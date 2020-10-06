import click
from termcolor import colored
import config
import query
import query_maker
from db_conn import db_curr


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

    query = query_maker.insert_row(table, values)

    try:
        db_curr.execute(query)
        db_curr.commit()
    except:
        db_curr.rollback()


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

    query = query_maker.update_row(table, old_values, new_values)

    try:
        db_curr.execute(query)
        db_curr.commit()
    except:
        db_curr.rollback()


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

    query = query_maker.delete_row(table, values)

    try:
        db_curr.execute(query)
        db_curr.commit()
    except:
        db_curr.rollback()
