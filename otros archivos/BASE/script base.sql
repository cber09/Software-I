create database [Veterinaria_BuenProductor]
USE [Veterinaria_BuenProductor]
GO

/****** Object:  Table [dbo].[Cliente]    Script Date: 27/6/2022 14:59:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cliente](
	[Id_Cliente] [int] NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[TelefonoFijo] [varchar](10) NULL,
	[Celular] [varchar](10) NULL,
	[Correo] [varchar](50) NULL,
	[Direccion] [varchar](200) NOT NULL,
	[Estado] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[Consulta]    Script Date: 27/6/2022 14:59:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Consulta](
	[Id_Consulta] [int] NOT NULL,
	[IdMascota] [int] NOT NULL,
	[Fecha] [date] NULL,
	[Sintomas] [varchar](100) NULL,
	[Diagnostico] [varchar](100) NULL,
	[IdVeterinario] [int] NOT NULL,
	[Estado] [varchar](10) NULL,
	[Hora] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Consulta] PRIMARY KEY CLUSTERED 
(
	[Id_Consulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_Mascota] FOREIGN KEY([IdMascota])
REFERENCES [dbo].[Mascota] ([Id_Mascota])
GO

ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_Consulta_Mascota]
GO

ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_Veterinario] FOREIGN KEY([IdVeterinario])
REFERENCES [dbo].[Veterinario] ([Id_Veterinario])
GO

ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_Consulta_Veterinario]
GO

/****** Object:  Table [dbo].[Credenciales]    Script Date: 27/6/2022 15:00:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Credenciales](
	[Id_Credenciales] [int] NOT NULL,
	[Usuario] [varchar](20) NOT NULL,
	[Contraseña] [varchar](20) NOT NULL,
	[Rol] [int] NOT NULL,
 CONSTRAINT [PK_Credenciales] PRIMARY KEY CLUSTERED 
(
	[Id_Credenciales] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[Mascota]    Script Date: 27/6/2022 15:12:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Mascota](
	[Id_Mascota] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Edad] [int] NOT NULL,
	[Raza] [varchar](20) NULL,
	[Observaciones] [varchar](100) NULL,
	[IdTipoMascota] [int] NOT NULL,
	[Estado] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Mascota] PRIMARY KEY CLUSTERED 
(
	[Id_Mascota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Mascota]  WITH CHECK ADD  CONSTRAINT [FK_Mascota_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([Id_Cliente])
GO

ALTER TABLE [dbo].[Mascota] CHECK CONSTRAINT [FK_Mascota_Cliente]
GO

ALTER TABLE [dbo].[Mascota]  WITH CHECK ADD  CONSTRAINT [FK_Mascota_TipoMascota] FOREIGN KEY([IdTipoMascota])
REFERENCES [dbo].[TipoMascota] ([Id_TipoMascota])
GO

ALTER TABLE [dbo].[Mascota] CHECK CONSTRAINT [FK_Mascota_TipoMascota]
GO

/****** Object:  Table [dbo].[Producto]    Script Date: 27/6/2022 15:13:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Producto](
	[Id_Producto] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Costo] [float] NOT NULL,
	[Precio] [float] NOT NULL,
	[Stock] [int] NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[Estado] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Proveedor] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([Id_Proveedor])
GO

ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Proveedor]
GO

/****** Object:  Table [dbo].[Proveedor]    Script Date: 27/6/2022 15:13:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Proveedor](
	[Id_Proveedor] [int] NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[TelefonoFijo] [varchar](10) NULL,
	[Celular] [varchar](10) NULL,
	[Direccion] [varchar](200) NOT NULL,
	[Correo] [varchar](50) NULL,
	[RUC] [varchar](50) NOT NULL,
	[Compañia] [varchar](50) NULL,
	[Estado] [varchar](20) NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[Id_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[TipoMascota]    Script Date: 27/6/2022 15:13:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TipoMascota](
	[Id_TipoMascota] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoMascota] PRIMARY KEY CLUSTERED 
(
	[Id_TipoMascota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[Vacunacion]    Script Date: 27/6/2022 15:14:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Vacunacion](
	[Id_Vacunacion] [int] NOT NULL,
	[IdMascota] [int] NOT NULL,
	[FechaProgramada] [date] NULL,
	[Vacuna] [varchar](50) NULL,
	[FechaAplicada] [date] NULL,
 CONSTRAINT [PK_Vacunacion] PRIMARY KEY CLUSTERED 
(
	[Id_Vacunacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Vacunacion]  WITH CHECK ADD  CONSTRAINT [FK_Vacunacion_Mascota] FOREIGN KEY([IdMascota])
REFERENCES [dbo].[Mascota] ([Id_Mascota])
GO

ALTER TABLE [dbo].[Vacunacion] CHECK CONSTRAINT [FK_Vacunacion_Mascota]
GO

/****** Object:  Table [dbo].[VentaDetalle]    Script Date: 27/6/2022 15:14:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[VentaDetalle](
	[IdVenta] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Costo] [float] NOT NULL,
	[total] [float] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[VentaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_VentaDetalle_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id_Producto])
GO

ALTER TABLE [dbo].[VentaDetalle] CHECK CONSTRAINT [FK_VentaDetalle_Producto]
GO

ALTER TABLE [dbo].[VentaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_VentaDetalle_Ventas] FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Ventas] ([Id_Venta])
GO

ALTER TABLE [dbo].[VentaDetalle] CHECK CONSTRAINT [FK_VentaDetalle_Ventas]
GO

/****** Object:  Table [dbo].[Ventas]    Script Date: 27/6/2022 15:14:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Ventas](
	[Id_Venta] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[Id_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([Id_Cliente])
GO

ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Cliente]
GO

/****** Object:  Table [dbo].[Veterinario]    Script Date: 27/6/2022 15:14:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Veterinario](
	[Id_Veterinario] [int] NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Cedula] [varchar](20) NOT NULL,
	[Correo] [varchar](50) NULL,
	[IdCredenciales] [int] NOT NULL,
	[Direccion] [varchar](200) NOT NULL,
	[Celular] [varchar](10) NULL,
	[Estado] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Veterinario] PRIMARY KEY CLUSTERED 
(
	[Id_Veterinario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Veterinario]  WITH CHECK ADD  CONSTRAINT [FK_Veterinario_Credenciales] FOREIGN KEY([IdCredenciales])
REFERENCES [dbo].[Credenciales] ([Id_Credenciales])
GO

ALTER TABLE [dbo].[Veterinario] CHECK CONSTRAINT [FK_Veterinario_Credenciales]
GO


