def strip_space(str):
    """Strips white space from left and right ends"""
    return str.lstrip().rstrip()


def insert_row(table_name, values):
    """Inserts a row in 'table_name' with values as 'values'"""
    query = f'INSERT INTO {table_name} VALUES ('

    no_attrs = len(values)

    # Add values to query
    for i in range(0, no_attrs - 1):
        query += f'{values[i]}, '

    # Add semicolon for last value
    query += f'{values[no_attrs - 1]});'

    print(query)
