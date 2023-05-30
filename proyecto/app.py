
from datetime import datetime,date, timedelta
import random
from dateutil.relativedelta import relativedelta
import secrets
import shutil
import pandas as pd
from io import BytesIO
from cs50 import SQL
from flask import Flask, flash, jsonify, make_response, redirect, render_template, request, sessions, url_for, session, send_file
from jinja2 import Environment
from werkzeug.security import check_password_hash, generate_password_hash
from correo import enviar_correo
from conexion import conectar

app = Flask(__name__)

#db1 = SQL("sqlite:///Veterinaria.db")
app.secret_key = "super secret key"
def capturarHora():
    hi = datetime.now()
    return hi
@app.route('/')
def Index():
    # conn = conectar()
    # cursor = conn.cursor()
    # query = 'INSERT INTO credenciales (usuario,contrasena,rol,cargo) VALUES (?,?,?,?)'
    # cursor.execute(query, ('empleado',generate_password_hash('123'),3,3))
    # conn.commit()
    # cursor.close()
    # conn.close()
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
            return render_template('index.html', errorlogin=1)
        else:
            # SINTAXIS PARA CONSULTAS EN SQL
            conn = conectar()
            cursor = conn.cursor()
            query = 'SELECT * FROM Credenciales where usuario = ?'
            cursor.execute(query, usuario)
            rows = cursor.fetchall()
            
            cursor.close()
            conn.close()
            # AQUI TERMINA LA SINTAXIS
            if len(rows) == 0 or not check_password_hash(rows[0][2], Contraseña):
            #if len(rows) == 0 or not check_password_hash(rows[0]["Contraseña"], Contraseña):
                return render_template('index.html', errorlogin=1)
            else:
                # Estas consultas son para mostrar la lista de personas y su asistencia
                
                #empleadoRol = db1.execute(
                #   "select rol.* from Credenciales as cred INNER JOIN Roles as rol ON cred.Rol = rol.Id_Rol WHERE cred.Usuario =:u", u=usuario)
                if rows[0][4] == 1:
                    # es VETERINARIO
                    #DATOS DEL USUARIO O EMPLEADO (NOMBRE ETC)
                    conn = conectar()
                    cursor = conn.cursor()
                    query = 'SELECT * FROM veterinario where id_credencial = ?'
                    cursor.execute(query, rows[0][0])
                    empleado = cursor.fetchall()
                    
                    cursor.close()
                    conn.close()
                    session['cargo'] = 'VETERINARIO'
                else:
                    # ES CLIENTE
                    conn = conectar()
                    cursor = conn.cursor()
                    query = 'SELECT * FROM cliente where id_credencial = ?'
                    cursor.execute(query, rows[0][0])
                    empleado = cursor.fetchall()
                    
                    cursor.close()
                    conn.close()
                    session['cargo'] = 'CLIENTE'
                #=======0
                print(empleado)
                #empleado = db1.execute(
                #    "select * from Usuarios as u inner join Credenciales as cred ON u.IdCredenciales = cred.Id_Credenciales Where cred.Usuario =:u", u=usuario)

                # # Recordar el usuario y rol que se logeo
                session["user"] = usuario
                if session['cargo'] == 'VETERINARIO':
                    session["usercom"] = empleado[0][3]
                else:
                    session["usercom"] = empleado[0][1]
                
                session["user_Id"] = empleado[0][0]
                session["userrole"] = rows[0][3]
                if session['userrole'] == 1:
                    session["nombrerol"] = 'Administrador'
                elif session['userrole'] == 2:
                    session["nombrerol"] = 'Empleado'
                    print(session['usercom'])
                else:
                    session["nombrerol"] = 'Cliente'
                if session["nombrerol"] == "Administrador":
                    return redirect(url_for('homesistema'))
                elif session["nombrerol"] == "Empleado":
                    return redirect(url_for('homesistema'))
                else:
                    #aca traemos las consultas del cliente logeado
                    #consultas = db1.execute('select c.*,m.Nombre from Consulta as c inner join mascota as m ON c.IdMascota = m.Id_Mascota inner join Usuarios as u ON m.IdUsuario = u.Id_Usuario Where u.Id_Usuario = :id',id = session["user_Id"] )
                    #TRAER CONSULTAS DEL CLIENTE QUE ESTA LOGUEADO
                    conn = conectar()
                    cursor = conn.cursor()
                    query = 'select ate.cod_atencion,ate.fecha_atencion,ma.Nombre_mascota,ate.tipo_atencion,c.nombres_cliente,est.NombreEstado from atencion as ate inner join cliente as c on ate.num_cliente = c.num_cliente inner join veterinario as vet on ate.num_veterinario = vet.num_veterinario inner join mascota as ma on ate.idMascota = ma.idMascota inner join estado as est on ate.id_estado = est.id_estado where c.num_cliente = ?'
                    cursor.execute(query,session['user_Id'])
                    consultas = cursor.fetchall()
                    
                    cursor.close()
                    conn.close()
                    #receta = db1.execute('select * from DetalleReceta Where IdReceta = :rec',rec = historial[0]['Id_Receta'])
                    return render_template('cliente.html',rol =session["nombrerol"],nombre =session["usercom"], cons = consultas)
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
        historial = db1.execute('select c.Diagnostico,re.Id_Receta,c.Fecha from consulta as c inner join Mascota as m ON c.IdMascota = m.Id_Mascota inner join Estado as est ON c.IdEstado = est.Id_Estado  inner join Recetas as re ON c.Id_Consulta = re.IdConsulta Where c.IdEstado = 4 and m.Id_Mascota = :id and date(c.Fecha) <= :fech ORDER BY date(re.Id_Receta) ASC Limit 1',id = consultas[0]['Id_Mascota'],fech = datetime.date(hi))
        print(historial)
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
        receta = db1.execute('select Id_Receta From Recetas WHere IdConsulta = :id',id = id)
        
        return str(receta[0]['Id_Receta'])
# USUARIOS
@app.route('/usuario')
def usuario():
    #usuarios = db1.execute('select u.*,est.NombreEstado,cred.Usuario,rol.NombreRol from Usuarios as u inner join Credenciales as cred ON u.IdCredenciales = cred.Id_Credenciales inner join Roles as rol ON cred.Rol = rol.Id_Rol inner join estado as est ON u.IdEstado = est.Id_Estado Where u.IdEstado = 1')
    
    conn = conectar()
    cursor = conn.cursor()
    query = 'select cli.num_cliente,cli.nombres_cliente,cli.apellidos_cliente,cli.direccion_cliente,cli.correo_cliente,est.NombreEstado,cred.usuario,cred.rol from cliente as cli inner join estado as est On cli.id_estado = est.id_estado inner join credenciales as cred on cli.id_credencial = cred.id_credencial'
    cursor.execute(query)
    usuarios = cursor.fetchall()
    
    return render_template('sistema/tablas/usuario.html',rol =session["nombrerol"],nombre =session["usercom"], user = usuarios )

@app.route('/verVeterinarios')
def verVeterinarios():
    #usuarios = db1.execute('select u.*,est.NombreEstado,cred.Usuario,rol.NombreRol from Usuarios as u inner join Credenciales as cred ON u.IdCredenciales = cred.Id_Credenciales inner join Roles as rol ON cred.Rol = rol.Id_Rol inner join estado as est ON u.IdEstado = est.Id_Estado Where u.IdEstado = 1')
    
    conn = conectar()
    cursor = conn.cursor()
    query = 'select vet.num_veterinario,vet.cod_veterinario,vet.nom_vet,vet.dir_vet,vet.cel_vet,vet.correo_vet,est.NombreEstado,cred.usuario,cred.rol from veterinario as vet inner join credenciales as cred on vet.id_credencial = cred.id_credencial inner join estado as est on vet.id_estado = est.id_estado '
    cursor.execute(query)
    usuarios = cursor.fetchall()
    
    
    return render_template('sistema/tablas/tabla-veterinarios.html',rol =session["nombrerol"],nombre =session["usercom"], user = usuarios )

@app.route('/verClientes')
def verClientes():
    #usuarios = db1.execute('select u.*,est.NombreEstado,cred.Usuario,rol.NombreRol from Usuarios as u inner join Credenciales as cred ON u.IdCredenciales = cred.Id_Credenciales inner join Roles as rol ON cred.Rol = rol.Id_Rol inner join estado as est ON u.IdEstado = est.Id_Estado Where u.IdEstado = 1')
    conn = conectar()
    cursor = conn.cursor()
    query = 'select cli.num_cliente,cli.nombres_cliente,cli.apellidos_cliente,cli.direccion_cliente,cli.correo_cliente,est.NombreEstado,cred.usuario,cred.rol from cliente as cli inner join estado as est On cli.id_estado = est.id_estado inner join credenciales as cred on cli.id_credencial = cred.id_credencial'
    cursor.execute(query)
    usuarios = cursor.fetchall()
    return render_template('sistema/tablas/tabla-clientes.html',rol =session["nombrerol"],nombre =session["usercom"], user = usuarios )




@app.route('/verMascotas')
def verMascotas():
    conn = conectar()
    cursor = conn.cursor()
    query = 'select idMascota,Nombre_mascota,r.nombre_raza,fecha_nac_mascota,fecha_ingreso,sexo,c.nombres_cliente +' ' + c.apellidos_cliente as cliente,e.NombreEstado  from mascota inner join estado as e on mascota.id_estado = e.id_estado inner join cliente as c on mascota.num_cliente = c.num_cliente inner join raza as r on mascota.id_raza = r.id_raza'
    cursor.execute(query)
    usuarios = cursor.fetchall()
    return render_template('sistema/tablas/tabla-mascotas.html',rol =session["nombrerol"],nombre =session["usercom"], user = usuarios )

@app.route('/addPet',  methods =["POST","GET"])
def addPet():
    if request.method == "POST":
        accion = request.form['accion']
        conn = conectar()
        cursor = conn.cursor()
        query = 'select idMascota,Nombre_mascota,r.nombre_raza,fecha_nac_mascota,fecha_ingreso,sexo,c.nombres_cliente +' ' + c.apellidos_cliente as cliente  from mascota inner join cliente as c on mascota.num_cliente = c.num_cliente inner join raza as r on mascota.id_raza = r.id_raza'
        cursor.execute(query)
        mascotas = cursor.fetchall()


        conn = conectar()
        cursor = conn.cursor()
        query = "select num_cliente, nombres_cliente+ ' '+apellidos_cliente as nombre  from cliente"
        cursor.execute(query)
        clientes = cursor.fetchall()


        conn = conectar()
        cursor = conn.cursor()
        query = "select id_raza,nombre_raza from raza"
        cursor.execute(query)
        raza = cursor.fetchall()

        conn = conectar()
        cursor = conn.cursor()
        query = "select id_especie,nom_especie from especie"
        cursor.execute(query)
        especie = cursor.fetchall()

        return render_template('sistema/modales/modal-mascota-nueva.html',info = "agregar",especie = especie, raza = raza,clientes = clientes, user = mascotas )


@app.route('/mascotaNueva',methods=["GET", "POST"])
def mascotaNueva():
    if request.method == "POST":
        nombres = request.form['nombres']
        especie = request.form['especie']
        raza = request.form['raza']
        fnaci = request.form['fnaci']
        sexo = request.form['sexo']
        cliente = request.form['cliente']
        color = request.form['color']
        hi = capturarHora()
        conn = conectar()
        cursor = conn.cursor()
        query = 'INSERT INTO mascota (Nombre_mascota,id_estado,id_raza,num_cliente,fecha_nac_mascota,sexo,color,fecha_ingreso) VALUES (?,?,?,?,?,?,?,?)'
        cursor.execute(query, (nombres,1,raza,cliente,fnaci,sexo,color,hi.date()))
        conn.commit()
        cursor.close()
        conn.close()




        return "yes"


@app.route('/actusu', methods =["POST","GET"])
def actusu():
    if request.method == "POST":
        
        accion = request.form['accion']
        print(accion)
        if accion == "actualizar":
            tabla = request.form['tabla']
            if tabla == 'veterinario':
                id = request.form['id']
                #usuarios = db1.execute('select u.*,est.NombreEstado,cred.Usuario,rol.NombreRol from Usuarios as u inner join Credenciales as cred ON u.IdCredenciales = cred.Id_Credenciales inner join Roles as rol ON cred.Rol = rol.Id_Rol inner join estado as est ON u.IdEstado = est.Id_Estado where u.Id_Usuario = :id',id = id)
                
                conn = conectar()
                cursor = conn.cursor()
                query = 'select vet.num_veterinario,vet.cod_veterinario,vet.nom_vet,vet.dir_vet,vet.cel_vet,vet.correo_vet,est.NombreEstado,cred.usuario,cred.rol from veterinario as vet inner join credenciales as cred on vet.id_credencial = cred.id_credencial inner join estado as est on vet.id_estado = est.id_estado where num_veterinario = ?'
                cursor.execute(query,id)
                usuarios = cursor.fetchall()
                
                return render_template('sistema/modales/modal.html',tabla = tabla,info = usuarios)
            elif tabla == 'cliente':
                
                id = request.form['id']
                #usuarios = db1.execute('select u.*,est.NombreEstado,cred.Usuario,rol.NombreRol from Usuarios as u inner join Credenciales as cred ON u.IdCredenciales = cred.Id_Credenciales inner join Roles as rol ON cred.Rol = rol.Id_Rol inner join estado as est ON u.IdEstado = est.Id_Estado where u.Id_Usuario = :id',id = id)
                print(id)
                conn = conectar()
                cursor = conn.cursor()
                query = 'select cli.num_cliente,cli.nombres_cliente as nombre,cli.apellidos_cliente,cli.direccion_cliente,cli.correo_cliente,est.NombreEstado,c.usuario,c.rol from cliente as cli inner join estado as est on cli.id_estado = est.id_estado inner join credenciales as c on cli.id_credencial = c.id_credencial where num_cliente = ?'
                cursor.execute(query,id)
                usuarios = cursor.fetchall()
                
                return render_template('sistema/modales/modal.html',tabla = tabla,info = usuarios)
        elif accion == "agregar":
            tabla = request.form['tabla']
            if tabla == "veterinario":
                return render_template('sistema/modales/modal-veterianrio-agregar.html',info = "agregar")
            else:

                return render_template('sistema/modales/modal.html',info = "agregar")

@app.route('/actualizaremp', methods =["POST","GET"])
def actualizaremp():
    if request.method == "POST":
        id = request.form['id']
        origen = request.form['origen']

        if origen == "cliente":
            nombre = request.form['nombre']
            apellido = request.form['apellido']
            direccion = request.form['direccion']
            usuario = request.form['usuario']
            correo = request.form['correo']
            contra = request.form['contra']

            conn = conectar()
            cursor = conn.cursor()
            query = 'UPDATE cliente set nombres_cliente = ?,apellidos_cliente = ?,direccion_cliente = ?,correo_cliente = ? where num_cliente = ?'
            cursor.execute(query,(nombre,apellido,direccion,correo,id))
            conn.commit()
            cursor.close()
            conn.close()

            if contra:
                conn = conectar()
                cursor = conn.cursor()
                query = 'SELECT id_credencial FROM cliente where num_cliente = ?'
                cursor.execute(query, id)
                id_credenciales = cursor.fetchone()
                print(id_credenciales[0])
                # MODIFICAR LA CONTRASEÑA
                conn = conectar()
                cursor = conn.cursor()
                query = 'UPDATE credenciales set usuario = ?,contrasena = ? where id_credencial = ?'
                cursor.execute(query,(usuario,contra,id_credenciales[0]))
                conn.commit()
                cursor.close()
                conn.close()
            else:
                conn = conectar()
                cursor = conn.cursor()
                query = 'SELECT id_credencial FROM cliente where num_cliente = ?'
                cursor.execute(query, id)
                id_credenciales = cursor.fetchone()
                print(id_credenciales[0])
                # MODIFICAR LA CONTRASEÑA
                conn = conectar()
                cursor = conn.cursor()
                query = 'UPDATE credenciales set usuario = ? where id_credencial = ?'
                cursor.execute(query,(usuario,id_credenciales[0]))
                conn.commit()
                cursor.close()
                conn.close()

            #db1.execute('Update Usuarios set Nombres = :nombre, Apellidos = :apell,TelefonoFijo = :tel,Celular = :cel,Direccion = :dir where Id_Usuario = :id',nombre = nombre,apell = apellido,tel = telfijo,cel = celular,dir = direccion,id = id)
            #if contra:
            #    db1.execute('update Credenciales set Usuario = :usu,Contraseña = :contra where Id_Credenciales = :id',usu = usuario, contra = generate_password_hash(contra),id = id)
            return redirect(url_for('verClientes'))
        elif origen == "veterinario":
            nombre = request.form['nombre']
            celular = request.form['celular']
            direccion = request.form['direccion']
            usuario = request.form['usuario']
            correo = request.form['correo']
            contra = request.form['contra']

            conn = conectar()
            cursor = conn.cursor()
            query = 'UPDATE veterinario set nom_vet = ?,cel_vet = ?,dir_vet = ?,correo_vet = ? where num_veterinario = ?'
            cursor.execute(query,(nombre,celular,direccion,correo,id))
            conn.commit()
            cursor.close()
            conn.close()

            if contra:
                conn = conectar()
                cursor = conn.cursor()
                query = 'SELECT id_credencial FROM veterinario where num_veterinario = ?'
                cursor.execute(query, id)
                id_credenciales = cursor.fetchone()
                print(id_credenciales[0])
                # MODIFICAR LA CONTRASEÑA
                conn = conectar()
                cursor = conn.cursor()
                query = 'UPDATE credenciales set usuario = ?,contrasena = ? where id_credencial = ?'
                cursor.execute(query,(usuario,contra,id_credenciales[0]))
                conn.commit()
                cursor.close()
                conn.close()
            else:
                conn = conectar()
                cursor = conn.cursor()
                query = 'SELECT id_credencial FROM veterinario where num_veterinario = ?'
                cursor.execute(query, id)
                id_credenciales = cursor.fetchone()
                print(id_credenciales[0])
                # MODIFICAR LA CONTRASEÑA
                conn = conectar()
                cursor = conn.cursor()
                query = 'UPDATE credenciales set usuario = ? where id_credencial = ?'
                cursor.execute(query,(usuario,id_credenciales[0]))
                conn.commit()
                cursor.close()
                conn.close()

            #db1.execute('Update Usuarios set Nombres = :nombre, Apellidos = :apell,TelefonoFijo = :tel,Celular = :cel,Direccion = :dir where Id_Usuario = :id',nombre = nombre,apell = apellido,tel = telfijo,cel = celular,dir = direccion,id = id)
            #if contra:
            #    db1.execute('update Credenciales set Usuario = :usu,Contraseña = :contra where Id_Credenciales = :id',usu = usuario, contra = generate_password_hash(contra),id = id)
            return redirect(url_for('verVeterinarios'))

@app.route('/elimusu', methods =["POST","GET"])
def elimusu():
    if request.method == "POST":
        id = request.form['id']
        tabla = request.form['tabla']
        #db1.execute('Update Usuarios set IdEstado = :est where Id_Usuario = :id',est = 2,id = id)
        if tabla == 'veterinario':

            conn = conectar()
            cursor = conn.cursor()
            query = 'UPDATE veterinario set id_estado = 2 where num_veterinario = ?'
            cursor.execute(query, id)
            conn.commit()
            cursor.close()
            conn.close()
            return redirect(url_for('verVeterinarios'))
        
        if tabla == 'cliente':

            conn = conectar()
            cursor = conn.cursor()
            query = 'UPDATE cliente set id_estado = 2 where num_cliente = ?'
            cursor.execute(query, id)
            conn.commit()
            cursor.close()
            conn.close()
            return redirect(url_for('verClientes'))
        

@app.route('/activarusu', methods =["POST","GET"])
def activarusu():
    if request.method == "POST":
        id = request.form['id']
        tabla = request.form['tabla']
        #db1.execute('Update Usuarios set IdEstado = :est where Id_Usuario = :id',est = 2,id = id)
        if tabla == 'veterinario':

            conn = conectar()
            cursor = conn.cursor()
            query = 'UPDATE veterinario set id_estado = 1 where num_veterinario = ?'
            cursor.execute(query, id)
            conn.commit()
            cursor.close()
            conn.close()
            return redirect(url_for('verVeterinarios'))
        
        if tabla == 'cliente':

            conn = conectar()
            cursor = conn.cursor()
            query = 'UPDATE cliente set id_estado = 1 where num_cliente = ?'
            cursor.execute(query, id)
            conn.commit()
            cursor.close()
            conn.close()
            return redirect(url_for('verClientes'))
            


@app.route('/eliminar', methods =["POST","GET"])
def eliminar():
    if request.method == "POST":
        id = request.form['id']
        flag = request.form['flag']
        
        if flag == "fact":
            receta = request.form['receta']
            cantidad = db1.execute('select IdProducto,Cantidad From DetalleVenta WHERE IdDetalle = :id',id = id)
            stock = db1.execute('SELECT Stock from Producto WHERE Id_Producto = :name',name = cantidad[0]['IdProducto'])
            db1.execute('UPDATE Producto set Stock =:nuevo WHERE Id_Producto =:id',nuevo = (int(cantidad[0]['Cantidad'])+ stock[0]['Stock']),id = id)
            
            db1.execute('DELETE FROM DetalleVenta WHERE IdDetalle = :id',est = 2,id = id)
        
            recetas = db1.execute('select Medicamento from DetalleReceta Where IdReceta = :name AND IdEstado = 1',name = receta)
            cantidad = 0    
            print("receta: ",recetas)
            medicamentobase = {}
            nohay = []
            hay = []
                
            total = 0
            for i in recetas:
                    
                medicamentoencontrado = db1.execute('select Nombre,Precio from Producto where Nombre = :name', name = i['Medicamento'])
                    
                if medicamentoencontrado:
                    hay.append(medicamentoencontrado)
                    cantidad = db1.execute('select Cantidad from DetalleReceta Where Medicamento = :name and IdReceta = :rec',name = i['Medicamento'],rec = receta)
                    total = total + int(medicamentoencontrado[0]['Precio'] * cantidad[0]['Cantidad'] )

                else:
                        
                    nohay.append(medicamentoencontrado)
                

            return render_template('sistema/tablas/tabla-factura.html',productos = hay,total = total,cant  = cantidad, nohay = nohay)  
        elif flag == "fact-rapida":
            idventa = request.form['idventa']

            cantidad = db1.execute('select IdProducto,Cantidad From DetalleVenta WHERE IdDetalle = :id',id = id)
            print(cantidad)
            stock = db1.execute('SELECT Stock from Producto WHERE Id_Producto = :name',name = cantidad[0]['IdProducto'])
            print(stock)
            db1.execute('UPDATE Producto set Stock =:nuevo WHERE Id_Producto =:id',nuevo = (int(cantidad[0]['Cantidad'])+ int(stock[0]['Stock'])),id = cantidad[0]['IdProducto'])
            

            db1.execute('DELETE FROM DetalleVenta WHERE IdDetalle = :id',id = id)
            sumatotal = db1.execute('select sum(Subtotal) as total from DetalleVenta where IdVenta = :idv',idv =idventa)
            print(sumatotal[0]['total'])
            db1.execute('UPDATE Ventas set total = :total WHERE Id_Venta = :id',total = sumatotal[0]['total'], id = idventa)
            nuevatabla = db1.execute('select dv.IdDetalle,p.Nombre as Nombre,p.Precio as Precio,dv.Cantidad from DetalleVenta as dv Inner join Producto as p ON dv.IdProducto = p.Id_Producto Where dv.IdVenta  = :idven',idven = idventa)
        
            return render_template('sistema/tablas/tabla-factura-rapida.html',productos = nuevatabla,total = sumatotal[0]['total'])         



@app.route('/buscarusu', methods =["POST","GET"])
def buscarusu():
    if request.method == "POST":
        usuario = request.form['usuario']
        conn = conectar()
        cursor = conn.cursor()
        query = 'SELECT id_credencial FROM credenciales where usuario = ?'
        cursor.execute(query, usuario)
        existente = cursor.fetchone()
        if existente:
            return "ya hay"
        else:
            return "no existe"

@app.route('/buscarCorreo', methods =["POST","GET"])
def buscarCorreo():
    if request.method == "POST":
        correo = request.form['correo']
        existente = db1.execute('select * from Usuarios where Correo like :us',us = correo +'%' )
        if existente:
            return "ya hay"
        else:
            return "no existe"

@app.route('/buscar', methods =["POST","GET"])
def buscar():
    if request.method == "POST":
        flag = request.form['flag']
        print(flag)
        if flag == "mascota":
            correo = request.form['correo']
            mascota = request.form['masc']
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
        elif flag == "producto":
            producto = request.form['producto']
            producto += "%"
            productos = db1.execute('SELECT Id_Producto,Nombre from Producto WHERE Nombre Like :name',name = producto)
            if productos:
                return render_template('producto-busqueda.html',productos = productos)
            else:
                return "No"
        elif flag == "receta":
            receta = request.form['receta']
            recetas = db1.execute('select Medicamento from DetalleReceta Where IdReceta = :name AND IdEstado = 1',name = receta)
            
            print("receta: ",recetas)
            medicamentobase = {}
            nohay = []
            hay = []
            cantidades = []
            cantidad = 0  
            total = 0
            cont = 0
            for i in recetas:
                
                medicamentoencontrado = db1.execute('select p.Nombre,p.Precio,dr.Cantidad from Producto as p inner join DetalleReceta as dr ON p.Id_Producto = dr.IdProducto where p.Nombre = :name and dr.IdReceta = :rec', name = i['Medicamento'],rec = receta)
                
                if medicamentoencontrado:
                    hay.append(medicamentoencontrado)
                    cantidad = db1.execute('select Cantidad from DetalleReceta Where Medicamento = :name and IdReceta = :rec',name = i['Medicamento'],rec = receta)
                    cantidades.append(cantidad)
                    print("cantidad receta: ",cantidad)
                    total = total + int(medicamentoencontrado[0]['Precio'] * cantidad[0]['Cantidad'])

                else:
                    
                    nohay.append(medicamentoencontrado)
            
            print("hay vale:",hay)
            print("no hay: ",nohay) 
            print(cantidades)
            if hay:
                return render_template('sistema/tablas/tabla-factura.html',productos = hay,total = total,cant  = cantidades,nohay = nohay)
            else:
                return "no"
       


@app.route('/cantidad', methods =["POST","GET"])
def cantidad():
    if request.method == "POST":
        id = request.form['id']
        cant = request.form['cant']
        receta = request.form['receta']

        precio = db1.execute('SELECT Id_Producto,Precio,Stock from Producto WHERE Nombre = :name',name = id)
        
        if int(precio[0]['Stock']) >= int(cant):
            db1.execute('UPDATE DetalleReceta set Cantidad = :cant WHERE Medicamento = :id',cant = cant,id = id)

        
            recetas = db1.execute('select Medicamento from DetalleReceta Where IdReceta = :name AND IdEstado = 1',name = receta)
                
            print("receta: ",recetas)
            medicamentobase = {}
            nohay = []
            hay = []
            cantidades = []
                
            total = 0
            for i in recetas:
                    
                medicamentoencontrado = db1.execute('select p.Nombre,p.Precio,dr.Cantidad from Producto as p inner join DetalleReceta as dr ON p.Id_Producto = dr.IdProducto where p.Nombre = :name', name = i['Medicamento'])
                    
                if medicamentoencontrado:
                    hay.append(medicamentoencontrado)
                    cantidad = db1.execute('select Cantidad from DetalleReceta Where Medicamento = :name And IdReceta = :rec',name = i['Medicamento'],rec = receta)
                    cantidades.append(cantidad)
                    print("cantidad receta: ",cantidad)
                    total = total + int(medicamentoencontrado[0]['Precio'] * cantidad[0]['Cantidad'] )

                else:
                        
                    nohay.append(medicamentoencontrado)
                
            print("cantidad: ",cantidades)
            return render_template('sistema/tablas/tabla-factura.html',productos = hay,total = total,cant  = cantidad, nohay = nohay)  
        else:
            return "NoStock"      

@app.route('/insertarReceta', methods =["POST","GET"])
def insertarReceta():
    if request.method == "POST":
        prod = request.form['prod']
        cons = request.form['cons']
        mascota = request.form['mascota']
       
        insertado = db1.execute('select * from Recetas WHERE IdMascota = :mas AND IdConsulta = :con',mas = mascota,con = cons)
        
        if insertado:
            id = db1.execute('select Id_Receta from Recetas  WHERE IdMascota = :mas AND IdConsulta = :con order by Id_Receta desc',mas = mascota,con = cons)
            print(id)
            verificardetalle = db1.execute('select * from DetalleReceta Where IdReceta = :id AND Medicamento = :medi',id =id[0]['Id_Receta'],medi = prod )
            if verificardetalle:
                receta = db1.execute('SELECT * from DetalleReceta Where IdReceta = :id',id = id[0]['Id_Receta'])
            else:
                idprod = db1.execute('SELECT Id_Producto From Producto Where Nombre = :nom',nom = prod)
                if idprod:
                    nuevoid = db1.execute('INSERT INTO DetalleReceta VALUES(null,:id,:medi,null,1,:idpro,1)',id = id[0]['Id_Receta'],medi = prod,idpro = idprod[0]['Id_Producto'])
                else:
                    nuevoid = db1.execute('INSERT INTO DetalleReceta VALUES(null,:id,:medi,null,1,null,1)',id = id[0]['Id_Receta'],medi = prod)
                receta = db1.execute('SELECT * from DetalleReceta Where IdReceta = :id',id = id[0]['Id_Receta'])
            
        else:
            db1.execute('INSERT INTO Recetas VALUES(null,:mas,:con)',mas = mascota,con = cons)
            id = db1.execute('select Id_Receta from Recetas order by Id_Receta desc')
            idprod = db1.execute('SELECT Id_Producto From Producto Where Nombre = :nom',nom = prod)
            idprod = db1.execute('SELECT Id_Producto From Producto Where Nombre = :nom',nom = prod)
            if idprod:
                nuevoid = db1.execute('INSERT INTO DetalleReceta VALUES(null,:id,:medi,null,1,:idpro,1)',id = id[0]['Id_Receta'],medi = prod,idpro = idprod[0]['Id_Producto'])
            else:
                nuevoid = db1.execute('INSERT INTO DetalleReceta VALUES(null,:id,:medi,null,1,null,1)',id = id[0]['Id_Receta'],medi = prod)
            receta = db1.execute('SELECT * from DetalleReceta Where IdReceta = :id',id = id[0]['Id_Receta'])
        
        
        return render_template ('sistema/tablas/tabla-productos.html',receta = receta)

@app.route('/insertarVenta', methods =["POST","GET"])
def insertarVenta():
    if request.method == "POST":
        idventa = request.form['idventa']
        prod = request.form['prod']
        cantidad = request.form['cant']
        cons = request.form['cons']

        hi = datetime.now()
        precio = db1.execute('SELECT Id_Producto,Precio,Stock from Producto WHERE Nombre = :name',name = prod)
        
        if int(precio[0]['Stock']) >= int(cantidad):
            db1.execute('UPDATE Producto set Stock =:nuevo WHERE Id_Producto = :name',nuevo = (int(precio[0]['Stock'])- int(cantidad)),name = precio[0]['Id_Producto'])
            subtotal = float(precio[0]['Precio']) * float(cantidad)

            verificacion = db1.execute('SELECT * FROM Ventas Where Id_Venta = :id', id = idventa)
            if not verificacion:
                nuevoid = db1.execute('INSERT INTO Ventas VALUES(:id,:emp,:fecha,:total,null)',id = idventa,emp = session["user_Id"], fecha = datetime.date(hi),total = 0 )
                db1.execute('INSERT INTO DetalleVenta VALUES(null,:idv,:idpro,:cant,:sub)',idv= nuevoid,idpro = precio[0]['Id_Producto'] ,cant = cantidad,sub =subtotal)
                sumatotal = db1.execute('select sum(Subtotal) as total from DetalleVenta where IdVenta = :idv',idv =nuevoid)
                db1.execute('UPDATE Ventas set total = :total WHERE Id_Venta = :id',total = float(sumatotal[0]['total'])+float(cons) , id = nuevoid)
                nuevatabla = db1.execute('select dv.IdDetalle,p.Nombre as Nombre,p.Precio as Precio,dv.Cantidad from DetalleVenta as dv Inner join Producto as p ON dv.IdProducto = p.Id_Producto Where dv.IdVenta  = :idven',idven = nuevoid)
            else:
                db1.execute('INSERT INTO DetalleVenta VALUES(null,:idv,:idpro,:cant,:sub)',idv= idventa,idpro = precio[0]['Id_Producto'] ,cant = cantidad,sub =subtotal)
                sumatotal = db1.execute('select sum(Subtotal) as total from DetalleVenta where IdVenta = :idv',idv =idventa)
                db1.execute('UPDATE Ventas set total = :total WHERE Id_Venta = :id',total = float(sumatotal[0]['total'])+float(cons), id = idventa)
                nuevatabla = db1.execute('select dv.IdDetalle,p.Nombre as Nombre,p.Precio as Precio,dv.Cantidad from DetalleVenta as dv Inner join Producto as p ON dv.IdProducto = p.Id_Producto Where dv.IdVenta = :idven',idven = idventa)
            
            return render_template('sistema/tablas/tabla-factura-rapida.html',productos = nuevatabla,total = sumatotal[0]['total']) 
        else:
            return "NoStock" 

@app.route('/cantidad1', methods =["POST","GET"])
def cantidad1():
    if request.method == "POST":
        id = request.form['id']
        idventa = request.form['idventa']
        cantidad = request.form['cant']

        
        idproducto = db1.execute('SELECT IdProducto from DetalleVenta WHERE IdDetalle = :name',name = id)
        producto = db1.execute('SELECT Precio,Stock from Producto WHERE Id_Producto = :name',name = idproducto[0]['IdProducto'])
        
        if int(producto[0]['Stock']) >= int(cantidad):

            
            
            subtotal = float(producto[0]['Precio']) * float(cantidad)
            db1.execute('UPDATE DetalleVenta set Cantidad = :cant, Subtotal = :sub WHERE IdDetalle = :id',cant = cantidad,sub = subtotal,id = id)
            sumatotal = db1.execute('select sum(Subtotal) as total from DetalleVenta where IdVenta = :idv',idv =idventa)
            print(sumatotal[0]['total'])
            db1.execute('UPDATE Ventas set total = :total WHERE Id_Venta = :id',total = sumatotal[0]['total'], id = idventa)
            nuevatabla = db1.execute('select dv.IdDetalle,p.Nombre as Nombre,p.Precio as Precio,dv.Cantidad from DetalleVenta as dv Inner join Producto as p ON dv.IdProducto = p.Id_Producto Where dv.IdVenta  = :idven',idven = idventa)
            
            return render_template('sistema/tablas/tabla-factura-rapida.html',productos = nuevatabla,total = sumatotal[0]['total'])         
        else:
            return "NoStock"


@app.route('/orientacion', methods =["POST","GET"])
def orientacion():
    if request.method == "POST":
        id1 = request.form['id']
        cons = request.form['cons']
        ori = request.form['ori']

        id = db1.execute('select Id_Receta from Recetas Where IdConsulta = :con order by Id_Receta desc',con = cons)
        db1.execute('Update DetalleReceta SET Pasos = :ori WHERE IdDetalleReceta = :id ',ori = ori,id = id1)
        
        
        receta = db1.execute('SELECT * from DetalleReceta Where IdReceta = :id',id = id[0]['Id_Receta'])
        return render_template ('sistema/tablas/tabla-productos.html',receta = receta)
@app.route('/idventa', methods =["POST","GET"])
def idventa():
    if request.method == "POST":
        receta = db1.execute('select Id_Venta from Ventas  order by(Id_Venta) DESC limit 1')
        if not receta:
            return "1"
        else:
            id = int(receta[0]['Id_Venta']) + 1
            return str(id)    
        

@app.route('/oriedit', methods =["POST","GET"])
def oriedit():
    if request.method == "POST":
        id = request.form['id']
        
        receta = db1.execute('SELECT * from DetalleReceta Where IdDetalleReceta = :id',id = id)
        return render_template ('sistema/modales/modal.html', info = "producto", receta = receta)

@app.route('/añadircons', methods =["POST","GET"])
def añadircons():
    if request.method == "POST":
        id = request.form['idventa']
        total = db1.execute('SELECT Total from Ventas Where Id_Venta = :id',id = id)
        db1.execute('UPDATE Ventas set Total = :total WHERE Id_Venta = :id',total = float(total[0]['Total'])+ 50 , id = id)
        return "done"

@app.route('/quitarcons', methods =["POST","GET"])
def quitarcons():
    if request.method == "POST":
        id = request.form['idventa']
        total = db1.execute('SELECT Total from Ventas Where Id_Venta = :id',id = id)
        db1.execute('UPDATE Ventas set Total = :total WHERE Id_Venta = :id',total = float(total[0]['Total'])+ 50 , id = id)
        return "done"





@app.route('/generarpdf', methods =["POST","GET"])
def generarpdf():
    if request.method == "POST":
       
        flag = request.form['flag']
        if flag == "receta":
            id = request.form['id']
            idrec = db1.execute('select Id_Receta from Recetas order by Id_Receta desc')
            recetas = db1.execute('SELECT * from DetalleReceta Where IdReceta = :id',id = id)
            print("recetas",recetas)
            nohay = []
            hay = []
            cantidades = []
            cantidad = 0  
            total = 0
            total1 = 0
            cont = 0
            for i in recetas:
                
                medicamentoencontrado = db1.execute('select p.Nombre,p.Precio,dr.Cantidad from Producto as p inner join DetalleReceta as dr ON p.Id_Producto = dr.IdProducto where p.Nombre = :name and IdReceta = :rec', name = i['Medicamento'],rec = id)
                print
                if medicamentoencontrado:
                    hay.append(medicamentoencontrado)
                    cantidad = db1.execute('select Cantidad from DetalleReceta Where Medicamento = :name and IdReceta = :rec',name = i['Medicamento'],rec = id)
                    cantidades.append(cantidad)
                    print("cantidad receta: ",cantidad)
                    total = total + int(medicamentoencontrado[0]['Precio'] * cantidad[0]['Cantidad'])

                else:
                    
                    nohay.append(medicamentoencontrado)

           
            hi = datetime.now()
            idVenta = db1.execute('INSERT INTO Ventas VALUES(null,:emp,:fecha,:total,:rec)',emp = session["user_Id"], fecha = datetime.date(hi),total = total,rec = id )
            for a in recetas:
                    
                    medicamentoencontrado1 = db1.execute('select p.Id_Producto,p.Nombre,p.Precio,dr.Cantidad from Producto as p inner join DetalleReceta as dr ON p.Id_Producto = dr.IdProducto where p.Nombre = :name and IdReceta = :rec', name = a['Medicamento'],rec = id)
                    
                    if medicamentoencontrado1:
                        cantidad = db1.execute('select Cantidad from DetalleReceta Where Medicamento = :name and IdReceta = :rec',name = a['Medicamento'],rec = id)
                        db1.execute('INSERT INTO DetalleVenta VALUES(null,:idv,:idpro,:cant,:sub)',idv= idVenta,idpro = medicamentoencontrado1[0]['Id_Producto'] ,cant = cantidad[0]['Cantidad'],sub =int(medicamentoencontrado1[0]['Precio'] * cantidad[0]['Cantidad']))
          
            
            return render_template ('sistema/pdf-factura.html', info = hay, flag = flag,total = total)
        elif flag == "rapida":
            idventa = request.form['idventa']
            nuevatabla = db1.execute('select dv.IdDetalle,p.Nombre as Nombre,p.Precio as Precio,dv.Cantidad from DetalleVenta as dv Inner join Producto as p ON dv.IdProducto = p.Id_Producto Where dv.IdVenta  = :idven',idven = idventa)
            print(nuevatabla)
            total = db1.execute('SELECT Total from Ventas where Id_Venta = :id',id = idventa)
            return render_template ('sistema/pdf-factura.html', info = nuevatabla,flag = flag,total = total[0]['Total'])


######################
# clientes
@app.route('/clienteinfo', methods =["POST","GET"])
def clienteinfo():
    if request.method == "POST":
       id = request.form['id']
       return render_template('sistema/modales/modal-cliente.html',id = id)
        
######################
# OTRAS FUNCIONES
@app.route('/correo',methods=["GET", "POST"])
def correo():
    if request.method == "POST":
        flag = request.form['flag']
        print(flag)
        if flag == "usuario":
            nombres = request.form['nombres']
            apellidos = request.form['apellidos']
            correoc = request.form['correo']
            usuario = request.form['loginUser']
            contraseña = request.form['loginPassword']
            enviar_correo(app,"Bienvenido a Nuestra Familia",correoc,usuario,contraseña,"","")
            return "done"
        elif flag == "receta":
            consulta = request.form['cons']
            mascota = request.form['mascota']
            id = db1.execute('select Id_Receta from Recetas WHERE IdMascota = :mas AND IdConsulta = :con',mas = mascota,con = consulta)
            receta = db1.execute('select * from DetalleReceta WHere IdReceta = :rec',rec = id[0]['Id_Receta'])
            diagnostico = db1.execute('select c.Diagnostico,re.Id_Receta From Consulta as c inner join Recetas as re ON c.Id_Consulta = re.IdConsulta Where c.Id_Consulta = :id',id = consulta)
            correo = db1.execute('select u.Correo from Consulta as c INNER JOIN Mascota as m ON c.IdMascota = m.Id_Mascota inner join Usuarios as u ON m.IdUsuario = u.Id_Usuario where c.Id_Consulta = :cons',cons = consulta)
            
            enviar_correo(app,"Usted tiene una nueva receta",correo[0]['Correo'],"","",receta,diagnostico)
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
    hi = datetime.now()
    fecha = datetime.date(hi)
    conn = conectar()
    cursor = conn.cursor()
    query = 'select sum(total) as ventas from venta where fecha_venta = ?'
    cursor.execute(query, fecha)
    ventas = cursor.fetchall()

    conn = conectar()
    cursor = conn.cursor()
    query = 'select count(cod_atencion) as consultas from atencion where fecha_atencion = ?'
    cursor.execute(query, fecha)
    consultas = cursor.fetchall()
    # CLIENTES
    conn = conectar()
    cursor = conn.cursor()
    query = 'select count(num_cliente) as usuarios from cliente where id_estado = ?'
    cursor.execute(query, 1)
    usuarios = cursor.fetchall()
    # EMPLEADOS
    conn = conectar()
    cursor = conn.cursor()
    query = 'select count(num_veterinario) as usuarios from veterinario where id_estado = ?'
    cursor.execute(query, 1)
    empleados = cursor.fetchall()

    conn = conectar()
    cursor = conn.cursor()
    query = 'select num_cliente,nombres_cliente as cliente from cliente where id_estado = ?'
    cursor.execute(query, 1)
    clientes = cursor.fetchall()

    
    mesUno = datetime.date(hi)- relativedelta(months=1)
    mesDos = datetime.date(hi)- relativedelta(months=2)

    conn = conectar()
    cursor = conn.cursor()
    query = 'select sum(total) as ventas1 from venta where fecha_venta = ?'
    cursor.execute(query, mesUno)
    ventasMesUno = cursor.fetchall()

    conn = conectar()
    cursor = conn.cursor()
    query = 'select sum(total) as ventas1 from venta where fecha_venta = ?'
    cursor.execute(query, mesDos)
    ventasMesDos = cursor.fetchall()

    print(ventas)
    ventas2 = 0
    ventas1 = 0
    
    if ventasMesUno[0][0] != None:
        ventas1 = ventasMesUno[0][0]

    if ventasMesDos[0][0] != None:
        ventas2 = ventasMesDos[0][0]
        print(ventas2)
       

    return render_template('sistema/admin.html',rol =session["nombrerol"],nombre =session["usercom"],ventas = ventas[0][0],cons = consultas[0][0],usuarios = usuarios[0][0],empleados = empleados[0][0],clientes = clientes,ventasmesuno = ventas1,ventasmesdos = ventas2)
######################
@app.route('/buscarinv',methods=["GET", "POST"])
def buscarinv():
    if request.method == "POST":
        producto = request.form['id']
        producto += "%"
        invent = db1.execute('select * from Producto as p INNER JOIN Proveedor as prov ON p.IdProveedor = prov.Id_Proveedor inner join Estado as e ON p.IdEstado = e.Id_Estado WHERE p.IdEstado != 2 and p.Nombre like :id',id = producto)
        return render_template('sistema/tablas/tabla-inventario.html',rol =session["nombrerol"],inventario = invent)

@app.route('/home')
def home():
    return render_template('index.html',rol =session["nombrerol"],nombre =session["usercom"] )

@app.route('/miinfo',methods=["GET", "POST"])
def miinfo():
    if request.method == "POST":
        usuarios = db1.execute('select u.*,est.NombreEstado,cred.Usuario,rol.NombreRol from Usuarios as u inner join Credenciales as cred ON u.IdCredenciales = cred.Id_Credenciales inner join Roles as rol ON cred.Rol = rol.Id_Rol inner join estado as est ON u.IdEstado = est.Id_Estado where u.Id_Usuario = :id',id = session["user_Id"])
        return render_template('sistema/modales/mi-info.html',info = usuarios)

# usuario nuevo
@app.route('/nuevou',methods=["GET", "POST"])
def nuevou():
    if request.method == "POST":
        nombres = request.form['nombres']
        apellidos = request.form['apellidos']
        direccion = request.form['direccion']
        correo = request.form['correo']
        usuario = request.form['loginUser']
        contraseña = request.form['loginPassword']
        flag = request.form['flag']
        print(flag)
        if flag:
            tabla = request.form['tabla']
            print(tabla)
            if tabla == "veterinario":
                celular = request.form['celular']
                rol = request.form['rol']
                # INSERTAMOS DESDE EL SISTEMA
                conn = conectar()
                cursor = conn.cursor()
                query = 'INSERT INTO credenciales (usuario,contrasena,rol,cargo) VALUES (?,?,?,?)'
                cursor.execute(query, (usuario,generate_password_hash(contraseña),rol,rol))
                conn.commit()
                cursor.close()
                conn.close()


                conn = conectar()
                cursor = conn.cursor()
                query = 'SELECT id_credencial FROM credenciales where usuario = ?'
                cursor.execute(query, usuario)
                idcred = cursor.fetchone()
                
                conn = conectar()
                cursor = conn.cursor()
                query = 'SELECT top 1 cod_veterinario FROM veterinario order by num_veterinario desc'
                cursor.execute(query)
                codigo = cursor.fetchone()

                caracteres_a_eliminar = "VET"
                cont = codigo[0].replace(caracteres_a_eliminar, "")
                numero_entero = int(cont)
                numero_entero += 1
                nuevo_numero = str(numero_entero).zfill(len(cont))

                cod_nuevo = "VET"+nuevo_numero
                conn = conectar()
                cursor = conn.cursor()
                query = 'INSERT INTO veterinario (cod_veterinario,nom_vet,dir_vet,cel_vet,correo_vet,id_estado,id_credencial) VALUES (?,?,?,?,?,?,?)'
                cursor.execute(query, (cod_nuevo,""+nombres+" "+apellidos,direccion,celular,correo,1,idcred[0]))
                conn.commit()
                cursor.close()
                conn.close()



                #verificacion = db1.execute('SELECT * from credenciales Where Usuario = :u',u = usuario)
                # db1.execute("INSERT INTO Credenciales VALUES(NULL,:usu,:passw,:rol)",usu = usuario,passw = generate_password_hash(contraseña),rol = rol)
                # credenciales = db1.execute('select Id_Credenciales from Credenciales  order by Id_Credenciales desc limit 1')
                # db1.execute("INSERT INTO Usuarios VALUES(NULL,:name,:lastna,:tel,:cel,:corr,:dir,1,:cred,null)",
                #             name=nombres , lastna=apellidos , tel = telefono,cel = celular,corr = correo,dir=direccion,cred = credenciales[0]['Id_Credenciales'])
                return "yes"
            else:

                rol = request.form['rol']
                # INSERTAMOS DESDE EL SISTEMA
                conn = conectar()
                cursor = conn.cursor()
                query = 'INSERT INTO credenciales (usuario,contrasena,rol,cargo) VALUES (?,?,?,?)'
                cursor.execute(query, (usuario,generate_password_hash(contraseña),rol,rol))
                conn.commit()
                cursor.close()
                conn.close()


                conn = conectar()
                cursor = conn.cursor()
                query = 'SELECT id_credencial FROM credenciales where usuario = ?'
                cursor.execute(query, usuario)
                idcred = cursor.fetchone()
                
                conn = conectar()
                cursor = conn.cursor()
                query = 'INSERT INTO cliente (nombres_cliente,apellidos_cliente,direccion_cliente,correo_cliente,id_estado,id_credencial) VALUES (?,?,?,?,?,?)'
                cursor.execute(query, (nombres,apellidos,direccion,correo,1,idcred[0]))
                conn.commit()
                cursor.close()
                conn.close()



                #verificacion = db1.execute('SELECT * from credenciales Where Usuario = :u',u = usuario)
                # db1.execute("INSERT INTO Credenciales VALUES(NULL,:usu,:passw,:rol)",usu = usuario,passw = generate_password_hash(contraseña),rol = rol)
                # credenciales = db1.execute('select Id_Credenciales from Credenciales  order by Id_Credenciales desc limit 1')
                # db1.execute("INSERT INTO Usuarios VALUES(NULL,:name,:lastna,:tel,:cel,:corr,:dir,1,:cred,null)",
                #             name=nombres , lastna=apellidos , tel = telefono,cel = celular,corr = correo,dir=direccion,cred = credenciales[0]['Id_Credenciales'])
                return "yes"
        else:
            # verificacion = db1.execute('SELECT * from credenciales Where Usuario = :u',u = usuario)
            # db1.execute("INSERT INTO Credenciales VALUES(NULL,:usu,:passw,3)",usu = usuario,passw = generate_password_hash(contraseña))
            # credenciales = db1.execute('select Id_Credenciales from Credenciales  order by Id_Credenciales desc limit 1')
            # db1.execute("INSERT INTO Usuarios VALUES(NULL,:name,:lastna,:tel,:cel,:corr,:dir,1,:cred,null)",
            #                 name=nombres , lastna=apellidos , tel = telefono,cel = celular,corr = correo,dir=direccion,cred = credenciales[0]['Id_Credenciales'])
            conn = conectar()
            cursor = conn.cursor()
            query = 'INSERT INTO credenciales (usuario,contrasena,rol,cargo) VALUES (?,?,?,?)'
            cursor.execute(query, (usuario,generate_password_hash(contraseña),rol,rol))
            conn.commit()
            cursor.close()
            conn.close()


            conn = conectar()
            cursor = conn.cursor()
            query = 'SELECT id_credencial FROM credenciales where usuario = ?'
            cursor.execute(query, usuario)
            id = cursor.fetchall()

            conn = conectar()
            cursor = conn.cursor()
            query = 'INSERT INTO cliente (nombres_cliente,apellidos_cliente,direccion_cliente,correo_cliente,id_estado,id_credencial) VALUES (?,?,?,?,?,?)'
            cursor.execute(query, (nombres,apellidos,direccion,correo,1,id[0]))
            conn.commit()
            cursor.close()
            conn.close()


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



#AJUSTES
@app.route('/ajuste')
def ajuste():
    return render_template('sistema/tablas/tabla-inventario.html')


#INTERNAMIENTO
@app.route('/internamiento')
def internamiento():
    return render_template('sistema/internamiento.html')

#BACKUPS
@app.route('/backups')
def backups():
    return render_template('sistema/backups.html')

#PERMISOS
@app.route('/permisos')
def permisos():
    return render_template('sistema/permisos.html')

#*************************************************
#       *PROVEEDORES*
# ************************************************   
@app.route('/proveedores',methods=["GET", "POST"])
def proveedores():
    if request.method == "POST":
        prov = db1.execute('select * from Proveedor')

        return render_template('sistema/tablas/tabla-proveedores.html',prov = prov)

#*************************************************
#       *INVENTARIO*
# ************************************************   
@app.route('/inventario',methods=["GET", "POST"])
def inventario():
    if request.method == "POST":
        invent = db1.execute('select * from Producto as p INNER JOIN Proveedor as prov ON p.IdProveedor = prov.Id_Proveedor inner join Estado as e ON p.IdEstado = e.Id_Estado WHERE p.IdEstado != 2')
        return render_template('sistema/tablas/tabla-inventario.html',rol =session["nombrerol"],inventario = invent)

@app.route('/actinv',methods=["GET", "POST"])
def actinv():
    if request.method == "POST":
        id = request.form['id']
        invent = db1.execute('select * from Producto as p INNER JOIN Proveedor as prov ON p.IdProveedor = prov.Id_Proveedor inner join Estado as e ON p.IdEstado = e.Id_Estado Where p.Id_Producto = :id',id = id)
        proveedores = db1.execute('select Id_Proveedor,Compañia from Proveedor')
        return render_template('sistema/modales/modal-inventario.html',inventario = invent,prov = proveedores)

@app.route('/actprod',methods=["GET", "POST"])
def actprod():
    if request.method == "POST":
        id = request.form['id']
        nombre = request.form['nombre']
        precio = request.form['precio']
        stock = request.form['stock']
        estado = request.form['estado']
        compañia = request.form['compañia']
        cant = stock
        if estado == "5":
            cant = 0
            db1.execute('UPDATE Producto set Nombre = :nombre, Precio = :pre, Stock = :stock,IdEstado = :est, IdProveedor = :prov where Id_Producto = :id',nombre = nombre,pre = precio,stock = cant, est = estado, prov = compañia,id = id)
        else:
            db1.execute('UPDATE Producto set Nombre = :nombre, Precio = :pre, Stock = :stock,IdEstado = :est, IdProveedor = :prov where Id_Producto = :id',nombre = nombre,pre = precio,stock = cant, est = estado, prov = compañia,id = id)
        
        
        return "Done"

@app.route('/addprod',methods=["GET", "POST"])
def addprod():
    if request.method == "POST":
        nombre = request.form['nombre']
        precio = request.form['precio']
        stock = request.form['stock']
        estado = request.form['estado']
        compañia = request.form['compañia']
        db1.execute('INSERT INTO Producto values(null,:nom,:pre,:stock,:est,:prov)',nom = nombre,pre= precio,stock = stock,est = estado,prov = compañia)
        
        return "Done"

@app.route('/elimprod',methods=["GET", "POST"])
def elimprod():
    if request.method == "POST":
        id = request.form['id']
        db1.execute('UPDATE Producto set IdEstado = 2 Where Id_Producto = :id',id = id)
        
        return "Done"

@app.route('/añadirinv',methods=["GET", "POST"])
def añadirinv():
    if request.method == "POST":
        proveedores = db1.execute('select Id_Proveedor,Compañia from Proveedor')
        return render_template('sistema/modales/modal-inventario.html',inventario = "",prov = proveedores)

#*************************************************
#       *VENTAS*
# ************************************************   
@app.route('/venta',methods=["GET", "POST"])
def venta():
    if request.method == "POST":
        invent = db1.execute('select v.Id_Venta,u.Nombres || " " || u.Apellidos as Nombre,v.Fecha,v.Total,v.IdReceta from Ventas as v inner join Usuarios as u ON v.IdEmpleado = u.Id_Usuario')
        return render_template('sistema/tablas/tabla-ventas.html',rol =session["nombrerol"],ventas = invent)

@app.route('/tipoVenta',methods=["GET", "POST"])
def tipoVenta():
    if request.method == "POST":
        tipo = request.form['tipo']
        if tipo == "receta":
           invent = db1.execute('select v.Id_Venta,u.Nombres || " " || u.Apellidos as Nombre,v.Fecha,v.Total,v.IdReceta from Ventas as v inner join Usuarios as u ON v.IdEmpleado = u.Id_Usuario Where v.IdReceta like "%"')
        elif tipo == "rapida":
            invent = db1.execute('select v.Id_Venta,u.Nombres || " " || u.Apellidos as Nombre,v.Fecha,v.Total,v.IdReceta from Ventas as v inner join Usuarios as u ON v.IdEmpleado = u.Id_Usuario Where v.IdReceta is NULL')
        elif tipo == "todo":
            invent = db1.execute('select v.Id_Venta,u.Nombres || " " || u.Apellidos as Nombre,v.Fecha,v.Total,v.IdReceta from Ventas as v inner join Usuarios as u ON v.IdEmpleado = u.Id_Usuario')
        return render_template('sistema/tablas/tabla-ventas.html',rol =session["nombrerol"],ventas = invent)

@app.route('/buscarventa',methods=["GET", "POST"])
def buscarventa():
    if request.method == "POST":
        inicio = request.form['inicio']
        fin = request.form['final']
        ventas = db1.execute('select v.Id_Venta,u.Nombres || " " || u.Apellidos as Nombre,v.Fecha,v.Total,v.IdReceta from Ventas as v inner join Usuarios as u ON v.IdEmpleado = u.Id_Usuario where v.Fecha BETWEEN :inicio and :fin ',inicio = inicio,fin = fin)
       
        return render_template('sistema/tablas/tabla-ventas.html',rol =session["nombrerol"],ventas = ventas)

@app.route('/ventadetalle',methods=["GET", "POST"])
def ventadetalle():
    if request.method == "POST":
        id = request.form['id']
        ventas = db1.execute('select v.Id_Venta,u.Nombres || " " || u.Apellidos as Empleado,v.Fecha,v.Total,p.Nombre,p.Precio,dv.Cantidad,dv.Subtotal,v.IdReceta from Ventas as v inner join Usuarios as u ON v.IdEmpleado = u.Id_Usuario inner join DetalleVenta as dv on v.Id_Venta = dv.IdVenta inner join Producto as p on dv.IdProducto = p.Id_Producto Where v.Id_Venta = :id', id = id)
        return render_template('sistema/modales/detalle-venta.html',ventas = ventas,id = id)


#*************************************************
#       *CONSULTAS HISTORIAL*
# ************************************************   
@app.route('/consultahist',methods=["GET", "POST"])
def consultahist():
    if request.method == "POST":
        consul = db1.execute('select c.Id_Consulta,c.Diagnostico,u.Nombres || " " || u.Apellidos as Veterinario,m.Nombre,c.Fecha,c.Sintomas,c.Hora,est.NombreEstado,c.IdUsuario from consulta as c inner join Mascota as m ON c.IdMascota = m.Id_Mascota inner join Estado as est ON c.IdEstado = est.Id_Estado inner join Usuarios as u ON c.IdUsuario = u.Id_Usuario  ')
    return render_template('sistema/tablas/tabla-consultas.html',consultas = consul)

@app.route('/buscarconsul',methods=["GET", "POST"])
def buscarconsul():
    if request.method == "POST":
        inicio = request.form['inicio']
        fin = request.form['final']
        consul = db1.execute('select c.Id_Consulta,c.Diagnostico,u.Nombres || " " || u.Apellidos as Veterinario,m.Nombre,c.Fecha,c.Sintomas,c.Hora,est.NombreEstado from consulta as c inner join Mascota as m ON c.IdMascota = m.Id_Mascota inner join Estado as est ON c.IdEstado = est.Id_Estado inner join Usuarios as u ON c.IdUsuario = u.Id_Usuario where c.Fecha BETWEEN :inicio and :fin ',inicio = inicio,fin = fin)
    
        return render_template('sistema/tablas/tabla-consultas.html',consultas = consul)

@app.route('/tipoConsulta',methods=["GET", "POST"])
def tipoConsulta():
    if request.method == "POST":
        tipo = request.form['tipo']
        val = request.form['val']
        print(tipo)
        print(val)
        if tipo == "mascota":
           consul = db1.execute('select c.Id_Consulta,c.Diagnostico,u.Nombres || " " || u.Apellidos as Veterinario,m.Nombre,c.Fecha,c.Sintomas,c.Hora,est.NombreEstado,c.IdUsuario from consulta as c inner join Mascota as m ON c.IdMascota = m.Id_Mascota inner join Estado as est ON c.IdEstado = est.Id_Estado inner join Usuarios as u ON c.IdUsuario = u.Id_Usuario where m.Nombre like :m',m = val + "%")
        elif tipo == "vet":
            consul = db1.execute('select c.Id_Consulta,c.Diagnostico,u.Nombres || " " || u.Apellidos as Veterinario,m.Nombre,c.Fecha,c.Sintomas,c.Hora,est.NombreEstado,c.IdUsuario from consulta as c inner join Mascota as m ON c.IdMascota = m.Id_Mascota inner join Estado as est ON c.IdEstado = est.Id_Estado inner join Usuarios as u ON c.IdUsuario = u.Id_Usuario where Veterinario like :m',m = val + "%")
        elif tipo == "todo":
            consul = db1.execute('select c.Id_Consulta,c.Diagnostico,u.Nombres || " " || u.Apellidos as Veterinario,m.Nombre,c.Fecha,c.Sintomas,c.Hora,est.NombreEstado,c.IdUsuario from consulta as c inner join Mascota as m ON c.IdMascota = m.Id_Mascota inner join Estado as est ON c.IdEstado = est.Id_Estado inner join Usuarios as u ON c.IdUsuario = u.Id_Usuario')
        return render_template('sistema/tablas/tabla-consultas.html',consultas = consul)

@app.route('/consultadetalle',methods=["GET", "POST"])
def consultadetalle():
    if request.method == "POST":
        id = request.form['id']
        historial = db1.execute('select Id_Receta from Recetas Where IdConsulta = :id  ORDER BY date(Id_Receta) ASC Limit 1',id = id)
        
        receta = db1.execute('select * from DetalleReceta Where IdReceta = :rec',rec = historial[0]['Id_Receta'])
        
        return render_template('sistema/modales/detalle-consulta.html',recetas = receta)

@app.route('/Backupusu')
def Backupusu():
            usuarios = db1.execute('select u.Id_Usuario,u.Nombres,u.Apellidos,u.TelefonoFijo,u.Celular,u.Direccion,cred.Usuario,rol.NombreRol from Usuarios as u inner join Credenciales as cred ON u.IdCredenciales = cred.Id_Credenciales inner join Roles as rol ON cred.Rol = rol.Id_Rol inner join estado as est ON u.IdEstado = est.Id_Estado Where u.IdEstado = 1')
            
            df_1 = pd.DataFrame((tuple(t) for t in usuarios), 
            columns=('Date ', 'name', 'username', 'description', '','','',''))
    
            output = BytesIO()
            writer = pd.ExcelWriter(output, engine='xlsxwriter')

            #taken from the original question
            df_1.to_excel(writer, startrow = -1,startcol=-1, merge_cells = False, sheet_name = "Backup")
            workbook = writer.book
            worksheet = writer.sheets["Backup"]
            caption = 'Table with user defined column headers.'
            formato = workbook.add_format()
            formato.set_align('center')
        # Set the columns widths.
            worksheet.set_column('A:H', 20)
        
            #haciendo la lista
            row = 2
            for i in usuarios:
                worksheet.write('A'+ str(row), i['Id_Usuario'],formato)
                worksheet.write('B'+ str(row), i['Nombres'],formato)
                worksheet.write('C'+ str(row), i['Apellidos'],formato)
                worksheet.write('D'+ str(row), i['TelefonoFijo'],formato)
                worksheet.write('E'+ str(row), i['Celular'],formato)
                worksheet.write('F'+ str(row), i['Direccion'],formato)
                worksheet.write('G'+ str(row), i['Usuario'],formato)
                worksheet.write('H'+ str(row), i['NombreRol'],formato)
                worksheet.write('I'+ str(row), None)
                row += 1

            tam = len(usuarios)
            tam = "A1:H" + str(tam)
            worksheet.add_table(tam, {
                                        'columns': [{'header': 'Id Usuario'},
                                                    {'header': 'Nombres'},
                                                    {'header': 'Apellidos'},
                                                    {'header': 'Telefono Fijo'},
                                                    {'header': 'Celular'},
                                                     {'header': 'Dirección'},
                                                    {'header': 'Usuario'},
                                                     {'header': 'Rol'}
                                                    ]})

            #the writer has done its job
            writer.close()

            #go back to the beginning of the stream
            output.seek(0)

            return send_file(output, download_name="Usuarios.xlsx", as_attachment=True)
       
@app.route('/Backupinv')
def Backupinv():
            usuarios = db1.execute('select p.Id_Producto,p.Nombre,p.Precio,p.Stock,prov.Compañia from Producto as p INNER JOIN Proveedor as prov ON p.IdProveedor = prov.Id_Proveedor inner join Estado as e ON p.IdEstado = e.Id_Estado WHERE p.IdEstado != 2')
        
            df_1 = pd.DataFrame((tuple(t) for t in usuarios), 
            columns=('Date ', 'name', 'username', 'description', ''))
    
            output = BytesIO()
            writer = pd.ExcelWriter(output, engine='xlsxwriter')

            #taken from the original question
            df_1.to_excel(writer, startrow = -1,startcol=-1, merge_cells = False, sheet_name = "Backup")
            workbook = writer.book
            worksheet = writer.sheets["Backup"]
            caption = 'Table with user defined column headers.'
            formato = workbook.add_format()
            formato.set_align('center')
        # Set the columns widths.
            worksheet.set_column('A:E', 20)
        
            #haciendo la lista
            row = 2
            for i in usuarios:
                worksheet.write('A'+ str(row), i['Id_Producto'],formato)
                worksheet.write('B'+ str(row), i['Nombre'],formato)
                worksheet.write('C'+ str(row), i['Precio'],formato)
                worksheet.write('D'+ str(row), i['Stock'],formato)
                worksheet.write('E'+ str(row), i['Compañia'],formato)
                worksheet.write('F'+ str(row), None)
                row += 1

            tam = len(usuarios)
            tam = "A1:E" + str(tam)
            worksheet.add_table(tam, {
                                        'columns': [{'header': 'Id Producto'},
                                                    {'header': 'Nombre'},
                                                    {'header': 'Precio'},
                                                    {'header': 'Stock'},
                                                    {'header': 'Compañia'}
                                                    ]})

            #the writer has done its job
            writer.close()

            #go back to the beginning of the stream
            output.seek(0)

            return send_file(output, download_name="Inventario.xlsx", as_attachment=True)
       
@app.route('/Backupcons')
def Backupcons():
            usuarios = db1.execute('select c.Id_Consulta,c.Diagnostico,u.Nombres || " " || u.Apellidos as Veterinario,m.Nombre,c.Fecha,c.Sintomas,c.Hora,est.NombreEstado,u.Nombres as Cliente from consulta as c inner join Mascota as m ON c.IdMascota = m.Id_Mascota inner join Estado as est ON c.IdEstado = est.Id_Estado inner join Usuarios as u ON c.IdUsuario = u.Id_Usuario  ')
    
            df_1 = pd.DataFrame((tuple(t) for t in usuarios), 
            columns=('Date ', 'name', 'username', 'description', '','','','',''))
    
            output = BytesIO()
            writer = pd.ExcelWriter(output, engine='xlsxwriter')

            #taken from the original question
            df_1.to_excel(writer, startrow = -1,startcol=-1, merge_cells = False, sheet_name = "Backup")
            workbook = writer.book
            worksheet = writer.sheets["Backup"]
            caption = 'Table with user defined column headers.'
            formato = workbook.add_format()
            formato.set_align('center')
        # Set the columns widths.
            worksheet.set_column('A:I', 20)
        
            #haciendo la lista
            row = 2
            for i in usuarios:
                worksheet.write('A'+ str(row), i['Id_Consulta'],formato)
                worksheet.write('B'+ str(row), i['Diagnostico'],formato)
                worksheet.write('C'+ str(row), i['Veterinario'],formato)
                worksheet.write('D'+ str(row), i['Nombre'],formato)
                worksheet.write('E'+ str(row), i['Fecha'],formato)
                worksheet.write('F'+ str(row), i['Sintomas'],formato)
                worksheet.write('G'+ str(row), i['Hora'],formato)
                worksheet.write('H'+ str(row), i['NombreEstado'],formato)
                worksheet.write('I'+ str(row), i['Cliente'],formato)
                worksheet.write('J'+ str(row), None)
                row += 1

            tam = len(usuarios)
            tam = "A1:I" + str(tam)
            worksheet.add_table(tam, {
                                        'columns': [{'header': 'N° Consulta'},
                                                    {'header': 'Diagnostico'},
                                                    {'header': 'Veterinario'},
                                                    {'header': 'Mascota'},
                                                    {'header': 'Fecha'},
                                                    {'header': 'Sintomas'},
                                                    {'header': 'Hora'},
                                                    {'header': 'Estado'},
                                                     {'header': 'Cliente'}
                                                    ]})

            #the writer has done its job
            writer.close()

            #go back to the beginning of the stream
            output.seek(0)

            return send_file(output, download_name="Consultas.xlsx", as_attachment=True)

@app.route('/Backupvent')
def Backupvent():
            usuarios = db1.execute('select v.Id_Venta,u.Nombres || " " || u.Apellidos as Nombre,v.Fecha,v.Total,v.IdReceta from Ventas as v inner join Usuarios as u ON v.IdEmpleado = u.Id_Usuario')
        
            df_1 = pd.DataFrame((tuple(t) for t in usuarios), 
            columns=('Date ', 'name', 'username', 'description', ''))
    
            output = BytesIO()
            writer = pd.ExcelWriter(output, engine='xlsxwriter')

            #taken from the original question
            df_1.to_excel(writer, startrow = -1,startcol=-1, merge_cells = False, sheet_name = "Backup")
            workbook = writer.book
            worksheet = writer.sheets["Backup"]
            caption = 'Table with user defined column headers.'
            formato = workbook.add_format()
            formato.set_align('center')
        # Set the columns widths.
            worksheet.set_column('A:F', 20)
        
            #haciendo la lista
            row = 2
            for i in usuarios:
                worksheet.write('A'+ str(row), i['Id_Venta'],formato)
                worksheet.write('B'+ str(row), i['Nombre'],formato)
                worksheet.write('C'+ str(row), i['Fecha'],formato)
                worksheet.write('D'+ str(row), i['Total'],formato)
                worksheet.write('E'+ str(row), i['IdReceta'],formato)
                worksheet.write('F'+ str(row), None)
                row += 1

            tam = len(usuarios)
            tam = "A1:E" + str(tam)
            worksheet.add_table(tam, {
                                        'columns': [{'header': 'N° Venta'},
                                                    {'header': 'Nombre'},
                                                    {'header': 'Fecha'},
                                                    {'header': 'Total'},
                                                    {'header': 'Receta'}
                                                    ]})

            #the writer has done its job
            writer.close()

            #go back to the beginning of the stream
            output.seek(0)

            return send_file(output, download_name="Ventas.xlsx", as_attachment=True)      
@app.route('/base',methods=["GET", "POST"])
def base():
    if request.method == 'POST':
        shutil.copy('Veterinaria.db', 'Backups/Veterinaria.db')
        return "done"

#************************************************
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
