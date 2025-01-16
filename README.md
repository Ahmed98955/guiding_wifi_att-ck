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

## Step 1: Identify and Configure Wireless Adapter:
* The script uses `iwconfig` to identify available wireless network adapters. You will need to specify which adapter to use for scanning the network. 
![image](https://github.com/user-attachments/assets/b915e602-906b-4159-a41f-b912f3aca6be)


## Step 2: Enable Monitor Mode:
* The script enables monitor mode using `airmon-ng`, which is required for scanning networks and capturing packets.
![image](https://github.com/user-attachments/assets/013b5280-56a2-4bcf-86bf-778c7b09a763)

## Step 3: Kill Interfering Processes:
* The script uses `airmon-ng check kill` to kill any processes that might interfere with the monitoring mode.

##  Step 4: Scan and Target Network:
* The script uses `airodump-ng` to scan for available wireless networks and allows you to select the target network (by BSSID and Channel).

## Step 5: Deauthenticate Clients:
* Using `aireplay-ng`, the script will deauthenticate clients from the selected network to capture the handshake required for password cracking.

## Step 6: Crack the Password:
* The script uses `aircrack-ng` to crack the captured password using a wordlist. You will need to provide the path to the captured file and the wordlist file.

## Step 7: Complete the Process:
* The script will notify you once the process is complete. It will prompt you to review your results and exit the guide.

# Example Usage
![image](https://github.com/user-attachments/assets/91c4b8a1-2054-4181-a08a-08a508e6b8c4)
























# License
## This project is licensed under the MIT License.








