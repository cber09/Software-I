
use Veterinaria_BuenProductor/********************************************************************MOSTRAR VISTAS****************************************************************************************/
/*MOSTAR CLIENTES*/
CREATE view [dbo].[View_ClientesCon]
AS
	select cli.Nombres as Cliente
	from Consulta as c
	INNER JOIN Mascota as m
	ON c.IdMascota = m.Id_Mascota
	INNER JOIN Cliente as cli
	ON m.IdCliente = cli.Id_Cliente
GO

/*MOSTRAR CLIENTES CON RESERVACIONES */
create view [dbo].[View_ClientesConReservacionesActivas]

as
select c.Nombres as NombreCliente,c.Apellidos,c.Celular,m.Nombre,m.Edad,m.Raza,tm.Descripcion,con.Fecha
,r.Descripcion as Motivo,r.Fecha as Fecha_Reservada
from Cliente as c INNER JOIN
Mascota as m ON c.Id_Cliente = m.IdCliente INNER JOIN
TipoMascota as tm ON m.IdTipoMascota = tm.Id_TipoMascota
INNER JOIN Consulta as con ON con.IdMascota = m.Id_Mascota 
INNER JOIN Reserva as r ON c.Id_Cliente = r.IdCliente
Where r.Estado = 1
GO

/*MOSTRAR EL HISTORAL DE CONSULTAS DE CLIENTES*/

create view [dbo].[View_HistorialConsultaCliente]

as
select c.Nombres,c.Apellidos,c.Celular,m.Nombre,m.Edad,m.Raza,tm.Descripcion,con.Fecha from Cliente as c INNER JOIN
Mascota as m ON c.Id_Cliente = m.IdCliente INNER JOIN
TipoMascota as tm ON m.IdTipoMascota = tm.Id_TipoMascota
INNER JOIN Consulta as con ON con.IdMascota = m.Id_Mascota 
GO
/*MOSTRAR EL HISTORIAL DE UN CLIENTE EN ESPECIFICO */
CREATE view [dbo].[View_HistorialConsultaClienteEspecifico]

as
select c.Nombres as NombreCliente,c.Apellidos,c.Celular,m.Nombre,m.Edad,m.Raza,tm.Descripcion,con.Fecha from Cliente as c INNER JOIN
Mascota as m ON c.Id_Cliente = m.IdCliente INNER JOIN
TipoMascota as tm ON m.IdTipoMascota = tm.Id_TipoMascota
INNER JOIN Consulta as con ON con.IdMascota = m.Id_Mascota 
GO

/*HISTORIAL DE CONSULTAS GENERALES*/
CREATE view [dbo].[View_HistorialConsultas]
AS
	select c.Id_Consulta as IdConsul,c.Fecha as Fecha,
	c.Sintomas as Sintomas,c.Diagnostico as Diagnostico
	,v.Nombres + ''+v.Apellidos as Veterinario
	,m.Nombre as Mascota
	from Consulta as c
	INNER JOIN Mascota as m
	ON c.IdMascota = m.Id_Mascota
	INNER JOIN Veterinario as v
	ON c.IdVeterinario = v.Id_Veterinario
GO

/*HISTORIAL DE ATENCION A UN CLIENTE EN ESPECIFICO */
create view [dbo].[View_HistorialDeAtencionDeVeterinarioEspecifico]

as
select vet.Id_Veterinario,vet.Nombres,vet.Apellidos,vet.Cedula,vet.Correo,m.Nombre as NombrePaciente,m.Edad,m.Raza 
from Veterinario as vet 
INNER JOIN Consulta as c ON vet.Id_Veterinario = c.IdVeterinario 
INNER JOIN Mascota as m ON c.IdMascota= m.Id_Mascota 
GO

/*HISTORIAL DE UN EMPLEADO POR MES */
create view [dbo].[View_HistorialDeAtencionDeVeterinarioPorMes]
as
select * from Consulta as c 
INNER JOIN Veterinario as vet ON c.IdVeterinario = vet.Id_Veterinario 
GO

/*HISTORIAL DE ATENCION DE UN VETERINARIO MENSUALMENTE*/
CREATE view [dbo].[View_HistorialDeAtencionDEVeterinarios]

as
select vet.Id_Veterinario,vet.Nombres,vet.Apellidos,vet.Cedula,vet.Correo,m.Nombre as NombrePaciente,m.Edad,m.Raza 
from Veterinario as vet 
INNER JOIN Consulta as c ON vet.Id_Veterinario = c.IdVeterinario 
INNER JOIN Mascota as m ON c.IdMascota= m.Id_Mascota 
GO

/*HISTORIAL DE VACUNACION DE CLIENTES*/
create view [dbo].[View_HistorialDeVacunasDeClientes]

as
select c.Nombres as NombreCliente,c.Apellidos,c.Celular,m.Nombre,m.Edad,m.Raza,tm.Descripcion,con.Fecha
,v.FechaProgramada,v.FechaAplicada,v.Vacuna
from Cliente as c INNER JOIN
Mascota as m ON c.Id_Cliente = m.IdCliente INNER JOIN
TipoMascota as tm ON m.IdTipoMascota = tm.Id_TipoMascota
INNER JOIN Consulta as con ON con.IdMascota = m.Id_Mascota 
INNER JOIN Vacunacion as v ON v.IdMascota = m.Id_Mascota
GO

/*HISTORIAL DE VACUNACION DE CLIENTES ESPECIFICOS */
create view [dbo].[View_HistorialDeVacunasDeClientesEspecificos]

as
select c.Nombres as NombreCliente,c.Apellidos,c.Celular,m.Nombre,m.Edad,m.Raza,tm.Descripcion,con.Fecha
,v.FechaProgramada,v.FechaAplicada,v.Vacuna
from Cliente as c INNER JOIN
Mascota as m ON c.Id_Cliente = m.IdCliente INNER JOIN
TipoMascota as tm ON m.IdTipoMascota = tm.Id_TipoMascota
INNER JOIN Consulta as con ON con.IdMascota = m.Id_Mascota 
INNER JOIN Vacunacion as v ON v.IdMascota = m.Id_Mascota
GO
/*HISTORIAL DE PACIENTES */
CREATE view [dbo].[View_HistorialPacientes]
AS
	select m.Id_Mascota as NumeroPaciente,m.Nombre as NombrePaciente,m.Edad as Edad,
	m.Raza as Raza,tm.Descripcion As Tipo,c.Nombres +''+c.Apellidos as Dueño,
	c.Celular as telefono
	from Cliente as c
	INNER JOIN Mascota as m 
	ON c.Id_Cliente = m.IdCliente
	INNER JOIN TipoMascota as tm
	ON m.IdTipoMascota = tm.Id_TipoMascota
GO
/*HISTORIAL DE LAS VENTAS*/
create   view [dbo].[View_HistorialVentas]
AS
	select v.Id_Venta AS CodigoVenta,p.Descripcion as NombreProducto,vd.Descripcion as Descripcion,
	vd.Cantidad as Cantidad,v.Fecha as Fecha,c.Nombres + ''+c.Apellidos as Cliente,
	vd.Costo as Total
	from VentaDetalle as vd
	INNER JOIN Ventas as v
	ON vd.IdVenta=v.Id_Venta
	INNER JOIN Cliente as c
	ON v.IdCliente = c.Id_Cliente
	INNER JOIN Producto as p
	ON vd.IdProducto = p.Id_Producto
GO
/*MOSTRAR CLIENTES */
create view [dbo].[View_MostrarClientes] 
As
	select * from Cliente
GO
/*MOSTRAR FACTURAS */
create view [dbo].[View_MostrarFacturas]
as
select v.Id_Venta as CodigoVenta,v.Fecha as Fecha,p.Descripcion as Producto,
	vd.Cantidad as Cantidad,c.Nombres +''+c.Apellidos as Cliente,m.Nombre as Mascota,
	(p.Precio * vd.Cantidad) + 150 as Total
	from Ventas as v 
	INNER JOIN VentaDetalle as vd 
	ON v.Id_Venta = vd.IdVenta
	INNER JOIN Cliente as c
	ON c.Id_Cliente = v.IdCliente
	INNER JOIN Mascota as m
	ON c.Id_Cliente = m.IdCliente
	INNER JOIN Producto as p
	ON vd.IdProducto = p.Id_Producto
GO

/*MOSTRAR TABLA PROVEEDORES*/
create view [dbo].[View_MostrarProveedores]
as
 select * From Proveedor 
GO
/*MOSTRAR TABLA DE VETERINARIO*/
create view [dbo].[View_MostrarVeterinario] 
As
	select * from Veterinario
GO

/*MOSTRAR TABLAS PRODUCTOS */
CREATE view [dbo].[View_Productos]
AS
	select p.Id_Producto as Id_Producto,p.Descripcion as Descripcion,p.Costo as Costo
	,p.Precio as Precio,p.Stock as Stock,pr.Compañia as Proveedor
	from Producto as p
	INNER JOIN Proveedor as pr
	ON p.IdProveedor = pr.Id_Proveedor
GO
/*MOSTRAR RESERVACIONES COMPLETAS DE UN VETERINARIO ESPECIFICO*/
create view [dbo].[View_ReservacionesCompletadasDeVeterinarioEspecifico]
as
select vet.Id_Veterinario,vet.Nombres as Veterinario,r.Fecha as FechaReservada,r.Descripcion as Motivo
,m.Nombre,tm.Descripcion,r.Estado from Consulta as c 
INNER JOIN Veterinario as vet ON c.IdVeterinario = vet.Id_Veterinario
INNER JOIN Reserva as r ON vet.Id_Veterinario = r.IdVeterinario
INNER JOIN Mascota as m ON c.IdMascota = m.Id_Mascota
INNER JOIN TipoMascota as tm ON m.IdTipoMascota=tm.Id_TipoMascota
GO
/*MOSTRAR RESERVACIONES PENDIENTES DE UN VETERINARIO EN ESPECIFICO*/
create view [dbo].[View_ReservacionesPendientesDeVeterinarioEspecifico]
as
select vet.Id_Veterinario,vet.Nombres as Veterinario,r.Fecha as FechaReservada,r.Descripcion as Motivo
,m.Nombre,tm.Descripcion,r.Estado from Consulta as c 
INNER JOIN Veterinario as vet ON c.IdVeterinario = vet.Id_Veterinario
INNER JOIN Reserva as r ON vet.Id_Veterinario = r.IdVeterinario
INNER JOIN Mascota as m ON c.IdMascota = m.Id_Mascota
INNER JOIN TipoMascota as tm ON m.IdTipoMascota=tm.Id_TipoMascota
GO
/*MOSTRAR TODAS LAS VENTAS*/
create view [dbo].[View_VerVentas]
as
	select * from Ventas
GO
/*VISTA PARA LOS PRODUCTOS MAS VENDIDOS*/
create view View_HistorialMasVendidos
as
select p.Descripcion as NombreProducto,SUM(vd.Cantidad) as Cantidad
	from VentaDetalle as vd
	INNER JOIN Producto as p
	ON vd.IdProducto = p.Id_Producto

	Group BY p.Descripcion


/*******************************************************************PROCESOS ALMACENADOS **********************************************************************************/
/*ASIGNARLE CONTRASEÑA A UN USUARIO*/
create or alter PROC [dbo].[SPGET_Acceso](@Nom_usu VARCHAR(30), @Password VARCHAR(10))
AS
BEGIN

SELECT * FROM Credenciales WHERE Usuario = @Nom_usu AND Contraseña = @Password

END
GO

/*BUSCAR UN CLIENTE */
create or alter procedure [dbo].[SPGet_BuscarCliente]@busqueda varchar(20),
@Indice int
as
begin
		IF @Indice = 0
		--buscar por codigo
		BEGIN

		SELECT * from Cliente
		WHERE Nombres LIKE @busqueda + '%'
		ORDER BY [Nombres] ASC
	END


	IF @Indice = 1
		BEGIN
		--Apellido

		SELECT * from Cliente
		WHERE Apellidos LIKE @busqueda + '%'
		ORDER BY [Apellidos] ASC
	END

end
GO

/*BUSCAR UN EMPLEADO*/
create or alter procedure [dbo].[SPGet_Buscarempleados]@busqueda varchar(20),
@Indice int
as
begin
		IF @Indice = 0
		--buscar por codigo
		BEGIN

		SELECT Id_Veterinario,Nombres,Apellidos,Cedula,
		Correo,IdCredenciales from Veterinario
		WHERE Nombres LIKE @busqueda + '%'
		ORDER BY [Nombres] ASC
	END


	IF @Indice = 1
		BEGIN
		--Apellido

		SELECT Id_Veterinario,Nombres,Apellidos,Cedula,
		Correo,IdCredenciales from Veterinario
		WHERE Apellidos LIKE @busqueda + '%'
		ORDER BY [Apellidos] ASC
	END

end
GO

/*BUSCAR UN PRODUCTO*/

create or alter procedure [dbo].[SPGet_BuscarProducto]@Indice int,@Nombre varchar(10)
as
begin
		IF @Indice = 0
		BEGIN

		SELECT p.Id_Producto as Id_Producto,p.Descripcion as Descripcion,p.Costo as Costo,p.Precio as Precio
		,p.Stock as Stock,prov.Compañia as Proveedor
		from Producto as p
		INNER JOIN Proveedor as prov 
		ON p.IdProveedor = prov.Id_Proveedor
		WHERE Id_Producto LIKE @Nombre + '%'
		ORDER BY [Descripcion] ASC
	END


	IF @Indice = 1
		BEGIN

		SELECT p.Id_Producto as Id_Producto,p.Descripcion as Descripcion,p.Costo as Costo,p.Precio as Precio
		,p.Stock as Stock,prov.Compañia as Proveedor
		from Producto as p
		INNER JOIN Proveedor as prov 
		ON p.IdProveedor = prov.Id_Proveedor
	    WHERE Descripcion LIKE @Nombre + '%'
		ORDER BY [Descripcion] ASC
	END
end
GO

/*BUSCAR UN PROVEEDOR */

create or alter procedure [dbo].[SPGet_BuscarProveedor]@busqueda varchar(20),
@Indice int
as
begin
		IF @Indice = 0
		--buscar por codigo
		BEGIN

		SELECT * from Proveedor
		WHERE Id_Proveedor LIKE @busqueda + '%'
		ORDER BY [Nombres] ASC
	END


	IF @Indice = 1
		BEGIN
		--compañia

		SELECT * from Proveedor
		WHERE Compañia LIKE @busqueda + '%'
		ORDER BY [Nombres] ASC
	END
	IF @Indice = 2
		BEGIN

		SELECT * from Proveedor
	    WHERE RUC LIKE @busqueda + '%'
		ORDER BY [Nombres] ASC
	END
end
GO

/*ELIMINAR UN CLIENTE */
create or alter   Procedure [dbo].[SPGet_EliminarCliente] @IdCliente varchar(10), @Nombres varchar (20), @Apellidos varchar (20)
AS
BEGIN
	SELECT * FROM Cliente
	order by Id_Cliente
	delete from Cliente
	Where Id_Cliente = @IdCliente and Nombres= @Nombres and Apellidos = @Apellidos
END
GO

/*ELIMINAR UNA COMPRA */
create or alter   procedure [dbo].[SPGet_EliminarCompra] @IdCompra varchar (10), @IdProveedor varchar(15)
as
begin
	select * from Compra
	delete from compra
	where Id_Compra =@IdCompra and IdProveedor= @IdProveedor
END
GO

/*ELIMINAR COMPRA DETALLE */
create or alter   procedure [dbo].[SPGet_EliminarCompraDetalle] @idcomprad int, @idProd int
as
begin
	select * from CompraDetalle
	delete from CompraDetalle
	where Id_CompraDetalle= @idcomprad and IdProducto=@idProd
	select * from CompraDetalle

end
GO

/*ELIMINAR UNA CONSULTA */
create or alter   procedure [dbo].[SPGet_EliminarConsulta] @Idcon int , @idmas int, @idvet int
as
begin
	delete from Consulta
	where Id_Consulta=@Idcon and IdMascota=@idmas and IdVeterinario =@idvet
end
GO

/*ELIMINAR UNA CREDENCIAL */
create or alter   PROCEDURE [dbo].[SPGet_EliminarCredencial] @IdCred varchar(10), @Usuario varchar(20), @contraseña varchar(20)
as
begin
	select * from Credenciales
	delete from Credenciales
	where Id_Credenciales = @IdCred and Usuario = @Usuario and Contraseña =@contraseña
	select * from Credenciales
END
GO

/*ELIMINAR UN EMPLEADO */
create or alter procedure [dbo].[SPGet_Eliminarempleado] @Idvet int
as
begin
	select * from Veterinario
	Delete from Veterinario
	where Id_Veterinario=@Idvet
	select * from Veterinario
end
GO

/*ELIMINAR UNA MASCOTA */
create or alter   procedure [dbo].[SPGet_EliminarMascota] @IdMascota varchar(10), @IdCliente varchar(10),@nombre varchar(20)
as
begin
	select * from Mascota
	delete from Mascota
	where Id_Mascota= @IdMascota and IdCliente=@IdCliente and Nombre= @nombre
	select * from Mascota
end
GO

/*ELIMINAR UN PRODUCTO */
create or alter   procedure [dbo].[SPGet_EliminarProducto] @IdProducto int
as
begin
	select * from Producto
	Delete from Producto
	where Id_Producto=@IdProducto
	select * from Producto
end
GO

/*ELIMINAR UN PROVEEDOR */
create or alter procedure [dbo].[SPGet_EliminarProveedor] @IdProv int
as
begin
	select * from Proveedor
	Delete from Proveedor
	where Id_Proveedor=@IdProv
	select * from Producto
end
GO

/*ELIMINAR UNA RESERVACION*/
create or alter   procedure [dbo].[SPGet_EliminarReserva] @idreserva int,@idcliente int, @idmascota int
as
begin
	delete from Reserva
	where Id_Reserva=@idreserva and  IdCliente=@idcliente and IdMascota=@idmascota
end
GO

/*ELIMINAR UN TIPO DE MASCOTA */
create or alter   PROCEDURE [dbo].[SPGet_EliminarTMascota] @IdTMas varchar (10)
as
begin
	select * from TipoMascota
	delete from TipoMascota
	where Id_TipoMascota= @IdTMas
	select * from TipoMascota
END
GO

/*ELIMINAR UNA VACUNACION*/
create or alter   procedure [dbo].[SPGet_EliminarVacunacion] @idvac int, @idmas int
as
begin
	delete from Vacunacion
	where Id_Vacunacion=@idvac and IdMascota=@idmas
end
GO

/*ELMINAR UNA VENTA */
create or alter   procedure [dbo].[SPGet_EliminarVenta] @IdVenta varchar(10)
as
begin
	select * from Venta
	delete from Venta
	where Id_Venta= @IdVenta
	select * from Venta
end
GO

/*ELIMINAR UN DETALLE DE VENTA*/
create or alter   procedure [dbo].[SPGet_EliminarVentaDetalle] @idventd int, @idventa int, @idprod int
as
begin
delete from VentaDetalle
where Id_VentaDetalle= @idventd and IdVenta=@idventa and IdProducto=@idprod
end
GO

/*ELIMINAR EMPLEADO*/
create or alter   procedure [dbo].[SPGet_EliminarVet] @IdVet varchar (10), @Nombres varchar (20), @Apellido varchar(20)
as
begin
	select * from Veterinario
	delete from Veterinario
	where Id_Veterinario= @IdVet and Nombres=@Nombres and Apellidos=@Apellido
	select * from Veterinario
end
GO

/*GENERAR UNA VENTA*/
 create or alter procedure [dbo].[SPGet_GenerarVenta]
 as
 begin
	select * from Ventas
 end
 GO

/*INSERTAR UN CLIENTE */
create or alter   PROCEDURE [dbo].[SPGet_InsertarCliente] @IdCliente varchar(10),@Nombres varchar (20), @Apellidos varchar (20), @Telefono varchar(10), @Celular varchar (10), @Correo varchar(30), @Direccion varchar(90) as
Select * from Cliente
Insert INTO Cliente(Id_Cliente,Nombres,Apellidos,TelefonoFijo,Celular,Correo,Direccion)
Values(@IdCliente,@Nombres,@Apellidos,@Telefono,@Celular,@Correo,@Direccion)
select * from Cliente

/*INSERTAR UNA COMPRA*/
create or alter   Procedure [dbo].[SPGet_InsertarCompra] @IdCompra varchar(10), @IdProveedor varchar(15), @Fecha Date
as
begin
	select * from Compra
	Insert Into Compra(Id_Compra,IdProveedor,Fecha)
	values(@IdCompra,@IdProveedor,@Fecha)
	select * from Compra
END
GO

/*INSERTAR UN DETALLE DE UNA COMPRA */
create or alter   procedure [dbo].[SPGet_InsertarCompradetalle] @idcomprad int, @idprod int, @idcompra int, @desc nchar(100), @cantidad int, @costo float
as
begin
	select * from CompraDetalle
	insert into CompraDetalle(Id_CompraDetalle,IdProducto,IdCompra,Descripcion,Cantidad,Costo)
	values(@idcomprad,@idprod,@idcompra,@desc,@cantidad,@costo)
	select * from CompraDetalle
end
GO

/*INSERTAR UNA CONSULTA */
create or alter   procedure [dbo].[SPGet_InsertarConsulta] @IdCons int, @IdMas int, @Fecha date, @Sintomas nchar(100), @Diagnostico nchar(100), @IdVet int,@Estado varchar(10)
as
begin
	Select * from Consulta	
	insert into Consulta(Id_Consulta,IdMascota,Fecha,Sintomas,Diagnostico,IdVeterinario,Estado)
	values(@IdCons,@IdMas,@Fecha,@Sintomas,@Diagnostico,@IdVet,@Estado)
	Select * from Consulta
end
GO

/*INSERTAR CREDENCIAL*/

create or alter   PROCEDURE [dbo].[SPGet_InsertarCredenciales] @IdCred int , @User varchar(20), @Contraseña varchar(20), @Rol int
as
begin
	select * from Credenciales
	insert into Credenciales(Id_Credenciales,Usuario,Contraseña,Rol)
	values(@IdCred,@User,@Contraseña,@Rol)
	select * from Credenciales
END
GO

/*INSERTAR CREDENCIALES */
create or alter   PROCEDURE [dbo].[SPGet_InsertarCredenciales] @IdCred int , @User varchar(20), @Contraseña varchar(20), @Rol int
as
begin
	select * from Credenciales
	insert into Credenciales(Id_Credenciales,Usuario,Contraseña,Rol)
	values(@IdCred,@User,@Contraseña,@Rol)
	select * from Credenciales
END
GO

/*INSERTAR EMPLEADO*/
create or alter   procedure [dbo].[SPGet_Insertarempleado] @Idvet int, @Nombres varchar(20), @Apellidos varchar(20), @cedula varchar(20), @correo varchar(20), @IdCredenciales int, @usuario varchar(20),@Contraseña varchar(20)
as
begin
	select * from Veterinario
	declare @id int
	set @id = (SELECT MAX(Id_Credenciales) from Credenciales)
	insert into Credenciales(Id_Credenciales,Usuario,Contraseña,Rol)
	values (@id +1,@usuario,@contraseña,1)
	declare @Idcredecialn int
        SET @Idcredecialn = (SELECT Id_Credenciales
                     FROM Credenciales 
                     WHERE Usuario = @usuario AND contraseña = @contraseña)
	insert into Veterinario(Id_Veterinario,Nombres,Apellidos,Cedula,Correo,IdCredenciales)
	values(@Idvet,@Nombres,@Apellidos,@cedula,@correo,@Idcredecialn)
	select * from Credenciales
end
GO

/*INSERTAR UNA MASCOTA*/

create or alter   procedure [dbo].[SPGet_InsertarMascota] @IdMascota varchar(10), @IdCliente varchar(10), @Nombre varchar (20),@Edad int, @Raza varchar(15), @Observaciones varchar(20), @IdTipo varchar(10)
as
begin
	select * from Mascota
	insert into Mascota(Id_Mascota,IdCliente,Nombre,Edad,Raza,Observaciones,IdTipoMascota)
	values(@IdMascota,@IdCliente,@Nombre,@Edad,@Raza,@Observaciones,@IdTipo)
	select * from Mascota
End 
GO

/*INSERTAR UN PRODUCTO*/
create or alter   procedure [dbo].[SPGet_InsertarProducto] @IdProd int, @Desc nchar(50), @costo float, @precio float, @stock int, @Prov int
as
begin
	select * from Producto
	insert into Producto(Id_Producto,Descripcion,Costo,Precio,Stock,IdProveedor)
	values(@IdProd,@Desc,@costo,@precio,@stock,@Prov)
	select * from Producto
END
GO

/*INSERTAR UN PROVEEDOR*/
create or alter   procedure [dbo].[SPGet_InsertarProveedor] @IdProveedor int, @Nombres varchar(20), @Apellidos varchar(20), @TelefonoFijo varchar(10), @Celular varchar(10), @Direccion varchar(90), @Correo varchar(30),
@RUC varchar(20),@Compañia varchar(20)
as
begin
	Select * from Proveedor
	insert into Proveedor(Id_Proveedor,Nombres,Apellidos,TelefonoFijo,Celular,Direccion,Correo,RUC,Compañia)
	Values(@IdProveedor, @Nombres, @Apellidos, @TelefonoFijo, @Celular, @Direccion, @Correo,@RUC,@Compañia)
	Select * from Proveedor
END
GO

/*INSERTAR UNA RESERVA*/
create or alter   procedure [dbo].[SPGet_InsertarReserva] @IdReserva int, @idcliente int, @idmascota int, @fecha date, @Desc nchar(100), @Estado bit
as
begin
	select * from Reserva
	insert into Reserva(Id_Reserva,IdCliente,IdMascota,Fecha,Descripcion,Estado)
	values(@IdReserva,@idcliente,@idmascota,@fecha,@Desc,@Estado)
	select * from Reserva
		
end
GO

/*INSERTAR UN TIPO DE MASCOTA */
create or alter   procedure [dbo].[SPGet_InsertarTMascota] @IdTMas varchar(10), @Descripcion varchar(120)
as
begin
	Select * from TipoMascota
	insert into TipoMascota(Id_TipoMascota,Descripcion)
	values(@IdTMas,@Descripcion)
	select * from TipoMascota
end
GO

/*INSERTAR UNA VACUNACION */
create or alter   procedure [dbo].[SPGet_InsertarVacunacion] @idVac int, @idmas int, @fechaprog date,@vacuna nchar(100),@fechaa date
as
begin
	insert into Vacunacion(Id_Vacunacion,IdMascota,FechaProgramada,Vacuna,FechaAplicada)
	values(@idVac,@idmas,@fechaprog,@vacuna,@fechaa)	
end
GO

/*INSERTAR UNA VENTAS */
create or alter   procedure [dbo].[SPGet_InsertarVenta] @IdVenta varchar(10)
as
begin
	select * from Venta
	insert into Venta(Id_Venta)
	values(@IdVenta)
	select * from Venta
end
GO

/*INSERTAR UN DETALLE DE VENTA */
create or alter   procedure [dbo].[SPGet_InsertarVentaDetalle] @idventad int, @idventa int,@idprod int, @desc nchar (100),@cantidad int, @costo float
as
begin
	insert into VentaDetalle(Id_VentaDetalle,IdVenta,IdProducto,Descripcion,Cantidad,Costo)
	values(@idventad,@idventa,@idprod,@desc,@cantidad,@costo)
end
GO

/*INSERTAR UN EMPLEADO */

create or alter   procedure [dbo].[SPGet_InsertarVeterinario] @IdVet varchar(10), @Nombres varchar(20),@apellido varchar(20), @Cedula varchar(20),@correo varchar (30), @IdCred varchar(10)
as
begin
	select * from Veterinario
	Insert into Veterinario(Id_Veterinario,Nombres,Apellidos,Cedula,Correo,IdCredenciales)
	values(@IdVet,@Nombres,@apellido,@Cedula,@correo,@IdCred)
	select * from Veterinario
end
GO

/*MODIFICAR UN CLIENTE */
create or alter   PROCEDURE [dbo].[SPGet_ModificarCliente] @IdCliente varchar(10), @Nombres varchar(20), @Apellidos varchar(20), @Celular varchar(10), @Telefono varchar(10), @Correo varchar (30), @Direccion varchar(90) 
AS
BEGIN
	select * from Cliente
	UPDATE Cliente
	SET Nombres = @Nombres, Apellidos = @Apellidos,TelefonoFijo = @Telefono, Celular = @Celular, Correo = @correo
	WHERE Id_Cliente = @IdCliente
	select * from Cliente
END

/*MODIFICAR UNA COMPRE */
create or alter   PROCEDURE [dbo].[SPGet_ModificarCompra] @IdCompra varchar(10), @IdProveedor varchar(15), @Fecha Date, @FechaMod Date
as
begin
	select * from Compra
	Update Compra
	Set Fecha = @FechaMod
	where Id_Compra = @IdCompra and IdProveedor = @IdProveedor
END
GO

/*MODIFICAR UN DETALLE DE COMPRA */
create or alter   procedure [dbo].[SPGet_ModificarCompradetalle] @idcomprad int, @descripcion nchar(100),@cantidad int, @costo float
as
begin
	select * from CompraDetalle
	update CompraDetalle
	set Descripcion=@descripcion, Cantidad=@cantidad, Costo=@costo
	where Id_CompraDetalle=@idcomprad
	
end
GO

/*MODIFICAR UNA CONSULTA */
create or alter   procedure [dbo].[SPGet_ModificarConsulta] @IdConsulta int, @IdMascota int, @FechaM date, @SintomasM nchar(100),@Diagnostico nchar(100)
as
begin
	select * from Consulta
	update Consulta
	set Fecha= @FechaM, Sintomas = @SintomasM, Diagnostico = @Diagnostico
	where Id_Consulta=@IdConsulta and IdMascota =@IdMascota
	select * from Consulta

end
GO

/*MODIFICAR UNA CREDENCIALES */

create or alter   PROCEDURE [dbo].[SPGet_ModificarCredenciales] @IdCred varchar(10), @User varchar(20), @Contra varchar(20), @Rol varchar(30), @NewRol varchar(30), @NewContra varchar(20)
as
begin
	select * from Credenciales
	update Credenciales
	set Rol = @NewRol, Contraseña = @NewContra
	where Id_Credenciales= @IdCred and Usuario = @User and Contraseña = @Contra
	select * from Credenciales
END
GO

/*MODIFICAR UNA MASCOTA */
create or alter   procedure [dbo].[SpGet_ModificarMascota] @IdMascota varchar(10),@IdCliente varchar(10),@EdadM int, @ObservacionesM varchar(100)
as
begin
	select * from Mascota
	update Mascota
	set Edad=@EdadM, Observaciones= @ObservacionesM
	where Id_Mascota = @IdMascota and IdCliente = @IdCliente
	select * from Mascota
end
GO

/*MODIFICAR UN PRODUCTO */
create or alter   procedure [dbo].[SPGet_ModificarProducto] @IdProd int, @Desc nchar(50), @costoM float,@precioM float, @StockM int,@Prov int
as
begin
	select * from Producto
	update Producto
	set Costo= @costoM, Precio=@precioM, Stock=@StockM, Descripcion = @Desc,IdProveedor = @Prov
	where Id_Producto=@IdProd
	select * from Producto
end
GO

/*MODIFICAR UN PROVEEDOR */
create or alter   PROCEDURE [dbo].[SPGet_ModificarProveedor] @IdProveedor int, @Nombres varchar(20), @Apellidos varchar(20), 
@TelefonoFijo varchar(10), @Celular varchar(10), @Direccion varchar(90), @Correo varchar(30),
@RUC varchar(20),@Compañia varchar(20)
as
begin
	select * from Proveedor
	update Proveedor
	set Nombres = @Nombres,Apellidos = @Apellidos,
	TelefonoFijo=@TelefonoFijo, Celular=@Celular, Direccion = @Direccion,
	Correo = @Correo,RUC= @RUC,Compañia= @Compañia
	where Id_Proveedor = @IdProveedor
	select * from Proveedor
END
GO

/*MODIFICAR UNA RESERVA */
create or alter   procedure [dbo].[SPGet_ModificarReserva] @IdReserva int, @idcliente int, @idmascota int,@descripcionM nchar(100), @estadom bit 
as
begin
	select * from Reserva
	Update Reserva
	set Descripcion=@descripcionM, Estado=@estadom
	WHERE Id_Reserva=@IdReserva and IdCliente=@idcliente and IdMascota=@idmascota
	
end
GO

/*MODIFICAR UN TIPO DE MASCOTA */
create or alter   PROCEDURE [dbo].[SPGet_ModificarTMascota] @IdTMas varchar(10), @DescripcionM varchar(120)
as
begin
	select * from TipoMascota
	update TipoMascota
	set Descripcion=@DescripcionM
	where Id_TipoMascota = @IdTMas
	select * from TipoMascota
End 
GO

/*MODIFICAR UNA VACUNACION*/
create or alter   procedure [dbo].[SPGet_ModificarVacunacion] @idvac int, @idmas int, @fecham date, @vacunam nchar(100), @fechaam date
as
begin

	update Vacunacion
	set FechaProgramada=@fecham, FechaAplicada=@fechaam, Vacuna=@vacunam
	where Id_Vacunacion=@idvac and IdMascota=@idmas
end
GO

/*MODIDIFCAR UNA VENTA */
create or alter   procedure [dbo].[SPGet_ModificarVenta] @IdVenta VARCHAR(10),@IdVentaM VARCHAR(10)
AS
BEGIN
	select * from Venta
	update Venta
	Set Id_Venta= @IdVentaM
	where Id_Venta =@IdVenta
	select * from Venta
END
GO

/*MODIFICAR UN DETALLE DE VENTA */
create or alter   procedure [dbo].[SPGet_ModificarVentaDetalle] @idventad int ,@idventa int,@idprod int, @cantidadm int, @costom float
as
begin
	update VentaDetalle
	set Cantidad=@cantidadm, Costo=@costom
	where Id_VentaDetalle=@idventad and IdVenta=@idventa and IdProducto=@idprod
	
end
GO

/*MODIFICAR UNA VENTA */
create or alter   procedure [dbo].[SPGet_ModificarVentas] @idventa int, @fecham date
as
begin

	update Ventas
	set Fecha=@fecham
	where Id_Venta= @idventa
end
GO

/*MODIFICAR UN EMPLEADO*/
create or alter   PROCEDURE [dbo].[SPGet_ModificarVeterinario] @Idvet int, @Nombres varchar(20), @Apellidos varchar(20), @cedula varchar(20), @correo varchar(20), @usuario varchar(20),@Contraseña varchar(20)
AS
BEGIN
	select * from Veterinario
	UPDATE Veterinario
	SET Nombres = @Nombres, Apellidos = @Apellidos, Cedula = @cedula, Correo = @correo
	WHERE Id_Veterinario = @Idvet 
	UPDATE Credenciales
	SET Usuario = @usuario, Contraseña = @Contraseña
	WHERE Id_Credenciales = (SELECT IdCredenciales from Veterinario WHERE Id_Veterinario = @Idvet)
END
GO
/*MOSTRAR UNA FACTURA */

create or alter Procedure [dbo].[SPGet_MostrarFactura]

as
begin
	select v.Id_Venta as CodigoVenta,v.Fecha as Fecha,p.Descripcion as Producto,
	vd.Cantidad as Cantidad,c.Nombres +''+c.Apellidos as Cliente,m.Nombre as Mascota,
	(p.Precio * vd.Cantidad) + 150 as Total
	from Ventas as v 
	INNER JOIN VentaDetalle as vd 
	ON v.Id_Venta = vd.IdVenta
	INNER JOIN Cliente as c
	ON c.Id_Cliente = v.IdCliente
	INNER JOIN Mascota as m
	ON c.Id_Cliente = m.IdCliente
	INNER JOIN Producto as p
	ON vd.IdProducto = p.Id_Producto
end
GO

/*MOSTRAR UN PRODUCTO VALIDO*/
create or alter    procedure [dbo].[SPGet_ProductoValido]
as
begin
	select MAX(Id_Producto) from Producto
	select * from Producto
end
GO

/*ROLES DE LOS USUARIOS */
create or alter procedure [dbo].[SPGet_Rol]@usuario varchar(20)
as
begin
	select Rol from Credenciales WHERE Usuario = @usuario
end
GO

/*TIPOS DE MASCOTA*/
create or alter  procedure [dbo].[SPGet_TipoMascota]
as
BEGIN
	select Id_TipoMascota as 'Codigo Tipo Mascota',Descripcion as 'Tipo de Mascota' from TipoMascota
END
GO

/*CAMBIAR EL ESTADO DE LAS CONSULTAS CUANDO NO LLEGAN*/
create or alter or alter procedure [dbo].[SPGet_ausente] @idcons int
as 
begin 
 update Consulta
 set Estado = 'Ausente'
 WHERE Id_Consulta = @idcons
end
/*VENTAS POR DIA*/
create or alter procedure [dbo].[SPGet_VentaDia]@dia date
	as
	begin
		select Id_Venta as CodigoVenta,Fecha as Fecha,
	total as Total
	from Ventas
	WHere Fecha = @dia
end
/*historial de consultas por dia*/
create or ALTER procedure [dbo].[SPGet_ConsultaDia]@dia date
	as
	begin
		select c.Id_Consulta as IdConsul,c.Fecha as Fecha,
	c.Sintomas as Sintomas,c.Diagnostico as Diagnostico
	,v.Nombres + ''+v.Apellidos as Veterinario
	,m.Nombre as Mascota
	from Consulta as c
	INNER JOIN Mascota as m
	ON c.IdMascota = m.Id_Mascota
	INNER JOIN Veterinario as v
	ON c.IdVeterinario = v.Id_Veterinario
	WHere Fecha = @dia
end

/*consultas por mes*/
create or ALTER procedure [dbo].[SPGet_ConsultaMes]@mes int
	as
	begin
		select c.Id_Consulta as IdConsul,c.Fecha as Fecha,
	c.Sintomas as Sintomas,c.Diagnostico as Diagnostico
	,v.Nombres + ''+v.Apellidos as Veterinario
	,m.Nombre as Mascota
	from Consulta as c
	INNER JOIN Mascota as m
	ON c.IdMascota = m.Id_Mascota
	INNER JOIN Veterinario as v
	ON c.IdVeterinario = v.Id_Veterinario
	WHere Month(Fecha) = @mes
end
/*buscar consulta por mascota o vet*/
create or ALTER procedure [dbo].[SPGet_BuscarConsulta]@Indice int,@Nombre varchar(10)
as
begin
		IF @Indice = 0
		BEGIN

		select c.Id_Consulta as IdConsul,c.Fecha as Fecha,
		c.Sintomas as Sintomas,c.Diagnostico as Diagnostico
		,v.Nombres + ''+v.Apellidos as Veterinario
		,m.Nombre as Mascota
		from Consulta as c
		INNER JOIN Mascota as m
		ON c.IdMascota = m.Id_Mascota
		INNER JOIN Veterinario as v
		ON c.IdVeterinario = v.Id_Veterinario
		WHERE m.Nombre LIKE @Nombre + '%'
		ORDER BY [Id_Consulta] ASC
	END


	IF @Indice = 1
		BEGIN

		select c.Id_Consulta as IdConsul,c.Fecha as Fecha,
		c.Sintomas as Sintomas,c.Diagnostico as Diagnostico
		,v.Nombres + ''+v.Apellidos as Veterinario
		,m.Nombre as Mascota
		from Consulta as c
		INNER JOIN Mascota as m
		ON c.IdMascota = m.Id_Mascota
		INNER JOIN Veterinario as v
		ON c.IdVeterinario = v.Id_Veterinario
		WHERE v.Nombres LIKE @Nombre + '%'
		ORDER BY [Id_Consulta] ASC
	END
end
/*buscar mascota*/
create or ALTER procedure [dbo].[SPGet_BuscarPaciente]@Indice int,@Nombre varchar(10)
as
begin
		IF @Indice = 0
		BEGIN

		select m.Id_Mascota as NumeroPaciente,m.Nombre as NombrePaciente,m.Edad as Edad,
		m.Raza as Raza,tm.Descripcion As Tipo,c.Nombres +''+c.Apellidos as Dueño,
		c.Celular as telefono
		from Cliente as c
		INNER JOIN Mascota as m 
		ON c.Id_Cliente = m.IdCliente
		INNER JOIN TipoMascota as tm
		ON m.IdTipoMascota = tm.Id_TipoMascota
		WHERE m.Nombre LIKE @Nombre + '%'
		ORDER BY [Id_Mascota] ASC
	END


	IF @Indice = 1
		BEGIN

		select m.Id_Mascota as NumeroPaciente,m.Nombre as NombrePaciente,m.Edad as Edad,
		m.Raza as Raza,tm.Descripcion As Tipo,c.Nombres +''+c.Apellidos as Dueño,
		c.Celular as telefono
		from Cliente as c
		INNER JOIN Mascota as m 
		ON c.Id_Cliente = m.IdCliente
		INNER JOIN TipoMascota as tm
		ON m.IdTipoMascota = tm.Id_TipoMascota
		WHERE tm.Descripcion LIKE @Nombre + '%'
		ORDER BY [Id_Mascota] ASC
	END
	IF @Indice = 2
		BEGIN

		select m.Id_Mascota as NumeroPaciente,m.Nombre as NombrePaciente,m.Edad as Edad,
		m.Raza as Raza,tm.Descripcion As Tipo,c.Nombres +''+c.Apellidos as Dueño,
		c.Celular as telefono
		from Cliente as c
		INNER JOIN Mascota as m 
		ON c.Id_Cliente = m.IdCliente
		INNER JOIN TipoMascota as tm
		ON m.IdTipoMascota = tm.Id_TipoMascota
		WHERE c.Nombres LIKE @Nombre + '%'
		ORDER BY [Id_Mascota] ASC
	END
end

/*cargar mascota*/
create or ALTER procedure [dbo].[SPGet_cargarmas] 
as
begin
	select Descripcion as Mascota,Id_TipoMascota as Codigo
	from TipoMascota
end