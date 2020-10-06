import pymysql
import pymysql.cursors
import query_maker
from tabulate import tabulate
import click
import query
import updateq

db_curr = None


def db_connect(host, user, password):
    try:
        db_conn = pymysql.connect(host= host,
                                  user= user,
                                  password= password,
                                  db='dota',    
                                  cursorclass=pymysql.cursors.DictCursor)
        global db_curr 
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


