-- usamos la base de datos "BD_SistemaVentas_e_Inventario"
USE BD_SistemaVentas_e_Inventario;
GO
-- Inserta datos de prueba en la tabla "roles"
INSERT INTO
    roles (nombre, descripcion)
VALUES
    (
        'administrador',
        'Rol con permisos de administrador'
    );

INSERT INTO
    roles (nombre, descripcion)
VALUES
    ('vendedor', 'Rol con permisos de vendedor');

-- Inserta datos de prueba en la tabla "permisos"
INSERT INTO
    permisos (nombre, descripcion)
VALUES
    (
        'ver_productos',
        'Permiso para ver los productos del inventario'
    );

INSERT INTO
    permisos (nombre, descripcion)
VALUES
    ('crear_ventas', 'Permiso para crear ventas');

-- Inserta datos de prueba en la tabla "asignaciones_permisos"
INSERT INTO
    asignaciones_permisos (id_rol, id_permiso)
VALUES
    (1, 1);

INSERT INTO
    asignaciones_permisos (id_rol, id_permiso)
VALUES
    (1, 2);

-- Inserta datos de prueba en la tabla "empresas"
INSERT INTO
    empresas (nombre, num_doc, direccion, telefono, email)
VALUES
    (
        'Empresa 1',
        '12345678',
        'Dirección 1',
        '123456789',
        'empresa1@gmail.com'
    );

-- Inserta datos de prueba en la tabla "usuarios"
INSERT INTO
    usuarios (nombre, apellido, email, password)
VALUES
    (
        'Usuario',
        '1',
        'usuario1@gmail.com',
        'password1'
    );

INSERT INTO
    usuarios (nombre, apellido, email, password)
VALUES
    (
        'Usuario',
        '2',
        'usuario2@gmail.com',
        'password2'
    );

-- Inserta datos de prueba en la tabla "unidades"
INSERT INTO
    unidades (codigo, descripcion)
VALUES
    ('unidad1', 'Unidad 1');

INSERT INTO
    unidades (codigo, descripcion)
VALUES
    ('unidad2', 'Unidad 2');

-- Inserta datos de prueba en la tabla "tipos_productos"
INSERT INTO
    tipos_productos (nombre)
VALUES
    ('tipo1');

INSERT INTO
    tipos_productos (nombre)
VALUES
    ('tipo2');

-- Inserta datos de prueba en la tabla "productos"
INSERT INTO
    productos (
        codigo,
        nombre,
        descripcion,
        precio,
        stock,
        id_tipo_producto,
        id_unidad,
        id_empresa
    )
VALUES
    (
        'producto1',
        'Producto 1',
        'Descripción 1',
        10.5,
        100,
        1,
        1,
        1
    );

INSERT INTO
    productos (
        codigo,
        nombre,
        descripcion,
        precio,
        stock,
        id_tipo_producto,
        id_unidad,
        id_empresa
    )
VALUES
    (
        'producto2',
        'Producto 2',
        'Descripción 2',
        15.75,
        200,
        2,
        2,
        2
    );