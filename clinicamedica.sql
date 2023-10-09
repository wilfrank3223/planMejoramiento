-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 09-10-2023 a las 14:10:44
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
-- Base de datos: `clinicamedica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `idCita` int NOT NULL,
  `idPaciente` int NOT NULL,
  `fechaCita` datetime NOT NULL,
  `recordatorio` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`idCita`, `idPaciente`, `fechaCita`, `recordatorio`) VALUES
(1, 3, '2023-10-09 09:00:00', 'medico'),
(2, 3, '2023-10-10 08:00:00', 'medico'),
(3, 2, '2023-10-11 07:00:00', 'medico'),
(4, 1, '2023-10-09 01:00:00', 'medico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idFactura` int NOT NULL,
  `idPaciente` int NOT NULL,
  `fechaFactura` date NOT NULL,
  `montoTotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idFactura`, `idPaciente`, `fechaFactura`, `montoTotal`) VALUES
(1, 3, '2023-10-10', 30000.00),
(2, 2, '2023-10-11', 30000.00),
(3, 1, '2023-10-11', 30000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialesmedicos`
--

CREATE TABLE `historialesmedicos` (
  `idHistorial` int NOT NULL,
  `idpaciente` int NOT NULL,
  `diagnostico` text,
  `tratamiento` text,
  `medicamentos` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `historialesmedicos`
--

INSERT INTO `historialesmedicos` (`idHistorial`, `idpaciente`, `diagnostico`, `tratamiento`, `medicamentos`) VALUES
(1, 3, 'el usuario presenta dolores de cabeza', 'reposo y masajes', 'acetominofen y desinflamatorios'),
(2, 2, 'el usuario presenta una leve gripa', 'masajes con vipvaporu', 'vipvaporu'),
(3, 1, 'el usuario presenta una fractura', 'cuidado Inmovilización con férula. Reducción abierta y fijación interna. Requiere una operación quirúrgica para reparar la fractura', 'antiinflamatorios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `idpaciente` int NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `contactoEmergencia` varchar(11) DEFAULT NULL,
  `seguroMedico` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`idpaciente`, `nombre`, `fechaNacimiento`, `contactoEmergencia`, `seguroMedico`) VALUES
(1, 'jorge', '2013-10-02', '317352720', 'militar'),
(2, 'marlisol', '2014-10-08', '317342720', 'pijao salud'),
(3, 'oscar', '2014-10-08', '312678909', 'colsalub');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `serviciosmedicos`
--

CREATE TABLE `serviciosmedicos` (
  `idServicio` int NOT NULL,
  `idPaciente` int NOT NULL,
  `descripcionServicio` text,
  `fechaServicio` date NOT NULL,
  `costo` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `serviciosmedicos`
--

INSERT INTO `serviciosmedicos` (`idServicio`, `idPaciente`, `descripcionServicio`, `fechaServicio`, `costo`) VALUES
(1, 3, 'muy bueno el servicio', '2023-10-10', 200000.00),
(2, 2, 'me atendieron super rapido', '2023-10-05', 25000.00),
(3, 1, 'todo fue muy agradable', '2023-10-12', 30000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int NOT NULL,
  `nombreUsuario` varchar(30) NOT NULL,
  `contraseña` varchar(25) NOT NULL,
  `rol` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombreUsuario`, `contraseña`, `rol`) VALUES
(1, 'wilfrank', 'wilfrank233', 'medico'),
(2, 'adhara', 'adhara132', 'nutricionista'),
(3, 'pedro', 'pedro123', 'pediatra');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`idCita`),
  ADD KEY `idPaciente` (`idPaciente`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `idPaciente` (`idPaciente`);

--
-- Indices de la tabla `historialesmedicos`
--
ALTER TABLE `historialesmedicos`
  ADD PRIMARY KEY (`idHistorial`),
  ADD KEY `idpaciente` (`idpaciente`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`idpaciente`);

--
-- Indices de la tabla `serviciosmedicos`
--
ALTER TABLE `serviciosmedicos`
  ADD PRIMARY KEY (`idServicio`),
  ADD KEY `idPaciente` (`idPaciente`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `idCita` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idFactura` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `historialesmedicos`
--
ALTER TABLE `historialesmedicos`
  MODIFY `idHistorial` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `idpaciente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `serviciosmedicos`
--
ALTER TABLE `serviciosmedicos`
  MODIFY `idServicio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`idpaciente`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`idpaciente`);

--
-- Filtros para la tabla `historialesmedicos`
--
ALTER TABLE `historialesmedicos`
  ADD CONSTRAINT `historialesmedicos_ibfk_1` FOREIGN KEY (`idpaciente`) REFERENCES `pacientes` (`idpaciente`);

--
-- Filtros para la tabla `serviciosmedicos`
--
ALTER TABLE `serviciosmedicos`
  ADD CONSTRAINT `serviciosmedicos_ibfk_1` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`idpaciente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
