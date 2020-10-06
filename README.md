# Dota2-Analyzer

> We said to Kunwar that if he doesn't stop playing Dota, then we will not help him in the project.
> Kunwar replied back: "I will report you."

But, Kunwar did stop playing Dota. And as a result, we finally have Dota2-Analyzer: a model database and analyzer for professional matches in the popular game Dota 2.

<img src="https://media.discordapp.net/attachments/689432710531252235/763047885108936764/https3A2F2Fwallpapercave.png?width=887&height=499">

### Authors
1. Kunwar Shaanjeet Singh Grover
2. Alapan Chaudhuri
3. Zeeshan Ahmed

## How to get started?
Install MySQL or MariaDB in order to be able to utilize our Database Dump. MariaDB is similar to MySQL but is also faster to use and easier to install.

Once you have either of the above installed in your system follow these steps:
- Enter in `mysql`
- Create a database named **dota** using 
	```sql
	CREATE DATABASE dota CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    CREATE USER '<user>'@'localhost' IDENTIFIED BY '<password>';
    GRANT ALL PRIVILEGES ON dota.* TO '<user>'@'localhost';
    exit
	```
:warning: **You must use Python 3**: Not using python3 might cause unnecessary problems.
- Create a virtual environment and install dependencies
    ```bash
    python3 -m venv env
    . /env/vin/activate
    pip3 install -r requirements.txt
    ```
- Relocate yourself to `core/Python` and run the following
    ```bash
    python3 cli.py 
    ```

    
    
    
    
    
    
    
    
    
    
    
