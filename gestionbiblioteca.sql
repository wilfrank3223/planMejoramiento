-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 09-10-2023 a las 14:28:48
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestionbiblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

CREATE TABLE `devoluciones` (
  `idDevolucion` int NOT NULL,
  `idPrestamo` int NOT NULL,
  `fechaDevolucion` date NOT NULL,
  `multa` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `devoluciones`
--

INSERT INTO `devoluciones` (`idDevolucion`, `idPrestamo`, `fechaDevolucion`, `multa`) VALUES
(1, 1, '2023-10-12', 0.00),
(2, 2, '2023-10-25', 10000.00),
(3, 3, '2023-10-04', 4000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `idLibro` int NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `autor` varchar(30) NOT NULL,
  `genero` varchar(20) DEFAULT NULL,
  `fechaPublicacion` date DEFAULT NULL,
  `copiasDisponibles` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`idLibro`, `titulo`, `autor`, `genero`, `fechaPublicacion`, `copiasDisponibles`) VALUES
(1, 'el quijote', 'm.cervantes', 'novela', '2019-10-08', 50),
(2, 'corazon DLT', 'edgar allan poe', 'terror', '2015-10-08', 100),
(3, 'el cuervo', 'edgar allan poe', 'terror', '2013-10-02', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miembrosbiblioteca`
--

CREATE TABLE `miembrosbiblioteca` (
  `idMiembro` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `direccion` varchar(35) DEFAULT NULL,
  `numeroIdentificacion` varchar(30) NOT NULL,
  `numeroMembresia` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `miembrosbiblioteca`
--

INSERT INTO `miembrosbiblioteca` (`idMiembro`, `nombre`, `direccion`, `numeroIdentificacion`, `numeroMembresia`) VALUES
(1, 'wilfrank', 'cll 14 12 e', '111042845', 'b3'),
(2, 'marlisol', 'cll 14 13 e', '38204145', 'b3'),
(3, 'edgar', 'cll 15 13 e', '9744660', 'b2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `idPrestamo` int NOT NULL,
  `idLibro` int NOT NULL,
  `idMiembro` int NOT NULL,
  `fechaPrestamo` date NOT NULL,
  `fechaDevolucion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`idPrestamo`, `idLibro`, `idMiembro`, `fechaPrestamo`, `fechaDevolucion`) VALUES
(1, 2, 1, '2023-10-03', '2023-10-06'),
(2, 3, 2, '2023-10-02', '2023-10-12'),
(3, 1, 3, '2023-10-10', '2023-10-19');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`idDevolucion`),
  ADD KEY `idPrestamo` (`idPrestamo`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`idLibro`);

--
-- Indices de la tabla `miembrosbiblioteca`
--
ALTER TABLE `miembrosbiblioteca`
  ADD PRIMARY KEY (`idMiembro`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`idPrestamo`),
  ADD KEY `idLibro` (`idLibro`),
  ADD KEY `idMiembro` (`idMiembro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  MODIFY `idDevolucion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `idLibro` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `miembrosbiblioteca`
--
ALTER TABLE `miembrosbiblioteca`
  MODIFY `idMiembro` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `idPrestamo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD CONSTRAINT `devoluciones_ibfk_1` FOREIGN KEY (`idPrestamo`) REFERENCES `prestamos` (`idPrestamo`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`idLibro`) REFERENCES `libros` (`idLibro`),
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`idMiembro`) REFERENCES `miembrosbiblioteca` (`idMiembro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
