-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-02-2021 a las 22:08:52
-- Versión del servidor: 5.6.26
-- Versión de PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `automoviles`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `dni` smallint(6) NOT NULL,
  `nombre` char(10) DEFAULT NULL,
  `apellido` char(10) DEFAULT NULL,
  `ciudad` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`dni`, `nombre`, `apellido`, `ciudad`) VALUES
(1, 'Luis', 'Garcia', 'Madrid'),
(2, 'Antonio', 'Lopez', 'Valencia'),
(3, 'Juan', 'Martin', 'Madrid'),
(4, 'Maria', 'Garcia', 'Madrid'),
(5, 'Javier', 'Gonzalez', 'Barcelona'),
(6, 'Ana', 'Lopez', 'Barcelona');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coches`
--

CREATE TABLE IF NOT EXISTS `coches` (
  `codcoche` smallint(6) NOT NULL,
  `nombre` char(10) NOT NULL,
  `modelo` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `coches`
--

INSERT INTO `coches` (`codcoche`, `nombre`, `modelo`) VALUES
(1, 'Ibiza', 'glx'),
(2, 'Ibiza', 'gti'),
(3, 'Ibiza', 'gtd'),
(4, 'Toledo', 'gtd'),
(5, 'cordoba', 'gti'),
(6, 'megane', '1.6'),
(7, 'megane', 'gti'),
(8, 'laguna', 'gtd'),
(9, 'laguna', 'td'),
(10, 'zx', '16v'),
(11, 'zx', 'td'),
(12, 'xantia', 'gtd'),
(13, 'a4', '1.8'),
(14, 'a4', '2.8'),
(15, 'astra', 'caravan'),
(16, 'astra', 'gti'),
(17, 'corsa', '1.4'),
(18, '300', '316i'),
(19, '500', '525i'),
(20, '700', '750i');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concesionarios`
--

CREATE TABLE IF NOT EXISTS `concesionarios` (
  `cifc` smallint(6) NOT NULL,
  `nombre` char(10) DEFAULT NULL,
  `ciudad` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `concesionarios`
--

INSERT INTO `concesionarios` (`cifc`, `nombre`, `ciudad`) VALUES
(1, 'acar', 'Madrid'),
(2, 'bcar', 'Madrid'),
(3, 'ccar', 'Barcelona'),
(4, 'dcar', 'Valencia'),
(5, 'ecar', 'Bilbao');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distribucion`
--

CREATE TABLE IF NOT EXISTS `distribucion` (
  `cifc` smallint(6) NOT NULL,
  `codcoche` smallint(6) NOT NULL,
  `cantidad` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `distribucion`
--

INSERT INTO `distribucion` (`cifc`, `codcoche`, `cantidad`) VALUES
(1, 1, 3),
(1, 5, 7),
(1, 6, 7),
(2, 6, 5),
(2, 8, 10),
(2, 9, 10),
(3, 10, 5),
(3, 11, 3),
(3, 12, 5),
(4, 13, 10),
(4, 14, 5),
(5, 15, 10),
(5, 16, 20),
(5, 17, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE IF NOT EXISTS `marcas` (
  `cifm` smallint(6) NOT NULL,
  `nombre` char(10) DEFAULT NULL,
  `ciudad` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`cifm`, `nombre`, `ciudad`) VALUES
(1, 'seat', 'Madrid'),
(2, 'renault', 'Barcelona'),
(3, 'citroen', 'Valencia'),
(4, 'audi', 'Madrid'),
(5, 'opel', 'Bilbao'),
(6, 'bmw', 'Barcelona');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marco`
--

CREATE TABLE IF NOT EXISTS `marco` (
  `cifm` smallint(6) NOT NULL,
  `codcoche` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marco`
--

INSERT INTO `marco` (`cifm`, `codcoche`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(3, 10),
(3, 11),
(3, 12),
(4, 13),
(4, 14),
(5, 15),
(5, 16),
(5, 17),
(6, 18),
(6, 19),
(6, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE IF NOT EXISTS `ventas` (
  `cifc` smallint(6) NOT NULL,
  `dni` smallint(6) NOT NULL,
  `codcoche` smallint(6) NOT NULL,
  `color` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`cifc`, `dni`, `codcoche`, `color`) VALUES
(1, 1, 1, 'blanco'),
(1, 2, 5, 'rojo'),
(2, 1, 6, 'rojo'),
(2, 3, 8, 'blanco'),
(3, 4, 11, 'rojo'),
(4, 5, 14, 'verde');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `coches`
--
ALTER TABLE `coches`
  ADD PRIMARY KEY (`codcoche`),
  ADD UNIQUE KEY `itodos` (`codcoche`,`nombre`,`modelo`);

--
-- Indices de la tabla `concesionarios`
--
ALTER TABLE `concesionarios`
  ADD PRIMARY KEY (`cifc`);

--
-- Indices de la tabla `distribucion`
--
ALTER TABLE `distribucion`
  ADD PRIMARY KEY (`cifc`,`codcoche`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`cifm`),
  ADD UNIQUE KEY `icifm` (`cifm`);

--
-- Indices de la tabla `marco`
--
ALTER TABLE `marco`
  ADD PRIMARY KEY (`cifm`,`codcoche`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`cifc`,`dni`,`codcoche`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
