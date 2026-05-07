-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-04-2026 a las 23:28:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `matchtivity`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `id_actividad` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha` datetime NOT NULL,
  `fecha_finalizacion` datetime NOT NULL,
  `maximo` int(11) NOT NULL,
  `minimo` int(11) NOT NULL,
  `lugar` varchar(200) NOT NULL,
  `ubicacion` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad_etiqueta`
--

CREATE TABLE `actividad_etiqueta` (
  `Id_actividad_etiqueta` int(11) NOT NULL,
  `id_actividad` int(11) NOT NULL,
  `id_etiqueta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiqueta`
--

CREATE TABLE `etiqueta` (
  `id_etiqueta` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `integrantes`
--

CREATE TABLE `integrantes` (
  `id_integrantes` int(11) NOT NULL,
  `id_actividad` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `tipo` tinyint(1) NOT NULL DEFAULT 0,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE `mensaje` (
  `id_mensaje` int(11) NOT NULL,
  `id_actividad` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha_envio` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE `reporte` (
  `id_reporte` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_actividad` int(11) NOT NULL,
  `motivo` varchar(100) NOT NULL,
  `mensaje` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `ban_cuenta` tinyint(1) NOT NULL DEFAULT 0,
  `foto` varchar(255) NOT NULL,
  `tipo_cuenta` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`id_actividad`);

--
-- Indices de la tabla `actividad_etiqueta`
--
ALTER TABLE `actividad_etiqueta`
  ADD PRIMARY KEY (`Id_actividad_etiqueta`),
  ADD KEY `id_actividad` (`id_actividad`),
  ADD KEY `id_etiqueta` (`id_etiqueta`);

--
-- Indices de la tabla `etiqueta`
--
ALTER TABLE `etiqueta`
  ADD PRIMARY KEY (`id_etiqueta`);

--
-- Indices de la tabla `integrantes`
--
ALTER TABLE `integrantes`
  ADD PRIMARY KEY (`id_integrantes`),
  ADD KEY `id_actividad` (`id_actividad`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`id_mensaje`),
  ADD KEY `id_actividad` (`id_actividad`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`id_reporte`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_Actividad` (`id_actividad`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `id_actividad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `actividad_etiqueta`
--
ALTER TABLE `actividad_etiqueta`
  MODIFY `Id_actividad_etiqueta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `etiqueta`
--
ALTER TABLE `etiqueta`
  MODIFY `id_etiqueta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `integrantes`
--
ALTER TABLE `integrantes`
  MODIFY `id_integrantes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  MODIFY `id_mensaje` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte`
--
ALTER TABLE `reporte`
  MODIFY `id_reporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad_etiqueta`
--
ALTER TABLE `actividad_etiqueta`
  ADD CONSTRAINT `actividad_etiqueta_ibfk_1` FOREIGN KEY (`id_actividad`) REFERENCES `actividad` (`id_actividad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `actividad_etiqueta_ibfk_2` FOREIGN KEY (`id_etiqueta`) REFERENCES `etiqueta` (`id_etiqueta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `integrantes`
--
ALTER TABLE `integrantes`
  ADD CONSTRAINT `integrantes_ibfk_1` FOREIGN KEY (`id_actividad`) REFERENCES `actividad` (`id_actividad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `integrantes_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD CONSTRAINT `mensaje_ibfk_1` FOREIGN KEY (`id_actividad`) REFERENCES `actividad` (`id_actividad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mensaje_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD CONSTRAINT `reporte_ibfk_1` FOREIGN KEY (`id_actividad`) REFERENCES `actividad` (`id_actividad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reporte_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
---
--- DATOS DE EJEMPLO: 40 USUARIOS
---
INSERT INTO usuarios (usuarioNombre, correo, contrasena, Ban, cuentaFoto, tipo_de_cuenta) VALUES
('User1', 'Correo1@gmail.com', '1234', 'NO', '../imagenes/default', 'admin'),
('Ramon', 'Ramon@gmail.com', 'la mejor contraseña', 'SI', '../imagenes/default', 'normal'),
('Laura', 'Laura@gmail.com', '3456', 'NO', '../imagenes/default', 'normal'),
('Juan', 'Messilover@gmail.com', 'Contraseña', 'NO', '../imagenes/default', 'normal'),
('Pepe', 'jamon@gmail.com', 'pepe_jamon', 'NO', '../imagenes/default', 'normal'),
('Maria', 'maria6@gmail.com', 'pass6', 'NO', '../imagenes/default', 'normal'),
('Carlos', 'carlos7@gmail.com', 'pass7', 'NO', '../imagenes/default', 'normal'),
('Elena', 'elena8@gmail.com', 'pass8', 'NO', '../imagenes/default', 'normal'),
('Pablo', 'pablo9@gmail.com', 'pass9', 'NO', '../imagenes/default', 'normal'),
('Lucia', 'lucia10@gmail.com', 'pass10', 'NO', '../imagenes/default', 'normal'),
('Andres', 'andres11@gmail.com', 'pass11', 'NO', '../imagenes/default', 'normal'),
('Sofia', 'sofia12@gmail.com', 'pass12', 'NO', '../imagenes/default', 'normal'),
('Diego', 'diego13@gmail.com', 'pass13', 'NO', '../imagenes/default', 'normal'),
('Marta', 'marta14@gmail.com', 'pass14', 'NO', '../imagenes/default', 'normal'),
('Jorge', 'jorge15@gmail.com', 'pass15', 'NO', '../imagenes/default', 'normal'),
('Julia', 'julia16@gmail.com', 'pass16', 'NO', '../imagenes/default', 'normal'),
('Marcos', 'marcos17@gmail.com', 'pass17', 'NO', '../imagenes/default', 'normal'),
('Alba', 'alba18@gmail.com', 'pass18', 'NO', '../imagenes/default', 'normal'),
('Raul', 'raul19@gmail.com', 'pass19', 'NO', '../imagenes/default', 'normal'),
('Sara', 'sara20@gmail.com', 'pass20', 'NO', '../imagenes/default', 'normal'),
('Ivan', 'ivan21@gmail.com', 'pass21', 'NO', '../imagenes/default', 'normal'),
('Paula', 'paula22@gmail.com', 'pass22', 'NO', '../imagenes/default', 'normal'),
('Ruben', 'ruben23@gmail.com', 'pass23', 'NO', '../imagenes/default', 'normal'),
('Carla', 'carla24@gmail.com', 'pass24', 'NO', '../imagenes/default', 'normal'),
('Luis', 'luis25@gmail.com', 'pass25', 'NO', '../imagenes/default', 'normal'),
('Nerea', 'nerea26@gmail.com', 'pass26', 'NO', '../imagenes/default', 'normal'),
('Victor', 'victor27@gmail.com', 'pass27', 'NO', '../imagenes/default', 'normal'),
('Irene', 'irene28@gmail.com', 'pass28', 'NO', '../imagenes/default', 'normal'),
('Oscar', 'oscar29@gmail.com', 'pass29', 'NO', '../imagenes/default', 'normal'),
('Silvia', 'silvia30@gmail.com', 'pass30', 'NO', '../imagenes/default', 'normal'),
('Fran', 'fran31@gmail.com', 'pass31', 'NO', '../imagenes/default', 'normal'),
('Angela', 'angela32@gmail.com', 'pass32', 'NO', '../imagenes/default', 'normal'),
('Hugo', 'hugo33@gmail.com', 'pass33', 'NO', '../imagenes/default', 'normal'),
('Clara', 'clara34@gmail.com', 'pass34', 'NO', '../imagenes/default', 'normal'),
('Adrian', 'adrian35@gmail.com', 'pass35', 'NO', '../imagenes/default', 'normal'),
('Rocio', 'rocio36@gmail.com', 'pass36', 'NO', '../imagenes/default', 'normal'),
('Mario', 'mario37@gmail.com', 'pass37', 'NO', '../imagenes/default', 'normal'),
('Alicia', 'alicia38@gmail.com', 'pass38', 'NO', '../imagenes/default', 'normal'),
('Toni', 'toni39@gmail.com', 'pass39', 'NO', '../imagenes/default', 'normal'),
('Bea', 'bea40@gmail.com', 'pass40', 'NO', '../imagenes/default', 'normal');

---
--- DATOS DE EJEMPLO: 20 ACTIVIDADES
---
INSERT INTO actividades (actividadNombre, fecha, fecha_finalizacion, Maximo, Minimo, Lugar, Ubicacion, descripcion) VALUES
('Jugar futbol', '2026-03-05 19:30:00', '2026-03-31 23:00:00', 12, 3, 'calle de ejemplo', 'coordenadas google maps', 'vamos a jugar al futbol'),
('Monopoly', '2026-04-02 20:00:00', '2026-04-15 23:00:00', 15, 3, 'Mi casa', 'coordenadas google maps', 'vamos a jugar al monopoly'),
('Maraton de pelis', '2026-04-12 20:00:00', '2026-04-20 22:00:00', 17, 4, 'enfrente del ayuntamiento', 'coordenadas google maps', 'vamos a ver la nueva de mario'),
('grupo de usuario', '2026-06-13 21:00:00', '2026-07-13 02:00:00', 8, 5, 'en el centro', 'coordenadas google maps', 'Texto que es muy largo y me sirve de ejeplo para acordarme de que esto puede llegar a tener un monton de caracteres'),
('quedada de chill', '2026-04-12 10:00:00', '2026-04-12 15:00:00', 9, 5, 'en el parque', 'coordenadas google maps', 'vamos al parque un buen rato de chill'),
('Cena Italiana', '2026-05-01 21:00:00', '2026-05-01 23:30:00', 6, 2, 'Restaurante Luigi', 'coordenadas google maps', 'Cena para probar la mejor pasta de la ciudad'),
('Senderismo', '2026-05-10 08:00:00', '2026-05-10 16:00:00', 20, 5, 'Montaña Norte', 'coordenadas google maps', 'Ruta de 15km por la sierra'),
('Torneo Padel', '2026-05-15 17:00:00', '2026-05-15 21:00:00', 4, 4, 'Polideportivo', 'coordenadas google maps', 'Partida rápida de padel nivel medio'),
('Escape Room', '2026-05-20 18:00:00', '2026-05-20 20:00:00', 6, 4, 'The Box', 'coordenadas google maps', 'A ver si conseguimos salir a tiempo'),
('Clase de Yoga', '2026-06-01 09:00:00', '2026-06-01 10:30:00', 15, 2, 'Gimnasio Sol', 'coordenadas google maps', 'Sesión de relajación matutina'),
('Intercambio Idiomas', '2026-06-05 19:00:00', '2026-06-05 21:00:00', 30, 5, 'Pub El Cruce', 'coordenadas google maps', 'English and Spanish exchange over some drinks'),
('Tarde de Bolos', '2026-06-10 18:30:00', '2026-06-10 21:00:00', 10, 4, 'Bowling Center', 'coordenadas google maps', 'A ver quién hace más strikes'),
('Barbacoa Verano', '2026-07-04 13:00:00', '2026-07-04 20:00:00', 25, 8, 'Finca El Olivo', 'coordenadas google maps', 'Piscina y carne a la brasa'),
('Concierto Rock', '2026-07-15 22:00:00', '2026-07-16 01:00:00', 100, 10, 'Estadio Municipal', 'coordenadas google maps', 'Entradas ya compradas para el festival'),
('Gaming Night', '2026-07-20 20:00:00', '2026-07-21 02:00:00', 5, 2, 'Casa de Marcos', 'coordenadas google maps', 'Noche de shooters y pizzas'),
('Visita Museo', '2026-08-05 11:00:00', '2026-08-05 14:00:00', 10, 2, 'Museo de Arte', 'coordenadas google maps', 'Exposición temporal de pintura moderna'),
('Karts', '2026-08-12 17:00:00', '2026-08-12 19:00:00', 8, 4, 'Karting Pro', 'coordenadas google maps', 'Carrera por el campeonato del grupo'),
('Cata de Vinos', '2026-09-01 20:00:00', '2026-09-01 23:00:00', 12, 6, 'Bodega Antigua', 'coordenadas google maps', 'Degustación de 5 vinos tintos'),
('Taller Cocina', '2026-09-15 18:00:00', '2026-09-15 21:00:00', 8, 4, 'Kitchen Studio', 'coordenadas google maps', 'Aprendiendo a hacer sushi desde cero'),
('Basket 3x3', '2026-09-20 18:00:00', '2026-09-20 20:00:00', 6, 6, 'Canchas Barrio', 'coordenadas google maps', 'Pachanga de baloncesto');

---
--- DATOS DE EJEMPLO: INTEGRANTES (RELACIONES)
---
INSERT INTO integrantes (id_actividad, id_Usuario, tipo, estado) VALUES
-- Actividad 1 (Futbol)
(1, 4, 'no-creador', 'pendiente'),
(1, 1, 'creador', NULL),
(1, 6, 'no-creador', 'Aprobado'),
-- Actividad 2 (Monopoly)
(2, 2, 'creador', NULL),
(2, 5, 'no-creador', 'Aprobado'),
(2, 3, 'no-creador', 'expulsado'),
-- Actividad 3 (Pelis)
(3, 4, 'no-creador', 'Aprobado'),
(3, 3, 'creador', NULL),
(3, 7, 'no-creador', 'Aprobado'),
-- Actividad 4 (Grupo Usuario)
(4, 5, 'creador', NULL),
(4, 8, 'no-creador', 'Aprobado'),
(4, 9, 'no-creador', 'Pendiente'),
-- Actividad 5 (Chill)
(5, 10, 'creador', NULL),
(5, 11, 'no-creador', 'Aprobado'),
-- Actividades restantes con diversos usuarios
(6, 12, 'creador', NULL), (6, 13, 'no-creador', 'Aprobado'),
(7, 14, 'creador', NULL), (7, 15, 'no-creador', 'Aprobado'), (7, 16, 'no-creador', 'Aprobado'),
(8, 17, 'creador', NULL), (8, 18, 'no-creador', 'Aprobado'),
(9, 19, 'creador', NULL), (9, 20, 'no-creador', 'Pendiente'),
(10, 21, 'creador', NULL), (10, 22, 'no-creador', 'Aprobado'),
(11, 23, 'creador', NULL), (11, 24, 'no-creador', 'Aprobado'), (11, 25, 'no-creador', 'Pendiente'),
(12, 26, 'creador', NULL), (12, 27, 'no-creador', 'Aprobado'),
(13, 28, 'creador', NULL), (13, 29, 'no-creador', 'Aprobado'), (13, 30, 'no-creador', 'Aprobado'),
(14, 31, 'creador', NULL), (14, 32, 'no-creador', 'Aprobado'),
(15, 33, 'creador', NULL), (15, 34, 'no-creador', 'Aprobado'),
(16, 35, 'creador', NULL), (16, 36, 'no-creador', 'Aprobado'),
(17, 37, 'creador', NULL), (17, 38, 'no-creador', 'Pendiente'),
(18, 39, 'creador', NULL), (18, 40, 'no-creador', 'Aprobado'),
(19, 1, 'creador', NULL), (19, 2, 'no-creador', 'Aprobado'),
(20, 3, 'creador', NULL), (20, 4, 'no-creador', 'Aprobado');