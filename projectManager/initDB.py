import sqlite3
conn = sqlite3.connect("projectDB.db")
conn.execute('''
				create table students(id integer primary key not null,
									  name varchar(20),
									  address varchar(200),
									  phone varchar(10))
			 ''')
conn.execute('''
				create table teams(id integer primary key not null,
								   name varchar(200),
								   leader integer not null,
								   title varchar(200),
								   foreign key(leader) references students(id))
			 ''')

conn.commit()
conn.close()
