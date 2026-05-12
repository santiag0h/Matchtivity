-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-05-2026 a las 21:47:03
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
  `descripcion` text DEFAULT NULL,
  `Imagen` varchar(255) NOT NULL DEFAULT '../imagenes/actividad.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`id_actividad`, `nombre`, `fecha`, `fecha_finalizacion`, `maximo`, `minimo`, `lugar`, `ubicacion`, `descripcion`, `Imagen`) VALUES
(1, 'Jugar futbol', '2026-03-05 19:30:00', '2026-03-31 23:00:00', 12, 3, 'calle de ejemplo', 'coordenadas google maps', 'vamos a jugar al futbol', '../imagenes/actividad.png'),
(2, 'Monopoly', '2026-04-02 20:00:00', '2026-04-15 23:00:00', 15, 3, 'Mi casa', 'coordenadas google maps', 'vamos a jugar al monopoly', '../imagenes/actividad.png'),
(3, 'Maraton de pelis', '2026-04-12 20:00:00', '2026-04-20 22:00:00', 17, 4, 'enfrente del ayuntamiento', 'coordenadas google maps', 'vamos a ver la nueva de mario', '../imagenes/actividad.png'),
(4, 'grupo de usuario', '2026-06-13 21:00:00', '2026-07-13 02:00:00', 8, 5, 'en el centro', 'coordenadas google maps', 'Texto largo de ejemplo', '../imagenes/actividad.png'),
(5, 'quedada de chill', '2026-04-12 10:00:00', '2026-04-12 15:00:00', 9, 5, 'en el parque', 'coordenadas google maps', 'vamos al parque de chill', '../imagenes/actividad.png'),
(6, 'Cena Italiana', '2026-05-01 21:00:00', '2026-05-01 23:30:00', 6, 2, 'Restaurante Luigi', 'coords', 'Cena de pasta', '../imagenes/actividad.png'),
(7, 'Senderismo', '2026-05-10 08:00:00', '2026-05-10 16:00:00', 20, 5, 'Montaña Norte', 'coords', 'Ruta de 15km', '../imagenes/actividad.png'),
(8, 'Torneo Padel', '2026-05-15 17:00:00', '2026-05-15 21:00:00', 4, 4, 'Polideportivo', 'coords', 'Padel nivel medio', '../imagenes/actividad.png'),
(9, 'Escape Room', '2026-05-20 18:00:00', '2026-05-20 20:00:00', 6, 4, 'The Box', 'coords', 'A salir a tiempo', '../imagenes/actividad.png'),
(10, 'Clase de Yoga', '2026-06-01 09:00:00', '2026-06-01 10:30:00', 15, 2, 'Gimnasio Sol', 'coords', 'Relajación', '../imagenes/actividad.png'),
(11, 'Intercambio Idiomas', '2026-06-05 19:00:00', '2026-06-05 21:00:00', 30, 5, 'Pub El Cruce', 'coords', 'English exchange', '../imagenes/actividad.png'),
(12, 'Tarde de Bolos', '2026-06-10 18:30:00', '2026-06-10 21:00:00', 10, 4, 'Bowling Center', 'coords', 'Strikes', '../imagenes/actividad.png'),
(13, 'Barbacoa Verano', '2026-07-04 13:00:00', '2026-07-04 20:00:00', 25, 8, 'Finca El Olivo', 'coords', 'Piscina y carne', '../imagenes/actividad.png'),
(14, 'Concierto Rock', '2026-07-15 22:00:00', '2026-07-16 01:00:00', 100, 10, 'Estadio', 'coords', 'Festival rock', '../imagenes/actividad.png'),
(15, 'Gaming Night', '2026-07-20 20:00:00', '2026-07-21 02:00:00', 5, 2, 'Casa de Marcos', 'coords', 'Pizzas y juegos', '../imagenes/actividad.png'),
(16, 'Visita Museo', '2026-08-05 11:00:00', '2026-08-05 14:00:00', 10, 2, 'Museo Arte', 'coords', 'Arte moderno', '../imagenes/actividad.png'),
(17, 'Karts', '2026-08-12 17:00:00', '2026-08-12 19:00:00', 8, 4, 'Karting Pro', 'coords', 'Carrera karts', '../imagenes/actividad.png'),
(18, 'Cata de Vinos', '2026-09-01 20:00:00', '2026-09-01 23:00:00', 12, 6, 'Bodega', 'coords', 'Vinos tintos', '../imagenes/actividad.png'),
(19, 'Taller Cocina', '2026-09-15 18:00:00', '2026-09-15 21:00:00', 8, 4, 'Kitchen Studio', 'coords', 'Hacer sushi', '../imagenes/actividad.png'),
(20, 'Basket 3x3', '2026-09-20 18:00:00', '2026-09-20 20:00:00', 6, 6, 'Canchas Barrio', 'coords', 'Baloncesto', '../imagenes/actividad.png');

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

--
-- Volcado de datos para la tabla `integrantes`
--

INSERT INTO `integrantes` (`id_integrantes`, `id_actividad`, `id_usuario`, `tipo`, `estado`) VALUES
(25, 1, 1, 0, ''),
(26, 1, 4, 0, 'Aprobado'),
(27, 2, 2, 0, ''),
(28, 2, 5, 0, 'Aprobado'),
(29, 3, 3, 0, ''),
(30, 3, 4, 0, 'Aprobado'),
(31, 4, 5, 0, ''),
(32, 4, 8, 0, 'Pendiente'),
(33, 5, 10, 0, ''),
(34, 6, 12, 0, ''),
(35, 7, 14, 0, ''),
(36, 8, 17, 0, ''),
(37, 9, 19, 0, ''),
(38, 10, 21, 0, ''),
(39, 11, 23, 0, ''),
(40, 12, 26, 0, ''),
(41, 13, 28, 0, ''),
(42, 14, 31, 0, ''),
(43, 15, 33, 0, ''),
(44, 16, 35, 0, ''),
(45, 17, 37, 0, ''),
(46, 18, 39, 0, ''),
(47, 19, 1, 0, ''),
(48, 20, 3, 0, ''),
(49, 1, 1, 1, ''),
(50, 1, 4, 0, 'Aprobado'),
(51, 2, 2, 1, 'Creador'),
(52, 2, 5, 0, 'Aprobado'),
(53, 3, 3, 1, 'Creador'),
(54, 3, 4, 0, 'Aprobado'),
(55, 4, 5, 1, 'Creador'),
(56, 4, 8, 0, 'Pendiente'),
(57, 5, 10, 1, 'Creador'),
(58, 6, 12, 1, 'Creador'),
(59, 7, 14, 1, 'Creador'),
(60, 8, 17, 1, 'Creador'),
(61, 9, 19, 1, 'Creador'),
(62, 10, 21, 1, 'Creador'),
(63, 11, 23, 1, 'Creador'),
(64, 12, 26, 1, 'Creador'),
(65, 13, 28, 1, 'Creador'),
(66, 14, 31, 1, 'Creador'),
(67, 15, 33, 1, 'Creador'),
(68, 16, 35, 1, 'Creador'),
(69, 17, 37, 1, 'Creador'),
(70, 18, 39, 1, 'Creador'),
(71, 19, 1, 1, 'Creador'),
(72, 20, 3, 1, 'Creador');

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
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `correo`, `contrasena`, `ban_cuenta`, `foto`, `tipo_cuenta`) VALUES
(1, 'User1', 'Correo1@gmail.com', '1234', 0, '../imagenes/default', 'admin'),
(2, 'Ramon', 'Ramon@gmail.com', 'la mejor contraseña', 0, '../imagenes/default', 'normal'),
(3, 'Laura', 'Laura@gmail.com', '3456', 0, '../imagenes/default', 'normal'),
(4, 'Juan', 'Messilover@gmail.com', 'Contraseña', 0, '../imagenes/default', 'normal'),
(5, 'Pepe', 'jamon@gmail.com', 'pepe_jamon', 0, '../imagenes/default', 'normal'),
(6, 'Maria', 'maria6@gmail.com', 'pass6', 0, '../imagenes/default', 'normal'),
(7, 'Carlos', 'carlos7@gmail.com', 'pass7', 0, '../imagenes/default', 'normal'),
(8, 'Elena', 'elena8@gmail.com', 'pass8', 0, '../imagenes/default', 'normal'),
(9, 'Pablo', 'pablo9@gmail.com', 'pass9', 0, '../imagenes/default', 'normal'),
(10, 'Lucia', 'lucia10@gmail.com', 'pass10', 0, '../imagenes/default', 'normal'),
(11, 'Andres', 'andres11@gmail.com', 'pass11', 0, '../imagenes/default', 'normal'),
(12, 'Sofia', 'sofia12@gmail.com', 'pass12', 0, '../imagenes/default', 'normal'),
(13, 'Diego', 'diego13@gmail.com', 'pass13', 0, '../imagenes/default', 'normal'),
(14, 'Marta', 'marta14@gmail.com', 'pass14', 0, '../imagenes/default', 'normal'),
(15, 'Jorge', 'jorge15@gmail.com', 'pass15', 0, '../imagenes/default', 'normal'),
(16, 'Julia', 'julia16@gmail.com', 'pass16', 0, '../imagenes/default', 'normal'),
(17, 'Marcos', 'marcos17@gmail.com', 'pass17', 0, '../imagenes/default', 'normal'),
(18, 'Alba', 'alba18@gmail.com', 'pass18', 0, '../imagenes/default', 'normal'),
(19, 'Raul', 'raul19@gmail.com', 'pass19', 0, '../imagenes/default', 'normal'),
(20, 'Sara', 'sara20@gmail.com', 'pass20', 0, '../imagenes/default', 'normal'),
(21, 'Ivan', 'ivan21@gmail.com', 'pass21', 0, '../imagenes/default', 'normal'),
(22, 'Paula', 'paula22@gmail.com', 'pass22', 0, '../imagenes/default', 'normal'),
(23, 'Ruben', 'ruben23@gmail.com', 'pass23', 0, '../imagenes/default', 'normal'),
(24, 'Carla', 'carla24@gmail.com', 'pass24', 0, '../imagenes/default', 'normal'),
(25, 'Luis', 'luis25@gmail.com', 'pass25', 0, '../imagenes/default', 'normal'),
(26, 'Nerea', 'nerea26@gmail.com', 'pass26', 0, '../imagenes/default', 'normal'),
(27, 'Victor', 'victor27@gmail.com', 'pass27', 0, '../imagenes/default', 'normal'),
(28, 'Irene', 'irene28@gmail.com', 'pass28', 0, '../imagenes/default', 'normal'),
(29, 'Oscar', 'oscar29@gmail.com', 'pass29', 0, '../imagenes/default', 'normal'),
(30, 'Silvia', 'silvia30@gmail.com', 'pass30', 0, '../imagenes/default', 'normal'),
(31, 'Fran', 'fran31@gmail.com', 'pass31', 0, '../imagenes/default', 'normal'),
(32, 'Angela', 'angela32@gmail.com', 'pass32', 0, '../imagenes/default', 'normal'),
(33, 'Hugo', 'hugo33@gmail.com', 'pass33', 0, '../imagenes/default', 'normal'),
(34, 'Clara', 'clara34@gmail.com', 'pass34', 0, '../imagenes/default', 'normal'),
(35, 'Adrian', 'adrian35@gmail.com', 'pass35', 0, '../imagenes/default', 'normal'),
(36, 'Rocio', 'rocio36@gmail.com', 'pass36', 0, '../imagenes/default', 'normal'),
(37, 'Mario', 'mario37@gmail.com', 'pass37', 0, '../imagenes/default', 'normal'),
(38, 'Alicia', 'alicia38@gmail.com', 'pass38', 0, '../imagenes/default', 'normal'),
(39, 'Toni', 'toni39@gmail.com', 'pass39', 0, '../imagenes/default', 'normal'),
(40, 'Bea', 'bea40@gmail.com', 'pass40', 0, '../imagenes/default', 'normal'),
(41, 'User1', 'Correo1@gmail.com', '1234', 0, '../imagenes/default', 'admin'),
(42, 'Ramon', 'Ramon@gmail.com', 'la mejor contraseña', 1, '../imagenes/default', 'normal'),
(43, 'Laura', 'Laura@gmail.com', '3456', 0, '../imagenes/default', 'normal'),
(44, 'Juan', 'Messilover@gmail.com', 'Contraseña', 0, '../imagenes/default', 'normal'),
(45, 'Pepe', 'jamon@gmail.com', 'pepe_jamon', 0, '../imagenes/default', 'normal'),
(46, 'Maria', 'maria6@gmail.com', 'pass6', 0, '../imagenes/default', 'normal'),
(47, 'Carlos', 'carlos7@gmail.com', 'pass7', 0, '../imagenes/default', 'normal'),
(48, 'Elena', 'elena8@gmail.com', 'pass8', 0, '../imagenes/default', 'normal'),
(49, 'Pablo', 'pablo9@gmail.com', 'pass9', 0, '../imagenes/default', 'normal'),
(50, 'Lucia', 'lucia10@gmail.com', 'pass10', 0, '../imagenes/default', 'normal'),
(51, 'Andres', 'andres11@gmail.com', 'pass11', 0, '../imagenes/default', 'normal'),
(52, 'Sofia', 'sofia12@gmail.com', 'pass12', 0, '../imagenes/default', 'normal'),
(53, 'Diego', 'diego13@gmail.com', 'pass13', 0, '../imagenes/default', 'normal'),
(54, 'Marta', 'marta14@gmail.com', 'pass14', 0, '../imagenes/default', 'normal'),
(55, 'Jorge', 'jorge15@gmail.com', 'pass15', 0, '../imagenes/default', 'normal'),
(56, 'Julia', 'julia16@gmail.com', 'pass16', 0, '../imagenes/default', 'normal'),
(57, 'Marcos', 'marcos17@gmail.com', 'pass17', 0, '../imagenes/default', 'normal'),
(58, 'Alba', 'alba18@gmail.com', 'pass18', 0, '../imagenes/default', 'normal'),
(59, 'Raul', 'raul19@gmail.com', 'pass19', 0, '../imagenes/default', 'normal'),
(60, 'Sara', 'sara20@gmail.com', 'pass20', 0, '../imagenes/default', 'normal'),
(61, 'Ivan', 'ivan21@gmail.com', 'pass21', 0, '../imagenes/default', 'normal'),
(62, 'Paula', 'paula22@gmail.com', 'pass22', 0, '../imagenes/default', 'normal'),
(63, 'Ruben', 'ruben23@gmail.com', 'pass23', 0, '../imagenes/default', 'normal'),
(64, 'Carla', 'carla24@gmail.com', 'pass24', 0, '../imagenes/default', 'normal'),
(65, 'Luis', 'luis25@gmail.com', 'pass25', 0, '../imagenes/default', 'normal'),
(66, 'Nerea', 'nerea26@gmail.com', 'pass26', 0, '../imagenes/default', 'normal'),
(67, 'Victor', 'victor27@gmail.com', 'pass27', 0, '../imagenes/default', 'normal'),
(68, 'Irene', 'irene28@gmail.com', 'pass28', 0, '../imagenes/default', 'normal'),
(69, 'Oscar', 'oscar29@gmail.com', 'pass29', 0, '../imagenes/default', 'normal'),
(70, 'Silvia', 'silvia30@gmail.com', 'pass30', 0, '../imagenes/default', 'normal'),
(71, 'Fran', 'fran31@gmail.com', 'pass31', 0, '../imagenes/default', 'normal'),
(72, 'Angela', 'angela32@gmail.com', 'pass32', 0, '../imagenes/default', 'normal'),
(73, 'Hugo', 'hugo33@gmail.com', 'pass33', 0, '../imagenes/default', 'normal'),
(74, 'Clara', 'clara34@gmail.com', 'pass34', 0, '../imagenes/default', 'normal'),
(75, 'Adrian', 'adrian35@gmail.com', 'pass35', 0, '../imagenes/default', 'normal'),
(76, 'Rocio', 'rocio36@gmail.com', 'pass36', 0, '../imagenes/default', 'normal'),
(77, 'Mario', 'mario37@gmail.com', 'pass37', 0, '../imagenes/default', 'normal'),
(78, 'Alicia', 'alicia38@gmail.com', 'pass38', 0, '../imagenes/default', 'normal'),
(79, 'Toni', 'toni39@gmail.com', 'pass39', 0, '../imagenes/default', 'normal'),
(80, 'Bea', 'bea40@gmail.com', 'pass40', 0, '../imagenes/default', 'normal');

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
  MODIFY `id_actividad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  MODIFY `id_integrantes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

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
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

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
