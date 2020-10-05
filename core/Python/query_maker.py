import config

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
	WHERE (winner LIKE "{team}" OR loser LIKE "{team}");'
	return query

def hero_win_rate(win_rate):
	'''Given a win rate it will display all the players and hero pairs with
		win rate greater than given win rate''' 
	query = f'SELECT hero_name, steam_id, (wins/matches_played) AS win_rate FROM\
	 player_characters WHERE (wins/matches_played) > {win_rate};'
	return query

def hero_win_rate_all(win_rate):
	'''Given a win rate it will display heroes with win rate greater than given win rate'''
	query = f'WITH hero_aggr AS (SELECT hero_name, SUM(wins) AS wins, \
	SUM(matches_played) AS matches_played FROM\
	 player_characters GROUP BY hero_name)\
	SELECT hero_name, wins FROM\
	 hero_aggr WHERE wins >= {win_rate} * matches_played;'
	return query

def win_rate_attr(attribute):
	'''For a given attribute, it will show the win rate'''
	query = f'WITH hero_req AS (SELECT name, primary_attribute FROM heroes WHERE primary_attribute =\
	 "{attribute}")\
	 , hero_det AS (SELECT hero_req.primary_attribute, player_characters.wins, \
	 player_characters.matches_played FROM hero_req JOIN player_characters ON \
	 hero_req.name = player_characters.hero_name)\
	 SELECT primary_attribute, SUM(wins)/SUM(matches_played) AS win_rate FROM hero_det;'
	return query

def player_attr_wins(player, attribute):
	'''For a given player and attribute, it returns the number of wins'''
	query = f'WITH id AS (SELECT steam_id FROM players \
	WHERE steam_name = '{player}'), player_heroes AS \
	(SELECT player_characters.wins, player_characters.hero_name \
	FROM player_characters, id WHERE player_characters.steam_id = id.steam_id) \
	SELECT COUNT(wins) FROM player_heroes, heroes \
	WHERE (heroes.primary_attribute = '{attribute}' \
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


