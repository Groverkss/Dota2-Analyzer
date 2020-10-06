import pymysql
import pymysql.cursors

db_conn = pymysql.connect(host= "localhost",
                          user= "dota",
                          password= "dota",
                          db='dota',    
                          cursorclass=pymysql.cursors.DictCursor,
                          autocommit = True)
db_curr = db_conn.cursor()


db_curr.execute("INSERT INTO tournament_type\
             VALUES (\"BATMAN LEAGUE\", \"Amatuer\")")
db_conn.commit()