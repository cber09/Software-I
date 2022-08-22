select * from Cliente

ALTER TABLE Cliente 
ALTER COLUMN Foto Varchar(250) null; 

INSERT INTO Cliente 
values(
'001-050601-0005J', 'Juan Ramón','Sanchez Zepeda','54789654','Ciudad Sandino, Managua',3850,10050,null),(
'201-030499-3000U', 'Rosa Maria','Blandon Suarez','56987454','Reparto hielera del yankee, Granada',4580,6000,null),(
'201-030201-4000K', 'Harry Xavier','Suarez Martinez','87946561','Campo de Aterrizaje, Granada',7859,15985,null),(
'201-040401-1009F', 'Samuel Jose','Ramirez Martinez','59621421','Villa solidaridad, Managua',5150,8900,null),(
'201-130502-1005J', 'Arturo Roman','Tapias Duarte','85965421','Palmiras, Granada',9550,20000,null),(
'001-060301-0005J', 'Manuel Javier','Sanchez Zepeda','59648754','Ciudad Sandino, Managua',5415,11500,null),(
'201-150699-3000H', 'Maria Auxiliadora','Blandon Suarez','58748574','La Sabaneta, Granada',6521,8000,null),(

'201-201198-4000L', 'Guadalupe Maria','Suarez Martinez','89968547','Calle Atravesada, Granada',8000,15000,null),(
'201-121202-1009M', 'Marcos Antonio','Ramirez Ramirez','59687415','Villa solidaridad, Granada',6521,20000,null),(
'201-050501-1006J', 'Manuel De Jesus','Zepeda Martinez','54747152','Villa solidaridad, Managua',6210,8900,null),(
'201-030397-1006F', 'Pablo Antonio','Ramirez Duarte','59623102','Palmiras, Granada',3000,20000,null),(
'001-060302-0004M', 'Norma Auxiliadora','Largaespada Zepeda','89652301','Ciudad Sandino, Managua',6352,11500,null),(
'201-150597-3001H', 'Alisson Andrea','Ramirez Suarez','89654123','La Sabaneta, Granada',5632,8000,null),(
'201-201295-4000K', 'Guadalupe Maria','Suarez Gutierrez','87456932','Calle Atravesada, Granada',3520,10000,null),(
'201-150294-1009L', 'Manuel Rodrigo','Centeno Ramirez','53021012','Villa solidaridad, Granada',6302,20000,null)

select * from Productos
INSERT INTO Productos
values(
'0003', 'Electrodomesticos','Refrigeradora','LB',15000,20,''),(
'0004', 'Alimentos','Arroz','LB',20,100,'Disponible'),(
'0005', 'Alimentos','Frijoles','LB',20,100,'Disponible'),(
'0006', 'Alimentos','Maiz','LB',10,100,'Disponible'),(
'0007', 'Alimentos','Cacao','LB',45,100,'Disponible'),(
'0008', 'Alimentos','Carne','LB',80,500,'Disponible'),(
'0009', 'Alimentos','Uva','LB',50,100,'Disponible'),(
'0010', 'Bebidas','Gaseosa','LT',45,500,'Disponible'),(
'0011', 'Bebidas','Jugos','LT',35,500,'Disponible'),(
'0012', 'Electronicos','Pc','LB',25000,5,'Disponible'),(
'0013', 'Electronicos','Mouse','LB',800,100,'Disponible'),(
'0014', 'Electronicos','Tablets','LB',5000,38,'Disponible'),(
'0015', 'Electrodomestico','Licuadora','LB',5000,38,'Disponible')

select * from Factura
INSERT INTO Factura
values(
'0001', '201-150699-3000H','Persona','2022-03-20',5000,'12:46','TRUE'),(
'0002', '201-201198-4000L','Persona','2022-03-20',6000,'12:47','TRUE'),(
'0003', '201-201295-4000K','Online','2022-03-20',7000,'12:50','TRUE'),(
'0004', '201-150294-1009L','Persona','2022-03-20',4000,'01:15','TRUE'),(
'0005', '001-050601-0005J','Persona','2022-03-20',6000,'01:20','TRUE'),(
'0006', '201-030499-3000U','Persona','2022-03-20',8000,'01:25','TRUE'),(
'0007', '201-121202-1009M','Online','2022-03-20',10000,'01:30','TRUE'),(
'0008', '201-030397-1006F','Persona','2022-03-20',6000,'01:45','TRUE'),(
'0009', '201-150699-3000H','Persona','2022-03-20',5000,'02:01','TRUE'),(
'0010', '201-150294-1009L','Persona','2022-03-20',6000,'02:15','TRUE'),(
'0011', '001-050601-0005J','Persona','2022-03-20',7000,'02:20','TRUE'),(
'0012', '201-030499-3000U','Persona','2022-03-20',8000,'02:25','TRUE'),(
'0013', '201-121202-1009M','Online','2022-03-20',10000,'03:30','TRUE'),(
'0014', '201-030397-1006F','Persona','2022-03-20',6000,'03:45','TRUE'),(
'0015', '201-150699-3000H','Persona','2022-03-20',5000,'04:01','TRUE'),(
'0016', '201-150294-1009L','Persona','2022-03-20',6000,'05:15','TRUE')



select * from Proveedor
INSERT INTO Proveedor
values(
'0001', 'SINSA','KM 8, 1/2 Carr. a Masaya, Managua','87451201'),(
'0002', 'SEVASA','Carretera a Masaya km 13.4, Costado este, Managua','59687451'),(
'0003', 'Coca Cola','C. Las Jagüitas, Managua','85748965'),(
'0004', 'Curacao','Plaza Paseo Masaya','89754562'),(
'0005', 'Electro','Iglesia el Calvario, 2 cuadras al Este, 2 cuadras al Sur, Managua','54789562'),(
'0006', 'R Electronic','Barrio 19 de Julio','59648754'),(
'0007', 'Arroz Corea','Sirama Norte','56874521'),(
'0008', 'Granos y Semillas S.A','Altamira del Este Semáforos BDF 1 cuadra arriba, 14027','85412101'),(
'0009', 'AGROEXPORT','W4R2+GX4, Matagalpa','57489562'),(
'0010', 'Venta de Granos Básicos','Cd. Sandino','54621542')


select * from Compras
INSERT INTO Compras
values(
'0001', '0001','2022-03-20',100, 5000, 6000, 100000),(
'0002', '0002','2022-03-20',100, 6000, 6000, 120000),(
'0003', '0003','2022-03-20',100, 8000, 6000, 125000),(
'0004', '0004','2022-03-20',100, 2000, 6000, 150000),(
'0005', '0005','2022-03-20',100, 1000, 6000, 115000),(
'0006', '0006','2022-03-20',100, 4500, 6000, 130000),(
'0007', '0007','2022-03-20',100, 5500, 6000, 126000),(
'0008', '0008','2022-03-20',100, 3000, 6000, 158500),(
'0009', '0009','2022-03-20',100, 4000, 6000, 163200),(
'0010', '0010','2022-03-20',100, 6300, 6000, 100000),(
'0011', '0001','2022-03-20',100, 2000, 6000, 150000),(
'0012', '0002','2022-03-20',100, 1000, 6000, 115000),(
'0013', '0006','2022-03-20',100, 4500, 6000, 130000),(
'0014', '0007','2022-03-20',100, 5500, 6000, 126000),(
'0015', '0008','2022-03-20',100, 3000, 6000, 158500),(
'0016', '0009','2022-03-20',100, 4000, 6000, 163200)


select * from Abonos
INSERT INTO Abonos
values(
'0001', '201-150699-3000H',500,'2022-03-20'),(
'0002', '201-201198-4000L',100,'2022-03-20'),(
'0003', '201-201295-4000K',100,'2022-03-20'),(
'0004', '201-150294-1009L',200,'2022-03-20'),(
'0005', '001-050601-0005J',500,'2022-03-20'),(
'0006', '201-030499-3000U',300,'2022-03-20'),(
'0007', '201-121202-1009M',450,'2022-03-20'),(
'0008', '201-030397-1006F',100,'2022-03-20'),(
'0009', '201-150699-3000H',250,'2022-03-20'),(
'0010', '201-150294-1009L',300,'2022-03-20'),(
'0011', '001-050601-0005J',400,'2022-03-20'),(
'0012', '201-030499-3000U',300,'2022-03-20'),(
'0013', '201-121202-1009M',500,'2022-03-20'),(
'0014', '201-030397-1006F',300,'2022-03-20'),(
'0015', '201-150699-3000H',250,'2022-03-20')

select * from DetalleFactura
delete  from DetalleFactura
INSERT INTO DetalleFactura
values(
'0001', '0001',1,9000),(
'0002', '0003',1,15000),(
'0003', '0001',1,9000),(
'0004', '0006',6,600),(
'0005', '0003',1,15000),(
'0006', '0004',10,200),(
'0007', '0002',2,10000),(
'0008', '0001',1,9000),(
'0009', '0005',10,200),(
'0010', '0005',9,180),(
'0011', '0006',5,500),(
'0012', '0006',10,100),(
'0013', '0006',5,50),(
'0014', '0002',1,5000),(
'0015', '0001',1,9000)

select * from DetalleCompra
INSERT INTO DetalleCompra
values(
'0001', '0001',1,9000,9000),(
'0002', '0003',1,1500,15000),(
'0003', '0001',1,9000,9000),(
'0004', '0006',6,10,600),(
'0005', '0003',1,15000,15000),(
'0006', '0004',10,20,200),(
'0007', '0002',2,5000,10000),(
'0008', '0001',1,9000,9000),(
'0009', '0005',10,20,200),(
'0010', '0005',9,20,180),(
'0011', '0006',5,10,500),(
'0012', '0006',10,10,100),(
'0013', '0006',5,10,50),(
'0014', '0002',1,5000,5000),(
'0015', '0001',1,9000,9000)

--Consulta 1: Mostrar los productos por existencia y ordenados por el identificador.
select * from Productos 
where TipoDeInventario = 'Disponible'

--Consulta 2: Mostrar a todos los clientes con sus límites de créditos, ordenados por el apellido.

select Apellidos, Nombres, TotalCredito as Creditos from Cliente
order by Apellidos

--Consulta 3:Muestre cada una de las facturas del mes de septiembre, ordenadas en forma ascendente por la fecha de la facturación.

select Cedula, TipoDeVenta, FechaFactura, TotalFactura, Hora, 
df.Cantidad,p.Producto,p.IdCategoria
from Factura as f
inner join DetalleFactura as df
on f.IdFactura = df.IdFactura
inner join Productos as p
on df.IdProducto = p.IdProducto
WHERE MONTH(FechaFactura) = 9

--Consulta 4:Mostrar las compras que se han realizado, detallado el nombre del proveedor, así como la fecha en que se han realizado. 

select Cedula, TipoDeVenta, FechaFactura, TotalFactura, Hora, 
df.Cantidad,p.Producto,p.IdCategoria, pr.NombreEmpresa as Proveedor, pr.Direccion,c.FechaCompras as fecha_compra
from Factura as f
inner join DetalleFactura as df
on f.IdFactura = df.IdFactura
inner join Productos as p
on df.IdProducto = p.IdProducto
inner join DetalleCompra as dc
on p.IdProducto = dc.IdProducto
inner join Compras as c
on c.IdCompras = dc.IdCompras
inner join Proveedor as pr
on c.IdProveedor = pr.Idproveedor