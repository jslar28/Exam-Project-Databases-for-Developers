# Exam-Project-Databases-for-Developers
Exam Project for Databases for Developers, 2019.

# Setup

## Environment:
    - Have access to Windows 10
        We used Windows 10 Pro
        You might need administration permissions
    - Have access to Google Chrome
        We used version 78.0.3904.108 (Officiel version) (64-bit)
    - Have Microsoft SQL Server Management Studio (MSSQLSMS) installed
        We used version 18.3.1
        Make sure that SQL Server 2017 Configuration Manager is also installed
            This comes with the MSQLSMS installation
    - Have access to a terminal
        We used Windows Powershell and Command Prompt in Windows 10
    - Optionally, an IDEA like Visual Studio Code, but not required
    
## Pre-requisites:
    - Have NodeJS installed
        Link: https://nodejs.org/en/
        We used version 12.13.1 (LTS)
    - Clone the this GIT repository to your local machine

## Setup Microsoft SQL Server Management Studio
First of all, make sure MSSQLSMS is running
Login to the DB server, and take note of the instance name
    The instance name is the last part of the 'Server Name' field when you Connect to Server is MSSQLSMS
    The instance name is often 'MSSQLSERVER' or something close to it
        Example: A 'Server Name' might be 'DESKTOP-JIGR9V8\MSSQLSERVER01'. In that case, the instance name is 'MSSQLSERVER01'
            (This is important later, if you need to open TCP/IP ports)

Make sure that your TCP/IP is enabled, and listening on port 1433:
    You enable TCP/IP through SQL Sever 2017 Configuration Manager:
        - Open SQL Sever 2017 Configuration Manager
        - Click SQL Server Network Configuration
        - Click Protocols for the instance name (like MSSQLSERVER or MSSQLSERVER01)
            -- If there are multiple choices, it's important you pick the instance your server connects to
        - Double click TCP/IP
        - Click "IP Adresses" tab
        - Scroll to bottom to "IPAll"
        - Clear any values in "TCP Dynamic Ports" field (if any)
        - Set value in "TCP Port" field to 1433, if it's not already there
        - Hit Apply + OK
        - Finally, right click on TCP/IP, and click "Enable"

Make sure you can login with SQL Autentication, as well as Windows Authentication
    You enable SQL Authentication in MSSQLSMS
        - Login to MSSQLSMS
        - Right click the server name (typically the computer name)
        - Click "Properties"
        - Go to "Security"
        - Under "Server Authentication", click SQL Server and Windows Authentication
        - Hit OK

Enable, and configure 'sa' user
    You enable the 'sa' user in MSSQLSMS
        - Go to "Security" -> "Logins" -> Right click 'sa' -> Click "Properties" -> Go to "Status" -> Under "Login", click "Enabled"
        - Go to "General", and enter and confirm a password you can remember (you will need it later)
        - Restart the server
            -- Right click the name, and click Restart
    Note, you might have to change the variables in ./backend/env.js to match a user on your system

For good measure, we recommend restarting the system when all above steps have been taken.

## Setup data in the database
Run the "CompleteScripts.sql" from the ./db_scripts folder, to generate everything for the database.

## Setup Backend (NodeJS)
Setup config file:
    All of this can be done in File Explorer, or an IDEA (we recommend VS Code)
    - Navigate to this project (Exam-Project-Databases-For-Developers)
    - Navigate to the 'backend' folder
    - Make a copy of the file called 'env.template' and paste it in the same location
        -- Don't delete the original env.template file
    - Rename the copy "env.js"
    - Open the 'env.js' file, and change the values to match your local DB
        -- The 'user' variable should be 'sa' (or whatever user you choose to use)
        -- The 'password' variable should be whatever password you set the user to have
        -- The 'db' should be the name of the database you are using 
            --- If you are using our DB creation scripts, the DB name will be 'WebShopDB'
    - You should now have a file called 'env.js', stored in the 'backend' folder, containing values corresponding to your local database
        -- Note that the 'env.js' file is in the .gitignore

Install global dependencies
    All of this can be done in a terminal
    - In a terminal (location doesn't matter), run the command: npm install nodemon -g

Instal project dependencies:
    All of this can be done in a terminal
    - Navigate to the 'backend' folder of this repository
        -- Command: cd <location of this file>/backend
    - Run the command: npm install

Start up backend (default is port 3500):
    All of this can be done in a terminal
    - Navigate to the 'backend' folder of this repository
        -- Command: cd <location of this file>/backend
    - Run the command: nodemon

Troubleshooting:
    If something is already running on port 3500, do on of the following:
        1) Kill the process running on port 3500
            In CMD, run command: netstat -ano | findStr "3500"
                (Replace 3500 with whatever port is used)
                You will get the ID of the process running on the port
            Then in CMD, run command: taskkill /pid {id} /f
                (Replace {id} with the ID found in the previous step)
        2) Change the port number
            In a File Explorer or IDEA, go to ./backend/index.js
            Change the port variable number with whaterver port you want to use

    If the execution of scripts has been disabled on the system, do the following:
        Open up Windows Powershell
        Run the following command:
            Set-ExecutionPolicy -Scope LocalMachine Unrestricted

## Setup Frontend (ReactJS)
Instal project dependencies:
    All of this can be done in a terminal
    - Navigate to the 'frontend' folder of this repository
        -- Command: cd <location of this file>/frontend
    - Run the command: npm install

Start up frontend (default is port 300):
    All of this can be done in a terminal
    - Navigate to the 'frontend' folder of this repository
        -- Command: cd <location of this file>/frontend
    - Run the command: npm start
