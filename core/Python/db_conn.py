import pymysql
import pymysql.cursors
import query_maker
from tabulate import tabulate
import click
import query
from termcolor import colored
import config

db_conn = None
db_curr = None

def db_connect(host, user, password):
    try:
        global db_conn, db_curr 
        db_conn = pymysql.connect(host= host,
                                  user= user,
                                  password= password,
                                  db='dota',    
                                  cursorclass=pymysql.cursors.DictCursor,
                                  autocommit = True)
        db_curr = db_conn.cursor()
    except:
        click.secho("Credentials invalid", fg = 'red')
        exit()



def print_query(query):
    try:
        db_curr.execute(query)
        output = db_curr.fetchall()
    except:
        db_curr.rollback()

    if not output:
        return

    headers = [name.replace('_', ' ').title()
               for name in list(output[0].keys())]

    output = [list(row.values()) for row in output]

    click.secho(tabulate(output, headers, tablefmt='fancy_grid'), fg='yellow')
    

def list_tables():
    print_query("show tables;")
    

def team_matches(team):
    '''Get all matches played by a team'''
    query = query_maker.all_match_team(team)
    print_query(query)


def player_matches(player):
    '''Get all matches played by a player'''
    query = query_maker.all_match_player(player)
    print_query(query)


def match_against(team1, team2):
    '''Get all matches played between 2 given teams'''
    query = query_maker.all_match_two_teams(team1, team2)
    print_query(query)


def winrate_greater_player(player, x):
    '''Get all Heroes with win-rate >= x, for a certain player'''
    query = query_maker.hero_win_rate(player, x)
    print_query(query)

def winrate_greater(x):
    '''Get all Heroes with win-rate >= x'''
    query = query_maker.hero_win_rate_all(x)
    print_query(query)

def wins_by_pattr(player, primary_att):
    '''Total wins by a player for all heroes of a given primary attribute'''
    query = query_maker.player_attr_wins(player, primary_att)
    print_query(query)

def total_time(player):
    '''Total time by a player in all matches'''
    query = query_maker.total_time_player(player)
    print_query(query)

def total_wins(player):
    '''Total wins by player in all the matches'''
    query = query_maker.total_win_player(player)
    print_query(query)

def find_hero(hero):
    '''Get info about a hero'''
    query = query_maker.partial_search_hero(hero)
    print_query(query)

def find_player(player):
    '''Get info about a player'''
    query = query_maker.partial_search_player(player)
    print_query(query)

def player_report():
    '''Get report of all the players'''
    query = query_maker.player_report()
    print_query(query)

def team_report():
    '''Gets report of all the teams'''
    query = query_maker.team_report()
    print_query(query)

def tournament_report(option):
    '''Shows the tournament standings'''
    query = query_maker.tournament_report(option)
    print_query(query)

def hero_report():
    '''Shows the hero and the matches played'''
    query = query_maker.hero_report()
    print_query(query)

# --- Updateq queries ---

def format_att(attribute, color):
    attribute = attribute.replace('_', ' ')
    attribute = attribute.title()
    return colored(attribute, color=color)


def insert(table):
    '''Prompts for data for insertion to corresponding TABLE'''
    global db_conn, db_curr
    try:
        index = config.table_names.index(table)
    except:
        click.secho("Table does not exist", fg='red')
        return

    values = []

    for attribute, quote in config.attrs[index]:
        value = click.prompt(format_att(attribute, 'green'),
                             type=(str if quote else int))
        values.append(value)

    query = query_maker.insert_row(table, values)
    
    try:
        db_curr.execute(query)
        db_conn.commit()
    except:
        db_conn.rollback()


def modify(table):
    '''Prompts for data and modifys to corresponding TABLE'''
    global db_conn, db_curr
    try:
        index = config.table_names.index(table)
    except:
        click.secho("Table does not exist", fg='red')
        return

    old_values = []
    new_values = []

    for attribute, quote in config.attrs[index]:
        default_val = '' if quote else -1

        old_value = click.prompt(format_att('Old ' + attribute, 'green'),
                                 type=(str if quote else int), default=default_val)

        if old_value == default_val:
            new_value = default_val
            print()
        else:
            new_value = click.prompt(format_att('New ' + attribute, 'yellow'),
                                     type=(str if quote else int))

            old_values.append(old_value)
        new_values.append(new_value)


    query = query_maker.update_row(table, old_values, new_values)

    try:
        db_curr.execute(query)
        db_conn.commit()
    except:
        db_conn.rollback()



def delete(table):
    '''Prompts for data and modifys to corresponding TABLE'''
    global db_conn, db_curr
    try:
        index = config.table_names.index(table)
    except:
        click.secho("Table does not exist", fg='red')
        return

    values = []

    for attribute, quote in config.attrs[index]:
        default_val = '' if quote else -1

        value = click.prompt(format_att(attribute, 'green'),
                             type=(str if quote else int), default=default_val)

        values.append(value)

    query = query_maker.delete_row(table, values)

    try:
        db_curr.execute(query)
        db_conn.commit()
    except:
        db_conn.rollback()

