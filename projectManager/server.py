from flask import Flask,g,render_template,request,jsonify
import sqlite3
import database as db
from flask.ext.mysql import MySQL
from pymysql.cursors import DictCursor
import ln2sql,os


app = Flask(__name__)
mysql = MySQL(cursorclass=DictCursor)

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'college'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
#app.config['MYSQL_DATABASE_PORT'] = 'localhost'
mysql.init_app(app)



@app.route('/')
@app.route('/getResults',methods=['GET','POST'])
def add_student():
	if request.method == 'GET':
		return render_template('index.html')
	else:
		query = request.form['query']
		print("gotcha",query)
		query = ln2sql.Ln2sql(database_path=os.path.join(os.getcwd(),'college.sql'),language_path=os.path.join(os.getcwd(),'english.csv')).get_query(query)  #get title of course with student whose name is Shravan
		status = db.run_query(query)
		return jsonify({'content':status})


@app.before_request
def get_db():
	if not hasattr(g,'db'):
		g.conn = mysql.connect()

@app.teardown_request
def teardown(exception):
	if hasattr(g,'db'):
		g.conn.close()


app.run(debug=True,host='0.0.0.0')
