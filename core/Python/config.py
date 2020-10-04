table_names = ["players",
               "tournament_type",
               "matches",
               "participating_teams",
               "heroes",
               "base_stats",
               "abilities",
               "player_characters",
               "match_description",
               "match_performance",
               "teams",
               "teams_teams",
               "roles",
               "teams_player"]

all_quotes = [
            [1, 1, 1, 1, 1, 1, 0, 1],
            [1, 1, 0, 0, 1],
            [1, 1, 1, 1, 1, 0, 1],
            [1, 1, 1],
            [1, 1, 1, 1, 1, 1],
            [1, 1, 0, 0],
            [1, 1, 1],
            [1, 1, 1, 1, 0, 0],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [1, 1, 0, 0, 0],
            [1, 1],
            [1, 1, 1, 0],
            [1, 1],
            [1, 1, 0, 0, 0]
        ]


attrs = [
    ["steam_name", "steam_id", "name", "country_of_origin", "date_of_birth", "signature_hero", "playtime", "status"],
    ["hero_name","ability_name","manacost","cooldown","description"],
    ["match_id","winner","mvp","loser","tournament","duration", "type"],
    ["match_id","team_1","team_2"],
    ["match_id","steam_id","steam_name", "hero_name","team_1", "team_2"],
    ["team_name","player","losses","wins"],
    ["name","faction","primary_attribute"],
    ["team_1","team_2", "player_11", "player_21", "losses", "wins"],
    ["hero_name", "turn_rate", "hp_regen", "mana_regen", "sight_range", "attack_range", "missile_range", "attack_duration", "cast_duration", "magic_resist", "attack_speed", "attack_time"],
    ["match_id", "steam_id", "kills", "deaths", "assists"],
    ["steam_id", "roles"],
    ["player_id", "team_name", "join_date", "participation"],
    ["tournament", "type"],
    ["hero_name", "steam_id", "wins", "matches_played", "win_rate"]
]
