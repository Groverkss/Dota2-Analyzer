INSERT INTO players (steam_name,
					 steam_id, 
					 name, 
					 country_of_origin, 
					 date_of_birth, 
					 signature_hero, 
					 playtime, 
					 status)
VALUES ();

INSERT INTO abilities (hero_name,
						ability_name,
						manacost,
						cooldown,
						description)
VALUES ();

INSERT INTO matches (match_id, 
						winner,
						mvp,
						loser, 
						tournament,
						duration)
VALUES ();

INSERT INTO participating_teams(match_id,
								team_1,
								team_2)
VALUES ();

INSERT INTO match_description(	match_id,
								steam_id,
								hero_name,
								teams)
VALUES ();

INSERT INTO teams(team_name,
				    player,
				    losses,
				    wins)
VALUES ();

INSERT INTO heroes(name,
					faction,
					primary_attribute,
					lore)
VALUES ();

INSERT INTO teams_teams(team_1,
						team_2,
						player_11,
						player_21,
						losses,
						wins)
VALUES ();

INSERT INTO base_stats(hero_name,
						turn_rate,
						hp_regen,
						mana_regen,
						sight_range,
						attack_range,
						missile_range, 
						attack_duration,
						cast_duration,
						magic_resist,
						attack_speed,
						attack_time)
VALUES ();

INSERT INTO match_performance(match_id,
								steam_id,
								kills,
								deaths,
								assists)
VALUES ();

INSERT INTO roles(steam_id,
					roles)
VALUES ();				

INSERT INTO teams_player(player_id,
							team_name,
							join_date,
							participation)
VALUES ();

INSERT INTO tournament_type(tournament,
								type)
VALUES ();

INSERT INTO player_characters(hero_name,
								steam_id,
								wins,
								matches_played,
								win_rate)
VALUES ();

