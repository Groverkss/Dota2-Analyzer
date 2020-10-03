


def strip_space(str):
	return "{}".format(str.lstrip().rstrip())


def insert_query(table_name, atrs, values):
	query = "INSERT INTO {}(".format(table_name)
	no_atrs = len(atrs)

	for i in range(0, no_atrs - 1):
		query += "{}, ".format(strip_space(atrs[i]))
	query += "{}) VALUES (".format(strip_space(atrs[no_atrs - 1]))
	for i in range(0, no_atrs - 1):
		query += "\"{}\", ".format(strip_space(values[i]))
	query += "\"{}\");".format(strip_space(values[no_atrs - 1]))

	print(query)


table_names = ["players", 
				"abilities", 
				"matches", 
				"participating_teams", 
				"match_description",
				"teams",
				"heroes",
				"teams_teams",
				"base_stats",
				"match_performance",
				"roles",
				"teams_player",
				"tournament_type",
				"player_characters"] 


				
atrs = [
		["steam_name", 
		"steam_id", 
		"name", 
		"country_of_origin",
		"date_of_birth", 
		"signature_hero", 
		"playtime", 
		"status"],
		["hero_name",
		"ability_name",
		"manacost",
		"cooldown",
		"description"],
		["match_id", 
		"winner",
		"mvp",
		"loser", 
		"tournament",
		"duration"],
		["match_id",
		"team_1",
		"team_2"],
		["match_id",
		"steam_id",
		"hero_name",
		"teams"],
		["team_name",
	    "player",
	    "losses",
	    "wins"],
		["name",
		"faction",
		"primary_attribute",
		"lore"],
		["team_1",
		"team_2",
		"player_11",
		"player_21",
		"losses",
		"wins"],
		["hero_name",
		"turn_rate",
		"hp_regen",
		"mana_regen",
		"sight_range",
		"attack_range",
		"missile_range", 
		"attack_duration",
		"cast_duration",
		"magic_resist",
		"attack_speed",
		"attack_time"],
		["match_id",
		"steam_id",
		"kills",
		"deaths",
		"assists"],
		["steam_id",
		"roles"],
		["player_id",
		"team_name",
		"join_date",
		"participation"],
		["tournament",
		"type"],
		["hero_name",
		"steam_id",
		"wins",
		"matches_played",
		"win_rate"]
		]



print(atrs)
value = list(input().split(','))
insert_query(table_names[0], atrs, value)






# def player_insert(values):
# 	query = """INSERT INTO players(steam_name, steam_id, name, country_of_origin,\
# date_of_birth, signature_hero, playtime, status)\
# VALUES (\"{0}\", \"{1}\", \"{2}\", \"{3}\", \"{4}\", \"{5}\", \"{6}\", \"{7}\");"""
# 	output = query.format(values[0], values[1], values[2], values[3], values[4], values[5], values[6], values[7])
# 	print(output)




# value = ["ltc", "6" * 17, "Shanjeet", "India", "2001-01-08", "Razor", "4000", "Active"]

# insert_query(table_name, atrs, value)