
/****** Object:  Database [ControlAsistencia]    Script Date: 29/6/2020 12:26:20 ******/
CREATE DATABASE [ControlAsistencia]

USE [ControlAsistencia]
GO
/****** Object:  Table [dbo].[Asistencia]    Script Date: 29/6/2020 12:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asistencia](
	[id_asis] [int] IDENTITY(1,1) NOT NULL,
	[fecha_ingreso] [date] NULL,
	[fecha_salida] [date] NULL,
	[id_emp] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_asis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 29/6/2020 12:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[id_emp] [int] IDENTITY(1,1) NOT NULL,
	[nombre_completo] [varchar](100) NULL,
	[telefono] [varchar](15) NULL,
	[correo] [varchar](25) NULL,
	[cedula] [varchar](13) NULL,
	[lugar_nacimiento] [varchar](25) NULL,
	[sexo] [varchar](1) NULL,
	[estado_civil] [varchar](10) NULL,
	[area_trabajo] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_emp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Informe]    Script Date: 29/6/2020 12:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Informe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pago_empleado] [float] NULL,
	[id_asis] [int] NULL,
	[id_emp] [int] NULL,
	[dias_trabajo] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Asistencia] ON 
GO
INSERT [dbo].[Asistencia] ([id_asis], [fecha_ingreso], [fecha_salida], [id_emp]) VALUES (1, CAST(N'2020-06-25' AS Date), CAST(N'2020-06-25' AS Date), 1)
GO
INSERT [dbo].[Asistencia] ([id_asis], [fecha_ingreso], [fecha_salida], [id_emp]) VALUES (2, CAST(N'2020-06-26' AS Date), CAST(N'2020-06-26' AS Date), 3)
GO
INSERT [dbo].[Asistencia] ([id_asis], [fecha_ingreso], [fecha_salida], [id_emp]) VALUES (3, CAST(N'2020-06-25' AS Date), NULL, 6)
GO
SET IDENTITY_INSERT [dbo].[Asistencia] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleado] ON 
GO
INSERT [dbo].[Empleado] ([id_emp], [nombre_completo], [telefono], [correo], [cedula], [lugar_nacimiento], [sexo], [estado_civil], [area_trabajo]) VALUES (1, N'Cristian Alejandro Venegas Venegas', N'0987456321', N'abc@example.com', N'123456789', N'Quito', N'M', N'Casado', N'Recursos Humanos')
GO
INSERT [dbo].[Empleado] ([id_emp], [nombre_completo], [telefono], [correo], [cedula], [lugar_nacimiento], [sexo], [estado_civil], [area_trabajo]) VALUES (3, N'Bryan Lenin Sandoval Maiza', N'0987654321', N'abc@example.com', N'1878945612', N'Ambato', N'M', N'Soltero', N'Informatica')
GO
INSERT [dbo].[Empleado] ([id_emp], [nombre_completo], [telefono], [correo], [cedula], [lugar_nacimiento], [sexo], [estado_civil], [area_trabajo]) VALUES (6, N'David Ledezma', N'1223453', N'abc@example.com', N'09784561230', N'Quito', N'M', N'Casado', N'Recursos Humanos')
GO
SET IDENTITY_INSERT [dbo].[Empleado] OFF
GO
ALTER TABLE [dbo].[Asistencia]  WITH CHECK ADD  CONSTRAINT [FK_Asistencia_Empleado] FOREIGN KEY([id_emp])
REFERENCES [dbo].[Empleado] ([id_emp])
GO
ALTER TABLE [dbo].[Asistencia] CHECK CONSTRAINT [FK_Asistencia_Empleado]
GO
ALTER TABLE [dbo].[Informe]  WITH CHECK ADD  CONSTRAINT [fk1] FOREIGN KEY([id_asis])
REFERENCES [dbo].[Asistencia] ([id_asis])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Informe] CHECK CONSTRAINT [fk1]
GO
ALTER TABLE [dbo].[Informe]  WITH CHECK ADD  CONSTRAINT [fk2] FOREIGN KEY([id_emp])
REFERENCES [dbo].[Empleado] ([id_emp])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Informe] CHECK CONSTRAINT [fk2]
GO
USE [master]
GO
ALTER DATABASE [ControlAsistencia] SET  READ_WRITE 
GO
