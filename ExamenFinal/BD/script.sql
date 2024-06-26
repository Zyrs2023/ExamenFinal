USE [ExamenFinal]
GO
/****** Object:  Table [dbo].[Agentes]    Script Date: 22/4/2024 16:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agentes](
	[IDAgente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Telefono] [varchar](20) NULL,
	[Contrasena] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDAgente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uq_correo] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Casas]    Script Date: 22/4/2024 16:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casas](
	[IDCasa] [int] IDENTITY(1,1) NOT NULL,
	[Direccion] [varchar](100) NULL,
	[Ciudad] [varchar](50) NULL,
	[Precio] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCasa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 22/4/2024 16:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IDCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Telefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 22/4/2024 16:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[IDVenta] [int] IDENTITY(1,1) NOT NULL,
	[ID_Agente] [int] NULL,
	[ID_Cliente] [int] NULL,
	[ID_Casa] [int] NULL,
	[Fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Agente])
REFERENCES [dbo].[Agentes] ([IDAgente])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Casa])
REFERENCES [dbo].[Casas] ([IDCasa])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([IDCliente])
GO
/****** Object:  StoredProcedure [dbo].[ConsultarAgentePorID]    Script Date: 22/4/2024 16:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarAgentePorID]
    @IDAgente INT
AS
BEGIN
    SELECT IDAgente, Nombre, Email, Telefono
    FROM Agentes
    WHERE IDAgente = @IDAgente;
END;
GO
/****** Object:  StoredProcedure [dbo].[GestionarAgentes]    Script Date: 22/4/2024 16:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GestionarAgentes]
    @accion NVARCHAR(10),
    @agente_id INT = NULL,
    @agente_nombre NVARCHAR(50) = NULL,
    @agente_email NVARCHAR(100) = NULL,
    @agente_telefono NVARCHAR(20) = NULL,
    @agente_contrasena NVARCHAR(50) = NULL
AS
BEGIN
    IF @accion = 'agregar'
    BEGIN
        INSERT INTO Agentes (Nombre, Email, Telefono, Contrasena) 
        VALUES (@agente_nombre, @agente_email, @agente_telefono, @agente_contrasena);
    END
    ELSE IF @accion = 'borrar'
    BEGIN
        DELETE FROM Agentes WHERE IDAgente = @agente_id;
    END
    ELSE IF @accion = 'modificar'
    BEGIN
        UPDATE Agentes SET 
            Nombre = @agente_nombre,
            Email = @agente_email,
            Telefono = @agente_telefono,
            Contrasena = @agente_contrasena
        WHERE IDAgente = @agente_id;
    END
    ELSE IF @accion = 'consultar'
    BEGIN
        SELECT IDAgente, Nombre, Email, Telefono 
		FROM Agentes
		WHERE IDAgente = @agente_id;
    END
    ELSE
    BEGIN
        SELECT 'Acción no válida';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[GestionarCasas]    Script Date: 22/4/2024 16:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GestionarCasas]
    @accion NVARCHAR(10),
    @casa_id INT = NULL,
    @casa_direccion VARCHAR(100) = NULL,
    @casa_ciudad VARCHAR(50) = NULL,
    @casa_precio DECIMAL(10, 2) = NULL
AS
BEGIN
    IF @accion = 'agregar'
    BEGIN
        INSERT INTO Casas (Direccion, Ciudad, Precio) 
        VALUES (@casa_direccion, @casa_ciudad, @casa_precio);
    END
    ELSE IF @accion = 'borrar'
    BEGIN
        DELETE FROM Casas WHERE IDCasa = @casa_id;
    END
    ELSE IF @accion = 'modificar'
    BEGIN
        UPDATE Casas SET 
            Direccion = @casa_direccion,
            Ciudad = @casa_ciudad,
            Precio = @casa_precio
        WHERE IDCasa = @casa_id;
    END
    ELSE IF @accion = 'consultar'
    BEGIN
        SELECT IDCasa, Direccion, Ciudad, Precio 
		FROM Casas
		WHERE IDCasa = @casa_id;
    END
    ELSE
    BEGIN
        SELECT 'Acción no válida';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[GestionarClientes]    Script Date: 22/4/2024 16:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GestionarClientes]
    @accion NVARCHAR(10),
    @cliente_id INT = NULL,
    @cliente_nombre NVARCHAR(50) = NULL,
    @cliente_email NVARCHAR(100) = NULL,
    @cliente_telefono NVARCHAR(20) = NULL
AS
BEGIN
    IF @accion = 'agregar'
    BEGIN
        INSERT INTO Clientes (Nombre, Email, Telefono) 
        VALUES (@cliente_nombre, @cliente_email, @cliente_telefono);
    END
    ELSE IF @accion = 'borrar'
    BEGIN
        DELETE FROM Clientes WHERE IDCliente = @cliente_id;
    END
    ELSE IF @accion = 'modificar'
    BEGIN
        UPDATE Clientes SET 
            Nombre = @cliente_nombre,
            Email = @cliente_email,
            Telefono = @cliente_telefono
        WHERE IDCliente = @cliente_id;
    END
    ELSE IF @accion = 'consultar'
    BEGIN
        SELECT IDCliente, Nombre, Email, Telefono 
		FROM Clientes
		WHERE IDCliente = @cliente_id;
    END
    ELSE
    BEGIN
        SELECT 'Acción no válida';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[GestionarVentas]    Script Date: 22/4/2024 16:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GestionarVentas]
    @accion NVARCHAR(10),
    @venta_id INT = NULL,
    @agente_id INT = NULL,
    @cliente_id INT = NULL,
    @casa_id INT = NULL,
    @fecha DATE = NULL
AS
BEGIN
    IF @accion = 'agregar'
    BEGIN
        INSERT INTO Ventas (ID_Agente, ID_Cliente, ID_Casa, Fecha) 
        VALUES (@agente_id, @cliente_id, @casa_id, @fecha);
    END
    ELSE IF @accion = 'borrar'
    BEGIN
        DELETE FROM Ventas WHERE IDVenta = @venta_id;
    END
    ELSE IF @accion = 'modificar'
    BEGIN
        UPDATE Ventas SET 
            ID_Agente = @agente_id,
            ID_Cliente = @cliente_id,
            ID_Casa = @casa_id,
            Fecha = @fecha
        WHERE IDVenta = @venta_id;
    END
    ELSE IF @accion = 'consultar'
    BEGIN
        SELECT IDVenta, ID_Agente, ID_Cliente, ID_Casa, Fecha 
		FROM Ventas
		WHERE IDVenta = @venta_id;
    END
    ELSE
    BEGIN
        SELECT 'Acción no válida';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[LlenarGridAgentes]    Script Date: 22/4/2024 16:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LlenarGridAgentes]
AS
BEGIN
    SELECT IDAgente, Nombre, Email, Telefono FROM Agentes;
END;
GO
/****** Object:  StoredProcedure [dbo].[LlenarGridCasas]    Script Date: 22/4/2024 16:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LlenarGridCasas]
AS
BEGIN
    SELECT IDCasa, Direccion, Ciudad, Precio FROM Casas;
END;
GO
/****** Object:  StoredProcedure [dbo].[LlenarGridClientes]    Script Date: 22/4/2024 16:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LlenarGridClientes]
AS
BEGIN
    SELECT IDCliente, Nombre, Email, Telefono FROM Clientes;
END;
GO
/****** Object:  StoredProcedure [dbo].[LlenarGridVentas]    Script Date: 22/4/2024 16:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LlenarGridVentas]
AS
BEGIN
    SELECT IDVenta, ID_Agente, ID_Cliente, ID_Casa, Fecha 
    FROM Ventas;
END;
GO
/****** Object:  StoredProcedure [dbo].[ValidarLogin]    Script Date: 22/4/2024 16:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidarLogin]
    @email VARCHAR(100),
    @contrasena VARCHAR(50)
AS
BEGIN
    SELECT IDAgente AS 'ID Agente', Nombre AS 'Nombre Completo', Email
    FROM Agentes
    WHERE Email = @email 
        AND BINARY_CHECKSUM(Contrasena) = BINARY_CHECKSUM(@contrasena);
END;
GO
