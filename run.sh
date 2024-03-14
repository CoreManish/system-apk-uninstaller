 #!/bin/bash

# install adb (android debug bridge)
 if ! [ -x "$(command -v adb)" ]; then
  echo 'adb is not installed. Installing adb...'
  sudo apt install adb
  echo 'adb is installed.'
fi

# Get the number of connected devices
lines=$(command adb devices | wc -l)


# Check if there are more than 2 lines (at least one device connected)
if [ $lines -le 2 ]; then
    echo "No devices connected."
    echo "Follow steps - Enable developer option, enable usb debugging,allow, connect device via USB, choose file transfer"
    echo "If ready then run this file again"
    exit 1
fi

echo "INSTRUCTIONS"
echo "1. List all packages "
echo "2. Uninstall packages with line numbering"
echo "3. Filter package by keyword"
echo "Any other keyword to exit"
echo ""

select i in 1 2 3
do
    case $i in
        1)
            echo "Packages are : "
            # Run pm list packages with line numbering
            adb shell pm list packages | awk '{print NR, $0}'
            break
        ;;
        2)
            # Prompt the user for input
            read -p "Enter the row number to uninstall the corresponding package: " row_number

            # Validate input as a positive integer
            if [[ $row_number =~ ^[0-9]+$ && $row_number -gt 0 ]]; then
                # Get the package name corresponding to the selected row
                package_name=$(adb shell pm list packages | sed -n "${row_number}p" | cut -d':' -f2)
                
                # Uninstall the package
                adb shell pm uninstall -k --user 0 "$package_name"
                echo "Uninstalling package: $package_name"
            else
                echo "Invalid input. Please enter a valid row number."
            fi
            break
        ;;
        3)
            echo "3. Filter package by keyword"
            read -p "Enter search keyword: " keyword
            adb shell pm list packages | awk '{print NR, $0}' | grep $keyword 
            break
        ;;
        *) echo "This is invalid key! Exit"
        break
        ;;
        esac
done
