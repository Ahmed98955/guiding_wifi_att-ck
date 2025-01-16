# guiding_wifi_att-ck

## This Bash script guides users through the process of scanning wireless networks and cracking Wi-Fi passwords using popular tools like iwconfig, airmon-ng, airodump-ng, and aircrack-ng. It offers an interactive, step-by-step approach, allowing users to start from any step (1-7) in the process. The script also combines steps 4 and 5 for efficiency, while prompting users to continue or exit after each step.

# Features
* Step-by-step guidance: Users can start at any step in the process (from 1 to 7).
* Efficiency: Steps 4 and 5 (network scanning and deauthentication) are combined for improved efficiency.
* Interactive: After each step, users are prompted to decide whether they want to continue or exit the process.
* Checks and Validations: The script checks for necessary conditions, such as the availability of the wireless adapter, and provides error messages for failed operations.

# Prerequisites

## To run this script, you'll need the following:
* A Linux-based system (preferably Kali Linux).
* Wireless network adapter capable of monitor mode.
* iwconfig, airmon-ng, airodump-ng, and aircrack-ng tools installed.
* Root or sudo privileges to execute certain commands.

# Usage
1- Clone the repository to your local machine:

 `git clone https://github.com/Ahmed98955/guiding_wifi_att-ck.git`

2- Navigate to the project directory:

 `cd guiding_wifi_att-ck`

3- Make the script executable:

`chmod +x guiding_wifi_att-ck.sh`

4- Run the script:

`./guiding_wifi_att-ck.sh`

5- The script will prompt you to select the step you want to start from (1-7). You can choose any step, and the script will guide you through the process interactively.

# Script Steps

## step 0.1:continue_or_quit Function:
* This function repeatedly asks the user whether they want to continue or exit the script. It uses a `while true` loop to prompt for the user's input. If the user types `y` or `Y`, the function returns `0` and continues the script. If the user types `n` or `N`, the script exits. If the user provides any other input, it will prompt them again with a message that says "Invalid choice."
![image](https://github.com/user-attachments/assets/ad9ac160-c0e0-4868-8d25-7d6c4834be9a)

## step 0.2:display_steps Function:
* This function simply prints a list of steps to the terminal that guide the user through the Wi-Fi cracking process. Each step is displayed in sequence, explaining the different stages of the script's process, from identifying the wireless adapter to completing the process. It helps the user understand the order and purpose of the steps involved.
![image](https://github.com/user-attachments/assets/7deedfd8-143e-435d-abff-240adb76d551)

## step 0.3:Asking the user for the starting step:
This part of the script greets the user and explains that they can start from any step between 1 and 7. It then calls the `display_steps` function to show the available steps. After that, it prompts the user to enter a number corresponding to the step they want to begin from.
* Explanation: The script greets the user and provides instructions on which step they can start from. Then, the user is asked to input a number representing the step they want to start at.


## step 0.4:Validating user input:
After the user enters their chosen step, this part of the script checks if the input is a valid number between 1 and 7. It uses a regular expression (`^ [1-7] $`) to ensure that the input matches a valid step number. If the input is invalid, the script will display an error message and exit.
* Explanation: This section checks whether the user entered a valid number (1 to 7). If the input is invalid, the script shows an error message and stops.
![image](https://github.com/user-attachments/assets/cc17c328-354c-453b-a261-309fbd484933)


## Step 1: Identify and Configure Wireless Adapter:
* The script uses `iwconfig` to identify available wireless network adapters. You will need to specify which adapter to use for scanning the network. 
![image](https://github.com/user-attachments/assets/b915e602-906b-4159-a41f-b912f3aca6be)


## Step 2: Enable Monitor Mode:
* The script enables monitor mode using `airmon-ng`, which is required for scanning networks and capturing packets.
![image](https://github.com/user-attachments/assets/013b5280-56a2-4bcf-86bf-778c7b09a763)

## Step 3: Kill Interfering Processes:
* The script uses `airmon-ng check kill` to kill any processes that might interfere with the monitoring mode.
![Screenshot 2025-01-16 150444](https://github.com/user-attachments/assets/2ffa0479-9e71-48ce-958e-9413aadf135c)

##  Step 4: Scan and Target Network:
* The script uses `airodump-ng` to scan for available wireless networks and allows you to select the target network (by BSSID and Channel).

## Step 5: Deauthenticate Clients:
* Using `aireplay-ng`, the script will deauthenticate clients from the selected network to capture the handshake required for password cracking.
![Screenshot 2025-01-16 150537](https://github.com/user-attachments/assets/7a66ac33-4ae8-4897-95e5-276774c5d9f9)

## Step 6: Crack the Password:
* The script uses `aircrack-ng` to crack the captured password using a wordlist. You will need to provide the path to the captured file and the wordlist file.
![image](https://github.com/user-attachments/assets/f01d9916-fcca-40f7-bb8b-88f8ad9e82ba)

## Step 7: Complete the Process:
* The script will notify you once the process is complete. It will prompt you to review your results and exit the guide.
![image](https://github.com/user-attachments/assets/ccea0b78-0378-47a7-8a0b-66de2f30f607)



# Example Usage
![image](https://github.com/user-attachments/assets/91c4b8a1-2054-4181-a08a-08a508e6b8c4)
























# License
## This project is licensed under the MIT License.








