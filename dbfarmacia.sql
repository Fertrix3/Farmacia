-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-05-2025 a las 18:50:38
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
-- Base de datos: `dbfarmacia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `articulo_id` int(4) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `precio_unitario` int(5) NOT NULL,
  `precio_venta` int(10) NOT NULL,
  `stock` int(10) NOT NULL,
  `provedor_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`articulo_id`, `descripcion`, `precio_unitario`, `precio_venta`, `stock`, `provedor_id`) VALUES
(1283, 'Fanta 600ml', 8, 19, 20, 88),
(1873, 'Ibuprofeno 400g', 5, 31, 4, 8735),
(3983, 'Coca-Cola', 7, 21, 10, 987),
(4774, 'Paracetamol 500g', 6, 22, 11, 8735);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cliente_id` int(4) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `RFC` varchar(20) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `puntos_acumulados` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `nombre`, `direccion`, `RFC`, `telefono`, `puntos_acumulados`) VALUES
(6534, 'Fabian Uranio', 'Tierra de OOO', '1927635451623', '1983653412', 11),
(8736, 'Ernesto Díaz', 'De allá pa acá y de acá pa all', '19200086745372', '8765493827', 0),
(9837, 'Pepito Changoleon', 'en su casa', '486374623764729', '8234723676', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `folio_compra` int(5) NOT NULL,
  `fecha` int(10) NOT NULL,
  `provedor_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `det_ventas`
--

CREATE TABLE `det_ventas` (
  `folio` varchar(20) NOT NULL,
  `articulo_id` int(4) NOT NULL,
  `cantidad` int(10) NOT NULL,
  `precio_unitario` float(10,2) NOT NULL,
  `subtotal` float(10,2) NOT NULL,
  `detalle_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `det_ventas`
--

INSERT INTO `det_ventas` (`folio`, `articulo_id`, `cantidad`, `precio_unitario`, `subtotal`, `detalle_id`) VALUES
('V-20250504-0001', 3983, 2, 21.00, 42.00, 0),
('V-20250504-0001', 1873, 4, 31.00, 124.00, 0),
('V-20250504-0001', 4774, 4, 22.00, 88.00, 0),
('V-20250504-0002', 1873, 5, 31.00, 155.00, 0),
('V-20250504-0002', 4774, 5, 22.00, 110.00, 0),
('V-20250504-0003', 1873, 2, 31.00, 62.00, 0),
('V-20250504-0003', 3983, 6, 21.00, 126.00, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provedor`
--

CREATE TABLE `provedor` (
  `provedor_id` int(4) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `empresa` varchar(15) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `rfc` int(5) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `provedor`
--

INSERT INTO `provedor` (`provedor_id`, `nombre`, `empresa`, `telefono`, `rfc`, `direccion`, `email`) VALUES
(88, 'Paco Chescos', '', '8735366789', 382323273, 'Enrique cegobiano 4430', 'pacochescos@gmail.com'),
(987, 'Equipo Coca-Cola', '', '8772368128', 2147483647, 'Enrique Cegobiano 3329B', 'cocacola@gmail.com'),
(8498, 'Wister Medicines', '', '2753467829', 2147483647, 'En la luna no manches aaa', 'medicines4every1@gmail.com'),
(8735, 'Walter White Inc', '', '635729983', 2147483647, 'Vive allá a la vuelta de con doña lupe, la que ven', 'imthedanger@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(4) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` int(5) NOT NULL,
  `perfil` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombre`, `telefono`, `username`, `password`, `perfil`) VALUES
(1920, 'Adair Galicia', '8712637149', 'Adair', 0, 'auxiliar'),
(4568, 'Fermín León', '0123456789', 'Fermincio', 3, 'admin'),
(5778, 'Felipe Quintero', '763539817', 'Felipe', 0, 'cajero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `folio` varchar(20) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `cliente_id` int(4) NOT NULL,
  `usuario_id` int(4) NOT NULL,
  `subtotal` float NOT NULL,
  `iva` float NOT NULL,
  `total` float NOT NULL,
  `puntos_otorgados` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`folio`, `fecha`, `cliente_id`, `usuario_id`, `subtotal`, `iva`, `total`, `puntos_otorgados`) VALUES
('V-20250504-0001', '2025-05-04 10:37:35.000000', 8736, 4568, 254, 40.64, 294.64, 2),
('V-20250504-0002', '2025-05-04 10:38:23.000000', 0, 4568, 265, 42.4, 307.4, 3),
('V-20250504-0003', '2025-05-04 10:40:22.000000', 0, 4568, 188, 30.08, 218.08, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`articulo_id`),
  ADD KEY `provedor_id` (`provedor_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`folio_compra`),
  ADD KEY `provedor_id` (`provedor_id`);

--
-- Indices de la tabla `det_ventas`
--
ALTER TABLE `det_ventas`
  ADD KEY `folio` (`folio`),
  ADD KEY `articulo_id` (`articulo_id`);

--
-- Indices de la tabla `provedor`
--
ALTER TABLE `provedor`
  ADD PRIMARY KEY (`provedor_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`folio`),
  ADD KEY `cliente_id` (`cliente_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
