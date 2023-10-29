
#!/bin/bash

device_mac="74:45:CE:8B:A1:03"

function bluetooth {
    while (( "$#" )); do
        case "$1" in
            --on)
                sudo bluetoothctl <<EOF
power on
connect $device_mac
exit
EOF
                shift
                ;;
            --off)
                sudo bluetoothctl <<EOF
disconnect $device_mac
exit
EOF
                shift
                ;;
            --help)
                echo "Usage: $0 {--on|--off|--help}"
                echo "Commands:"
                echo "--on    Turn on Bluetooth and connect to the device"
                echo "--off   Disconnect from the Bluetooth device"
                echo "--help  Display this help message"
                shift
                ;;
            *)
                echo "Invalid argument. Please use '--on', '--off' or '--help'."
                echo "Use '$0 --help' for more information."
                exit 1
                ;;
        esac
    done
}

# Check if no arguments were passed and display help
if [ $# -eq 0 ]
then
    bluetooth --help
    exit 1
fi

bluetooth "$@"
