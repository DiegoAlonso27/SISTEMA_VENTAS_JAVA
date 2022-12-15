USE MASTER
GO
    --Creación BD_SistemaVentas_e_Inventario
    --  validamos si la base de datos BD_SistemaVentas_e_Inventario existe o no
    IF EXISTS (
        SELECT
            name
        FROM
            master.dbo.sysdatabases
        WHERE
            name = N'BD_SistemaVentas_e_Inventario'
    ) BEGIN -- si existe la base de datos, la eliminamos
    DROP DATABASE BD_SistemaVentas_e_Inventario
END Create Database BD_SistemaVentas_e_Inventario
GO
    --USANDO BD_SistemaVentas_e_Inventario
    USE BD_SistemaVentas_e_Inventario
GO
    -- Tabla roles
    CREATE TABLE roles (
        id INT PRIMARY KEY IDENTITY(1, 1),
        nombre VARCHAR(255) NOT NULL,
        descripcion VARCHAR(255) NOT NULL,
        created_at DATETIME2(7) DEFAULT GETDATE(),
        updated_at DATETIME2(7) DEFAULT GETDATE(),
        deleted_at DATETIME2(7) NULL
    );

GO
    CREATE TABLE permisos (
        id INT PRIMARY KEY IDENTITY(1, 1),
        nombre VARCHAR(255) NOT NULL,
        descripcion VARCHAR(255) NOT NULL,
        created_at DATETIME2(7) DEFAULT GETDATE(),
        updated_at DATETIME2(7) DEFAULT GETDATE(),
        deleted_at DATETIME2(7) NULL
    );

GO
    CREATE TABLE asignaciones_permisos (
        id INT PRIMARY KEY IDENTITY(1, 1),
        id_rol INT NOT NULL,
        id_permiso INT NOT NULL,
        FOREIGN KEY (id_rol) REFERENCES roles(id),
        FOREIGN KEY (id_permiso) REFERENCES permisos(id),
        created_at DATETIME2(7) DEFAULT GETDATE(),
        updated_at DATETIME2(7) DEFAULT GETDATE(),
        deleted_at DATETIME2(7) NULL
    );

GO
    -- creat table empresas
    CREATE TABLE empresas (
        id INT PRIMARY KEY IDENTITY(1, 1),
        nombre VARCHAR(255) NOT NULL,
        num_doc VARCHAR(255) NOT NULL,
        direccion VARCHAR(255) NOT NULL,
        telefono VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        created_at DATETIME2(7) DEFAULT GETDATE(),
        updated_at DATETIME2(7) DEFAULT GETDATE(),
        deleted_at DATETIME2(7) NULL
    );

GO
    -- create table users 
    CREATE TABLE usuarios (
        id INT PRIMARY KEY IDENTITY(1, 1),
        nombre VARCHAR(255) NOT NULL,
        apellido VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        password VARCHAR(255) NOT NULL,
        created_at DATETIME2(7) DEFAULT GETDATE(),
        updated_at DATETIME2(7) DEFAULT GETDATE(),
        deleted_at DATETIME2(7) NULL
    );

GO
    -- create table unidades
    CREATE TABLE unidades (
        id INT PRIMARY KEY IDENTITY(1, 1),
        codigo VARCHAR(255) NOT NULL,
        descripcion VARCHAR(255) NOT NULL,
        created_at DATETIME2(7) DEFAULT GETDATE(),
        updated_at DATETIME2(7) DEFAULT GETDATE(),
        deleted_at DATETIME2(7) NULL
    );

GO
    -- create table tipos_pagos
    CREATE TABLE tipos_pagos (
        id INT PRIMARY KEY IDENTITY(1, 1),
        descripcion VARCHAR(255) NOT NULL,
        created_at DATETIME2(7) DEFAULT GETDATE(),
        updated_at DATETIME2(7) DEFAULT GETDATE(),
        deleted_at DATETIME2(7) NULL
    );

GO
    -- create table metodos_pagos
    CREATE TABLE metodos_pagos (
        id INT PRIMARY KEY IDENTITY(1, 1),
        descripcion VARCHAR(255) NOT NULL,
        created_at DATETIME2(7) DEFAULT GETDATE(),
        updated_at DATETIME2(7) DEFAULT GETDATE(),
        deleted_at DATETIME2(7) NULL
    );

GO
    -- create table documentos
    CREATE TABLE documentos (
        id INT PRIMARY KEY IDENTITY(1, 1),
        codigo VARCHAR(255) NOT NULL,
        descripcion VARCHAR(255) NOT NULL,
        created_at DATETIME2(7) DEFAULT GETDATE(),
        updated_at DATETIME2(7) DEFAULT GETDATE(),
        deleted_at DATETIME2(7) NULL
    );

GO
    -- create table monedas
    CREATE TABLE monedas (
        id INT PRIMARY KEY IDENTITY(1, 1),
        nombre VARCHAR(255) NOT NULL,
        descripcion VARCHAR(255) NOT NULL,
        created_at DATETIME2(7) DEFAULT GETDATE(),
        updated_at DATETIME2(7) DEFAULT GETDATE(),
        deleted_at DATETIME2(7) NULL
    );

GO
    -- create table departamentos
    CREATE TABLE departamentos (
        id INT PRIMARY KEY IDENTITY(1, 1),
        nombre VARCHAR(255) NOT NULL,
        created_at DATETIME2(7) DEFAULT GETDATE(),
        updated_at DATETIME2(7) DEFAULT GETDATE(),
        deleted_at DATETIME2(7) NULL
    );

GO
    -- create table provincias
    CREATE TABLE provincias (
        id INT PRIMARY KEY IDENTITY(1, 1),
        nombre VARCHAR(255) NOT NULL,
        id_departamento INT NOT NULL,
        FOREIGN KEY (id_departamento) REFERENCES departamentos(id),
        created_at DATETIME2(7) DEFAULT GETDATE(),
        updated_at DATETIME2(7) DEFAULT GETDATE(),
        deleted_at DATETIME2(7) NULL
    );

-- create table distritos
CREATE TABLE distritos (
    id INT PRIMARY KEY IDENTITY(1, 1),
    nombre VARCHAR(255) NOT NULL,
    id_provincia INT NOT NULL,
    FOREIGN KEY (id_provincia) REFERENCES provincias(id),
    created_at DATETIME2(7) DEFAULT GETDATE(),
    updated_at DATETIME2(7) DEFAULT GETDATE(),
    deleted_at DATETIME2(7) NULL
);

GO
    -- create table categorias
    CREATE TABLE categorias (
        id INT PRIMARY KEY IDENTITY(1, 1),
        nombre VARCHAR(255) NOT NULL,
        descripcion VARCHAR(255) NOT NULL,
        estado INT NOT NULL,
        -- puede ser 1 o 0
        created_at DATETIME2(7) DEFAULT GETDATE(),
        updated_at DATETIME2(7) DEFAULT GETDATE(),
        deleted_at DATETIME2(7) NULL
    );

GO
    -- create table proveedores
    CREATE TABLE proveedores (
        id INT PRIMARY KEY IDENTITY(1, 1),
        -- fk documento id
        id_documento INT NOT NULL,
        FOREIGN KEY (id_documento) REFERENCES documentos(id),
        nombre VARCHAR(255) NOT NULL,
        num_doc VARCHAR(255) NOT NULL,
        direccion VARCHAR(255) NOT NULL,
        telefono VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        created_at DATETIME2(7) DEFAULT GETDATE(),
        updated_at DATETIME2(7) DEFAULT GETDATE(),
        deleted_at DATETIME2(7) NULL
    );

GO
    -- create table productos
    CREATE TABLE productos (
        id INT PRIMARY KEY IDENTITY(1, 1),
        id_categoria INT NOT NULL,
        FOREIGN KEY (id_categoria) REFERENCES categorias(id),
        id_unidad INT NOT NULL,
        FOREIGN KEY (id_unidad) REFERENCES unidades(id),
        id_proveedor INT NOT NULL,
        FOREIGN KEY (id_proveedor) REFERENCES proveedores(id),
        nombre VARCHAR(255) NOT NULL,
        codigo VARCHAR(255) NOT NULL,
        descripcion VARCHAR(255) NOT NULL,
        precio_venta DECIMAL(10, 2) NOT NULL,
        stock DECIMAL(10, 2) NOT NULL,
        estado INT NOT NULL,
        -- puede ser 1 o 0
        created_at DATETIME2(7) DEFAULT GETDATE(),
        updated_at DATETIME2(7) DEFAULT GETDATE(),
        deleted_at DATETIME2(7) NULL
    );

GO
    -- create table clientes
    CREATE TABLE clientes (
        id INT PRIMARY KEY IDENTITY(1, 1),
        -- fk documento id
        id_documento INT NOT NULL,
        FOREIGN KEY (id_documento) REFERENCES documentos(id),
        nombre VARCHAR(255) NOT NULL,
        num_doc VARCHAR(255) NOT NULL,
        direccion VARCHAR(255) NOT NULL,
        telefono VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        created_at DATETIME2(7) DEFAULT GETDATE(),
        updated_at DATETIME2(7) DEFAULT GETDATE(),
        deleted_at DATETIME2(7) NULL
    );

GO
    -- create table ventas
    CREATE TABLE ventas (
        id INT PRIMARY KEY IDENTITY(1, 1),
        -- fk empresas id
        id_empresa INT NOT NULL,
        FOREIGN KEY (id_empresa) REFERENCES empresas(id),
        -- fk usuario id
        id_usuario INT NOT NULL,
        FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
        -- fk cliente id
        id_cliente INT NOT NULL,
        FOREIGN KEY (id_cliente) REFERENCES clientes(id),
        -- fk moneda id
        id_moneda INT NOT NULL,
        FOREIGN KEY (id_moneda) REFERENCES monedas(id),
        -- fk metodo_pago id
        id_metodo_pago INT NOT NULL,
        FOREIGN KEY (id_metodo_pago) REFERENCES metodos_pagos(id),
        -- fk tipos_pago id
        id_tipo_pago INT NOT NULL,
        FOREIGN KEY (id_tipo_pago) REFERENCES tipos_pagos(id),
        igv DECIMAL(10, 2) NOT NULL,
        total DECIMAL(10, 2) NOT NULL,
        estado INT NOT NULL,
        -- puede ser 1 o 0
        created_at DATETIME2(7) DEFAULT GETDATE(),
        updated_at DATETIME2(7) DEFAULT GETDATE(),
        deleted_at DATETIME2(7) NULL
    );

GO
    -- create table detalle_ventas
    CREATE TABLE detalle_ventas (
        id INT PRIMARY KEY IDENTITY(1, 1),
        -- fk venta id
        id_venta INT NOT NULL,
        FOREIGN KEY (id_venta) REFERENCES ventas(id),
        -- fk producto id
        id_producto INT NOT NULL,
        FOREIGN KEY (id_producto) REFERENCES productos(id),
        cantidad DECIMAL(10, 2) NOT NULL,
        precio_venta DECIMAL(10, 2) NOT NULL,
        created_at DATETIME2(7) DEFAULT GETDATE(),
        updated_at DATETIME2(7) DEFAULT GETDATE(),
        deleted_at DATETIME2(7) NULL
    );

GO
    -- Crea un índice en el campo "id" de la tabla "roles"
    CREATE INDEX idx_roles_id ON roles(id);

-- Crea un índice en el campo "nombre" de la tabla "permisos"
CREATE INDEX idx_permisos_nombre ON permisos(nombre);

-- Crea un índice en el campo "id_rol" de la tabla "asignaciones_permisos"
CREATE INDEX idx_asignaciones_permisos_id_rol ON asignaciones_permisos(id_rol);

-- Crea un índice en el campo "num_doc" de la tabla "empresas"
CREATE INDEX idx_empresas_num_doc ON empresas(num_doc);

-- Crea un índice en el campo "num_doc" de la tabla "proveedores"
CREATE INDEX idx_proveedores_num_doc ON proveedores(num_doc);

-- Crea un índice en el campo "num_doc" de la tabla "clientes"
CREATE INDEX idx_clientes_num_doc ON clientes(num_doc);

-- Crea un índice en el campo "email" de la tabla "usuarios"
CREATE INDEX idx_usuarios_email ON usuarios(email);

-- Crea un índice en el campo "nombre" de la tabla "usuarios"
CREATE INDEX idx_usuarios_nombre ON usuarios(nombre);

-- Crea un índice en el campo "nombre" de la tabla "categorias"
CREATE INDEX idx_categorias_nombre ON categorias(nombre);

-- Crea un índice en el campo "codigo" de la tabla "unidades"
CREATE INDEX idx_unidades_codigo ON unidades(codigo);

-- Crea un índice en el campo "codigo" de la tabla "productos"
CREATE INDEX idx_productos_codigo ON productos(codigo);

-- Crea un índice en el campo "id_usuario" de la tabla "ventas"
CREATE INDEX idx_ventas_id_usuario ON ventas(id_usuario);

-- Crea un índice en el campo "id_producto" de la tabla "detalles_ventas"
CREATE INDEX idx_detalles_ventas_id_producto ON detalles_ventas(id_producto);

-- Crea un índice en el campo "id_venta" de la tabla "detalles_ventas"
CREATE INDEX idx_detalles_ventas_id_venta ON detalles_ventas(id_venta);