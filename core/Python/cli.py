import click
from click_shell import shell


# Class to handle shell exiting
class OnExit():

    def __call__(self, garbage):
        click.secho('Goodbye', fg='green')


# Callable executed on shell exit
on_shell_exit = OnExit()


@shell(prompt='dotabase > ', intro='Welcome to Dotabase...', on_finished=on_shell_exit)
def dota():
    pass


@dota.command()
@click.argument('table')
def insert(table):
    '''Insert data into the corresponding TABLE'''
    print(f'Inserting in table {table}')


@dota.command()
@click.argument('table')
def delete(table):
    '''Delete data from the corresponding TABLE'''
    print(f'Deleting from table {table}')


@dota.command()
@click.argument('table')
def modify(table):
    '''Modify data from a corresponding TABLE'''
    print(f'Modifying from table {table}')

# --- Retrival Commands Start ---


@dota.group()
def retrieve():
    pass


# --- Select Commands Start ---

@retrieve.group()
def select():
    pass


@select.command()
@click.argument('team')
def team_matches(team):
    '''Get all matches played by a team'''
    print(f'Getting all matches played by team {team}')


@select.command()
@click.argument('player')
def player_match(player):
    '''Get all matches player by a player'''
    print(f'Getting all matches played by player {player}')


@select.command()
@click.argument('team1')
@click.argument('team2')
def match_against(team1, team2):
    '''Get all matches played between 2 given teams'''
    print(f'Getting all matches played between team {team1} and {team2}')

# --- Select Commands End ---

# --- Project Commands Start ---


@retrieve.group()
def project():
    pass


@project.command()
@click.argument('player')
@click.argument('x')
def winrate_greater_player(player, x):
    '''Get all Heroes with win-rate >= x, for a certain player'''
    pass


@project.command()
@click.argument('x')
def winrate_greater(x):
    '''Get all Heroes with win-rate >= x'''
    pass

# --- Project Commands End ---

# --- Aggregate Commands Start ---


@retrieve.group()
def aggregate():
    pass


@aggregate.command()
@click.argument('player')
@click.argument('primary_att')
def wins_by_pattr(player, primary_att):
    '''Total wins by a player for all heroes of a given primary attribute'''
    pass


@aggregate.command()
@click.argument('player')
def total_time(player):
    '''Total time by a player in all the matches'''
    pass


@aggregate.command()
@click.argument('player')
def total_wins(player):
    '''Total wins by player in all the matches'''
    pass

# --- Aggregate Commands End

# --- Search Commands Start


@retrieve.group()
def search():
    pass


@search.command()
@click.argument('hero')
def find_hero(hero):
    '''Get info about a hero. Supports partial text match'''
    pass


@search.command()
@click.argument('player')
def find_player(player):
    '''Get info about a hero. Supports partial text match'''
    pass

# --- Search Commands End

# --- Retrival Commands End

# --- Analysis Commands Start


@dota.group()
def analysis():
    pass


@analysis.command()
def player_report():
    '''Generate a report of all the players based on their wins'''
    pass


@analysis.command()
def team_report():
    '''Generate a report on performance of all the teams based on history'''
    pass


@analysis.command()
@click.argument('tournament')
def tour_report(tournament):
    '''Generate a report of the tournament'''
    pass


@analysis.command()
def hero_report():
    '''Generate a report on all the heroes'''
    pass

# --- Analysis Commands End ---


if __name__ == '__main__':
    dota()
