-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-06-2019 a las 00:21:50
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `academia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acudiente`
--

CREATE TABLE `acudiente` (
  `idacudiente` int(11) NOT NULL,
  `nombre` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `documento` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(250) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `idcargo` int(11) NOT NULL,
  `nombre` varchar(250) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idempleado` int(11) NOT NULL,
  `idcargo` int(11) NOT NULL,
  `nombre` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `documento` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `contrasenia` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `rol` varchar(250) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuela`
--

CREATE TABLE `escuela` (
  `idescuela` int(11) NOT NULL,
  `nombre` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `condicion` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `idestudiante` int(11) NOT NULL,
  `idacudiente` int(11) NOT NULL,
  `nombre` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `documento` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `fechanacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hojadevida`
--

CREATE TABLE `hojadevida` (
  `idhojadevida` int(11) NOT NULL,
  `idempleado` int(11) NOT NULL,
  `especialidad` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `tiempoexperiencia` varchar(250) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item`
--

CREATE TABLE `item` (
  `iditem` int(11) NOT NULL,
  `nombre` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `tipo` varchar(250) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensualidad`
--

CREATE TABLE `mensualidad` (
  `idmensualidad` int(11) NOT NULL,
  `idacudiente` int(11) NOT NULL,
  `fechapago` date NOT NULL,
  `valor` int(20) NOT NULL,
  `mes` date NOT NULL,
  `anio` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina`
--

CREATE TABLE `nomina` (
  `idnomina` int(11) NOT NULL,
  `idempleado` int(11) NOT NULL,
  `iditem` int(11) NOT NULL,
  `fechainicio` date NOT NULL,
  `fechafin` date NOT NULL,
  `valor` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedadmedica`
--

CREATE TABLE `novedadmedica` (
  `idnovedadmedica` int(11) NOT NULL,
  `idestudiante` int(11) NOT NULL,
  `idempleado` int(11) NOT NULL,
  `fechalesion` date NOT NULL,
  `descripcion` varchar(250) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acudiente`
--
ALTER TABLE `acudiente`
  ADD PRIMARY KEY (`idacudiente`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`idcargo`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idempleado`),
  ADD KEY `idcargo` (`idcargo`);

--
-- Indices de la tabla `escuela`
--
ALTER TABLE `escuela`
  ADD PRIMARY KEY (`idescuela`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`idestudiante`),
  ADD KEY `idacudiente` (`idacudiente`);

--
-- Indices de la tabla `hojadevida`
--
ALTER TABLE `hojadevida`
  ADD PRIMARY KEY (`idhojadevida`),
  ADD KEY `idempleado` (`idempleado`);

--
-- Indices de la tabla `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`iditem`);

--
-- Indices de la tabla `mensualidad`
--
ALTER TABLE `mensualidad`
  ADD PRIMARY KEY (`idmensualidad`),
  ADD KEY `idacudiente` (`idacudiente`);

--
-- Indices de la tabla `nomina`
--
ALTER TABLE `nomina`
  ADD PRIMARY KEY (`idnomina`),
  ADD KEY `idempleado` (`idempleado`),
  ADD KEY `iditem` (`iditem`);

--
-- Indices de la tabla `novedadmedica`
--
ALTER TABLE `novedadmedica`
  ADD PRIMARY KEY (`idnovedadmedica`),
  ADD KEY `idestudiante` (`idestudiante`),
  ADD KEY `idempleado` (`idempleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acudiente`
--
ALTER TABLE `acudiente`
  MODIFY `idacudiente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `idcargo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idempleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `escuela`
--
ALTER TABLE `escuela`
  MODIFY `idescuela` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `idestudiante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hojadevida`
--
ALTER TABLE `hojadevida`
  MODIFY `idhojadevida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `item`
--
ALTER TABLE `item`
  MODIFY `iditem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mensualidad`
--
ALTER TABLE `mensualidad`
  MODIFY `idmensualidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nomina`
--
ALTER TABLE `nomina`
  MODIFY `idnomina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `novedadmedica`
--
ALTER TABLE `novedadmedica`
  MODIFY `idnovedadmedica` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`idcargo`) REFERENCES `cargo` (`idcargo`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`idacudiente`) REFERENCES `acudiente` (`idacudiente`);

--
-- Filtros para la tabla `hojadevida`
--
ALTER TABLE `hojadevida`
  ADD CONSTRAINT `hojadevida_ibfk_1` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`idempleado`);

--
-- Filtros para la tabla `mensualidad`
--
ALTER TABLE `mensualidad`
  ADD CONSTRAINT `mensualidad_ibfk_1` FOREIGN KEY (`idacudiente`) REFERENCES `acudiente` (`idacudiente`);

--
-- Filtros para la tabla `nomina`
--
ALTER TABLE `nomina`
  ADD CONSTRAINT `nomina_ibfk_1` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`idempleado`),
  ADD CONSTRAINT `nomina_ibfk_2` FOREIGN KEY (`iditem`) REFERENCES `item` (`iditem`);

--
-- Filtros para la tabla `novedadmedica`
--
ALTER TABLE `novedadmedica`
  ADD CONSTRAINT `novedadmedica_ibfk_1` FOREIGN KEY (`idestudiante`) REFERENCES `estudiante` (`idestudiante`),
  ADD CONSTRAINT `novedadmedica_ibfk_2` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`idempleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
