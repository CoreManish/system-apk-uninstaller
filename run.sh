 #!/bin/bash

# Check if ./adb is available
if [ ! -x "./adb" ]; then
    echo "./adb not found or not executable. Make sure it's in your current directory and has execute permissions."
    exit 1
fi

# Get the number of connected devices
lines=$(./adb devices | wc -l)

# Check if there are more than 2 lines (at least one device connected)
if [ "$lines" -gt 2 ]; then
    # Run pm list packages with line numbering
    ./adb shell pm list packages | awk '{print NR, $0}'

    # Prompt the user for input
    read -p "Enter the row number to uninstall the corresponding package: " row_number

    # Validate input as a positive integer
    if [[ $row_number =~ ^[0-9]+$ && $row_number -gt 0 ]]; then
        # Get the package name corresponding to the selected row
        package_name=$(./adb shell pm list packages | sed -n "${row_number}p" | cut -d':' -f2)
        
        # Uninstall the package
        ./adb shell pm uninstall -k --user 0 "$package_name"
        echo "Uninstalling package: $package_name"
    else
        echo "Invalid input. Please enter a valid row number."
    fi
else
    echo "No device connected."
    echo "Enable developer option, enable usb debugging,allow, connect device via USB, choose file transfer"
    echo "If ready then run this file again"
fi
