-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-05-2019 a las 17:10:45
-- Versión del servidor: 10.1.39-MariaDB
-- Versión de PHP: 7.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `control_vehicular`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnostico`
--

CREATE TABLE `diagnostico` (
  `id_diagnostico` int(5) NOT NULL,
  `id_empleado` int(5) NOT NULL,
  `id_vehiculo` int(5) NOT NULL,
  `fecha` date NOT NULL,
  `observaciones` varchar(300) NOT NULL,
  `necesario` varchar(20) NOT NULL,
  `id_taller` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empledos`
--

CREATE TABLE `empledos` (
  `id_empleado` int(5) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `edad` int(2) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `puesto` varchar(20) NOT NULL,
  `rol` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `realizar_servicio`
--

CREATE TABLE `realizar_servicio` (
  `id_diagnostico` int(5) NOT NULL,
  `id_empleado` int(5) NOT NULL,
  `id_vehiculo` int(5) NOT NULL,
  `id_servicio` int(5) NOT NULL,
  `fecha` date NOT NULL,
  `observaciones` varchar(300) NOT NULL,
  `id_taller` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL,
  `aceite` varchar(100) NOT NULL,
  `frenos` varchar(100) NOT NULL,
  `bugías` varchar(100) NOT NULL,
  `electronica` varchar(100) NOT NULL,
  `lavado_motor` varchar(100) NOT NULL,
  `alineacion_y_balanceo` varchar(100) NOT NULL,
  `filtro` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tallrt`
--

CREATE TABLE `tallrt` (
  `id_taller` int(5) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `horario` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id_vehiculo` int(5) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `bateria` varchar(50) NOT NULL,
  `cristales` varchar(50) NOT NULL,
  `parabrisas` varchar(50) NOT NULL,
  `medallon` varchar(50) NOT NULL,
  `espejos` varchar(50) NOT NULL,
  `limpiadores` varchar(50) NOT NULL,
  `refaccion` varchar(50) NOT NULL,
  `polveras` varchar(50) NOT NULL,
  `encendedor` varchar(50) NOT NULL,
  `tapetes` varchar(50) NOT NULL,
  `radio` varchar(50) NOT NULL,
  `antena_frecuendia` varchar(50) NOT NULL,
  `antena_musical` varchar(50) NOT NULL,
  `sirena` varchar(50) NOT NULL,
  `burbuja` varchar(50) NOT NULL,
  `radio_frecuencia` varchar(50) NOT NULL,
  `gato` varchar(50) NOT NULL,
  `cruceta` varchar(50) NOT NULL,
  `extinguidor` varchar(50) NOT NULL,
  `kilometraje` varchar(50) NOT NULL,
  `comentarios` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD PRIMARY KEY (`id_diagnostico`),
  ADD KEY `id_empleado` (`id_empleado`),
  ADD KEY `id_vehiculo` (`id_vehiculo`),
  ADD KEY `id_taller` (`id_taller`);

--
-- Indices de la tabla `empledos`
--
ALTER TABLE `empledos`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `realizar_servicio`
--
ALTER TABLE `realizar_servicio`
  ADD PRIMARY KEY (`id_diagnostico`),
  ADD KEY `id_empleado` (`id_empleado`),
  ADD KEY `id_vehiculo` (`id_vehiculo`),
  ADD KEY `id_servicio` (`id_servicio`),
  ADD KEY `id_taller` (`id_taller`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `tallrt`
--
ALTER TABLE `tallrt`
  ADD PRIMARY KEY (`id_taller`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id_vehiculo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  MODIFY `id_diagnostico` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empledos`
--
ALTER TABLE `empledos`
  MODIFY `id_empleado` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `realizar_servicio`
--
ALTER TABLE `realizar_servicio`
  MODIFY `id_diagnostico` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tallrt`
--
ALTER TABLE `tallrt`
  MODIFY `id_taller` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `id_vehiculo` int(5) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD CONSTRAINT `diagnostico_ibfk_1` FOREIGN KEY (`id_taller`) REFERENCES `tallrt` (`id_taller`),
  ADD CONSTRAINT `diagnostico_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empledos` (`id_empleado`),
  ADD CONSTRAINT `diagnostico_ibfk_3` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`);

--
-- Filtros para la tabla `realizar_servicio`
--
ALTER TABLE `realizar_servicio`
  ADD CONSTRAINT `realizar_servicio_ibfk_1` FOREIGN KEY (`id_taller`) REFERENCES `tallrt` (`id_taller`),
  ADD CONSTRAINT `realizar_servicio_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empledos` (`id_empleado`),
  ADD CONSTRAINT `realizar_servicio_ibfk_3` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`),
  ADD CONSTRAINT `realizar_servicio_ibfk_4` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
