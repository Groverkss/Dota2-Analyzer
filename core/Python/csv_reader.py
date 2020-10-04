import pandas as pd
from query import *
from config import * 

def strip_space(str):
    """Strips white space from left and right ends"""
    return f"{str.lstrip().rstrip()}"

def add_quotes(str):
	"""Adds quotes on the end and returns the output"""
	return f"\"{str}\""

def csv_reader(address, list_size, quotes):
    """
        Address is the csv file location,
        list_size is the size of the row in the table to be inserted,
        quotes is a one hot vector which represents which position
        need to be surrounded by \"\" 
    """
    df = list(pd.read_csv(address))

    rows = []
    """Splitting the csv file into rows"""
    for i in range(0, len(df), list_size):
    	rows.append(list(df[i : i + list_size]))
    """Cleaning the entries by inserting quotes"""
    for row in rows:
    	for index in range(0, list_size):
    		row[index] = strip_space(row[index])
    		if(quotes[index] == 1):
    			row[index] = add_quotes(row[index])

    """ Converting numbers to int or float"""
    for row in rows:
    	for index in range(0, list_size):
    		if quotes[index] == 0:
    			"""Skipping dates"""
    			if row[index].find('-') != -1:
    				continue
    			"""If there is a decimal point we make it float"""
    			else if row[index].find('.') != -1:
    			 	row[index] = float(row[index])
    			else:
    			 	row[index] = int(row[index])
    return rows

def Insert_csv(address, table_name):
	index = table_names.index(table_name)
	quotes = all_quotes[index]
	rows = csv_reader(address, len(quotes), quotes)

	for row in rows:
		insert_row(table_name, row)


# Insert_csv("../data/old/teams.csv", "teams")
Insert_csv("../data/old/tournament_type.csv", "tournament_type")
# Insert_csv("../data/old/players.csv", "players")