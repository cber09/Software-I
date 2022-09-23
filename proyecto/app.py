import datetime
from cs50 import SQL
from flask import Flask, flash, jsonify, redirect, render_template, request, sessions, url_for, session, send_file
from jinja2 import Environment
from werkzeug.security import check_password_hash, generate_password_hash
app = Flask(__name__)

db1 = SQL("sqlite:///Veterinaria.db")
app.secret_key = "super secret key"

@app.route('/')
def Index():
    return render_template('index.html')
# asociate (LOGIN)
@app.route('/asociate')
def asociate():
    return render_template('asociate.html')
@app.route('/login',methods=["GET", "POST"])
def login():
    session.clear()
    if request.method == "POST":
        usuario = request.form['loginUser']
        Contraseña = request.form['loginPassword']
        if usuario == "" or Contraseña == "":
            return render_template('asociate.html', errorlogin=1)
        else:
            rows = db1.execute("SELECT * FROM Credenciales Where Usuario=:username",
                               username=usuario)
            
            if len(rows) == 0 or not check_password_hash(rows[0]["Contraseña"], Contraseña):
                return render_template('asociate.html', errorlogin=1)
            else:
                # Estas consultas son para mostrar la lista de personas y su asistencia
                
                empleadoRol = db1.execute(
                    "select rol.* from Credenciales as cred INNER JOIN Roles as rol ON cred.Rol = rol.Id_Rol WHERE cred.Usuario =:u", u=usuario)
                empleado = db1.execute(
                    "select * from Usuarios as u inner join Credenciales as cred ON u.IdCredenciales = cred.Id_Credenciales Where cred.Usuario =:u", u=usuario)

                # # Recordar el usuario y rol que se logeo
                session["user"] = empleado[0]["Usuario"]
                session["usercom"] = empleado[0]["Nombres"]
                session["user_Id"] = empleado[0]["Id_Usuario"]
                session["userrole"] = empleadoRol[0]["Id_Rol"]
                session["nombrerol"] = empleadoRol[0]["NombreRol"]
                if session["nombrerol"] == "Administrador":
                    return redirect(url_for('homesistema'))
                elif session["nombrerol"] == "Empleado":
                    return redirect(url_for('homesistema'))
                else:
                    return render_template('cliente.html',rol =session["nombrerol"],nombre =session["usercom"])
    return render_template('index.html')
#DESLOGUEO
@app.route('/deslog')
def deslog():
    session.clear()
    return render_template('index.html',rol ="",nombre ="" )
######################
######################
#LAYOUT OPCIONES
######################
@app.route('/consulta')
def consulta():
    return render_template('sistema/consulta.html',rol =session["nombrerol"],nombre =session["usercom"] )

@app.route('/usuario')
def usuario():
    return render_template('sistema/usuario.html',rol =session["nombrerol"],nombre =session["usercom"] )

@app.route('/facturacion')
def facturacion():
    return render_template('sistema/facturacion.html',rol =session["nombrerol"],nombre =session["usercom"] )
######################
######################
#HOME AQUI
######################
#HOME SISTEMA
@app.route('/homesistema')
def homesistema():
    return render_template('sistema/admin.html',rol =session["nombrerol"],nombre =session["usercom"])
######################

@app.route('/home')
def home():
    return render_template('index.html',rol =session["nombrerol"],nombre =session["usercom"] )
# usuario nuevo
@app.route('/nuevou',methods=["GET", "POST"])
def nuevou():
    if request.method == "POST":
        nombres = request.form['nombres']
        apellidos = request.form['apellidos']
        direccion = request.form['direccion']
        telefono = request.form['telefono']
        celular = request.form['celular']
        usuario = request.form['loginUser']
        contraseña = request.form['loginPassword']
        verificacion = db1.execute('SELECT * from credenciales Where Usuario = :u',u = usuario)
        db1.execute("INSERT INTO Credenciales VALUES(NULL,:usu,:passw,3)",usu = usuario,passw = generate_password_hash(contraseña))
        credenciales = db1.execute('select Id_Credenciales from Credenciales  order by Id_Credenciales desc limit 1')
        db1.execute("INSERT INTO Usuarios VALUES(NULL,:name,:lastna,:tel,:cel,null,:dir,1,:cred)",
                    name=nombres , lastna=apellidos , tel = telefono,cel = celular,dir=direccion,cred = credenciales[0]['Id_Credenciales'])
        
        
        return redirect(url_for('asociate'))
    else:
        return render_template('nuevous.html')
#CONTACTOS
@app.route('/contactos')
def contactos():
    return render_template('contacto.html')
#NOSOTROS
@app.route('/nosotros')
def nosotros():
    return render_template('nosotros.html')

if __name__ == '__main__':
    app.run(port=5001, debug=True)
