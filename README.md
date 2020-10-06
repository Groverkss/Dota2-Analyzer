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
- Enter "Host", "User" and "Password" with the details of the user (with all permissions) created just after creating the database `dota`, respectively.

    <img src="https://cdn.discordapp.com/attachments/689432710531252235/763073998477066250/unknown.png">
- Finally, use `help` **to get started**.

*Tip: use `list-tables` to show all tables.*

## Current Functionalities

The following image lists all functionalities in a tree hierarchy.

<img src="https://media.discordapp.net/attachments/689432710531252235/763072897987379280/unknown.png?width=297&height=499">

### Basic Functionalities

As seen above, we have all basic functionalities to be used in the form as specified below.

```py
help
exit
list-tables

delete <table_name> 
insert <table_name>
modify <table_name>
```
For, `insert`, `delete` and `modify` you shall have options once you execute the command as specified above.

<img src="https://cdn.discordapp.com/attachments/689432710531252235/763078894001061938/unknown.png">
    
    
    
    
    
