import config
import click


def all_match_team(team):
    '''Returns the query required to display all the matches played by a team'''

    query = f'SELECT * FROM matches \
            WHERE (winner = "{team}" OR loser = "{team}");'
    return query


def all_match_player(player):
    '''Returns the query required to display all the matches played by a player'''

    query = f'WITH player_id AS (SELECT steam_id FROM players WHERE\
            steam_name = "{player}")\
            , matches_id AS (SELECT match_id FROM match_description, player_id WHERE\
            player_id.steam_id = match_description.steam_id)\
            SELECT matches.* FROM matches, matches_id WHERE\
            matches.match_id = matches_id.match_id;'
    return query


def all_match_two_teams(team_1, team_2):
    '''Returns the query required to display all the matches played betwee 2 teams'''

    query = f'SELECT * FROM matches \
            WHERE (winner LIKE "{team_1}" OR loser LIKE "{team_2}");'
    return query


def hero_win_rate(player, win_rate):
    '''Given a win rate it will display all the players and hero pairs with
       win rate greater than given win rate'''

    query = f'WITH player_id AS (SELECT steam_id FROM players WHERE\
            steam_name = "{player}")\
            SELECT player_characters.hero_name, player_characters.wins AS wins, player_characters.matches_played AS matches_played FROM\
            player_characters, player_id WHERE wins * 100 > {win_rate} * matches_played AND\
            player_characters.steam_id = player_id.steam_id;'
    return query


def hero_win_rate_all(win_rate):
    '''Given a win rate it will display heroes with win rate greater than given win rate'''

    query = f'WITH hero_aggr AS (SELECT hero_name, SUM(wins) AS wins, \
            SUM(matches_played) AS matches_played FROM\
            player_characters GROUP BY hero_name)\
            SELECT hero_name, wins, matches_played FROM\
            hero_aggr WHERE wins * 100 > {win_rate} * matches_played;'
    return query


def player_attr_wins(player, attribute):
    '''For a given player and attribute, it returns the number of wins'''

    query = f'WITH id AS (SELECT steam_id FROM players \
            WHERE steam_name = \'{player}\'), player_heroes AS \
            (SELECT player_characters.wins, player_characters.hero_name \
            FROM player_characters, id WHERE player_characters.steam_id = id.steam_id) \
            SELECT SUM(wins) AS wins FROM player_heroes, heroes \
            WHERE (heroes.primary_attribute = \'{attribute}\' \
            AND player_heroes.hero_name = heroes.name);'
    return query


def total_time_player(player):
    '''Total time for a player in all the matches'''

    query = f'WITH player_id AS (SELECT steam_name, steam_id FROM players WHERE\
            steam_name = "{player}")\
            , matches_id AS (SELECT player_id.steam_name, match_id FROM match_description, \
            player_id WHERE player_id.steam_id = match_description.steam_id)\
            SELECT matches_id.steam_name, SUM(matches.duration) AS duration FROM matches,\
            matches_id WHERE matches.match_id = matches_id.match_id;'
    return query


def total_win_player(player):
    '''Total wins of a player'''

    query = f'WITH player_id AS (SELECT steam_name, steam_id FROM players WHERE\
            steam_name = "{player}")\
            SELECT player_id.steam_name, SUM(wins) AS wins FROM player_id, player_characters\
            WHERE player_id.steam_id = player_characters.steam_id GROUP BY player_id.steam_name;'
    return query


def partial_search_hero(partial_hero):
    '''Partial text search for hero names'''

    query = f'SELECT * FROM heroes WHERE name LIKE \'{partial_hero}%\';'
    return query


def partial_search_player(partial_player):
    '''Partial text search for player names'''

    query = f'SELECT * FROM players WHERE name LIKE \'{partial_player}%\';'
    return query

def add_quote_individual(value):
    if type(value) == str:
        return f'\'{value}\''
    else:
        return value

def add_quotes(values):
    '''Add quotes to values depending on type'''
    # Add values to query
    for value in values[:-1]:
        query += f'{add_quote_individual(value)}, '

    # Add semicolon for last value
    query += f'{add_quote_individual(values[-1])}'

    return query


def insert_row(table_name, values):
    '''Inserts VALUES into TABLE'''

    query = f'INSERT INTO {table_name} VALUES ('
    query += add_quotes(values)
    query += f');'

    return(query)

def update_row(table_name, old_values, new_values):
    '''Modifies OLD_VALUES by NEW_VALUES into TABLE'''
    query = f'UPDATE {table_name} SET '
    attrs = config.attrs[config.table_names.index(table_name)]
    for ind, at in enumerate(attrs[:-1]):
        query += f'{at[0]} = {add_quote_individual(new_values[ind])}, '
    query += f'{attrs[-1][0]} = {add_quote_individual(new_values[-1])} '
    
    query += 'WHERE '

    for ind, at in enumerate(attrs[:-1]):
        query += f'{at[0]} = {add_quote_individual(old_values[ind])} AND '
    query += f'{attrs[-1][0]} = {add_quote_individual(old_values[-1])};'

    return query


def delete_row(table_name, values):
    '''Deletes rows which match VALUES into TABLE'''
    query = f'DELETE FROM {table_name} WHERE '
    attrs = config.attrs[config.table_names.index(table_name)]
    
    for ind, at in enumerate(attrs[:-1]):
        query += f'{at[0]} = {add_quote_individual(values[ind])} AND '
    query += f'{attrs[-1][0]} = {add_quote_individual(values[-1])};'

    return query


## ANALYSIS

def player_report():
    '''Ranks of players based on the number of wins'''  
    query = 'WITH team_player AS (SELECT player_id, team_name FROM teams_player)\
            , wins AS (SELECT team_name, wins FROM teams), \
            win_ids AS (SELECT team_player.player_id AS player_id, wins \
            FROM team_player, wins \
            WHERE team_player.team_name = wins.team_name) \
            SELECT players.steam_name AS name, win_ids.wins AS wins \
            FROM win_ids, players \
            WHERE players.steam_id = win_ids.player_id ORDER BY wins DESC;'
    return query



def team_report():
    '''Orders teams by the wins'''
    query = 'SELECT team_name AS teams, wins FROM teams ORDER BY wins DESC;'
    return query    


def tournament_report(option):
    if option.lower() == "teams":
        query = 'WITH tournament AS (SELECT winner, tournament, COUNT(match_id) AS wins \
            FROM matches GROUP BY winner, tournament ORDER BY  wins DESC, tournament ASC) \
            SELECT * FROM tournament;'
    else:
        query = 'WITH hero AS (SELECT match_description.hero_name, matches.tournament AS tour, \
            COUNT(match_description.match_id) AS matches_played FROM matches, match_description \
            WHERE matches.match_id  = match_description.match_id GROUP BY matches.tournament, \
            match_description.hero_name ORDER BY matches_played DESC) \
            SELECT * FROM hero ORDER BY tour, matches_played DESC;'

    return query

def hero_report():
    query = 'WITH hero AS (SELECT match_description.hero_name AS hero, \
        COUNT(match_description.match_id) AS matches_played FROM matches, match_description \
        WHERE matches.match_id  = match_description.match_id GROUP BY \
        match_description.hero_name ORDER BY matches_played DESC) \
        SELECT * FROM hero ORDER BY matches_played DESC;'
    return query