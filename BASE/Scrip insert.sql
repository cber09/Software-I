alter table Mascota
alter column Raza nchar(30) null


INSERT INTO TipoMascota VALUES (1,'Perro');
INSERT INTO TipoMascota VALUES (2,'Gato');
INSERT INTO TipoMascota VALUES (3,'Loro');
INSERT INTO TipoMascota VALUES (4,'Conejo');
INSERT INTO TipoMascota VALUES (5,'Serpiente');
INSERT INTO TipoMascota VALUES (6,'Hamster');


insert into TipoMascota
VALUES
(7,'Ardilla'),
(8,'Tortuga'),
(9,'Iguana'),
(10,'Pato')
go



INSERT INTO Veterinario VALUES (1,'Roger Mario','Espinoza Sanchez','001-160989-1139F','Rogeresanchez@gmail.com',1,'Costado Oeste del Hotel Intercontinental Metrocentro, Managua','8875-9612','Activo');
INSERT INTO Veterinario VALUES (2,'Ernesto Aburto','Reinoza Reyes','001-100979-0015A','eareinoza@gmail.com',2,'Parque Sandino, 500 varas al Esta','8796-5236','Activo');
INSERT INTO Veterinario VALUES (3,'Javier Josue','Lopez Gomez','001-190670-1569O','jjlopezgomez@gmail.com',3,'De la Subasta 10 vrs al lago, frente a Café Soluble','892-1145','Activo');
INSERT INTO Veterinario VALUES (4,'Luis Horacio','Hernandez Martinez','001-221075-1599E','lhmartinez@gmail.com',4,'Entrada a reparto Cailagua, 20 varas al Sur','8826-0756','Activo');
INSERT INTO Veterinario VALUES (5,'Christian Josue','Bermudez Soza','001-190788-0235R','cjbermusoza@gmail.com',5,'Calle Principal de San Juan del Sur','8512-7825','Activo');
INSERT INTO Veterinario VALUES (6,'Roberto Ismael','Guzman Pereira','001-140395-1523H','rigpereira@gmail.com',6,'Barrio San Judas, Los Cocos, 3 cuadras arriba','8316-9852','Activo');
INSERT INTO Veterinario VALUES (7,'Francisco Samuel','Mairena Orozco','001-021089-1022A','fmairena12@gmail.com',7,'Contiguo a Escuela Salvador Mendieta','8867-9012','Activo');

INSERT INTO Credenciales VALUES (1,'Respinoza','Espinoza45$',1);
INSERT INTO Credenciales VALUES (2,'EREINOZA','Reinoza58$',1);
INSERT INTO Credenciales VALUES (3,'JLOPEZ','JJLopez12$',2);
INSERT INTO Credenciales VALUES (4,'HHERNANDEZ','Hernan23$',2);
INSERT INTO Credenciales VALUES (5,'Admin','Admin123',2);
INSERT INTO Credenciales VALUES (6,'RGUZMAN','Riguzman01$',2);
INSERT INTO Credenciales VALUES (7,'FMAIRENA','Moirena11$',2);


INSERT INTO Proveedor VALUES (1,'Mauricio Alfredo','Perez Guadamuz','2710-5892','8897-1596','Km. 6.5 Carretera Norte Edificio Impelsa','ventas@perezgdamuz.com.ni','2584F','PetShop','Activo');
INSERT INTO Proveedor VALUES (2,'Maria Alondra','Herrera Morales','2215-9025','8760-2215','Km. 7 Carretera Masaya','productos@herremor.com.ni','2547K','VetTodo','Inactivo');
INSERT INTO Proveedor VALUES (3,'Uriel Luiz','Martinez Campuzano','2512-9023','8412-2090','De la Rotonda de Bello Horizonte, 1.5 metros al sur.','ani4life@productos.com','2784F','VetLab','Activo');
INSERT INTO Proveedor VALUES (4,'Luis Ernesto','Cuadra Medina','2265-8512','8897-1569','Las Colinas 2da Entr 1c al E 1/2c al N, No.97','ultraveterina@gmail.com','3699F','VetNew','Activo');
INSERT INTO Proveedor VALUES (5,'Ana Luisa','Ortiz Mendieta','2285-1209','7804-1523','Km 11.4 Carretera Nueva a León','veteorr@gmail.com','2207A','VeteAll','Inactivo');
INSERT INTO Proveedor VALUES (6,'Marco Jose','Sanchez Lopez','2264-8912','8845-6921','Carretera Nueva a León Km 16 1/2, 200m al N','vetebetter@hotmail.com','4596E','BetterVet','Activo');
INSERT INTO Proveedor VALUES (7,'Ernesto Jose','Cuadra Gomez','2542-4979','8330-4786','Villa Revolución Rest El Madroño 2c al Oe 300vrs al N, No.7','helanim@gmail.com','2957P','AnimHelp','Activo');
INSERT INTO Proveedor VALUES (8,'Mauricio Miguel','Pineda Arauz','2266-8744','8869-4167','Bosques de Altamira Antiguo Cine 2c Al E, No.390','producpet@gmail.com','2880R','ProducAnim','Inactivo');
select * from Proveedor

INSERT INTO Cliente VALUES (1,'Alberto Martin','Fernandez Araica','2280-9621','8879-1522','almuerzofernandez@gmail.com','De donde fue la pepsi 5c al sur 1 1/2 al Oeste','Activo');
INSERT INTO Cliente VALUES (2,'Cristina Antonieta','Fernandez Suarez','2230-9711','8490-2021','cristinaperonista@gmail.com','De la rotonda el Gueguense 3 al Sur 2 al Este','Activo');
INSERT INTO Cliente VALUES (3,'Javier Horacio','Milei Lopez','2269-1522','8958-7215','javierantizurdos@gmail.com','Barrio Dimitrov 9c al Oeste 1 al Norte','Activo');
INSERT INTO Cliente VALUES (4,'Bartolome Agusto','Mitre Garcia','2240-1243','8985-3596','bartolomegarcia@gmail.com','De donde fue la pepsi 9c al este 1c al oeste','Inactivo');
INSERT INTO Cliente VALUES (5,'René Marco','Morales Gaitan','2520-1223','8960-3206','marcorm@gmail.com','De la mansión teodolinda 2c al norte','Activo');
INSERT INTO Cliente VALUES (6,'Yaritza Alejandra','Reyes pereira','2789-1522','8765-9212','misspereira@gmail.com','de la terminar de la 111 3 cuadras al sur 1 1/2 al este','Activo');
INSERT INTO Cliente VALUES (7,'Ernesto Alberto','Cuadra Moreno','2257-8569','8851-3695','elbertom@hotmail.com','De la rotonda el Gueguense 7 cuadras al norte','Activo');
INSERT INTO Cliente VALUES (8,'Mario Adrian','Narvaez Lopez','2269-1587','8769-2536','mnadlopez@hotmail.com','Plaza inter, 1 Cuadra al sur, 1 Cuadra al oeste','Activo');
INSERT INTO Cliente VALUES (9,'Juan Fernando','Ríos Acosta','2768-1296','8895-6312','jfracosta@mail.com','De los semaforos del zumen, 20 varas al sur','Activo');
INSERT INTO Cliente VALUES (10,'Fernando Adrian','Acosta Muñoz','2512-6895','8813-8969','facnos@gmail.com','Plaza inter, 1 Cuadra al sur, 1 Cuadra al oeste','Activo');
INSERT INTO Cliente VALUES (11,'Maria Alejandra','Lopez Gonzalez','2255-9878','8815-2396','mlgonzalez@hotmail.com','De la entrada de la UPOLI, 2 Andenes al sur','Inactivo');
INSERT INTO Cliente VALUES (12,'Marco Manuel','Ordoñez Ubieta','2267-1588','8890-7569','mmubieta@gmail.com','Cruz Roja Don Bosco 2c Al Lago 1/2c Arriba C-701, Colonia 10 de Junio','Activo');
INSERT INTO Cliente VALUES (13,'Alfredo Manuel','Bautista Mejía','2269-2435','8701-7070','ambejia@gmail.com','Comercial Pastora Rosales','Activo');
INSERT INTO Cliente VALUES (14,'Juan Miguel de Jesús','Soto Romero','2279-9122','8469-5560','jjromero@hotmail.com','Km. 8 C.norte, Semaf. Kativo 2 And. Norte 10 Vrs','Activo');
INSERT INTO Cliente VALUES (15,'José Antonio','Castro Sanchéz','2277-3194','8406-2662','jcsanchez@gmail.com','Las Colinas 2da Entr 1c al E 1/2c al N, No.97','Activo');
INSERT INTO Cliente VALUES (16,'Salvador Antonio','Garcia Morales','2768-0291','5222-8560','antonigarmo@hotmail.com','Porton Colegio B Zeledon 4c Sur, 2c Este','Activo');
INSERT INTO Cliente VALUES (17,'Miguel Ángel','Dávila Cruz','2244-8120','8811-7270','davicru99@gmail.com','Plaza Altamira, de La Vicky 1 1/2c Ab Fte A Iglesia Sn Agustín','Inactivo');
INSERT INTO Cliente VALUES (18,'Fredy Francisco','Peréz Hérnandez','2280-9620','8775-2200','fpfernande@gmail.com','Restaurante La Merselleise 1/2 C Al Sur','Activo');
INSERT INTO Cliente VALUES (19,'José Israel','Torrez Moreno','2732-2840','8575-5052','jitoreno@hotmail.com','Entr 9C Al S 30Vrs Al E','Activo');
INSERT INTO Cliente VALUES (20,'Roberto Antonio','Álvarez Chavéz','2266-8732','8775-4608','rachavez22@gmail.com','Barrio Enrrique Lorente, Rpto. Shikc Tercera','Activo');
INSERT INTO Cliente VALUES (21,'Víctor Hugo','Mendoza Muñoz','2572-2386','8788-8778','vugomendo00@gmail.com','Cine González 1C Al S','Activo');
INSERT INTO Cliente VALUES (22,'Gerardo Alonso','Díaz Romero','2289-1011','8659-2864','gadirom87@gmail.com','Km 9 Carretera Nueva A Leon, 1km Al Sur','Activo');
INSERT INTO Cliente VALUES (23,'Julio Eduardo','Salazar Rugama','2254-6280','8732-3456','julioesr@hotmail.com','Detrás de Shell Bo La Estación','Activo');
INSERT INTO Cliente VALUES (24,'Jesús Andrés','Fernandez Torrez','2255-0147','8732-2990','fernanjandres@hotmail.com','Carretera Nueva a León Km 16 1/2, 200m al N','Activo');
INSERT INTO Cliente VALUES (25,'Luisa Belén','Ortiz Contreras','2697-8727','8563-4675','lbortizcon@gmail.com','Contiguo A Colegio Filadelfia','Activo');
INSERT INTO Cliente VALUES (26,'Brunilda','Montes Caparras','2237-3806','8889-4475','useranormal@gmail.com','Vista Hermosa 2 Casa 38 Km 16 Ticuantepe','Inactivo');
INSERT INTO Cliente VALUES (27,'Andres','Figuerola Aznar','2237-6526','8794-7155','u.seranormal@gmail.com','Carretera a Masaya Km 7 Modulo C1-12 Centro Comercial Galerias Santo Domingo','Activo');
INSERT INTO Cliente VALUES (28,'Esteban','Gargallo Escriv?','2230-7059','8862-4290','us.eranormal@gmail.com','Reparto San Juan Contiguo a Tercer Ojo','Activo');
INSERT INTO Cliente VALUES (29,'Roberta','Manj?n Parejo','2257-8630','8882-3168','u.s.eranormal@gmail.com','Km 65 Carretera a Masachapa 1262','Activo');
INSERT INTO Cliente VALUES (30,'Carlito','de Pastor','2234-3493','8850-9327','use.ranormal@gmail.com','Club Terraza 300 metros al sur','Activo');
INSERT INTO Cliente VALUES (31,'Onofre','Carpio Garza','2241-1485','8832-1935','u.se.ranormal@gmail.com','Del Bavinic 2 cuadras y media al norte Mano derecha','Activo');
INSERT INTO Cliente VALUES (32,'Jovita','Lara Amiga','2262-4112','8795-5887','us.e.ranormal@gmail.com','Carretera Nueva a Leon Km 16,5 entrada matadero 150 metros al lago','Activo');
INSERT INTO Cliente VALUES (33,'Ligia','Vidal Gomez','2241-9182','8888-2989','u.s.e.ranormal@gmail.com','Reparto San Juan Casa 300 Del Hotel Brandts 50 metros al sur','Activo');
INSERT INTO Cliente VALUES (34,'Eusebio','Gomez Maza','2254-0990','8867-1597','user.anormal@gmail.com','Avenida de irdoba T- 3 Residencial Lomas del Valle','Activo');
INSERT INTO Cliente VALUES (35,'Horacio','Palomar-Quiroga','2250-8403','8876-9216','u.ser.anormal@gmail.com','Rotonda el Gueguense 1 cuadra abajo y 2 al norte Bosques de Bolonia','Inactivo');
INSERT INTO Cliente VALUES (36,'Severo','Mena Cobos','2252-0539','8850-6105','us.er.anormal@gmail.com','Km 14 Carretera a Masaya 8,5 Km al este Veracruz - Nindiri','Activo');
INSERT INTO Cliente VALUES (37,'Fortunato','Zaragoza-Guillen','2260-0679','8866-5847','u.s.er.anormal@gmail.com','Km 7,5 Carretera a Masaya entrada de la virgen y a mano izquierda 75 metros oeste','Activo');
INSERT INTO Cliente VALUES (38,'Loreto Laura','Fernandez Oller','2230-1505','8805-2409','use.r.anormal@gmail.com','Km 10 Carretera Nueva Leon','Activo');
INSERT INTO Cliente VALUES (39,'Charo Iris','Bejarano Sanchez','2246-9950','8822-5436','u.se.r.anormal@gmail.com','Calle Real 1 esquina opuesta al hotel la Gran Francia Jalteva','Activo');
INSERT INTO Cliente VALUES (40,'Olegario','Botella Toledo','2247-6795','8817-1426','us.e.r.anormal@gmail.com','Iglesia Los Mormones 1/2 cuadra arriba Reparto Las Palmas','Activo');
INSERT INTO Cliente VALUES (41,'Lola','Palomino Salazar','2263-9651','8852-8545','u.s.e.r.anormal@gmail.com','Calle Pamplona 130 Altamira D/Este','Activo');
INSERT INTO Cliente VALUES (42,'Gaspar','Llabras-Herves','2245-4264','8789-9712','usera.normal@gmail.com','Restaurante La Marsallaise 1/2 cuadra arriba Camara Oficial Española de Comercio','Activo');
INSERT INTO Cliente VALUES (43,'Josep','Villalba Huguet','2252-2010','8806-2851','u.sera.normal@gmail.com','Semaforo Club Terraza 3 cuadras abajo 1 cuadra al sur 1 cuadra abajo','Activo');
INSERT INTO Cliente VALUES (44,'Adan Jaime','Gomez Checa','2242-5948','8842-9142','us.era.normal@gmail.com','Villa Fontana','Inactivo');
INSERT INTO Cliente VALUES (45,'Candida','Llano Trujillo','2228-0753','8883-5604','u.s.era.normal@gmail.com','Condominio Los Soveche 1 Rotonda de Villa Fontana Norte','Activo');
INSERT INTO Cliente VALUES (46,'Maria Pilar','Echeverria-Delgado','2265-7489','8851-2833','use.ra.normal@gmail.com','Residencial El Carmen Casa 1917 1 cuadra abrajo y 3 cuadras al sur','Activo');
INSERT INTO Cliente VALUES (47,'Alvaro Simon','Chico Llabras','2256-5252','8784-0152','u.se.ra.normal@gmail.com','Carretera a Masaya Km 7 Galerias Santo Domingo','Activo');
INSERT INTO Cliente VALUES (48,'Placido','Bayen Peralta','2266-9762','8858-6105','us.e.ra.normal@gmail.com','Semaforos Enitel Villa Fontana 22 cuadras al este','Activo');
INSERT INTO Cliente VALUES (49,'Gracia','Estevez Lloret','2240-9871','8838-7667','u.s.e.ra.normal@gmail.com','Residencial Paseo de las Colinas 623','Activo');
INSERT INTO Cliente VALUES (50,'Herberto Vinicio','Solsona Giron','2232-4154','8877-0395','user.a.normal@gmail.com','Avenida Granada Edificio Mina Planta 2 Oficina 2','Inactivo');
INSERT INTO Cliente VALUES (51,'Dalila','Llabras Vega','2245-4009','8861-6265','u.ser.a.normal@gmail.com','Reparto las Palmas de la Iglesia Corazon de Mar?a 2 casas abajo Contiguo a Productos Maya','Activo');
INSERT INTO Cliente VALUES (52,'Yessica','Vigil Borja','2231-9155','8863-7246','us.er.a.normal@gmail.com','Serranias Km 13,5, Carretera al sur','Activo');
INSERT INTO Cliente VALUES (53,'Petrona Blanco','Barrera','2247-7000','8791-6755','u.s.er.a.normal@gmail.com','Carretera a Masaya km 5 Edificio Sacar 2 Piso 3 Del Edificio Delta 70 metros arriba','Activo');
INSERT INTO Cliente VALUES (54,'Socorro Rico','Ruiz','2247-4928','8828-5582','use.r.a.normal@gmail.com','Carretera Sur km 13 Villa Blanca','Inactivo');
INSERT INTO Cliente VALUES (55,'Rosario','Murillo Prat','2245-5515','8811-8292','u.se.r.a.normal@gmail.com','Hotel Seminole 2 cuadras al lago y 1 cuadra abajo','Activo');
INSERT INTO Cliente VALUES (56,'Cirino Yeñez','Murillo','2229-3191','8823-9063','us.e.r.a.normal@gmail.com','Rotonda Centroamerica 700 metros oeste','Inactivo');
INSERT INTO Cliente VALUES (57,'Mauricio','Catalon Valles','2257-6478','8862-1785','u.s.e.r.a.normal@gmail.com','Carretera a Masaya km 4,5','Activo');
INSERT INTO Cliente VALUES (58,'Ruperto Joe','Varela','2245-6270','8787-9615','useran.ormal@gmail.com','America 2 Anden 5 Casa E-54','Inactivo');
INSERT INTO Cliente VALUES (59,'Tamara Baez','Molins','2252-3832','8809-9014','u.seran.ormal@gmail.com','Carretera a Masaya Km 7','Activo');
INSERT INTO Cliente VALUES (60,'Ximena','Vallejos Benitez','2264-6380','8784-8351','us.eran.ormal@gmail.com','Plaza Inter, 1 cuadra al Sur, 1 cuadra al Oeste','Activo');
INSERT INTO Cliente VALUES (61,'Sebastian Miralles','Ortiz','2261-9434','8826-4828','u.s.eran.ormal@gmail.com','Del Paseo Naciones Unidas 2 cuadras al sur 1 al este','Activo');
INSERT INTO Cliente VALUES (62,'Consuelo Fernando','Urroz','2250-2879','8808-0655','use.ran.ormal@gmail.com','Reparto San Juan Casa 300 Del Hotel Brandts 50 metros al sur','Activo');
INSERT INTO Cliente VALUES (63,'Angelina Costa','Quevedo','2248-4430','8839-1339','u.se.ran.ormal@gmail.com','Avenida de Cordoba T- 3 Residencial Lomas del Valle','Activo');
INSERT INTO Cliente VALUES (64,'Candelario Vicente','Huertas','2262-7474','8875-1091','us.e.ran.ormal@gmail.com','Rotonda el Gueguense 1 cuadra abajo y 2 al norte Bosques de Bolonia','Inactivo');
INSERT INTO Cliente VALUES (65,'Eulalia Artigas','Belda','2229-7499','8835-7392','u.s.e.ran.ormal@gmail.com','Km 14 Carretera a Masaya 8,5 Km al este Veracruz - Nindir?','Activo');
INSERT INTO Cliente VALUES (66,'Lupe Santana','Cortez','2237-4771','8815-2538','user.an.ormal@gmail.com','Km 7,5 Carretera a Masaya entrada de la virgen y a mano izquierda 75 metros oeste','Activo');
INSERT INTO Cliente VALUES (67,'Borja','Gargallo','2228-8858','8841-8584','u.ser.an.ormal@gmail.com','Km 10 Carretera Nueva Leon','Activo');
INSERT INTO Cliente VALUES (68,'Ofelia Sanabria','Vallejo','2258-4623','8826-9477','us.er.an.ormal@gmail.com','Calle Real 1 esquina opuesta al hotel la Gran Francia Jalteva','Activo');
INSERT INTO Cliente VALUES (69,'Arsenio','Rivas Ayllon','2227-6412','8792-0327','u.s.er.an.ormal@gmail.com','Restaurante La Marsallaise 1/2 cuadra arriba Camara Oficial Española de Comercio','Inactivo');
INSERT INTO Cliente VALUES (70,'Ñurea Isern','Herreras','2251-5142','8829-9825','use.r.an.ormal@gmail.com','Semaforo Club Terraza 3 cuadras abajo 1 cuadra al sur 1 cuadra abajo','Activo');
INSERT INTO Cliente VALUES (71,'Prudencia','Martinez','2267-5137','8818-3850','u.se.r.an.ormal@gmail.com','Villa Fontana','Activo');
INSERT INTO Cliente VALUES (72,'Dimas Mateos','Pinilla','2263-4667','8870-0801','us.e.r.an.ormal@gmail.com','Condominio Los Soveche 1 Rotonda de Villa Fontana Norte','Activo');
INSERT INTO Cliente VALUES (73,'Onofre Gallart','Saldaña','2249-0656','8795-2445','u.s.e.r.an.ormal@gmail.com','Residencial El Carmen Casa 1917 1 cuadra abrajo y 3 cuadras al sur','Inactivo');
INSERT INTO Cliente VALUES (74,'Luciana Catal','Merino','2260-2228','8884-4124','usera.n.ormal@gmail.com','Carretera a Masaya Km 7 Galerias Santo Domingo','Activo');
INSERT INTO Cliente VALUES (75,'Reyes','Saenz','2247-1287','8834-1088','u.sera.n.ormal@gmail.com','Semaforos Enitel Villa Fontana 22 cuadras al este','Activo');
INSERT INTO Cliente VALUES (76,'Amanda Elizabeth','Morales Lopez','2225-8563','8815-0792','us.era.n.ormal@gmail.com','Reparto San Juan Contiguo a Tercer Ojo','Activo');
INSERT INTO Cliente VALUES (77,'Isaura','Castañeda','2250-6743','8824-3370','u.s.era.n.ormal@gmail.com','Km 65 Carretera a Masachapa 1262','Activo');
INSERT INTO Cliente VALUES (78,'Toño','Castillo Corral','2253-7485','8859-3443','use.ra.n.ormal@gmail.com','Club Terraza 300 metros al sur','Inactivo');
INSERT INTO Cliente VALUES (79,'Antonio','Herrera','2245-2518','8820-5677','u.se.ra.n.ormal@gmail.com','Del Bavinic 2 cuadras y media al norte Mano derecha','Activo');
INSERT INTO Cliente VALUES (80,'Eli Sandra','Melero Canton','2258-1756','8790-6990','us.e.ra.n.ormal@gmail.com','Carretera Nueva a Leon Km 16,5 entrada matadero 150 metros al lago','Inactivo');

go

INSERT INTO Mascota VALUES (1,3,'Paquito',2,'Pequines','LLeno de garrapatas',1,'Activo');
INSERT INTO Mascota VALUES (2,2,'Cristi',1,'Siames','Agresivo',2,'Activo');
INSERT INTO Mascota VALUES (3,1,'Macri',5,'Pitbull','Pelaje Descuidado',1,'Activo');
INSERT INTO Mascota VALUES (4,7,'Morise',4,'Loro','Plumas Descuidadas',3,'Inactivo');
INSERT INTO Mascota VALUES (5,8,'Flavio',2,'Cotorra','Pico Descuidado',3,'Activo');
INSERT INTO Mascota VALUES (6,9,'Toto',2,'Hamster Campbell','Ansioso',6,'Activo');
INSERT INTO Mascota VALUES (7,10,'Raulio',5,'Gran Danes','Sarna',1,'Activo');
INSERT INTO Mascota VALUES (8,12,'Bolita',2,'Gran Chincilla','Problema Auditivo',4,'Activo');
INSERT INTO Mascota VALUES (9,11,'Walter',4,'Bull Terrier','Inicios de PLL',1,'Activo');
INSERT INTO Mascota VALUES (10,15,'Micio',1,'Tonkinés','Nistagmo',2,'Activo');
INSERT INTO Mascota VALUES (11,18,'Max',3,'Golden Retriever','Obesidad',1,'Inactivo');
INSERT INTO Mascota VALUES (12,20,'Clyde',4,'Cotorra','Muda anomala',3,'Activo');
INSERT INTO Mascota VALUES (13,19,'Luna',2,'Ardilla Roja','Problemas Urinarios',7,'Activo');
INSERT INTO Mascota VALUES (14,13,'Aura',1,'Ardilla Gris','Ninguno',7,'Activo');
INSERT INTO Mascota VALUES (15,14,'Amber',3,'Boa','Ninguna',5,'Activo');
INSERT INTO Mascota VALUES (16,21,'Jerry',1,'Serpiente Chatilla','Muda de piel',5,'Activo');
INSERT INTO Mascota VALUES (17,22,'Rafa',7,'Tortuga Rusa','Ninguna',8,'Inactivo');
INSERT INTO Mascota VALUES (18,21,'Cookie',2,'Poodle','Agresivo',1,'Activo');
INSERT INTO Mascota VALUES (19,24,'Miru',3,'Persa','Perdida de pelaje',2,'Activo');
INSERT INTO Mascota VALUES (20,25,'Boris',2,'Siberiano','Ninguna',2,'Activo');
INSERT INTO Mascota VALUES (21,8,'Jerry',2,'Call Duck','Caminado raro',10,'Activo');
INSERT INTO Mascota VALUES (22,14,'Ron',2,'Iguana Verde','Cola lastimada',9,'Activo');
INSERT INTO Mascota VALUES (23,19,'Bunni',1,'Mini rex','Ninguna',4,'Activo');
INSERT INTO Mascota VALUES (24,16,'Conker',1,'Ardilla Roja','Ninguna',7,'Activo');
INSERT INTO Mascota VALUES (25,18,'Dino',5,'Tortuga Pintada','Ninguna',8,'Activo');
INSERT INTO Mascota VALUES (26,10,'Pipe',4,'Cacatua','Ninguna',3,'Inactivo');
INSERT INTO Mascota VALUES (27,23,'Thor',3,'Pastor Aleman','Ninguna',1,'Activo');
INSERT INTO Mascota VALUES (28,22,'Atlas',2,'Falsa Coral','Ninguna',5,'Activo');
INSERT INTO Mascota VALUES (29,2,'Ani',1,'Roborowski','Ninguna',6,'Activo');
INSERT INTO Mascota VALUES (30,4,'Dock',2,'Aylesbury','Ninguna',10,'Activo');
INSERT INTO Mascota VALUES (31,7,'Bruno',7,'Tortuga Rusa','Ninguna',8,'Activo');
INSERT INTO Mascota VALUES (32,9,'Simba',1,'Chihuahua','Ninguna',1,'Activo');
INSERT INTO Mascota VALUES (33,11,'Leo',2,'Pug','Ninguna',1,'Activo');
INSERT INTO Mascota VALUES (34,13,'Oreo',3,'Fold Escoces','Ninguna',2,'Activo');
INSERT INTO Mascota VALUES (35,2,'Sultan',3,'Boxer','Ninguna',1,'Inactivo');
INSERT INTO Mascota VALUES (36,1,'Bombro',2,'Orejas rojas','Ninguna',8,'Activo');
INSERT INTO Mascota VALUES (37,15,'Pixie',5,'Periquito','Ninguna',3,'Activo');
INSERT INTO Mascota VALUES (38,14,'Alfonso',4,'Cacatua','Ninguna',3,'Activo');
INSERT INTO Mascota VALUES (39,11,'Sammy',3,'American wirehair','Ninguna',2,'Activo');
INSERT INTO Mascota VALUES (40,1,'Jack',1,'Bulldog','Ninguna',1,'Activo');
INSERT INTO Mascota VALUES (41,3,'Brutus',8,'Caja de Florida','Ninguna',8,'Activo');
INSERT INTO Mascota VALUES (42,9,'Gomy',1,'Orpington Duck','Ninguna',10,'Activo');
INSERT INTO Mascota VALUES (43,7,'Alan',1,'Sciurini','Ninguna',7,'Activo');
INSERT INTO Mascota VALUES (44,25,'Hidra',2,'Pitón real','Ninguna',5,'Inactivo');
INSERT INTO Mascota VALUES (45,24,'Asmodeus',2,'Boa rosada','Ninguna',5,'Activo');
INSERT INTO Mascota VALUES (46,26,'Diana',1,'Cotorrilla de mejilla verde','Ninguna',3,'Activo');
INSERT INTO Mascota VALUES (47,27,'Samy',3,'Akita','Ninguna',1,'Activo');
INSERT INTO Mascota VALUES (48,28,'Ciri',1,'toy','Ninguna',4,'Activo');
INSERT INTO Mascota VALUES (49,29,'Peggy',2,'Hamster Campbell','Ninguna',6,'Activo');
INSERT INTO Mascota VALUES (50,30,'Kiwi',2,'Yaco','Ninguna',3,'Inactivo');
INSERT INTO Mascota VALUES (51,31,'Clara',4,'Hamster Sirio','Ninguna',6,'Activo');
INSERT INTO Mascota VALUES (52,32,'Hannah',2,'Akita americano','Ninguna',1,'Activo');
INSERT INTO Mascota VALUES (53,33,'Alice',5,'Eclectus','Ninguna',3,'Activo');
INSERT INTO Mascota VALUES (54,34,'Lucky',4,'Iguana verde','Ninguna',9,'Inactivo');
INSERT INTO Mascota VALUES (55,35,'Emma',4,'Bull terrier','Ninguna',1,'Activo');
INSERT INTO Mascota VALUES (56,36,'Catalina',2,'Mini lop','Ninguna',4,'Inactivo');
INSERT INTO Mascota VALUES (57,37,'Marley',1,'Boxer','Ninguna',1,'Activo');
INSERT INTO Mascota VALUES (58,38,'Grace',4,'Guacamayo Aliverde','Ninguna',3,'Inactivo');
INSERT INTO Mascota VALUES (59,39,'Sam',1,'Rex','Ninguna',4,'Activo');
INSERT INTO Mascota VALUES (60,40,'Billie',4,'Siames Tradicional','Ninguna',2,'Activo');
INSERT INTO Mascota VALUES (61,41,'Prada',2,'Periquito','Ninguna',3,'Activo');
INSERT INTO Mascota VALUES (62,42,'June',2,'American Short hair','Ninguna',2,'Activo');
INSERT INTO Mascota VALUES (63,43,'Berta',1,'cotorra de Kramer','Ninguna',3,'Activo');
INSERT INTO Mascota VALUES (64,44,'Mulan',2,'Bulldog franc?s','Ninguna',1,'Inactivo');
INSERT INTO Mascota VALUES (65,45,'Valentina',1,'Agapornis','Ninguna',3,'Activo');
INSERT INTO Mascota VALUES (66,46,'Penny',1,'crestada de Fiyi','Ninguna',9,'Activo');
INSERT INTO Mascota VALUES (67,47,'Baby',1,'Galgo Español','Ninguna',1,'Activo');
INSERT INTO Mascota VALUES (68,48,'Lukas',1,'Iguana verde','Ninguna',9,'Activo');
INSERT INTO Mascota VALUES (69,49,'Jarvis',4,'Poodle','Ninguna',1,'Inactivo');
INSERT INTO Mascota VALUES (70,50,'Luna',4,'Cotorrita celestial','Ninguna',3,'Activo');
INSERT INTO Mascota VALUES (71,51,'Mike',4,'Ninfa','Ninguna',3,'Activo');
INSERT INTO Mascota VALUES (72,52,'Alex',1,'Chihuahua','Ninguna',1,'Activo');
INSERT INTO Mascota VALUES (73,53,'Ozzy',3,'Chihuahua','Ninguna',1,'Inactivo');
INSERT INTO Mascota VALUES (74,54,'Morty',3,'Jarretera','Ninguna',9,'Activo');
INSERT INTO Mascota VALUES (75,55,'Benny',4,'Kakarikis','Ninguna',3,'Activo');
INSERT INTO Mascota VALUES (76,56,'Poppy',1,'Cocker Spaniel Americano','Ninguna',1,'Activo');
INSERT INTO Mascota VALUES (77,57,'Lilo',3,'Piton de la India','Ninguna',9,'Activo');
INSERT INTO Mascota VALUES (78,58,'Billy',2,'Cumberland','Ninguna',1,'Inactivo');
INSERT INTO Mascota VALUES (79,59,'Lupo',3,'Dalmata','Ninguna',1,'Activo');
INSERT INTO Mascota VALUES (80,60,'Vincent',3,'Serpiente de leche','Ninguna',9,'Inactivo');
INSERT INTO Mascota VALUES (81,61,'Prince',3,'Serpiente de maiz','Ninguna',9,'Activo');
INSERT INTO Mascota VALUES (82,62,'Joe',1,'Pato Pekin','Ninguna',10,'Activo');
INSERT INTO Mascota VALUES (83,63,'Kira',2,'Cacatua','Ninguna',3,'Inactivo');
INSERT INTO Mascota VALUES (84,64,'Pablo',3,'mapa','Ninguna',8,'Activo');
INSERT INTO Mascota VALUES (85,65,'Ace',4,'Munchkin','Ninguna',2,'Inactivo');
INSERT INTO Mascota VALUES (86,66,'Hugo',4,'Guacamayo','Ninguna',3,'Activo');
INSERT INTO Mascota VALUES (87,67,'Peanut',1,'Bombay','Ninguna',2,'Activo');
INSERT INTO Mascota VALUES (88,68,'Alf',4,'Pato mudo','Ninguna',10,'Inactivo');
INSERT INTO Mascota VALUES (89,69,'Herbie',1,'Somali','Ninguna',2,'Activo');
INSERT INTO Mascota VALUES (90,70,'Dash',4,'del bosque','Ninguna',8,'Inactivo');
INSERT INTO Mascota VALUES (91,71,'Patrick',3,'Curl americano','Ninguna',2,'Activo');
INSERT INTO Mascota VALUES (92,72,'Johnny',2,'Pato Real','Ninguna',10,'Activo');
INSERT INTO Mascota VALUES (93,73,'Aussie',4,'de caja comun','Ninguna',8,'Inactivo');
INSERT INTO Mascota VALUES (94,74,'Diego',3,'Cymric','Ninguna',2,'Activo');
INSERT INTO Mascota VALUES (95,75,'Jasper',4,'Aylesbury','Ninguna',10,'Inactivo');
INSERT INTO Mascota VALUES (96,76,'Guss',2,'Bobtail Americano','Ninguna',2,'Activo');
INSERT INTO Mascota VALUES (97,77,'Quicksilver',1,'Tortuga rusa','Ninguna',8,'Activo');
INSERT INTO Mascota VALUES (98,78,'Sparrow',1,'gran danes','Ninguna',1,'Inactivo');
INSERT INTO Mascota VALUES (99,79,'Raven',2,'Cotorra del sol','Ninguna',3,'Activo');
INSERT INTO Mascota VALUES (100,80,'Lexi',3,'Tortuga pintada','Ninguna',8,'Inactivo');

ALTER TABLE Consulta ALTER COLUMN Hora varchar(20) NULL
/*aqui falta la hora en string ejemplo 12:30 AM*/
INSERT INTO Consulta VALUES (1,2,'2022-07-01','Resfriado','Moquillo Felino',1,'Pendiente',NULL);
INSERT INTO Consulta VALUES (2,3,'2022-05-10','Picazon y manchas en la piel','Sarna',1,'Completado',NULL);
INSERT INTO Consulta VALUES (3,1,'2022-05-10','Comezon','Garrapatas',2,'Completado',NULL);
INSERT INTO Consulta VALUES (4,1,'2021-02-12','Resfriado','Moquillo',1,'Completado',NULL);
INSERT INTO Consulta VALUES (5,2,'2020-02-12','vomitos','Problema Digestivo',1,'Completado',NULL);
INSERT INTO Consulta VALUES (6,1,'2020-08-01','vomitos','Problema Digestivo',2,'Completado',NULL);
INSERT INTO Consulta VALUES (7,6,'2022-06-15','Revision Mensual',NULL,1,'Pendiente',NULL);
INSERT INTO Consulta VALUES (8,7,'2022-06-15','Revision Mensual',NULL,3,'Pendiente',NULL);
INSERT INTO Consulta VALUES (9,10,'2021-11-19','Mov Rap en ojos','Nistagmo',2,'Completado',NULL);
INSERT INTO Consulta VALUES (10,13,'2022-01-22','Le cuesta orinar','Problemas Urinarios',6,'Completado',NULL);
INSERT INTO Consulta VALUES (11,12,'2022-05-19','se arranca las plumas','Muda anomala',3,'Ausente',NULL);
INSERT INTO Consulta VALUES (12,14,'2021-06-19','Revision mensual','Todo en orden',7,'Completado',NULL);
INSERT INTO Consulta VALUES (13,9,'2022-04-21','Revision ocular','Sin avances de PLL',1,'Completado',NULL);
INSERT INTO Consulta VALUES (14,12,'2022-04-26','Se arranca las plumas','Muda anomala',3,'Completado',NULL);
INSERT INTO Consulta VALUES (15,40,'2021-01-25','Revision mensual','Todo en orden',7,'Completado',NULL);
INSERT INTO Consulta VALUES (16,83,'2021-02-17','Revision mensual','Todo en orden',7,'Ausente',NULL);
INSERT INTO Consulta VALUES (17,76,'2021-02-24','Revision mensual','Todo en orden',6,'Ausente',NULL);
INSERT INTO Consulta VALUES (18,9,'2021-03-02','Revision mensual','Todo en orden',3,'Ausente',NULL);
INSERT INTO Consulta VALUES (19,43,'2021-03-04','Revision mensual','Todo en orden',3,'Ausente',NULL);
INSERT INTO Consulta VALUES (20,74,'2021-03-18','Revision mensual','Todo en orden',4,'Ausente',NULL);
INSERT INTO Consulta VALUES (21,46,'2021-03-23','Revision mensual','Todo en orden',5,'Ausente',NULL);
INSERT INTO Consulta VALUES (22,61,'2021-03-30','Revision mensual','Todo en orden',5,'Completado',NULL);
INSERT INTO Consulta VALUES (23,57,'2021-04-08','Revision mensual','Todo en orden',5,'Completado',NULL);
INSERT INTO Consulta VALUES (24,90,'2021-04-18','Revision mensual','Todo en orden',1,'Completado',NULL);
INSERT INTO Consulta VALUES (25,91,'2021-04-20','Revision mensual','Todo en orden',1,'Completado',NULL);
INSERT INTO Consulta VALUES (26,97,'2021-05-05','Revision mensual','Todo en orden',3,'Completado',NULL);
INSERT INTO Consulta VALUES (27,92,'2021-05-12','Revision mensual','Todo en orden',2,'Completado',NULL);
INSERT INTO Consulta VALUES (28,61,'2021-05-30','Revision mensual','Todo en orden',7,'Completado',NULL);
INSERT INTO Consulta VALUES (29,4,'2021-06-14','Revision mensual','Todo en orden',7,'Completado',NULL);
INSERT INTO Consulta VALUES (30,23,'2021-06-16','Revision mensual','Todo en orden',6,'Completado',NULL);
INSERT INTO Consulta VALUES (31,15,'2021-06-18','Revision mensual','Todo en orden',2,'Completado',NULL);
INSERT INTO Consulta VALUES (32,74,'2021-06-20','Revision mensual','Todo en orden',7,'Completado',NULL);
INSERT INTO Consulta VALUES (33,12,'2021-06-28','Revision mensual','Todo en orden',2,'Completado',NULL);
INSERT INTO Consulta VALUES (34,98,'2021-08-05','Revision mensual','Todo en orden',5,'Ausente',NULL);
INSERT INTO Consulta VALUES (35,58,'2021-08-11','Revision mensual','Todo en orden',3,'Completado',NULL);
INSERT INTO Consulta VALUES (36,100,'2021-08-13','Revision mensual','Todo en orden',5,'Ausente',NULL);
INSERT INTO Consulta VALUES (37,93,'2021-08-26','Revision mensual','Todo en orden',4,'Ausente',NULL);
INSERT INTO Consulta VALUES (38,62,'2021-09-30','Revision mensual','Todo en orden',4,'Ausente',NULL);
INSERT INTO Consulta VALUES (39,1,'2021-10-06','Revision mensual','Todo en orden',7,'Ausente',NULL);
INSERT INTO Consulta VALUES (40,82,'2021-10-07','Revision mensual','Todo en orden',6,'Completado',NULL);
INSERT INTO Consulta VALUES (41,12,'2021-10-17','Revision mensual','Todo en orden',1,'Completado',NULL);
INSERT INTO Consulta VALUES (42,3,'2021-10-27','Revision mensual','Todo en orden',3,'Completado',NULL);
INSERT INTO Consulta VALUES (43,80,'2021-11-28','Revision mensual','Todo en orden',6,'Completado',NULL);
INSERT INTO Consulta VALUES (44,47,'2021-12-11','Revision mensual','Todo en orden',7,'Completado',NULL);
INSERT INTO Consulta VALUES (45,15,'2021-12-24','Revision mensual','Todo en orden',1,'Ausente',NULL);
INSERT INTO Consulta VALUES (46,86,'2022-01-06','Revision mensual','Todo en orden',2,'Ausente',NULL);
INSERT INTO Consulta VALUES (47,99,'2022-01-09','Revision mensual','Todo en orden',2,'Ausente',NULL);
INSERT INTO Consulta VALUES (48,29,'2022-01-18','Revision mensual','Todo en orden',7,'Ausente',NULL);
INSERT INTO Consulta VALUES (49,23,'2022-01-18','Revision mensual','Todo en orden',2,'Ausente',NULL);
INSERT INTO Consulta VALUES (50,45,'2022-01-20','Revision mensual','Todo en orden',1,'Completado',NULL);
INSERT INTO Consulta VALUES (51,10,'2022-02-04','Revision mensual','Todo en orden',4,'Completado',NULL);
INSERT INTO Consulta VALUES (52,39,'2022-02-09','Revision mensual','Todo en orden',7,'Completado',NULL);
INSERT INTO Consulta VALUES (53,91,'2022-02-19','Revision mensual','Todo en orden',7,'Ausente',NULL);
INSERT INTO Consulta VALUES (54,6,'2022-03-18','Revision mensual','Todo en orden',6,'Ausente',NULL);
INSERT INTO Consulta VALUES (55,94,'2022-03-18','Revision mensual','Todo en orden',3,'Ausente',NULL);
INSERT INTO Consulta VALUES (56,18,'2022-03-25','Revision mensual','Todo en orden',6,'Ausente',NULL);
INSERT INTO Consulta VALUES (57,71,'2022-03-31','Revision mensual','Todo en orden',5,'Completado',NULL);
INSERT INTO Consulta VALUES (58,67,'2022-03-31','Revision mensual','Todo en orden',7,'Completado',NULL);
INSERT INTO Consulta VALUES (59,69,'2022-04-02','Revision mensual','Todo en orden',6,'Completado',NULL);
INSERT INTO Consulta VALUES (60,56,'2022-04-07','Revision mensual','Todo en orden',2,'Completado',NULL);
INSERT INTO Consulta VALUES (61,97,'2022-04-12','Revision mensual','Todo en orden',7,'Completado',NULL);
INSERT INTO Consulta VALUES (62,74,'2022-05-01','Revision mensual','Todo en orden',6,'Completado',NULL);
INSERT INTO Consulta VALUES (63,41,'2022-05-18','Revision mensual','Todo en orden',7,'Ausente',NULL);
INSERT INTO Consulta VALUES (64,54,'2022-05-26','Revision mensual','Todo en orden',1,'Ausente',NULL);
INSERT INTO Consulta VALUES (65,15,'2022-06-11','Revision mensual','Todo en orden',7,'Ausente',NULL);
INSERT INTO Consulta VALUES (66,87,'2022-06-17','Revision mensual','Todo en orden',7,'Pendiente',NULL);

/*malo*/

INSERT INTO Producto VALUES (1,'Shampoo para el pelaje canino','200',100,95,1,'Activo');
INSERT INTO Producto VALUES (2,'Bozal','100',150,20,3,'Activo');
INSERT INTO Producto VALUES (3,'Desparasitante','100',150,93,3,'Activo');
INSERT INTO Producto VALUES (4,'paja','150',200,100,2,'Activo');
INSERT INTO Producto VALUES (5,'Comida de gato cachorro','30',45,0,1,'Inactivo');
INSERT INTO Producto VALUES (6,'Comida de perro adulto','15',25,0,3,'Inactivo');
INSERT INTO Producto VALUES (7,'Comida de gato adult','25',37,0,1,'Inactivo');
INSERT INTO Producto VALUES (8,'Comida de perro cachorro','24',39,0,2,'Inactivo');
INSERT INTO Producto VALUES (9,'Semillas de girasol','40',60,0,1,'Inactivo');
INSERT INTO Producto VALUES (10,'Jaula de pajaro','150',250,0,1,'Inactivo');
INSERT INTO Producto VALUES (11,'Comida de hamster','40',55,6,1,'Activo');
INSERT INTO Producto VALUES (12,'Frutos secos','90',140,15,2,'Activo');
INSERT INTO Producto VALUES (13,'Omega Tabs','300',500,10,3,'Activo');
INSERT INTO Producto VALUES (14,'Vitamina B12','200',300,20,5,'Activo');
INSERT INTO Producto VALUES (15,'Esponjas','60',120,10,1,'Activo');
INSERT INTO Producto VALUES (16,'Hueso para Perros','20',60,30,6,'Activo');
INSERT INTO Producto VALUES (17,'Pelota para Perros','25',70,10,4,'Activo');
INSERT INTO Producto VALUES (18,'Vacuna contra la rabia','90',150,10,2,'Activo');
INSERT INTO Producto VALUES (19,'Vacuna contra Garrapatas','100',200,15,5,'Activo');
INSERT INTO Producto VALUES (20,'Antinflamatorio','80',130,20,7,'Activo');
INSERT INTO Producto VALUES (21,'Antibiotico','90',150,20,1,'Activo');
INSERT INTO Producto VALUES (22,'Peines','15',50,10,3,'Activo');
INSERT INTO Producto VALUES (23,'Jabon de baño','95',190,10,2,'Activo');
INSERT INTO Producto VALUES (24,'Cojin para perro','150',280,8,6,'Activo');
INSERT INTO Producto VALUES (25,'Arenero Cubierto','790',1020,3,1,'Inactivo');
INSERT INTO Producto VALUES (26,'Arena de gato','200',260,5,2,'Activo');
INSERT INTO Producto VALUES (27,'Pala para Lecho','60',110,7,3,'Activo');
INSERT INTO Producto VALUES (28,'Spray para Jaulas','170',210,8,3,'Activo');
INSERT INTO Producto VALUES (29,'Rueda giratoria Plast','80',130,5,7,'Activo');
INSERT INTO Producto VALUES (30,'Bola para hamster','70',100,5,2,'Activo');
INSERT INTO Producto VALUES (31,'NET PARA ACUARIO','88,23529412',150,38,7,'Activo');
INSERT INTO Producto VALUES (32,'PLANTA ORNAMENTAL','67,05882353',114,23,6,'Activo');
INSERT INTO Producto VALUES (33,'TORTUGUERA PLASTICA PEQUEÑA','151,1764706',257,36,2,'Activo');
INSERT INTO Producto VALUES (34,'TORTUGUERA PLASTICA MEDIANA','170,5882353',290,13,8,'Activo');
INSERT INTO Producto VALUES (35,'BEBEDERO CON SUJETADOR','176,4705882',300,18,8,'Activo');
INSERT INTO Producto VALUES (36,'BEBEDERO METALICO','197,6470588',336,28,4,'Activo');
INSERT INTO Producto VALUES (37,'COLLAR CON CASCABEL','105,2941176',179,11,1,'Activo');
INSERT INTO Producto VALUES (38,'COLLAR CON APLIQUES Y CASCABEL','75,88235294',129,35,8,'Inactivo');
INSERT INTO Producto VALUES (39,'COLLAR CON LAZO Y CASCABEL','108,2352941',184,25,6,'Activo');
INSERT INTO Producto VALUES (40,'COLLAR CON PERLAS','150,5882353',256,28,3,'Activo');
INSERT INTO Producto VALUES (41,'COLLAR CON PLUMAS Y CASCABEL','81,17647059',138,21,2,'Activo');
INSERT INTO Producto VALUES (42,'COLLAR CON PUAS','109,4117647',186,40,4,'Activo');
INSERT INTO Producto VALUES (43,'JUGUETE CON FORMA DE CANGREJO','30',51,40,5,'Activo');
INSERT INTO Producto VALUES (44,'JUGUETE CON FORMA CABALLO DE MAR','45,29411765',77,26,1,'Inactivo');
INSERT INTO Producto VALUES (45,'CEPILLO DOBLE M/MADERA','69,41176471',118,19,7,'Activo');
INSERT INTO Producto VALUES (46,'CEPILLO DOBLE M/CAUCHO','108,2352941',184,12,7,'Activo');
INSERT INTO Producto VALUES (47,'CEPILLO DOBLE M/PLASTICO','58,82352941',100,33,5,'Activo');
INSERT INTO Producto VALUES (48,'CEPILLO SIMPLE','62,35294118',106,18,7,'Activo');
INSERT INTO Producto VALUES (49,'CEPILLO C/BOTON QUITA PELO','145,8823529',248,20,5,'Activo');
INSERT INTO Producto VALUES (50,'PEINE DE ACERO M/CAUCHO','135,8823529',231,33,2,'Activo');
INSERT INTO Producto VALUES (51,'PEINE DE ACERO M/PLASTICO','117,6470588',200,31,8,'Activo');
INSERT INTO Producto VALUES (52,'PEINE DESMONTADOR DE ACERO','147,0588235',250,21,8,'Activo');
INSERT INTO Producto VALUES (53,'PEINE DOBLE DE ACERO','158,8235294',270,16,5,'Inactivo');
INSERT INTO Producto VALUES (54,'RODILLO QUITA PELUSA','65,88235294',112,39,4,'Activo');
INSERT INTO Producto VALUES (55,'REPUESTO PARA RODILLO QUITA PELUSA','86,47058824',147,27,4,'Activo');
INSERT INTO Producto VALUES (56,'KIT DE LIMPIEZA 4 PCS','205,8823529',350,17,8,'Activo');
INSERT INTO Producto VALUES (57,'CORTAUÑA TIPO ALICATE','149,4117647',254,14,5,'Activo');
INSERT INTO Producto VALUES (58,'CORTAUÑA DE ACERO','70,58823529',120,29,3,'Inactivo');
INSERT INTO Producto VALUES (59,'CORTAUÑA TIPO TIJERA','88,23529412',150,29,6,'Activo');
INSERT INTO Producto VALUES (60,'CEPILLO DE DIENTE DOBLE','95,88235294',163,28,4,'Activo');
INSERT INTO Producto VALUES (61,'PLATO DOBLE PARA PERROS','117,6470588',200,25,3,'Activo');
INSERT INTO Producto VALUES (62,'PLATO CARA DE GATITO','94,11764706',160,11,2,'Inactivo');
INSERT INTO Producto VALUES (63,'PLATO CARA DE CERDITO','88,23529412',150,31,6,'Activo');
INSERT INTO Producto VALUES (64,'PLATO CON BASE ANTIDESLIZANTE','118,8235294',202,35,8,'Activo');
INSERT INTO Producto VALUES (65,'PLATO INTERACTIVO','105,8823529',180,11,4,'Activo');
INSERT INTO Producto VALUES (66,'ESTANTE PARA PLATO','129,4117647',220,28,3,'Activo');
INSERT INTO Producto VALUES (67,'COMEDERO Y BEBEDERO','176,4705882',300,17,4,'Activo');
INSERT INTO Producto VALUES (68,'FRISBEE D/CARA DE PERRO','52,94117647',90,28,3,'Inactivo');
INSERT INTO Producto VALUES (69,'HUESO MASTICABLE','52,94117647',90,15,4,'Activo');
INSERT INTO Producto VALUES (70,'HUESITOS ALTO RELIEVE','64,70588235',110,35,4,'Activo');
INSERT INTO Producto VALUES (71,'JUGUETE DISEÑO HAMBURGUESA','70,58823529',120,20,7,'Inactivo');
INSERT INTO Producto VALUES (72,'JUGUETE DISEÑO HOT DOG','70,58823529',120,39,7,'Activo');
INSERT INTO Producto VALUES (73,'JUGUETE DISEÑO PIERNA DE POLLO','70,58823529',120,21,4,'Activo');
INSERT INTO Producto VALUES (74,'JUGUETE DISEÑO DE PELOTA C/CASCABEL','64,70588235',110,25,7,'Activo');
INSERT INTO Producto VALUES (75,'JUGUETE DISEÑO DE PELOTA CON PUPOS','64,70588235',110,12,3,'Activo');
INSERT INTO Producto VALUES (76,'JUGUETE DISEÑO DE ARO','52,94117647',90,15,5,'Activo');
INSERT INTO Producto VALUES (77,'JUGUETE DISEÑO DE BARRITA','50',85,30,7,'Activo');
INSERT INTO Producto VALUES (78,'JUGUETE DISEÑO PELOTA DE FÚTBOL','35,29411765',60,22,6,'Activo');
INSERT INTO Producto VALUES (79,'JUGUETE DISEÑO PELOTA CON RELIEVE','47,05882353',80,33,7,'Activo');
INSERT INTO Producto VALUES (80,'COLLAR DE CUERO SINTÉTICO','76,47058824',130,22,8,'Activo');
INSERT INTO Producto VALUES (81,'COLLAR CON MOSQUETON','82,35294118',140,21,6,'Activo');
INSERT INTO Producto VALUES (82,'COLLAR ISABELINO PLASTICO','108,2352941',184,10,7,'Activo');
INSERT INTO Producto VALUES (83,'ARNES PARA PERROS PEQUEÑOS','100',170,40,6,'Activo');
INSERT INTO Producto VALUES (84,'ARNES PARA PERROS MEDIANOS','117,6470588',200,11,6,'Activo');
INSERT INTO Producto VALUES (85,'ARNES PARA PERROS GRANDES','141,1764706',240,21,8,'Activo');
INSERT INTO Producto VALUES (86,'PECHERO PARA PERRO MACHO','94,11764706',160,15,2,'Activo');
INSERT INTO Producto VALUES (87,'PECHERO PARA PERRO HEMBRA','94,11764706',160,29,4,'Activo');
INSERT INTO Producto VALUES (88,'CORREA DE POLIESTER','53,52941176',91,28,3,'Activo');
INSERT INTO Producto VALUES (89,'CORREA CON BROCHE','52,94117647',90,40,1,'Activo');
INSERT INTO Producto VALUES (90,'CORREA CON COLLAR','70,58823529',120,26,7,'Activo');
INSERT INTO Producto VALUES (91,'CORREA TIPO CUERDA','58,82352941',100,20,7,'Activo');
INSERT INTO Producto VALUES (92,'CORREA REFLECTIVA','88,23529412',150,34,8,'Inactivo');
INSERT INTO Producto VALUES (93,'CORREA REFLECTIVA TIPO CUERDA','94,11764706',160,21,1,'Activo');
INSERT INTO Producto VALUES (94,'JAULA DE METAL CON BASE PLASTICA','167,6470588',285,30,5,'Activo');
INSERT INTO Producto VALUES (95,'JAULA DE METAL CON BASE Y RUEDAS','261,7647059',445,10,3,'Inactivo');
INSERT INTO Producto VALUES (96,'JAULA DE METAL CON BANDEJA','188,2352941',320,19,8,'Inactivo');
INSERT INTO Producto VALUES (97,'JAULA PLASTICA','129,4117647',220,16,1,'Activo');
INSERT INTO Producto VALUES (98,'JAULA PLASTICA CON REJILLA METALICA','141,1764706',240,10,3,'Inactivo');
INSERT INTO Producto VALUES (99,'BOLSO TRANSPORTADOR TALLA: L','123,5294118',210,16,7,'Inactivo');
INSERT INTO Producto VALUES (100,'BOLSO TRANSPORTADOR TALLA: M','105,8823529',180,11,6,'Activo');

/*aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa*/
INSERT INTO Ventas VALUES (1,2,'2022-08-01',111);
INSERT INTO Ventas VALUES (2,1,'2021-11-06',370);
INSERT INTO Ventas VALUES (3,1,'2021-11-06',50);
INSERT INTO Ventas VALUES (4,3,'2022-03-06',200);
INSERT INTO Ventas VALUES (5,3,'2020-10-16',120);
INSERT INTO Ventas VALUES (6,3,'2020-10-16',350);
INSERT INTO Ventas VALUES (7,1,'2021-11-22',75);
INSERT INTO Ventas VALUES (8,2,'2022-01-10',180);
INSERT INTO Ventas VALUES (9,1,'2021-11-10',250);
INSERT INTO Ventas VALUES (10,5,'2021-01-08',456);
INSERT INTO Ventas VALUES (11,12,'2021-01-23',129);
INSERT INTO Ventas VALUES (12,10,'2021-02-05',692);
INSERT INTO Ventas VALUES (13,7,'2021-02-07',77);
INSERT INTO Ventas VALUES (14,9,'2021-02-21',284);
INSERT INTO Ventas VALUES (15,14,'2021-03-26',555);
INSERT INTO Ventas VALUES (16,18,'2021-04-11',1024);
INSERT INTO Ventas VALUES (17,21,'2021-05-15',748);
INSERT INTO Ventas VALUES (18,22,'2021-05-18',270);
INSERT INTO Ventas VALUES (19,25,'2021-05-27',258);
INSERT INTO Ventas VALUES (20,25,'2021-05-28',150);
INSERT INTO Ventas VALUES (21,20,'2021-06-11',212);
INSERT INTO Ventas VALUES (22,17,'2021-06-13',741);
INSERT INTO Ventas VALUES (23,16,'2021-08-07',408);
INSERT INTO Ventas VALUES (24,15,'2021-08-14',830);
INSERT INTO Ventas VALUES (25,1,'2021-08-31',508);
INSERT INTO Ventas VALUES (26,13,'2021-09-07',1280);
INSERT INTO Ventas VALUES (27,2,'2021-09-13',628);
INSERT INTO Ventas VALUES (28,4,'2021-10-10',912);
INSERT INTO Ventas VALUES (29,11,'2021-10-21',1100);
INSERT INTO Ventas VALUES (30,23,'2021-11-10',532);
INSERT INTO Ventas VALUES (31,8,'2021-11-18',1495);
INSERT INTO Ventas VALUES (32,7,'2021-11-20',465);
INSERT INTO Ventas VALUES (33,9,'2021-12-03',992);
INSERT INTO Ventas VALUES (34,13,'2021-12-17',1168);
INSERT INTO Ventas VALUES (35,15,'2021-12-25',608);
INSERT INTO Ventas VALUES (36,22,'2021-12-29',558);
INSERT INTO Ventas VALUES (37,25,'2022-01-06',204);
INSERT INTO Ventas VALUES (38,24,'2022-01-09',300);
INSERT INTO Ventas VALUES (39,20,'2022-01-20',308);
INSERT INTO Ventas VALUES (40,13,'2022-02-21',193);
INSERT INTO Ventas VALUES (41,12,'2022-03-04',590);
INSERT INTO Ventas VALUES (42,11,'2022-03-10',532);
INSERT INTO Ventas VALUES (43,14,'2022-03-20',405);
INSERT INTO Ventas VALUES (44,18,'2022-03-26',895);
INSERT INTO Ventas VALUES (45,19,'2022-04-01',550);
INSERT INTO Ventas VALUES (46,17,'2022-04-11',129);
INSERT INTO Ventas VALUES (47,12,'2022-04-27',1300);
INSERT INTO Ventas VALUES (48,5,'2022-05-19',245);
INSERT INTO Ventas VALUES (49,3,'2022-05-24',220);
INSERT INTO Ventas VALUES (50,1,'2022-06-04',777);
INSERT INTO Ventas VALUES (51,57,'2021-01-01',456);
INSERT INTO Ventas VALUES (52,71,'2021-01-02',129);
INSERT INTO Ventas VALUES (53,53,'2021-01-06',692);
INSERT INTO Ventas VALUES (54,16,'2021-01-10',77);
INSERT INTO Ventas VALUES (55,76,'2021-01-13',284);
INSERT INTO Ventas VALUES (56,14,'2021-01-16',555);
INSERT INTO Ventas VALUES (57,69,'2021-01-25',1024);
INSERT INTO Ventas VALUES (58,21,'2021-02-03',748);
INSERT INTO Ventas VALUES (59,61,'2021-02-12',270);
INSERT INTO Ventas VALUES (60,75,'2021-02-18',258);
INSERT INTO Ventas VALUES (61,17,'2021-02-21',150);
INSERT INTO Ventas VALUES (62,36,'2021-03-03',212);
INSERT INTO Ventas VALUES (63,51,'2021-03-06',741);
INSERT INTO Ventas VALUES (64,76,'2021-03-16',408);
INSERT INTO Ventas VALUES (65,24,'2021-03-18',830);
INSERT INTO Ventas VALUES (66,6,'2021-03-22',508);
INSERT INTO Ventas VALUES (67,74,'2021-03-22',1280);
INSERT INTO Ventas VALUES (68,75,'2021-03-29',628);
INSERT INTO Ventas VALUES (69,45,'2021-04-02',912);
INSERT INTO Ventas VALUES (70,35,'2021-04-09',1100);
INSERT INTO Ventas VALUES (71,65,'2021-04-29',532);
INSERT INTO Ventas VALUES (72,28,'2021-05-01',1495);
INSERT INTO Ventas VALUES (73,35,'2021-05-09',465);
INSERT INTO Ventas VALUES (74,63,'2021-05-14',992);
INSERT INTO Ventas VALUES (75,11,'2021-05-20',1168);
INSERT INTO Ventas VALUES (76,42,'2021-05-29',608);
INSERT INTO Ventas VALUES (77,53,'2021-06-02',558);
INSERT INTO Ventas VALUES (78,71,'2021-06-03',204);
INSERT INTO Ventas VALUES (79,44,'2021-06-14',300);
INSERT INTO Ventas VALUES (80,18,'2021-06-14',308);
INSERT INTO Ventas VALUES (81,17,'2021-06-15',193);
INSERT INTO Ventas VALUES (82,69,'2021-06-17',590);
INSERT INTO Ventas VALUES (83,57,'2021-06-27',532);
INSERT INTO Ventas VALUES (84,39,'2021-06-28',405);
INSERT INTO Ventas VALUES (85,6,'2021-07-07',895);
INSERT INTO Ventas VALUES (86,28,'2021-07-09',550);
INSERT INTO Ventas VALUES (87,72,'2021-07-12',129);
INSERT INTO Ventas VALUES (88,60,'2021-07-17',1300);
INSERT INTO Ventas VALUES (89,46,'2021-07-19',245);
INSERT INTO Ventas VALUES (90,64,'2021-07-21',220);
INSERT INTO Ventas VALUES (91,52,'2021-07-28',777);
INSERT INTO Ventas VALUES (92,10,'2021-08-05',199);
INSERT INTO Ventas VALUES (93,68,'2021-08-09',368);
INSERT INTO Ventas VALUES (94,8,'2021-08-12',756);
INSERT INTO Ventas VALUES (95,27,'2021-08-15',1485);
INSERT INTO Ventas VALUES (96,52,'2021-08-19',715);
INSERT INTO Ventas VALUES (97,58,'2021-08-23',175);
INSERT INTO Ventas VALUES (98,37,'2021-08-29',173);
INSERT INTO Ventas VALUES (99,48,'2021-09-04',114);
INSERT INTO Ventas VALUES (100,70,'2021-09-11',664);
INSERT INTO Ventas VALUES (101,30,'2021-10-01',620);
INSERT INTO Ventas VALUES (102,34,'2021-10-03',424);
INSERT INTO Ventas VALUES (103,19,'2021-10-15',546);
INSERT INTO Ventas VALUES (104,56,'2021-10-17',920);
INSERT INTO Ventas VALUES (105,63,'2021-10-24',732);
INSERT INTO Ventas VALUES (106,19,'2021-10-25',150);
INSERT INTO Ventas VALUES (107,57,'2021-10-26',771);
INSERT INTO Ventas VALUES (108,73,'2021-11-08',360);
INSERT INTO Ventas VALUES (109,43,'2021-11-08',237);
INSERT INTO Ventas VALUES (110,30,'2021-11-08',162);
INSERT INTO Ventas VALUES (111,55,'2021-11-14',885);
INSERT INTO Ventas VALUES (112,10,'2021-11-14',552);
INSERT INTO Ventas VALUES (113,18,'2021-11-28',51);
INSERT INTO Ventas VALUES (114,53,'2021-12-02',330);
INSERT INTO Ventas VALUES (115,32,'2021-12-12',765);
INSERT INTO Ventas VALUES (116,47,'2022-01-03',850);
INSERT INTO Ventas VALUES (117,29,'2022-01-13',258);
INSERT INTO Ventas VALUES (118,69,'2022-01-14',387);
INSERT INTO Ventas VALUES (119,8,'2022-01-16',720);
INSERT INTO Ventas VALUES (120,9,'2022-01-23',288);
INSERT INTO Ventas VALUES (121,28,'2022-01-29',368);
INSERT INTO Ventas VALUES (122,66,'2022-01-29',336);
INSERT INTO Ventas VALUES (123,12,'2022-02-02',1000);
INSERT INTO Ventas VALUES (124,9,'2022-02-02',1056);
INSERT INTO Ventas VALUES (125,68,'2022-02-07',819);
INSERT INTO Ventas VALUES (126,5,'2022-02-20',504);
INSERT INTO Ventas VALUES (127,9,'2022-02-26',498);
INSERT INTO Ventas VALUES (128,22,'2022-02-27',290);
INSERT INTO Ventas VALUES (129,32,'2022-02-27',360);
INSERT INTO Ventas VALUES (130,46,'2022-03-02',464);
INSERT INTO Ventas VALUES (131,72,'2022-03-05',500);
INSERT INTO Ventas VALUES (132,57,'2022-03-08',1010);
INSERT INTO Ventas VALUES (133,40,'2022-03-08',297);
INSERT INTO Ventas VALUES (134,48,'2022-03-08',270);
INSERT INTO Ventas VALUES (135,15,'2022-03-12',600);
INSERT INTO Ventas VALUES (136,57,'2022-03-13',618);
INSERT INTO Ventas VALUES (137,51,'2022-03-21',630);
INSERT INTO Ventas VALUES (138,67,'2022-03-30',472);
INSERT INTO Ventas VALUES (139,71,'2022-04-05',1145);
INSERT INTO Ventas VALUES (140,41,'2022-04-07',1280);
INSERT INTO Ventas VALUES (141,53,'2022-04-18',530);
INSERT INTO Ventas VALUES (142,78,'2022-04-23',564);
INSERT INTO Ventas VALUES (143,55,'2022-04-29',275);
INSERT INTO Ventas VALUES (144,70,'2022-04-30',154);
INSERT INTO Ventas VALUES (145,34,'2022-05-07',404);
INSERT INTO Ventas VALUES (146,23,'2022-05-07',472);
INSERT INTO Ventas VALUES (147,16,'2022-05-20',488);
INSERT INTO Ventas VALUES (148,62,'2022-05-25',424);
INSERT INTO Ventas VALUES (149,78,'2022-06-07',590);
INSERT INTO Ventas VALUES (150,26,'2022-06-14',681);


insert into VentaDetalle
values
(1,7,3,37,111),
(2,1,1,370,370),
(3,6,2,25,50),
(4,4,1,200,200),
(5,9,2,60,120),
(6,1,1,350,350),
(7,7,3,25,75),
(8,9,3,60,180),
(9,6,10,25,250),
(10,28,1,210,210),
(11,12,2,140,280),
(12,9,6,60,360),
(13,28,1,210,210),
(14,14,1,300,300),
(15,9,3,60,180),
(16,6,3,15,45),
(17,28,1,210,210),
(18,28,1,210,210),
(19,6,2,13.5,37),
(20,15,2,120,240),
(21,9,6,60,360),
(22,8,5,27,135),
(23,12,2,140,280),
(24,7,2,37,74),
(25,28,2,210,420),
(26,7,1,37,37),
(27,6,10,15,150),
(28,14,1,300,300),
(29,2,1,150,150),
(30,2,1,150,150),
(31,14,1,300,300),
(32,28,1,210,210),
(33,6,1,15,15),
(34,12,1,140,140),
(35,7,4,74,296),
(36,28,1,210,210),
(37,7,2,37,74),
(38,7,2,37,74),
(39,9,2,60,120),
(40,7,10,37,370),
(41,12,1,140,140),
(42,7,1,37,37),
(43,28,1,210,210),
(44,6,15,15,225),
(45,12,1,140,140),
(46,21,2,300,600),
(47,12,2,280,560),
(48,28,1,210,210),
(49,6,10,150,1500),
(50,2,1,150,150)
go

/*revisar*/
INSERT INTO VentaDetalle VALUES (51,32,4,114,456);
INSERT INTO VentaDetalle VALUES (52,38,1,129,129);
INSERT INTO VentaDetalle VALUES (53,91,4,173,692);
INSERT INTO VentaDetalle VALUES (54,44,1,77,77);
INSERT INTO VentaDetalle VALUES (55,91,2,142,284);
INSERT INTO VentaDetalle VALUES (56,67,5,111,555);
INSERT INTO VentaDetalle VALUES (57,40,4,256,1024);
INSERT INTO VentaDetalle VALUES (58,99,4,187,748);
INSERT INTO VentaDetalle VALUES (59,76,2,135,270);
INSERT INTO VentaDetalle VALUES (60,35,2,129,258);
INSERT INTO VentaDetalle VALUES (61,31,1,150,150);
INSERT INTO VentaDetalle VALUES (62,91,2,106,212);
INSERT INTO VentaDetalle VALUES (63,63,3,247,741);
INSERT INTO VentaDetalle VALUES (64,47,4,102,408);
INSERT INTO VentaDetalle VALUES (65,93,5,166,830);
INSERT INTO VentaDetalle VALUES (66,79,2,254,508);
INSERT INTO VentaDetalle VALUES (67,40,5,256,1280);
INSERT INTO VentaDetalle VALUES (68,76,4,157,628);
INSERT INTO VentaDetalle VALUES (69,94,4,228,912);
INSERT INTO VentaDetalle VALUES (70,86,4,275,1100);
INSERT INTO VentaDetalle VALUES (71,58,4,133,532);
INSERT INTO VentaDetalle VALUES (72,70,5,299,1495);
INSERT INTO VentaDetalle VALUES (73,51,3,155,465);
INSERT INTO VentaDetalle VALUES (74,84,4,248,992);
INSERT INTO VentaDetalle VALUES (75,57,4,292,1168);
INSERT INTO VentaDetalle VALUES (76,83,4,152,608);
INSERT INTO VentaDetalle VALUES (77,89,2,279,558);
INSERT INTO VentaDetalle VALUES (78,43,4,51,204);
INSERT INTO VentaDetalle VALUES (79,34,1,300,300);
INSERT INTO VentaDetalle VALUES (80,44,4,77,308);
INSERT INTO VentaDetalle VALUES (81,96,1,193,193);
INSERT INTO VentaDetalle VALUES (82,79,2,295,590);
INSERT INTO VentaDetalle VALUES (83,75,2,266,532);
INSERT INTO VentaDetalle VALUES (84,71,3,135,405);
INSERT INTO VentaDetalle VALUES (85,47,5,179,895);
INSERT INTO VentaDetalle VALUES (86,95,5,110,550);
INSERT INTO VentaDetalle VALUES (87,38,1,129,129);
INSERT INTO VentaDetalle VALUES (88,90,5,260,1300);
INSERT INTO VentaDetalle VALUES (89,52,1,245,245);
INSERT INTO VentaDetalle VALUES (90,91,2,110,220);
INSERT INTO VentaDetalle VALUES (91,65,3,259,777);
INSERT INTO VentaDetalle VALUES (92,78,1,199,199);
INSERT INTO VentaDetalle VALUES (93,39,2,184,368);
INSERT INTO VentaDetalle VALUES (94,78,4,189,756);
INSERT INTO VentaDetalle VALUES (95,56,5,297,1485);
INSERT INTO VentaDetalle VALUES (96,58,5,143,715);
INSERT INTO VentaDetalle VALUES (97,63,1,175,175);
INSERT INTO VentaDetalle VALUES (98,93,1,173,173);
INSERT INTO VentaDetalle VALUES (99,80,1,114,114);
INSERT INTO VentaDetalle VALUES (100,97,4,166,664);
INSERT INTO VentaDetalle VALUES (101,67,5,124,620);
INSERT INTO VentaDetalle VALUES (102,90,2,212,424);
INSERT INTO VentaDetalle VALUES (103,46,2,273,546);
INSERT INTO VentaDetalle VALUES (104,93,5,184,920);
INSERT INTO VentaDetalle VALUES (105,56,3,244,732);
INSERT INTO VentaDetalle VALUES (106,31,1,150,150);
INSERT INTO VentaDetalle VALUES (107,33,3,257,771);
INSERT INTO VentaDetalle VALUES (108,100,2,180,360);
INSERT INTO VentaDetalle VALUES (109,50,1,237,237);
INSERT INTO VentaDetalle VALUES (110,91,1,162,162);
INSERT INTO VentaDetalle VALUES (111,93,3,295,885);
INSERT INTO VentaDetalle VALUES (112,36,3,184,552);
INSERT INTO VentaDetalle VALUES (113,43,1,51,51);
INSERT INTO VentaDetalle VALUES (114,80,3,110,330);
INSERT INTO VentaDetalle VALUES (115,46,5,153,765);
INSERT INTO VentaDetalle VALUES (116,83,5,170,850);
INSERT INTO VentaDetalle VALUES (117,38,2,129,258);
INSERT INTO VentaDetalle VALUES (118,35,3,129,387);
INSERT INTO VentaDetalle VALUES (119,88,5,144,720);
INSERT INTO VentaDetalle VALUES (120,49,1,288,288);
INSERT INTO VentaDetalle VALUES (121,36,2,184,368);
INSERT INTO VentaDetalle VALUES (122,34,1,336,336);
INSERT INTO VentaDetalle VALUES (123,46,5,200,1000);
INSERT INTO VentaDetalle VALUES (124,68,4,264,1056);
INSERT INTO VentaDetalle VALUES (125,72,3,273,819);
INSERT INTO VentaDetalle VALUES (126,66,3,168,504);
INSERT INTO VentaDetalle VALUES (127,95,3,166,498);
INSERT INTO VentaDetalle VALUES (128,33,2,145,290);
INSERT INTO VentaDetalle VALUES (129,100,2,180,360);
INSERT INTO VentaDetalle VALUES (130,56,2,232,464);
INSERT INTO VentaDetalle VALUES (131,67,2,250,500);
INSERT INTO VentaDetalle VALUES (132,92,5,202,1010);
INSERT INTO VentaDetalle VALUES (133,88,1,297,297);
INSERT INTO VentaDetalle VALUES (134,48,1,270,270);
INSERT INTO VentaDetalle VALUES (135,91,3,200,600);
INSERT INTO VentaDetalle VALUES (136,91,3,206,618);
INSERT INTO VentaDetalle VALUES (137,49,5,126,630);
INSERT INTO VentaDetalle VALUES (138,45,4,118,472);
INSERT INTO VentaDetalle VALUES (139,69,5,229,1145);
INSERT INTO VentaDetalle VALUES (140,40,5,256,1280);
INSERT INTO VentaDetalle VALUES (141,84,5,106,530);
INSERT INTO VentaDetalle VALUES (142,60,3,188,564);
INSERT INTO VentaDetalle VALUES (143,98,1,275,275);
INSERT INTO VentaDetalle VALUES (144,92,1,154,154);
INSERT INTO VentaDetalle VALUES (145,63,2,202,404);
INSERT INTO VentaDetalle VALUES (146,45,4,118,472);
INSERT INTO VentaDetalle VALUES (147,46,2,244,488);
INSERT INTO VentaDetalle VALUES (148,53,2,212,424);
INSERT INTO VentaDetalle VALUES (149,53,2,295,590);
INSERT INTO VentaDetalle VALUES (150,83,3,227,681);



INSERT INTO Vacunacion VALUES (1,1,'2022-06-19','Rabia','2022-06-19');
INSERT INTO Vacunacion VALUES (2,1,'2022-05-28','Vitaminas','2022-06-28');
INSERT INTO Vacunacion VALUES (3,1,'2022-09-11','Garrapatas','2022-09-11');
INSERT INTO Vacunacion VALUES (4,3,'2022-08-20','Rabia','2022-08-20');
INSERT INTO Vacunacion VALUES (5,3,'2023-01-05','Vitaminas','2023-01-05');
INSERT INTO Vacunacion VALUES (6,2,'2022-07-15','Rabia','2022-07-15');
INSERT INTO Vacunacion VALUES (7,2,'2022-08-01','Leucemia Felina','2022-08-01');
INSERT INTO Vacunacion VALUES (8,11,'2022-11-23','GarraPatas','2022-11-02');
INSERT INTO Vacunacion VALUES (9,10,'2022-12-29','PIF','2022-12-29');
INSERT INTO Vacunacion VALUES (10,4,'2022-12-03','Salmonelosis','2022-12-03');
INSERT INTO Vacunacion VALUES (11,3,'2023-04-10','Ivermectina','2023-04-10');
INSERT INTO Vacunacion VALUES (12,12,'2022-10-06','Salmonelosis','2022-10-06');
INSERT INTO Vacunacion VALUES (13,8,'2023-05-01','RHDV2','2023-05-01');
INSERT INTO Vacunacion VALUES (14,5,'2021-01-07','Canigen','2021-01-07');
INSERT INTO Vacunacion VALUES (16,18,'2021-02-01','Eurican','2021-02-01');
INSERT INTO Vacunacion VALUES (17,16,'2021-02-15','Letifend','2021-02-15');
INSERT INTO Vacunacion VALUES (23,21,'2021-04-08','Leucofeligen','2021-04-08');
INSERT INTO Vacunacion VALUES (24,40,'2021-04-29','Leucogen','2021-04-29');
INSERT INTO Vacunacion VALUES (26,5,'2021-05-03','Versifel','2021-05-03');
INSERT INTO Vacunacion VALUES (29,43,'2021-06-01','Arvilap','2021-06-01');
INSERT INTO Vacunacion VALUES (30,6,'2021-06-10','Cunipravac','2021-06-10');
INSERT INTO Vacunacion VALUES (34,12,'2021-08-01','Nobivac','2021-08-01');
INSERT INTO Vacunacion VALUES (36,18,'2021-09-04','Feligen','2021-09-04');
INSERT INTO Vacunacion VALUES (37,6,'2021-09-07','Fevaxyn','2021-09-07');
INSERT INTO Vacunacion VALUES (39,31,'2021-09-30','Leucogen','2021-09-30');
INSERT INTO Vacunacion VALUES (40,22,'2021-10-03','Purevax','2021-10-03');
INSERT INTO Vacunacion VALUES (42,14,'2021-10-05','Versiguard','2021-10-05');
INSERT INTO Vacunacion VALUES (45,22,'2021-11-20','Letifend','2021-11-20');
INSERT INTO Vacunacion VALUES (46,39,'2021-12-04','Maxivac','2021-12-04');
INSERT INTO Vacunacion VALUES (49,7,'2021-12-29','Etadex','2021-12-29');
INSERT INTO Vacunacion VALUES (50,44,'2022-01-08','Fevaxyn','2022-01-08');
INSERT INTO Vacunacion VALUES (52,23,'2022-02-11','Leucogen','2022-02-11');
INSERT INTO Vacunacion VALUES (54,2,'2022-02-26','Versifel','2022-02-26');
INSERT INTO Vacunacion VALUES (55,45,'2022-03-09','Versiguard','2022-03-09');
INSERT INTO Vacunacion VALUES (57,43,'2022-03-24','Arvilap','2022-03-24');
INSERT INTO Vacunacion VALUES (59,33,'2022-04-02','Mixohipra','2022-04-02');
INSERT INTO Vacunacion VALUES (60,18,'2022-04-07','Vanguard','2022-04-07');
INSERT INTO Vacunacion VALUES (62,20,'2022-04-17','Nobivac','2022-04-17');
INSERT INTO Vacunacion VALUES (65,41,'2022-05-21','Fevaxyn','2022-05-21');


--INSERT INTO Reserva VALUES (1,3,1,'2023-01-10','Chequeo anual','Pendiente',1);
--INSERT INTO Reserva VALUES (2,3,1,'2022-06-10','Chequeo Mensual','Completado',2);
--INSERT INTO Reserva VALUES (3,2,2,'2022-09-15','Chequeo Mensual','Pendiente',4);
--INSERT INTO Reserva VALUES (4,1,3,'2022-07-15','Chequeo Mensual','Pendiente',3);
--INSERT INTO Reserva VALUES (5,1,3,'2022-01-15','Chequeo Mensual','Ausente',2);
--INSERT INTO Reserva VALUES (6,1,3,'2021-01-15','Chequeo Anual','Completado',1);
--INSERT INTO Reserva VALUES (7,3,1,'2022-06-19','Vacuna Rabia','Ausente',1);
--INSERT INTO Reserva VALUES (8,3,1,'2022-05-28','Vacuna Vit','Completado',1);
--INSERT INTO Reserva VALUES (9,3,1,'2022-09-11','Vacuna Garrap','Pendiente',1);
--INSERT INTO Reserva VALUES (10,1,3,'2022-08-20','Vacuna Rabia','Pendiente',3);
--INSERT INTO Reserva VALUES (11,1,3,'2023-01-05','Vacuna Vitaminas','Pendiente',3);
--INSERT INTO Reserva VALUES (12,2,2,'2022-07-15','Vacuna Rabia','Pendiente',2);
--INSERT INTO Reserva VALUES (13,2,2,'2022-04-01','Consulta','Ausente',2);
--INSERT INTO Reserva VALUES (14,1,3,'2022-05-10','Consulta','Completado',3);
--INSERT INTO Reserva VALUES (15,3,1,'2022-04-10','Consulta','Completado',1);
--INSERT INTO Reserva VALUES (16,3,1,'2021-02-12','Consulta','Completado',1);
--INSERT INTO Reserva VALUES (17,2,2,'2020-02-12','Consulta','Completado',2);
--INSERT INTO Reserva VALUES (18,3,1,'2020-08-01','Consulta','Completado',1);
--INSERT INTO Reserva VALUES (19,11,9,'2021-10-02','Consulta','Completado',1);
--INSERT INTO Reserva VALUES (20,12,8,'2022-02-11','Consulta','Ausente',4);
--INSERT INTO Reserva VALUES (21,15,10,'2021-11-19','Consulta','Completado',2);
--INSERT INTO Reserva VALUES (22,19,13,'2022-01-22','Consulta','Ausente',6);
--INSERT INTO Reserva VALUES (23,20,12,'2022-05-19','Consulta','Completado',3);
--INSERT INTO Reserva VALUES (24,13,14,'2021-06-19','Consulta','Completado',7);
--INSERT INTO Reserva VALUES (25,11,9,'2022-04-21','Consulta','Completado',1);
--INSERT INTO Reserva VALUES (26,20,12,'2022-04-26','Consulta','Completado',3);
--INSERT INTO Reserva VALUES (27,21,16,'2022-07-22','Consulta','Pendiente',3);
--INSERT INTO Reserva VALUES (28,14,15,'2022-07-13','Consulta','Pendiente',3);
--INSERT INTO Reserva VALUES (29,18,11,'2022-11-23','Vacunación','Pendiente',1);
--INSERT INTO Reserva VALUES (30,20,12,'2022-10-17','Consulta','Pendiente',4);
--INSERT INTO Reserva VALUES (31,12,8,'2022-08-24','Consulta','Pendiente',4);
--INSERT INTO Reserva VALUES (32,21,16,'2023-08-18','Consulta','Pendiente',3);
--INSERT INTO Reserva VALUES (33,19,13,'2023-04-25','Consulta','Pendiente',6);
--INSERT INTO Reserva VALUES (34,15,10,'2022-12-29','Vacunación','Pendiente',2);
--INSERT INTO Reserva VALUES (35,4,4,'2022-12-03','Vacunación','Pendiente',4);
--INSERT INTO Reserva VALUES (36,1,3,'2023-04-10','Vacunación','Pendiente',1);
--INSERT INTO Reserva VALUES (37,5,6,'2022-11-21','Consulta','Pendiente',4);
--INSERT INTO Reserva VALUES (38,11,9,'2022-11-16','Consulta','Pendiente',1);
--INSERT INTO Reserva VALUES (39,13,14,'2022-12-14','Consulta','Pendiente',5);
--INSERT INTO Reserva VALUES (40,20,12,'2022-10-06','Vacunación','Pendiente',4);
--INSERT INTO Reserva VALUES (41,15,10,'2022-11-11','Consulta','Pendiente',2);
--INSERT INTO Reserva VALUES (42,12,8,'2023-05-01','Vacunación','Pendiente',5);
--INSERT INTO Reserva VALUES (43,5,5,'2022-06-11','Consulta','Ausente',3);
--INSERT INTO Reserva VALUES (44,5,6,'2022-06-11','Consulta','Ausente',3);
--INSERT INTO Reserva VALUES (45,50,5,'2021-01-07','Vacunacion','Completado',2);
--INSERT INTO Reserva VALUES (46,33,40,'2021-01-25','Consulta','Completado',7);
--INSERT INTO Reserva VALUES (47,48,63,'2021-01-27','Vacunacion','Completado',6);
--INSERT INTO Reserva VALUES (48,70,18,'2021-02-01','Vacunacion','Completado',5);
--INSERT INTO Reserva VALUES (49,22,16,'2021-02-15','Vacunacion','Completado',7);
--INSERT INTO Reserva VALUES (50,42,83,'2021-02-17','Consulta','Completado',7);
--INSERT INTO Reserva VALUES (51,36,56,'2021-02-24','Vacunacion','Completado',3);
--INSERT INTO Reserva VALUES (52,64,76,'2021-02-24','Consulta','Completado',6);
--INSERT INTO Reserva VALUES (53,10,9,'2021-03-02','Consulta','Completado',3);
--INSERT INTO Reserva VALUES (54,72,43,'2021-03-04','Consulta','Completado',3);
--INSERT INTO Reserva VALUES (55,65,53,'2021-03-05','Vacunacion','Completado',4);
--INSERT INTO Reserva VALUES (56,34,67,'2021-03-12','Vacunacion','Ausente',1);
--INSERT INTO Reserva VALUES (57,65,74,'2021-03-18','Consulta','Ausente',4);
--INSERT INTO Reserva VALUES (58,3,46,'2021-03-23','Consulta','Ausente',5);
--INSERT INTO Reserva VALUES (59,34,61,'2021-03-30','Consulta','Ausente',5);
--INSERT INTO Reserva VALUES (60,14,55,'2021-04-06','Vacunacion','Ausente',3);
--INSERT INTO Reserva VALUES (61,8,54,'2021-04-06','Vacunacion','Completado',1);
--INSERT INTO Reserva VALUES (62,73,57,'2021-04-08','Consulta','Ausente',5);
--INSERT INTO Reserva VALUES (63,56,21,'2021-04-08','Vacunacion','Ausente',2);
--INSERT INTO Reserva VALUES (64,16,90,'2021-04-18','Consulta','Ausente',1);
--INSERT INTO Reserva VALUES (65,52,91,'2021-04-20','Consulta','Ausente',1);
--INSERT INTO Reserva VALUES (66,74,40,'2021-04-29','Vacunacion','Completado',6);
--INSERT INTO Reserva VALUES (67,42,90,'2021-05-03','Vacunacion','Completado',2);
--INSERT INTO Reserva VALUES (68,54,5,'2021-05-03','Vacunacion','Completado',7);
--INSERT INTO Reserva VALUES (69,29,97,'2021-05-05','Consulta','Completado',3);
--INSERT INTO Reserva VALUES (70,52,65,'2021-05-09','Vacunacion','Completado',7);
--INSERT INTO Reserva VALUES (71,29,92,'2021-05-12','Consulta','Completado',2);
--INSERT INTO Reserva VALUES (72,9,95,'2021-05-20','Vacunacion','Completado',3);
--INSERT INTO Reserva VALUES (73,23,61,'2021-05-30','Consulta','Completado',7);
--INSERT INTO Reserva VALUES (74,14,43,'2021-06-01','Vacunacion','Completado',3);
--INSERT INTO Reserva VALUES (75,33,6,'2021-06-10','Vacunacion','Completado',5);
--INSERT INTO Reserva VALUES (76,43,4,'2021-06-14','Consulta','Completado',7);
--INSERT INTO Reserva VALUES (77,80,23,'2021-06-16','Consulta','Completado',6);
--INSERT INTO Reserva VALUES (78,41,15,'2021-06-18','Consulta','Completado',2);
--INSERT INTO Reserva VALUES (79,33,54,'2021-06-19','Vacunacion','Completado',4);
--INSERT INTO Reserva VALUES (80,70,57,'2021-06-20','Vacunacion','Ausente',2);
--INSERT INTO Reserva VALUES (81,61,74,'2021-06-20','Consulta','Completado',7);
--INSERT INTO Reserva VALUES (82,75,12,'2021-06-28','Consulta','Completado',2);
--INSERT INTO Reserva VALUES (83,7,68,'2021-07-07','Vacunacion','Completado',4);
--INSERT INTO Reserva VALUES (84,40,12,'2021-08-01','Vacunacion','Completado',5);
--INSERT INTO Reserva VALUES (85,19,98,'2021-08-05','Consulta','Completado',5);
--INSERT INTO Reserva VALUES (86,13,58,'2021-08-11','Consulta','Completado',3);
--INSERT INTO Reserva VALUES (87,29,100,'2021-08-13','Consulta','Completado',5);
--INSERT INTO Reserva VALUES (88,66,84,'2021-08-20','Vacunacion','Completado',4);
--INSERT INTO Reserva VALUES (89,77,93,'2021-08-26','Consulta','Completado',4);
--INSERT INTO Reserva VALUES (90,45,18,'2021-09-04','Vacunacion','Completado',5);
--INSERT INTO Reserva VALUES (91,47,6,'2021-09-07','Vacunacion','Completado',7);
--INSERT INTO Reserva VALUES (92,15,59,'2021-09-17','Vacunacion','Completado',1);
--INSERT INTO Reserva VALUES (93,28,31,'2021-09-30','Vacunacion','Ausente',6);
--INSERT INTO Reserva VALUES (94,26,62,'2021-09-30','Consulta','Ausente',4);
--INSERT INTO Reserva VALUES (95,41,22,'2021-10-03','Vacunacion','Ausente',7);
--INSERT INTO Reserva VALUES (96,56,73,'2021-10-04','Vacunacion','Ausente',1);
--INSERT INTO Reserva VALUES (97,49,14,'2021-10-05','Vacunacion','Ausente',4);
--INSERT INTO Reserva VALUES (98,65,1,'2021-10-06','Consulta','Ausente',7);
--INSERT INTO Reserva VALUES (99,44,82,'2021-10-07','Consulta','Ausente',6);
--INSERT INTO Reserva VALUES (100,13,12,'2021-10-17','Consulta','Ausente',1);
--INSERT INTO Reserva VALUES (101,20,3,'2021-10-27','Consulta','Ausente',3);
--INSERT INTO Reserva VALUES (102,46,72,'2021-11-13','Vacunacion','Ausente',1);
--INSERT INTO Reserva VALUES (103,56,74,'2021-11-17','Vacunacion','Completado',5);
--INSERT INTO Reserva VALUES (104,36,22,'2021-11-20','Vacunacion','Completado',4);
--INSERT INTO Reserva VALUES (105,32,80,'2021-11-28','Consulta','Completado',6);
--INSERT INTO Reserva VALUES (106,41,39,'2021-12-04','Vacunacion','Completado',6);
--INSERT INTO Reserva VALUES (107,7,47,'2021-12-11','Consulta','Completado',7);
--INSERT INTO Reserva VALUES (108,26,68,'2021-12-22','Vacunacion','Completado',1);
--INSERT INTO Reserva VALUES (109,28,15,'2021-12-24','Consulta','Completado',1);
--INSERT INTO Reserva VALUES (110,9,54,'2021-12-28','Vacunacion','Completado',6);
--INSERT INTO Reserva VALUES (111,68,7,'2021-12-29','Vacunacion','Completado',5);
--INSERT INTO Reserva VALUES (112,2,86,'2022-01-06','Consulta','Completado',2);
--INSERT INTO Reserva VALUES (113,71,44,'2022-01-08','Vacunacion','Completado',6);
--INSERT INTO Reserva VALUES (114,56,99,'2022-01-09','Consulta','Completado',2);
--INSERT INTO Reserva VALUES (115,4,94,'2022-01-11','Vacunacion','Completado',7);
--INSERT INTO Reserva VALUES (116,60,29,'2022-01-18','Consulta','Ausente',7);
--INSERT INTO Reserva VALUES (117,77,23,'2022-01-18','Consulta','Ausente',2);
--INSERT INTO Reserva VALUES (118,43,45,'2022-01-20','Consulta','Ausente',1);
--INSERT INTO Reserva VALUES (119,29,10,'2022-02-04','Consulta','Ausente',4);
--INSERT INTO Reserva VALUES (120,11,39,'2022-02-09','Consulta','Ausente',7);
--INSERT INTO Reserva VALUES (121,52,23,'2022-02-11','Vacunacion','Ausente',3);
--INSERT INTO Reserva VALUES (122,50,91,'2022-02-19','Consulta','Ausente',7);
--INSERT INTO Reserva VALUES (123,60,87,'2022-02-25','Vacunacion','Completado',1);
--INSERT INTO Reserva VALUES (124,24,2,'2022-02-26','Vacunacion','Completado',7);
--INSERT INTO Reserva VALUES (125,70,45,'2022-03-09','Vacunacion','Completado',6);
--INSERT INTO Reserva VALUES (126,38,87,'2022-03-15','Vacunacion','Completado',7);
--INSERT INTO Reserva VALUES (127,12,6,'2022-03-18','Consulta','Completado',6);
--INSERT INTO Reserva VALUES (128,74,94,'2022-03-18','Consulta','Completado',3);
--INSERT INTO Reserva VALUES (129,1,43,'2022-03-24','Vacunacion','Completado',2);
--INSERT INTO Reserva VALUES (130,80,67,'2022-03-24','Vacunacion','Completado',3);
--INSERT INTO Reserva VALUES (131,59,18,'2022-03-25','Consulta','Completado',6);
--INSERT INTO Reserva VALUES (132,43,71,'2022-03-31','Consulta','Completado',5);
--INSERT INTO Reserva VALUES (133,44,67,'2022-03-31','Consulta','Ausente',7);
--INSERT INTO Reserva VALUES (134,13,33,'2022-04-02','Vacunacion','Ausente',1);
--INSERT INTO Reserva VALUES (135,56,69,'2022-04-02','Consulta','Ausente',6);
--INSERT INTO Reserva VALUES (136,34,18,'2022-04-07','Vacunacion','Ausente',7);
--INSERT INTO Reserva VALUES (137,45,56,'2022-04-07','Consulta','Ausente',2);
--INSERT INTO Reserva VALUES (138,53,64,'2022-04-08','Vacunacion','Ausente',1);
--INSERT INTO Reserva VALUES (139,66,97,'2022-04-12','Consulta','Completado',7);
--INSERT INTO Reserva VALUES (140,14,20,'2022-04-17','Vacunacion','Completado',4);
--INSERT INTO Reserva VALUES (141,50,74,'2022-05-01','Consulta','Completado',6);
--INSERT INTO Reserva VALUES (142,36,64,'2022-05-16','Vacunacion','Completado',4);
--INSERT INTO Reserva VALUES (143,76,41,'2022-05-18','Consulta','Completado',7);
--INSERT INTO Reserva VALUES (144,64,99,'2022-05-20','Vacunacion','Completado',2);
--INSERT INTO Reserva VALUES (145,60,41,'2022-05-21','Vacunacion','Completado',3);
--INSERT INTO Reserva VALUES (146,35,54,'2022-05-26','Consulta','Completado',1);
--INSERT INTO Reserva VALUES (147,38,95,'2022-05-31','Vacunacion','Completado',4);
--INSERT INTO Reserva VALUES (148,78,98,'2022-06-01','Vacunacion','Completado',6);
--INSERT INTO Reserva VALUES (149,42,15,'2022-06-11','Consulta','Ausente',7);
--INSERT INTO Reserva VALUES (150,30,87,'2022-06-17','Consulta','Ausente',7);

--go


select * from Vacunacion
select * from Consulta
select * from Cliente
select * from Veterinario
select * from Mascota
select * from Producto
select * from Proveedor
select * from TipoMascota
select * from Credenciales
select * from VentaDetalle
select * from Ventas

