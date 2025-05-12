#!/bin/sh
# This script is used to update the firmware of the Nuvoton NPCM series SoC
# via UART. It requires the NpcmFwProg tool to be installed on the system.
# The script takes two arguments:
# 1. The path to the firmware image file to be written.
# 2. The path to the UART device to be used for communication.
# 3. An optional GPIO name to set the GPIO low before programming.
# The script checks if the provided paths are valid and then uses the NpcmFwProg
# tool to write the firmware image to the SoC via UART.
# Usage: ./smc-fw-update.sh <image_file> <uart_path> [<gpio_name>]
# Example: ./smc-fw-update.sh SMCNPCM_signed.bin /dev/ttyS4 SMC_FORCE_DL

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Please use sudo."
    exit 1
fi
# Check if the correct number of arguments is provided
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <image_file> <uart_path> [<gpio_name>]"
    echo "Example: $0 /path/to/image.bin /dev/ttyS0 example_gpio"
    echo "Optional GPIO name for setting GPIO low before programming."
    echo "Note: GPIO name is optional. If not provided, GPIO will not be set."
    exit 1
fi

# Assign arguments to variables
IMAGE_FILE="$1"
UART_PATH="$2"
GIO_NAME="$3"
UART_INF=$(echo "${UART_PATH}" | grep -o 'ttyS[0-9]\+')

# Verify dependencies
PROGRAMMER=$(find /usr/bin -name NpcmFwProg 2>/dev/null)
if [ -z "$PROGRAMMER" ]; then 
   echo "Error: NpcmFwProg not found in /usr/bin"
   exit 1
fi

# Validate UART path
if [ ! -c "${UART_PATH}" ]; then
    echo "Error: Invalid UART device path: ${UART_PATH}"
    exit 1
fi

# Validate image file
if [ ! -f "${IMAGE_FILE}" ]; then
    echo "Error: Invalid image file: ${IMAGE_FILE}"
    exit 1
fi

# Handle GPIO if provided (optional)
if [ -n "${GIO_NAME}" ]; then 
    GPIOCHIP=$(gpiofind "${GIO_NAME}")  
    if [ $? -ne 0 ] || [ -z "${GPIOCHIP}" ]; then  
        echo "Error: Invalid or non-existent GPIO: ${GIO_NAME}"
        exit 1  
    fi
    
    # Function to clean up GPIO on exit
    cleanup_gpio() {
        # Reset to high (or low if preferred) when script exits
        gpioset ${GPIOCHIP}=1 >/dev/null 2>&1
    }

    # Set GPIO low before programming  
    if ! gpioset ${GPIOCHIP}=0; then  
        echo "Error: Failed to set GPIO ${GIO_NAME} low"  
        exit 1  
    fi

    # Register cleanup handler
    trap cleanup_gpio EXIT INT TERM

    # Set UART parameters
    stty -F "${UART_PATH}" 115200 raw

    # Warm Reboot SMC (optional)
    if ! echo -e "\r\nkernel reboot warm\r\n" > "${UART_PATH}"; then
        echo "Error: Failed to write to UART device ${UART_PATH}"
        exit 1
    fi

    # Wait for SMC DL mode to be ready with timeout checking
    for _ in $(seq 1 5); do
        # TODO: Add check for DL mode readiness here if possible
        sleep 1
    done

    # Set GPIO from low to high only if previous steps succeeded
    if ! gpioset ${GPIOCHIP}=1; then
        echo "Warning: Failed to set GPIO ${GIO_NAME} high"
        # Don't exit here as we might still want to proceed
    fi
fi  

# Stop the obmc-console service for the specified UART
# This is to prevent any interference during the programming process
# Check if the service exists before stopping
if systemctl list-units --full -all | grep -q "obmc-console@${UART_INF}.service"; then
    if ! systemctl stop obmc-console@${UART_INF}.service; then
        echo "Error: Failed to stop obmc-console@${UART_INF}.service"
        exit 1
    fi

    # Check if the service is stopped
    if systemctl is-active --quiet  obmc-console@${UART_INF}.service; then
        echo "Error: obmc-console@${UART_INF}.service is still running"
        exit 1
    fi

fi

# Set timeout value in seconds (adjust as needed)
TIMEOUT=120

# Execute programmer with error checking and timeout
if ! timeout ${TIMEOUT} ${PROGRAMMER} -c ${UART_PATH} -w mcp -i ${IMAGE_FILE} -b; then
    # Check if the failure was due to timeout
    if [[ $? -eq 124 ]]; then
        echo "Error: Programming timed out after ${TIMEOUT} seconds"
    else
        echo "Error: Failed to program firmware"
    fi
    exit 1
fi

echo "Firmware programming completed successfully"

if systemctl list-units --full -all | grep -q "obmc-console@${UART_INF}.service"; then
    if ! systemctl start obmc-console@${UART_INF}.service; then
        echo "Error: Failed to start obmc-console@${UART_INF}.service"
        exit 1
    fi
fi

exit 0
