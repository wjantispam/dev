import mariadb
import sys

try:
    conn = mariadb.connect(
            user="jianwei",
            password="111",
            host="localhost",
            database="sakila"
            # database = "TestDB"
            )
except mariadb.Error as e:
    print(f"Error connecting to MariaDB: {e}")
    sys.exit(1)

cur = conn.cursor()

q1 = """\
select count(*) from actor
"""

print(cur.execute(q1))
