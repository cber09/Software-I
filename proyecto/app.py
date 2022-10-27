
from datetime import datetime,date
import random
import secrets
from correo import enviar_correo
from cs50 import SQL
from flask import Flask, flash, jsonify, redirect, render_template, request, sessions, url_for, session, send_file
from jinja2 import Environment
from werkzeug.security import check_password_hash, generate_password_hash
app = Flask(__name__)

db1 = SQL("sqlite:///Veterinaria.db")
app.secret_key = "super secret key"

@app.route('/')
def Index():
    return render_template('index.html', rol = "")
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
    consultas = db1.execute('select c.Id_Consulta,m.Nombre,c.Fecha,c.Sintomas,c.Hora,est.NombreEstado from consulta as c inner join Mascota as m ON c.IdMascota = m.Id_Mascota inner join Estado as est ON c.IdEstado = est.Id_Estado where c.IdUsuario = :u and c.IdEstado = 3',u = session["user_Id"])
    return render_template('sistema/consulta.html',rol =session["nombrerol"],nombre =session["usercom"] , consultas = consultas)
######################
@app.route('/detalleconsul', methods =["POST","GET"])
def detalleconsul():
    hi = datetime.now()
    if request.method == "POST":
        id = request.form['id']
        consultas = db1.execute('select m.Id_Mascota,c.Id_Consulta,u.Nombres,u.apellidos,m.Nombre,c.Fecha,c.Sintomas,c.Hora,est.NombreEstado,m.Edad,m.Sexo,tm.Descripcion,m.Raza from consulta as c inner join Mascota as m ON c.IdMascota = m.Id_Mascota inner join Estado as est ON c.IdEstado = est.Id_Estado inner join Usuarios as u ON m.IdUsuario = u.Id_Usuario inner join TipoMascota as tm on m.IdTipoMascota = tm.Id_TipoMascota where c.Id_Consulta = :u',u = id)
        historial = db1.execute('select c.Diagnostico,re.Id_Receta,c.Fecha from consulta as c inner join Mascota as m ON c.IdMascota = m.Id_Mascota inner join Estado as est ON c.IdEstado = est.Id_Estado  inner join Recetas as re ON c.Id_Consulta = re.IdConsulta Where c.IdEstado = 4 and m.Id_Mascota = :id and date(c.Fecha) <= :fech ORDER BY date(c.Fecha) DESC Limit 1',id = consultas[0]['Id_Mascota'],fech = datetime.date(hi))
        if historial:
            receta = db1.execute('select * from DetalleReceta Where IdReceta = :rec',rec = historial[0]['Id_Receta'])
            return render_template('sistema/consulta-detalle.html',rol =session["nombrerol"],nombre =session["usercom"] , consultas = consultas,historial = historial,recetas = receta)
        else:
            return render_template('sistema/consulta-detalle.html',rol =session["nombrerol"],nombre =session["usercom"] , consultas = consultas,historial = "",recetas = "")
        
@app.route('/diagnosticar', methods =["POST","GET"])
def diagnosticar():
    if request.method == "POST":
        id = request.form['id']
        diagnostico = request.form['diagnostico']
        receta = request.form['receta']
        mascota = request.form['mascota']
        db1.execute('UPDATE Consulta set Diagnostico = :diag, IdEstado = 4 where Id_Consulta = :u',diag = diagnostico,u = id)
        db1.execute('INSERT INTO Recetas VALUES(null,:mas,:con)',mas = mascota,con = id)
        id = db1.execute('select Id_Receta from Recetas order by Id_Receta desc')
        db1.execute('INSERT INTO DetalleReceta VALUES(:id,:receta)',id = id[0]['Id_Receta'],receta = receta)
        return "siuuu"
# USUARIOS
@app.route('/usuario')
def usuario():
    usuarios = db1.execute('select u.*,est.NombreEstado,cred.Usuario,rol.NombreRol from Usuarios as u inner join Credenciales as cred ON u.IdCredenciales = cred.Id_Credenciales inner join Roles as rol ON cred.Rol = rol.Id_Rol inner join estado as est ON u.IdEstado = est.Id_Estado Where u.IdEstado = 1')
    return render_template('sistema/usuario.html',rol =session["nombrerol"],nombre =session["usercom"], user = usuarios )

@app.route('/actusu', methods =["POST","GET"])
def actusu():
    if request.method == "POST":
        
        accion = request.form['accion']
        if accion == "actualizar":
            id = request.form['id']
            usuarios = db1.execute('select u.*,est.NombreEstado,cred.Usuario,rol.NombreRol from Usuarios as u inner join Credenciales as cred ON u.IdCredenciales = cred.Id_Credenciales inner join Roles as rol ON cred.Rol = rol.Id_Rol inner join estado as est ON u.IdEstado = est.Id_Estado where u.Id_Usuario = :id',id = id)
            return render_template('sistema/modal.html',info = usuarios)
        elif accion == "agregar":
            return render_template('sistema/modal.html',info = "agregar")

@app.route('/actualizaremp', methods =["POST","GET"])
def actualizaremp():
    if request.method == "POST":
        id = request.form['id']
        nombre = request.form['nombre']
        apellido = request.form['apellido']
        telfijo = request.form['telfijo']
        celular = request.form['celular']
        direccion = request.form['direccion']
        usuario = request.form['usuario']
        contra = request.form['contra']
        db1.execute('Update Usuarios set Nombres = :nombre, Apellidos = :apell,TelefonoFijo = :tel,Celular = :cel,Direccion = :dir where Id_Usuario = :id',nombre = nombre,apell = apellido,tel = telfijo,cel = celular,dir = direccion,id = id)
        if contra:
            db1.execute('update Credenciales set Usuario = :usu,Contraseña = :contra where Id_Credenciales = :id',usu = usuario, contra = generate_password_hash(contra),id = id)
    return redirect(url_for('usuario'))

@app.route('/elimusu', methods =["POST","GET"])
def elimusu():
    if request.method == "POST":
        id = request.form['id']
        db1.execute('Update Usuarios set IdEstado = :est where Id_Usuario = :id',est = 2,id = id)
        return redirect(url_for('usuario'))

@app.route('/buscarusu', methods =["POST","GET"])
def buscarusu():
    if request.method == "POST":
        usuario = request.form['usuario']
        existente = db1.execute('select * from Credenciales where Usuario == :us',us = usuario )
        if existente:
            return "ya hay"
        else:
            return "no existe"
@app.route('/buscar', methods =["POST","GET"])
def buscar():
    if request.method == "POST":
        correo = request.form['correo']
        mascota = request.form['masc']
        flag = request.form['flag']
        if flag == "mascota":
            usuario = db1.execute('select Id_Usuario from Usuarios WHere correo = :cor',cor = correo)
            print(usuario)
            if usuario:
                existente = db1.execute('select Id_Mascota From Mascota Where IdUsuario = :usu AND Nombre = :name',usu = usuario[0]['Id_Usuario'],name = mascota)
                print(existente)
                if existente:
                    return "encontrada"
                else:
                    return "no"
            else:
                return "no"


######################
# clientes
@app.route('/clienteinfo', methods =["POST","GET"])
def clienteinfo():
    if request.method == "POST":
       id = request.form['id']
       return render_template('sistema/modal-cliente.html',id = id)
        
######################
# OTRAS FUNCIONES
@app.route('/correo',methods=["GET", "POST"])
def correo():
    if request.method == "POST":
        nombres = request.form['nombres']
        apellidos = request.form['apellidos']
        correoc = request.form['correo']
        usuario = request.form['loginUser']
        contraseña = request.form['loginPassword']
        message = "Bienvenido al sistema de la Veterinaria El buen productor.\nSu Usuario es: "+ usuario+" \nSu Contraseña es: "+contraseña
        enviar_correo(app,"Bienvenido a Nuestra Familia",correoc,message)
        return "done"
    else:
        return render_template('nuevous.html')

@app.route('/buscarcorreo', methods =["POST","GET"])
def buscarcorreo():
    if request.method == "POST":
        correo = request.form['correo']
        existente = db1.execute('select * from Usuarios WHere correo = :us',us = correo )
        if existente:
            return "ya hay"
        else:
            return "no existe"

######################
######################
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
        correo = request.form['correo']
        usuario = request.form['loginUser']
        contraseña = request.form['loginPassword']
        flag = request.form['flag']
        print(flag)
        if flag:
            rol = request.form['rol']
            verificacion = db1.execute('SELECT * from credenciales Where Usuario = :u',u = usuario)
            db1.execute("INSERT INTO Credenciales VALUES(NULL,:usu,:passw,:rol)",usu = usuario,passw = generate_password_hash(contraseña),rol = rol)
            credenciales = db1.execute('select Id_Credenciales from Credenciales  order by Id_Credenciales desc limit 1')
            db1.execute("INSERT INTO Usuarios VALUES(NULL,:name,:lastna,:tel,:cel,:corr,:dir,1,:cred,null)",
                        name=nombres , lastna=apellidos , tel = telefono,cel = celular,corr = correo,dir=direccion,cred = credenciales[0]['Id_Credenciales'])
            return "yes"
        else:
            verificacion = db1.execute('SELECT * from credenciales Where Usuario = :u',u = usuario)
            db1.execute("INSERT INTO Credenciales VALUES(NULL,:usu,:passw,3)",usu = usuario,passw = generate_password_hash(contraseña))
            credenciales = db1.execute('select Id_Credenciales from Credenciales  order by Id_Credenciales desc limit 1')
            db1.execute("INSERT INTO Usuarios VALUES(NULL,:name,:lastna,:tel,:cel,:corr,:dir,1,:cred,null)",
                            name=nombres , lastna=apellidos , tel = telefono,cel = celular,corr = correo,dir=direccion,cred = credenciales[0]['Id_Credenciales'])
                
            return redirect(url_for('asociate'))
    else:
        return render_template('nuevous.html')
#mascota
@app.route('/mascota',methods=["GET", "POST"])
def mascota():
     if request.method == "POST":
        flag = request.form['flag']
        if flag:
            nombremas = request.form['nombremas']
            edad = request.form['edad']
            tipo = request.form['tipo']
            sexo = request.form['sexo']
            raza = request.form['raza']
            correo = request.form['correo']
            usuario = db1.execute('select Id_Usuario from Usuarios WHere correo = :cor',cor = correo)
            mascota = db1.execute('select Id_Mascota From Mascota Where IdUsuario = :usu AND Nombre = :name',usu = usuario[0]['Id_Usuario'],name = nombremas)
            return "mascota lista"
        else:
            nombremas = request.form['nombremas']
            edad = request.form['edad']
            tipo = request.form['tipo']
            sexo = request.form['sexo']
            raza = request.form['raza']
            correo = request.form['correo']
            usuario = db1.execute('select Id_Usuario from Usuarios WHere correo = :cor',cor = correo)
            db1.execute('INSERT INTO Mascota values(null,:us,:nom,:edad,:raza,:sexo,:tipo,1)',us = usuario[0]['Id_Usuario'],nom = nombremas, edad = edad, raza = raza,sexo = sexo,tipo = tipo)
            return "mascota lista"
@app.route('/generarconsulta',methods=["GET", "POST"])
def generarconsulta():
     if request.method == "POST":
        sintomas1 = request.form['sintomas1']
        nombremas = request.form['nombremas']
        fecha = request.form['fecha']
        correo = request.form['correo']
        usuario = db1.execute('select Id_Usuario from Usuarios WHere correo = :cor',cor = correo)
        mascota = db1.execute('SELECT Id_Mascota From Mascota Where IdUsuario = :usu AND Nombre =:nam',usu = usuario[0]['Id_Usuario'], nam = nombremas)
        vet = db1.execute('select u.Id_Usuario from usuarios as u inner join credenciales as cred on u.IdCredenciales = cred.Id_Credenciales where cred.Rol = 1')
        
        numero = secrets.choice(vet)
        db1.execute('INSERT INTO Consulta values(null,:mas,:fecha,:sintomas,null,:vet,"3:00",3)',mas = mascota[0]['Id_Mascota'],fecha = fecha, sintomas = sintomas1, vet = numero['Id_Usuario'])
        return "consulta lista"


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
