import pymysql
import pymysql.cursors

db = pymysql.connect(host="localhost", 
                    user="user",
                    password="password",
                    db="Database",
                    cursorclass=pymysql.cursors.DictCursor
                    )


# Executing a command:

c = db.cursor()
c.execute("""SELECT * FROM {db}""", db)

# Fetching the output

# Gets the next row one by one, "fetch one" This is based on
# the cursor that is used.

c.fetchone()

# To fetch the remaining rows from the output, we 
# use fetchall() It fetches only the remaining ones
# and not the ones that have been already fetched.

c.fetchall()

#Insertion in db

insert = """INSERT INTO {db}({row1}, {row2}, 
        {row3}) VALUES ({val1}, {val2}, {val3})"""

try:
    c.execute(insert)
    db.commit()
except:
    db.rollback()
    db.close()
