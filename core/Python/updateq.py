import click
from termcolor import colored
import config
<<<<<<< HEAD
import query
=======
import query_maker
from db_conn import db_curr

>>>>>>> 657479d2c9d51cfe3eee468bbc629138315b7360

def format_att(attribute, color):
    attribute = attribute.replace('_', ' ')
    attribute = attribute.title()
    return colored(attribute, color=color)


def insert(table):
    '''Prompts for data for insertion to corresponding TABLE'''

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

<<<<<<< HEAD
    # TODO: Add values to database
    query = query.insert_row(table, values)
    print(query)
    
=======
    query = query_maker.insert_row(table, values)

    try:
        db_curr.execute(query)
        db_curr.commit()
    except:
        db_curr.rollback()
>>>>>>> 657479d2c9d51cfe3eee468bbc629138315b7360


def modify(table):
    '''Prompts for data and modifys to corresponding TABLE'''

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

    print(new_values)
    print(old_values)

    # TODO: Modify values to database
    # TODO: If no change, dont change the database


def delete(table):
    '''Prompts for data and modifys to corresponding TABLE'''

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

    print(values)

    # TODO: Delete values to database
    # TODO: If all default, delete the whole table
