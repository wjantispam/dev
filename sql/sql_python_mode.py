import mariadb
import sys

def connect(dbname="sakila"):
    try:
        conn = mariadb.connect(
                user = "jianwei",
                password = "111",
                host = "localhost",
                database = dbname,
                )

    except mariadb.Error as e:
        print(f"Error connecting to MariaDB: {e}")
        sys.exit(1)

    cur = conn.cursor()
    return cur


cur = connect()

cur.execute(
        "SHOW DATABASES"
        )
for item in cur:
    print(item)


q1 = """\
select first_name, last_name from actor limit 10
"""

cur.execute(q1)
result = cur.fetchall()
print(result)



testDB = connect("TestDB")
testDB.execute(
        "CREATE TABLE IF NOT EXISTS student (id INT, name VARCHAR(255))"
        )

testDB.execute(
        "INSERT INTO student(id, name) VALUES (01, 'Jon')"
        )

print(testDB.rowcount, "Record inserted")


testDB.execute(
        "SELECT * FROM student"
        )
for item in testDB:
    print(item)

testDB.close()
