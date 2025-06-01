-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 01-06-2025 a las 15:14:41
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `centro de estudios`
--
CREATE DATABASE IF NOT EXISTS `centro de estudios` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `centro de estudios`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cursos`
--

DROP TABLE IF EXISTS `Cursos`;
CREATE TABLE `Cursos` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `credito` int(11) NOT NULL,
  `semestre` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `Cursos`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Estudiantes`
--

DROP TABLE IF EXISTS `Estudiantes`;
CREATE TABLE `Estudiantes` (
  `matricula` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `carrera` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `Estudiantes`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Matricula`
--

DROP TABLE IF EXISTS `Matricula`;
CREATE TABLE `Matricula` (
  `matricula` int(11) NOT NULL,
  `codigo_curso` int(11) NOT NULL,
  `nota` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `Matricula`:
--   `matricula`
--       `Estudiantes` -> `matricula`
--   `codigo_curso`
--       `Cursos` -> `codigo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Profesores`
--

DROP TABLE IF EXISTS `Profesores`;
CREATE TABLE `Profesores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `especialidad` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `Profesores`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Profesores_Cursos`
--

DROP TABLE IF EXISTS `Profesores_Cursos`;
CREATE TABLE `Profesores_Cursos` (
  `id_profesor` int(11) NOT NULL,
  `codigo_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `Profesores_Cursos`:
--   `id_profesor`
--       `Profesores` -> `id`
--   `codigo_curso`
--       `Cursos` -> `codigo`
--

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Cursos`
--
ALTER TABLE `Cursos`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `Estudiantes`
--
ALTER TABLE `Estudiantes`
  ADD PRIMARY KEY (`matricula`);

--
-- Indices de la tabla `Matricula`
--
ALTER TABLE `Matricula`
  ADD KEY `matricula` (`matricula`),
  ADD KEY `codigo_curso` (`codigo_curso`);

--
-- Indices de la tabla `Profesores`
--
ALTER TABLE `Profesores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Profesores_Cursos`
--
ALTER TABLE `Profesores_Cursos`
  ADD KEY `id_profesor` (`id_profesor`),
  ADD KEY `codigo_curso` (`codigo_curso`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Cursos`
--
ALTER TABLE `Cursos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Estudiantes`
--
ALTER TABLE `Estudiantes`
  MODIFY `matricula` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Profesores`
--
ALTER TABLE `Profesores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Matricula`
--
ALTER TABLE `Matricula`
  ADD CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `Estudiantes` (`matricula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`codigo_curso`) REFERENCES `Cursos` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Profesores_Cursos`
--
ALTER TABLE `Profesores_Cursos`
  ADD CONSTRAINT `fk_profesor_curso_profesor` FOREIGN KEY (`id_profesor`) REFERENCES `Profesores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `profesores_cursos_ibfk_1` FOREIGN KEY (`codigo_curso`) REFERENCES `Cursos` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
