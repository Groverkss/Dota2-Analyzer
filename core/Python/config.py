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
            [1, 1, 1, 1, 1, 1, 0, 1], #players
            [1, 1], #tournament_type
            [1, 1, 1, 1, 1, 0], #matches
            [1, 1, 1], #participating_teams
            [1, 1, 1, 1], #heroes
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], #base_stats
            [1, 1, 0, 0, 1], #abilities
            [1, 1, 0, 0], #player_characters
            [1, 1, 1, 1, 1], #match_description
            [1, 1, 0, 0, 0], #match_performance
            [1, 1, 0, 0], #teams
            [1, 1, 1, 1, 0, 0], #teams_teams
            [1, 1], #roles
            [1, 1, 1, 0] #teams_player
        ]


attrs = [
    ["steam_name", "steam_id", "name", "country_of_origin", "date_of_birth", "signature_hero", "playtime", "status"], #players
    ["tournament", "type"], #tournament_type
    ["match_id","winner","mvp","loser","tournament","duration"], #matches
    ["match_id","team_1","team_2"],#participating teams
    ["name","faction","primary_attribute", "lore"], #heroes
    ["hero_name", "turn_rate", "hp_regen", "mana_regen", "sight_range", "attack_range", "missile_range", "attack_duration", "cast_duration", "magic_resist", "attack_speed", "attack_time"], #base_stats
    ["hero_name","ability_name","manacost","cooldown","description"], #abilities
    ["hero_name", "steam_id", "wins", "matches_played"], #player characters
    ["match_id","steam_id", "hero_name","team_1", "team_2"], #match description
    ["match_id", "steam_id", "kills", "deaths", "assists"], #match performance
    ["team_name","player","losses","wins"], #teams
    ["team_1","team_2", "player_11", "player_21", "losses", "wins"], #teams-teams
    ["steam_id", "roles"], #roles
    ["player_id", "team_name", "join_date", "participation"] #teams-player
]
