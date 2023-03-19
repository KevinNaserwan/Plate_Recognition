from flask import Flask, render_template, request
import os
from tes import extract_num
from flaskext.mysql import MySQL
# from flask_mysqldb import MySQL

# webserver
app = Flask(__name__)
# Konfigurasi mysql
mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'plate'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)
conn = mysql.connect()

BASE_PATH = os.getcwd()
UPLOAD_PATH = os.path.join(BASE_PATH, 'static/upload')


@app.route('/', methods=['POST', 'GET'])
def index():
    if request.method == 'POST':
        upload_file = request.files['image_name']
        filename = upload_file.filename
        path_save = os.path.join(UPLOAD_PATH, filename)
        upload_file.save(path_save)
        text = extract_num(path_save)
        cursor = conn.cursor()
        sql = ('select nomor_plat from kendaraan')
        sqls = ('select * from kendaraan')
        cursor.execute(sqls)
        hasil = cursor.fetchall()
        return render_template('index.html', upload=True, upload_image=filename, text=text, data=hasil)

    return render_template('index.html', upload=False)


if __name__ == "__main__":
    app.run(debug=True)
