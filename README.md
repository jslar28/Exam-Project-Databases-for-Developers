# Exam-Project-Databases-for-Developers
Exam Project for Databases for Developers, 2019.

# Setup

Setup config file:
    Make a copy of ./backend/env.template
    Rename the copy "env.js"
    Store it in "./backend/env.js"
        (This is the same location as the template file)
    Change the values to match your local DB

Change directory to ./backend
Run: npm install
Run: nodemon

Change directory to ./frontend
Run: npm install
Run: npm start

Optional:
    If something is already running on port, do the following:
        In CMD, run command: netstat -ano | findStr "3500"
            (Replace 3500 with whatever port is used)
            You will get the ID of the process running on the port
        Then in CMD, run command: taskkill /pid {id} /f
            (Replace {id} with the ID found in the previous step)

Make sure you have MSSQL running.
    Note, you might need to enable TCP/IP in SQL Sever Configuration Manager:
        - Open SQL Sever 2017 Configuration Manager
        - Click SQL Server Network Configuration
        - Click Protocols for MSSQLSERVER
        - Double click TCP/IP
        - Click "IP Adresses" tab
        - Scroll to bottom to "IPAll"
        - Clear any values in "TCP Dynamic Ports" field (if any)
        - Set value in "TCP Port" field to 1433
        - Hit Apply + OK
        - Right click on TCP/IP, and click "Enable"
    Note, you might have to enable SQL Authentication for SQL Server
        - Login to MS SQL
        - Right click the server name (typically the computer name)
        - Click "Properties"
        - Go to "Security"
        - Under "Server Authentication", click SQL Server and Windows Authentication
        - Hit OK
        - Go to "Security" -> "Logins" -> Right click 'sa' -> Click "Properties" -> Go to "Status" -> Under "Login", click "Enabled"
        - Right click the server name again, and click Restart
    Note, you might have to change the variables in ./backend/env.js to match a user on your system

