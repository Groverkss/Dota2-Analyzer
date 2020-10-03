CREATE TABLE players(
	steam_name varchar(255) NOT NULL,
	steam_id varchar(255),
	name varchar(255) NOT NULL,
	country_of_origin varchar(255) NOT NULL,
	date_of_birth DATE NOT NULL,
	signature_hero varchar(255) NOT NULL,
	playtime SMALLINT DEFAULT 0 NOT NULL,
	status varchar(255),
	PRIMARY KEY(steam_id)
);


CREATE TABLE abilities(
    hero_name varchar(255) NOT NULL,
    ability_name varchar(255) NOT NULL,
    manacost SMALLINT NOT NULL,
    cooldown SMALLINT NOT NULL,
    description TEXT,
    PRIMARY KEY(hero_name, ability_name)
);

CREATE TABLE matches(
	match_id varchar(255),
	winner varchar(255) NOT NULL,
	mvp varchar(255) NOT NULL,
	loser varchar(255) NOT NULL,
	tournament varchar(255) NOT NULL,
    	duration SMALLINT NOT NULL,
	PRIMARY KEY(match_id)
);

CREATE TABLE participating_teams(
	match_id varchar(255),
	team_1 varchar(255) NOT NULL,
	team_2 varchar(255) NOT NULL,
	PRIMARY KEY(match_id)
);

CREATE TABLE match_description(
	match_id varchar(255),
	steam_id varchar(255),
	hero_name varchar(255) NOT NULL,
	teams varchar(255) NOT NULL,
	PRIMARY KEY (match_id, steam_id),
);



CREATE TABLE teams(
    team_name varchar(255) NOT NULL,
    player varchar(255) NOT NULL,
    losses SMALLINT NOT NULL,
    wins SMALLINT NOT NULL,
    PRIMARY KEY (player)
);

CREATE TABLE heroes(
	name varchar(255),
	faction varchar(255) NOT NULL,
	primary_attribute varchar(255) NOT NULL	
	lore LONGTEXT NOT NULL,
	PRIMARY KEY(name)
);

CREATE TABLE teams_teams(
	team_1 varchar(255) NOT NULL,
	team_2 varchar(255) NOT NULL,
	player_11 varchar(255) NOT NULL,
	player_21 varchar(255) NOT NULL,
	losses SMALLINT NOT NULL,
	wins SMALLINT NOT NULL,
	PRIMARY KEY(player_11, player_21)
);


CREATE TABLE base_stats(
	hero_name varchar(255) NOT NULL,
	turn_rate FLOAT NOT NULL,
	hp_regen FLOAT NOT NULL,
	mana_regen FLOAT NOT NULL,
	sight_range FLOAT NOT NULL,
	attack_range FLOAT NOT NULL,
	missile_range FLOAT DEFAULT 0 NOT NULL, 
	attack_duration INT NOT NULL,
	cast_duration INT NOT NULL,
	magic_resist FLOAT DEFAULT 0 NOT NULL,
	attack_speed FLOAT NOT NULL,
	attack_time INT NOT NULL,
	PRIMARY KEY(hero_name)
);

CREATE TABLE match_performance(
	match_id varchar(255) NOT NULL,
	steam_id varchar(255) NOT NULL,
	kills SMALLINT DEFAULT 0 NOT NULL,
	deaths SMALLINT DEFAULT 0 NOT NULL,
	assists SMALLINT DEFAULT 0 NOT NULL,
	PRIMARY KEY(match_id, steam_id)
);

CREATE TABLE roles(
	steam_id varchar(255) NOT NULL,
	roles varchar(255) NOT NULL,
	PRIMARY KEY(steam_id)
);

CREATE TABLE teams_player(
	player_id varchar(255) NOT NULL,
	team_name varchar(255) NOT NULL,
	join_date DATE NOT NULL,
	participation SMALLINT DEFAULT 0 NOT NULL,
	PRIMARY KEY(player_id)
);

CREATE TABLE tournament_type(
	tournament varchar(255) NOT NULL,
	type varchar(255) NOT NULL,
	PRIMARY KEY(tournament)
);

CREATE TABLE player_characters(
	hero_name varchar(255) NOT NULL,
	steam_id varchar(255) NOT NULL,
	wins SMALLINT NOT NULL,
	matches_played SMALLINT NOT NULL,
	win_rate FLOAT NOT NULL,
	PRIMARY KEY(steam_id, hero_name)
);




ALTER TABLE participating_teams
ADD FOREIGN KEY (match_id) REFERENCES matches(match_id);

ALTER TABLE matches
ADD FOREIGN KEY (tournament) REFERENCES tournament_type(tournament);

ALTER TABLE base_stats
ADD FOREIGN KEY (hero_name) REFERENCES heroes(name);

ALTER TABLE abilities
ADD FOREIGN KEY (hero_name) REFERENCES heroes(name);

ALTER TABLE player_characters
ADD FOREIGN KEY (hero_name) REFERENCES heroes(name);

ALTER TABLE match_description
ADD FOREIGN KEY (match_id) REFERENCES matches(match_id);

ALTER TABLE match_performance
ADD FOREIGN KEY (match_id) REFERENCES matches(match_id);

ALTER TABLE match_description
ADD FOREIGN KEY (steam_id) REFERENCES players(steam_id);

ALTER TABLE match_performance
ADD FOREIGN KEY (steam_id) REFERENCES players(steam_id);

ALTER TABLE teams_teams
ADD FOREIGN KEY (player_11) REFERENCES players(steam_id);

ALTER TABLE teams_teams
ADD FOREIGN KEY (player_21) REFERENCES players(steam_id);

ALTER TABLE roles
ADD FOREIGN KEY (steam_id) REFERENCES players(steam_id);
