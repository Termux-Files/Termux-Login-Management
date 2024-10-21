# Repository Overview

This repository provides a solution for users running Debian or Void or ArchLinux through proot-distro on the Termux app, offering seamless login management between Termux and Debian environments or Termux and Debian and Arch or Void Linux environment. Upon opening Termux, users can choose to log into either the Termux environment or directly into Debian or Arch or Void Linux. Similarly, options are provided when logging out, streamlining session transitions.

# Key Features

- Flexible Login: Upon opening Termux, users are prompted to select between logging into Termux or Debian or Arch or Void. 

- Logout Options: When logging out from Debian or Arch or Void, users can either return to the Termux environment or exit the application. (Note: Exiting Termux directly from Debian only works if the login was initiated via the provided method. Manually logging in with proot-distro login debian --user <your-username> bypasses this feature.)

# Login Management Scripts

This repository provides scripts to manage logins between different environments such as Debian, Void, Arch and Termux. These Scripts will create all the necessary files and folders. You can also Download Script from SetupScripts folder in this repository.

# Setup Scripts Overview

**Debian-Termux.sh**
Manages login for Debian and Termux environments.

**Debian-Void-Termux.sh**
Extends functionality to manage logins for Debian, Void, and Termux environments. 

**Debian-Arch-Termux.sh**
Extends functionality to manage logins for Debian,
 ArchLinux, and Termux environments

---

# How to Use

## Step 1 : Download the Script

You can download the scripts by executing following commands in your **TERMUX ENVIRONMENT** :

Choose appropriate command

**Debian-Termux.sh**

```
wget https://raw.githubusercontent.com/TermuxFiles/Termux-Login-Management/main/SetupScripts/Debian-Termux.sh
```

**Debian-Void-Termux.sh**

```
wget https://raw.githubusercontent.com/TermuxFiles/Termux-Login-Management/main/SetupScripts/Debian-Void-Termux.sh
```

**Debian-Arch-Termux.sh**

```
wget https://raw.githubusercontent.com/TermuxFiles/Termux-Login-Management/main/SetupScripts/Debian-Arch-Termux.sh
```

## Step 2 : Make the Script Executable

Now Make Downloaded script to executable. Copy appropriate Command from following and execute in your **TERMUX ENVIRONMENT** :

**For Debian-Termux**

```
chmod +x Debian-Termux.sh
```

### OR

**For Debian-Void-Termux**

```
chmod +x Debian-Void-Termux.sh
```

### OR

**For Debian-Arch-Termux**

```
chmod +x Debian-Arch-Termux.sh
```

## > DISCLAIMER :                    

Before You run the script, You should know that these scripts will NOT overwrite your ~/.bashrc file. It will just append (add) few lines in your .bashrc file. But it is recommended and good practice to take a backup of your ~/.bashrc file BEFORE running the script. 

```
cp ~/.bashrc ~/.bashrc.bak
```

## Step 3: Run the Script :

DO NOT FORGET to create a .bashrc file in your home directory of Termux Environment, if it is not already exist. 

```
touch $HOME/.bashrc
```

Copy appropriate command from following and execute it in **TERMUX ENVIRONMENT** :

**For Debian-Termux**

```
./Debian-Termux.sh
```

### OR

**For Debian-Void-Termux**

```
./Debian-Void-Termux.sh
```

### OR

**For Debian-Arch-Termux**

```
./Debian-Arch-Termux.sh
```

This will create a .loginScripts/ directory in your home directory and append necessary login commands to your ~/.bashrc. Again, it will NOT overwrite your .bashrc file. You can check if .loginScripts directory is created or not  with ls -a command.

## Step 4 : Manual Adjustments

Before running the script, follow this step. Replace "yasin" with your own username in all possible login.sh files.
**For Example**
If you have chosen Debian-Arch-Termux.sh, then change username in ***deb_login.sh*** and ***arch_login.sh***.
Remember, all command should be executed in **Termux Environment**

**For Debian:**
1. Open ~/.loginScripts/deb_login.sh :

```
nano ~/.loginScripts/deb_login.sh
```

2. Replace 'yasin' with your Debian username.
 
**For Void Linux (only if You have chosen Debian-Void-Termux.sh):**

1. Open .loginScripts/void_login.sh:

```
nano ~/.loginScripts/void_login.sh
```

2. Replace 'yasin' with your Void username

**For Arch Linux (Only if You have chosen Debian-Arch-Termux.sh**

1. Open ~/.loginScripts/arch.login.sh:

```
nano ~/.loginScripts/arch_login.sh
```

2. Replace 'yasin' with your ArchLinux username.

## Step 5 : Source .bashrc

Now Source your .bashrc file in your Termux Environment.

```
source ~/.bashrc
```
And you are good to go. You can modify script to your liking as long as logic remains intact. 

---

## Additional Information

- The scripts are designed to integrate seamlessly with your existing .bashrc configuration.

- Ensure you have the correct usernames in the relevant login scripts for each environment.


### > Disclaimer: These scripts have been tested and work as expected. However, you are solely responsible for ensuring proper execution and adjustments based on your system.

___

## Notes :

1. Replace 'yasin' in the deb_login.sh and arch_login.sh and void_login.sh scripts with your own username which you have set for particular environment.

2. If you are cloning the repo, move .loginScripts folder to home directory. And add necessary lines into your .bashrc file. Copy those lines from .bashrc file given in my repo.

3. If you're running multiple sessions, only the current session you want to exit will be terminated. This will not close the entire Termux application in such cases.

4. I used ChatGPT to create this script. But It took me several days to get what I want. I had to ask questions in different ways. Many solutions were given, but none worked except this.

5. This repo is for newbie like me. ofcourse experts know better than this.
