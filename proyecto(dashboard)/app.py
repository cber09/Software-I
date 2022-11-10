
from datetime import datetime,date
import random
import secrets

from cs50 import SQL
from flask import Flask, flash, jsonify, redirect, render_template, request, sessions, url_for, session, send_file
from jinja2 import Environment
from werkzeug.security import check_password_hash, generate_password_hash
from correo import enviar_correo
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
                    #aca traemos las consultas del cliente logeado
                    consultas = db1.execute('select c.*,m.Nombre from Consulta as c inner join mascota as m ON c.IdMascota = m.Id_Mascota inner join Usuarios as u ON m.IdUsuario = u.Id_Usuario Where u.Id_Usuario = :id',id = session["user_Id"] )
                    
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

@app.route('/eliminar', methods =["POST","GET"])
def eliminar():
    if request.method == "POST":
        id = request.form['id']
        flag = request.form['flag']
        
        if flag == "fact":
            receta = request.form['receta']
            db1.execute('Update DetalleReceta set IdEstado = :est where Medicamento = :id',est = 2,id = id)
        
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
                    cantidad = db1.execute('select Cantidad from DetalleReceta Where Medicamento = :name',name = i['Medicamento'])
                    total = total + int(medicamentoencontrado[0]['Precio'] * cantidad[0]['Cantidad'] )

                else:
                        
                    nohay.append(medicamentoencontrado)
                

            return render_template('sistema/tabla-factura.html',productos = hay,total = total,cant  = cantidad, nohay = nohay)  
        elif flag == "fact-rapida":
            idventa = request.form['idventa']
            db1.execute('DELETE FROM DetalleVenta WHERE IdDetalle = :id',id = id)
            sumatotal = db1.execute('select sum(Subtotal) as total from DetalleVenta where IdVenta = :idv',idv =idventa)
            print(sumatotal[0]['total'])
            db1.execute('UPDATE Ventas set total = :total WHERE Id_Venta = :id',total = sumatotal[0]['total'], id = idventa)
            nuevatabla = db1.execute('select dv.IdDetalle,p.Nombre as Nombre,p.Precio as Precio,dv.Cantidad from DetalleVenta as dv Inner join Producto as p ON dv.IdProducto = p.Id_Producto Where dv.IdVenta  = :idven',idven = idventa)
        
            return render_template('sistema/tabla-factura-rapida.html',productos = nuevatabla,total = sumatotal[0]['total'])         



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
                
                medicamentoencontrado = db1.execute('select p.Nombre,p.Precio,dr.Cantidad from Producto as p inner join DetalleReceta as dr ON p.Id_Producto = dr.IdProducto where p.Nombre = :name', name = i['Medicamento'])
                
                if medicamentoencontrado:
                    hay.append(medicamentoencontrado)
                    cantidad = db1.execute('select Cantidad from DetalleReceta Where Medicamento = :name',name = i['Medicamento'])
                    cantidades.append(cantidad)
                    print("cantidad receta: ",cantidad)
                    total = total + int(medicamentoencontrado[0]['Precio'] * cantidad[0]['Cantidad'])

                else:
                    
                    nohay.append(medicamentoencontrado)
            
            print("hay vale:",hay)
            print("no hay: ",nohay) 
            print(cantidades)
            if hay:
                return render_template('sistema/tabla-factura.html',productos = hay,total = total,cant  = cantidades,nohay = nohay)
            else:
                return "no"

@app.route('/cantidad', methods =["POST","GET"])
def cantidad():
    if request.method == "POST":
        id = request.form['id']
        cant = request.form['cant']
        receta = request.form['receta']
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
        return render_template('sistema/tabla-factura.html',productos = hay,total = total,cant  = cantidad, nohay = nohay)        

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
        return render_template ('tabla-productos.html',receta = receta)

@app.route('/insertarVenta', methods =["POST","GET"])
def insertarVenta():
    if request.method == "POST":
        idventa = request.form['idventa']
        prod = request.form['prod']
        cantidad = request.form['cant']
        hi = datetime.now()
        precio = db1.execute('SELECT Id_Producto,Precio from Producto WHERE Nombre = :name',name = prod)
        
        subtotal = float(precio[0]['Precio']) * float(cantidad)

        verificacion = db1.execute('SELECT * FROM Ventas Where Id_Venta = :id', id = idventa)
        if not verificacion:
            nuevoid = db1.execute('INSERT INTO Ventas VALUES(:id,:emp,:fecha,:total)',id = idventa,emp = session["user_Id"], fecha = datetime.date(hi),total = 0 )
            db1.execute('INSERT INTO DetalleVenta VALUES(null,:idv,:idpro,:cant,:sub,null)',idv= nuevoid,idpro = precio[0]['Id_Producto'] ,cant = cantidad,sub =subtotal)
            sumatotal = db1.execute('select sum(Subtotal) as total from DetalleVenta where IdVenta = :idv',idv =nuevoid)
            db1.execute('UPDATE Ventas set total = :total WHERE Id_Venta = :id',total = sumatotal[0]['total'], id = nuevoid)
            nuevatabla = db1.execute('select dv.IdDetalle,p.Nombre as Nombre,p.Precio as Precio,dv.Cantidad from DetalleVenta as dv Inner join Producto as p ON dv.IdProducto = p.Id_Producto Where dv.IdVenta  = :idven',idven = nuevoid)
        else:
            db1.execute('INSERT INTO DetalleVenta VALUES(null,:idv,:idpro,:cant,:sub,null)',idv= idventa,idpro = precio[0]['Id_Producto'] ,cant = cantidad,sub =subtotal)
            sumatotal = db1.execute('select sum(Subtotal) as total from DetalleVenta where IdVenta = :idv',idv =idventa)
            db1.execute('UPDATE Ventas set total = :total WHERE Id_Venta = :id',total = sumatotal[0]['total'], id = idventa)
            nuevatabla = db1.execute('select dv.IdDetalle,p.Nombre as Nombre,p.Precio as Precio,dv.Cantidad from DetalleVenta as dv Inner join Producto as p ON dv.IdProducto = p.Id_Producto Where dv.IdVenta = :idven',idven = idventa)
        
        return render_template('sistema/tabla-factura-rapida.html',productos = nuevatabla,total = sumatotal[0]['total'])  

@app.route('/cantidad1', methods =["POST","GET"])
def cantidad1():
    if request.method == "POST":
        id = request.form['id']
        idventa = request.form['idventa']
        cantidad = request.form['cant']
        idproducto = db1.execute('SELECT IdProducto from DetalleVenta WHERE IdDetalle = :name',name = id)
        producto = db1.execute('SELECT Precio from Producto WHERE Id_Producto = :name',name = idproducto[0]['IdProducto'])
        subtotal = float(producto[0]['Precio']) * float(cantidad)
        db1.execute('UPDATE DetalleVenta set Cantidad = :cant, Subtotal = :sub WHERE IdDetalle = :id',cant = cantidad,sub = subtotal,id = id)
        sumatotal = db1.execute('select sum(Subtotal) as total from DetalleVenta where IdVenta = :idv',idv =idventa)
        print(sumatotal[0]['total'])
        db1.execute('UPDATE Ventas set total = :total WHERE Id_Venta = :id',total = sumatotal[0]['total'], id = idventa)
        nuevatabla = db1.execute('select dv.IdDetalle,p.Nombre as Nombre,p.Precio as Precio,dv.Cantidad from DetalleVenta as dv Inner join Producto as p ON dv.IdProducto = p.Id_Producto Where dv.IdVenta  = :idven',idven = idventa)
        
        return render_template('sistema/tabla-factura-rapida.html',productos = nuevatabla,total = sumatotal[0]['total'])         



@app.route('/orientacion', methods =["POST","GET"])
def orientacion():
    if request.method == "POST":
        id1 = request.form['id']
        cons = request.form['cons']
        ori = request.form['ori']

        id = db1.execute('select Id_Receta from Recetas Where IdConsulta = :con order by Id_Receta desc',con = cons)
        db1.execute('Update DetalleReceta SET Pasos = :ori WHERE IdDetalleReceta = :id ',ori = ori,id = id1)
        
        
        receta = db1.execute('SELECT * from DetalleReceta Where IdReceta = :id',id = id[0]['Id_Receta'])
        return render_template ('tabla-productos.html',receta = receta)
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
        return render_template ('sistema/modal.html', info = "producto", receta = receta)


@app.route('/generarpdf', methods =["POST","GET"])
def generarpdf():
    if request.method == "POST":
       
        flag = request.form['flag']
        if flag == "receta":
            id = request.form['id']
            idrec = db1.execute('select Id_Receta from Recetas order by Id_Receta desc')
            recetas = db1.execute('SELECT * from DetalleReceta Where IdReceta = :id',id = idrec[0]['Id_Receta'])
            nohay = []
            hay = []
            cantidades = []
            cantidad = 0  
            total = 0
            cont = 0
            for i in recetas:
                
                medicamentoencontrado = db1.execute('select p.Nombre,p.Precio,dr.Cantidad from Producto as p inner join DetalleReceta as dr ON p.Id_Producto = dr.IdProducto where p.Nombre = :name', name = i['Medicamento'])
                
                if medicamentoencontrado:
                    hay.append(medicamentoencontrado)
                    cantidad = db1.execute('select Cantidad from DetalleReceta Where Medicamento = :name',name = i['Medicamento'])
                    cantidades.append(cantidad)
                    print("cantidad receta: ",cantidad)
                    total = total + int(medicamentoencontrado[0]['Precio'] * cantidad[0]['Cantidad'])

                else:
                    
                    nohay.append(medicamentoencontrado)
            print(hay)
            
            return render_template ('sistema/pdf-factura.html', info = hay, flag = flag)
        elif flag == "rapida":
            idventa = request.form['idventa']
            nuevatabla = db1.execute('select dv.IdDetalle,p.Nombre as Nombre,p.Precio as Precio,dv.Cantidad from DetalleVenta as dv Inner join Producto as p ON dv.IdProducto = p.Id_Producto Where dv.IdVenta  = :idven',idven = idventa)
            print(nuevatabla)
            return render_template ('sistema/pdf-factura.html', info = nuevatabla,flag = flag)


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
        flag = request.form['flag']
        if flag == "usuario":
            nombres = request.form['nombres']
            apellidos = request.form['apellidos']
            correoc = request.form['correo']
            usuario = request.form['loginUser']
            contraseña = request.form['loginPassword']
            enviar_correo(app,"Bienvenido a Nuestra Familia",correoc,usuario,contraseña)
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
