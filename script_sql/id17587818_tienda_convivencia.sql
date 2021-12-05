-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2021 a las 04:09:24
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `id17587818_tienda_convivencia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_emp` int(11) NOT NULL,
  `nom_emp` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `apell_emp` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `curp_emp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel_emp` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `direc_emp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rol_emp` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `salario_emp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id_fact` int(30) NOT NULL,
  `id_vent` int(30) NOT NULL,
  `totalGast_fact` float NOT NULL,
  `rfc_empr_fact` varchar(30) CHARACTER SET utf8 NOT NULL,
  `cant_fact` int(12) NOT NULL,
  `descrip_fact` varchar(50) NOT NULL,
  `precioUnit_fact` float NOT NULL,
  `subtotal` float NOT NULL,
  `total_fact` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`id_fact`, `id_vent`, `totalGast_fact`, `rfc_empr_fact`, `cant_fact`, `descrip_fact`, `precioUnit_fact`, `subtotal`, `total_fact`) VALUES
(1, 2, 300, 'Goyoma', 2, 'Audifonos', 150, 300, 360),
(2, 4, 200, 'HKASAKASD', 3, 'Tarjetas Google Play', 100, 200, 250);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perdidas`
--

CREATE TABLE `perdidas` (
  `id_perdidas` int(11) NOT NULL,
  `id_produc` int(11) NOT NULL,
  `precio_perdidas` float NOT NULL,
  `cant_perdidas` int(11) NOT NULL,
  `total_perdidas` float NOT NULL,
  `proveedor_perdidas` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_prov` int(11) NOT NULL,
  `nom_prov` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `tel_prov` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cant_prov` int(11) NOT NULL,
  `total_prov` float NOT NULL,
  `id_emp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reembolsos`
--

CREATE TABLE `reembolsos` (
  `id_reemb` int(11) NOT NULL,
  `motivo_reemb` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `costPieza_reemb` float NOT NULL,
  `id_produc` int(11) NOT NULL,
  `cant_reemb` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `rol` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `rol`) VALUES
(1, 'admin'),
(2, 'colab');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `user_name`, `password`, `name`) VALUES
(1, 'elias', '123', 'Elias'),
(2, 'john', 'abc', 'John');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usua` int(11) NOT NULL,
  `usuario` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `contraseña` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usua`, `usuario`, `contraseña`, `id_rol`) VALUES
(1, 'axel', '1234', 1),
(2, 'cesar', '1234', 1),
(3, 'eduardo', '1234', 1),
(4, 'kevin', '1234', 1),
(5, 'manuel', '1234', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_vent` int(11) NOT NULL,
  `id_emp` int(11) NOT NULL,
  `cost_produc_vent` decimal(10,0) NOT NULL,
  `fecha_vent` datetime NOT NULL,
  `cant_produc_vent` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `iva_vent` float NOT NULL,
  `descuentos_vent` float DEFAULT NULL,
  `subTotal_vent` float NOT NULL,
  `total_vent` float NOT NULL,
  `id_produc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_emp`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id_fact`);

--
-- Indices de la tabla `perdidas`
--
ALTER TABLE `perdidas`
  ADD PRIMARY KEY (`id_perdidas`),
  ADD KEY `fk_perdidas_produc` (`id_produc`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_prov`),
  ADD KEY `fk_prov_emp` (`id_emp`);

--
-- Indices de la tabla `reembolsos`
--
ALTER TABLE `reembolsos`
  ADD PRIMARY KEY (`id_reemb`),
  ADD KEY `fk_reemb_produc` (`id_produc`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usua`),
  ADD KEY `fk_usua_rol` (`id_rol`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_vent`),
  ADD KEY `fk_vent_emp` (`id_emp`),
  ADD KEY `fk_vent_produc` (`id_produc`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usua` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `perdidas`
--
ALTER TABLE `perdidas`
  ADD CONSTRAINT `fk_perdidas_produc` FOREIGN KEY (`id_produc`) REFERENCES `producto` (`id_produc`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `fk_prov_emp` FOREIGN KEY (`id_emp`) REFERENCES `empleado` (`id_emp`);

--
-- Filtros para la tabla `reembolsos`
--
ALTER TABLE `reembolsos`
  ADD CONSTRAINT `fk_reemb_produc` FOREIGN KEY (`id_produc`) REFERENCES `producto` (`id_produc`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usua_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_vent_emp` FOREIGN KEY (`id_emp`) REFERENCES `empleado` (`id_emp`),
  ADD CONSTRAINT `fk_vent_produc` FOREIGN KEY (`id_produc`) REFERENCES `producto` (`id_produc`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
