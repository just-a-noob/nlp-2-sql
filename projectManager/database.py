from flask import g
import re

def escape_ansi(line):
    ansi_escape = re.compile(r'(\x9B|\x1B\[)[0-?]*[ -/]*[@-~]')
    return ansi_escape.sub('', line)


def run_query(query):
	print(query.strip())
	try:
		cursor = g.conn.cursor()
		cursor.execute(escape_ansi(query))
		if 'insert' in query:
			g.conn.commit()
			return 'success'
		else:
			return cursor.fetchall()

	except Exception as e:
		print(e)
		return 'failure'
