-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 09-10-2023 a las 13:30:13
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
-- Base de datos: `hotel1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `ID_Factura` int NOT NULL,
  `ID_Reserva` int NOT NULL,
  `FechaFacturacion` date NOT NULL,
  `PrecioTotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`ID_Factura`, `ID_Reserva`, `FechaFacturacion`, `PrecioTotal`) VALUES
(1, 2, '2023-10-03', 10000.00),
(2, 1, '2023-10-11', 15000.00),
(3, 3, '2023-10-11', 1000.00),
(4, 3, '2023-10-11', 10000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciones`
--

CREATE TABLE `habitaciones` (
  `ID_Habitacion` int NOT NULL,
  `NumeroHabitacion` int NOT NULL,
  `TipoHabitacion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PrecioNoche` decimal(10,2) NOT NULL,
  `Disponibilidad` enum('D','O') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `habitaciones`
--

INSERT INTO `habitaciones` (`ID_Habitacion`, `NumeroHabitacion`, `TipoHabitacion`, `PrecioNoche`, `Disponibilidad`) VALUES
(5, 1, 'bonita', 15000.00, 'D'),
(6, 2, 'normal', 10000.00, 'O'),
(7, 3, 'fea', 5000.00, 'D');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `huespedes`
--

CREATE TABLE `huespedes` (
  `ID_Huesped` int NOT NULL,
  `Nombre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Contacto` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PreferenciasHabitacion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `huespedes`
--

INSERT INTO `huespedes` (`ID_Huesped`, `Nombre`, `Contacto`, `PreferenciasHabitacion`) VALUES
(1, 'wilfrank', '3173427208', 'con jacuzzi'),
(2, 'edgar', '322609784', 'con vista al mar'),
(3, 'camila', '322097384', 'en rasca cielos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `ID_Reserva` int NOT NULL,
  `ID_Habitacion` int NOT NULL,
  `ID_Huesped` int NOT NULL,
  `FechaCheckIn` date NOT NULL,
  `FechaCheckOut` date NOT NULL,
  `DetallesPago` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`ID_Reserva`, `ID_Habitacion`, `ID_Huesped`, `FechaCheckIn`, `FechaCheckOut`, `DetallesPago`) VALUES
(1, 5, 3, '2023-10-02', '2023-10-04', 'muy bonita'),
(2, 7, 2, '2023-10-03', '2023-10-05', 'acoplada a su precio'),
(3, 6, 1, '2023-10-17', '2023-10-26', 'precio calidad');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`ID_Factura`),
  ADD KEY `ID_Reserva` (`ID_Reserva`);

--
-- Indices de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD PRIMARY KEY (`ID_Habitacion`),
  ADD UNIQUE KEY `NumeroHabitacion` (`NumeroHabitacion`);

--
-- Indices de la tabla `huespedes`
--
ALTER TABLE `huespedes`
  ADD PRIMARY KEY (`ID_Huesped`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`ID_Reserva`),
  ADD KEY `ID_Habitacion` (`ID_Habitacion`),
  ADD KEY `ID_Huesped` (`ID_Huesped`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `ID_Factura` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  MODIFY `ID_Habitacion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `huespedes`
--
ALTER TABLE `huespedes`
  MODIFY `ID_Huesped` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `ID_Reserva` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`ID_Reserva`) REFERENCES `reservas` (`ID_Reserva`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`ID_Habitacion`) REFERENCES `habitaciones` (`ID_Habitacion`),
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`ID_Huesped`) REFERENCES `huespedes` (`ID_Huesped`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
