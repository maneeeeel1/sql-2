/* Relación tipo 1:1 */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios ( 
id_usuario INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(50) NOT NULL,
 apellido VARCHAR(100) NOT NULL,
 email VARCHAR(100) NOT NULL,
 edad INT );


-- PASO 2
-- Tu código aquí
CREATE TABLE roles (
 id_rol INT AUTO_INCREMENT PRIMARY KEY,
 nombre_rol VARCHAR(50) NOT NULL
 );


-- PASO 3
-- Tu código aquí
ALTER TABLE usuarios ADD id_rol INT;
ALTER TABLE usuarios ADD FOREIGN KEY (id_rol) REFERENCES roles(id_rol);

-- PASO 4
-- Tu código aquí
SELECT 
    usuarios.id_usuario,
    usuarios.nombre,
    usuarios.apellido,
    usuarios.email,
    usuarios.edad,
    roles.nombre_rol
FROM 
    usuarios
JOIN 
    roles ON usuarios.id_rol = roles.id_rol;


/* Relación tipo 1:N */
-- PASO 1
-- Tu código aquí
CREATE TABLE categorias(
 id_categoria INT AUTO_INCREMENT PRIMARY KEY,
 nombre_categoría VARCHAR(100) NOT NULL
 );



-- PASO 2
-- Tu código aquí
ALTER TABLE usuarios ADD id_categoria INT;


-- PASO 3
-- Tu código aquí
UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (1, 5, 9, 13, 17);
UPDATE usuarios SET id_categoria = 2 WHERE id_usuario IN (2, 7, 11, 15, 20);


-- PASO 4
-- Tu código aquí

/* Relación tipo N:M */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios_categorias (
  id_usuario_categoria INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT,  id_categoria INT,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
  FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
  );



-- PASO 2
-- Tu código aquí
INSERT INTO usuarios_categorias (id_usuario, id_categoria)
 VALUES (1, 1), (1, 2), (1, 3), (2, 4), (2, 5), 
 (3, 6), (3, 7), (4, 8), (4, 9), (4, 10);


-- PASO 3
-- Tu código aquí
SELECT 
    usuarios.id_usuario,
    usuarios.nombre,
    usuarios.apellido,
    usuarios.email,
    usuarios.edad,
    roles.nombre_rol,
    categorias.nombre_categoría
FROM usuarios 
JOIN roles ON usuarios.id_rol = roles.id_rol
JOIN usuarios_categorias ON usuarios.id_usuario = usuarios_categorias.id_usuario
JOIN categorias ON usuarios_categorias.id_categoria = categorias.id_categoria;
