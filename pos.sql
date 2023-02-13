-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 13-02-2023 a las 05:31:33
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `posmodificado`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` text COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`) VALUES
(1, 'Pinzas'),
(2, 'Sombras Oscuras'),
(3, 'Labiales'),
(6, 'Brochas'),
(7, 'Correctores'),
(8, 'Esmaltes'),
(9, 'Paleta'),
(10, 'Brillos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL,
  `nombre` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellido` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `dni` int(11) NOT NULL,
  `email` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idcliente`, `nombre`, `apellido`, `dni`, `email`, `telefono`, `direccion`, `fecha_nacimiento`) VALUES
(6, 'Carlos Aldair', 'Saldaña Chillon', 67452351, 'carlosmartinez@gmail.com', '984756342', 'Av. Miguel Grau 545 Campanita', '2001-05-09'),
(7, 'Fidel Elias', 'Castro Humala', 67452353, 'fidel@hotmail.com', '937525347', 'Guadalupe', '2001-05-12'),
(8, 'Nancy Mirella', 'Alvitres Padilla', 65552351, 'nancy.2018@gmail.com', '975635261', 'Calle Bolognesi Chiclayo', '1999-08-12'),
(9, 'Alfredo Neymar', 'Gutierrez Marín', 67232351, 'alfredo@hotmail.com', '926335916', 'Av.Sanches Carrion #400 Pacasmayo', '1998-02-12'),
(10, 'Cristian Wilfredo', 'Porres Castro', 87263531, 'cristianCastro@hotmail.com', '931246849', 'Calle La Parada Chocope', '1997-08-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idempleado` int(11) NOT NULL,
  `nombre` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellido` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `dni` int(8) NOT NULL,
  `telefono` int(11) NOT NULL,
  `trabajo` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `sueldo` int(11) NOT NULL,
  `direccion` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `ciudad` text COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idempleado`, `nombre`, `apellido`, `dni`, `telefono`, `trabajo`, `sueldo`, `direccion`, `ciudad`) VALUES
(5, 'Kevin Carlos', 'Tello Martinez', 60266420, 917469110, 'Barredor', 900, 'Av. Gonzales Caceda #222', 'Pacasmayo'),
(6, 'Luis Aymar', 'Lopez Chanduvi', 78634744, 918374578, 'Guardian', 1200, 'Calle Esperanza Etapa 2 ', 'Pacasmayo'),
(7, 'Orfelia Alexandra', 'Aparicio Miranda', 78925342, 917264758, 'Repartidora', 1100, 'Av. Miguel Grau #250', 'Pacasmayo'),
(8, 'Cristian Gustavo', 'Saldaña Quiroz', 68463153, 963525222, 'Seguridad', 1900, 'Av. Francisco Zela #600', 'Guadalupe'),
(10, 'Kevin Hernan', 'Arévalo', 60266420, 917469110, 'Limpieza', 930, 'Av. Miguel Grau 545 Campanita', 'La Libertad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `codigo` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `imagen` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `precio_compra` float NOT NULL,
  `precio_venta` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproducto`, `idproveedor`, `idcategoria`, `codigo`, `descripcion`, `imagen`, `stock`, `precio_compra`, `precio_venta`) VALUES
(41, 11, 3, 'LB-00011', 'Labial Crude Nude', 'vistas/img/productos/LB-00011/678.jpg', 31, 15, 20),
(42, 11, 3, 'LB-00012', 'Labial HydraLipRojo ', 'vistas/img/productos/LB-00012/320.jpg', 10, 20, 30),
(43, 11, 3, 'LB-00013', 'Labial Hydralip', 'vistas/img/productos/LB-00013/220.png', 33, 30, 35),
(44, 11, 3, 'LB-00014', 'Labial Ultramate', 'vistas/img/productos/LB-00014/888.jpg', 50, 25, 32),
(45, 11, 3, 'LB-00015', 'Labial Traslucido', 'vistas/img/productos/LB-00015/198.jpg', 50, 45, 56),
(46, 12, 9, 'PA-00011', 'Paleta zoo', 'vistas/img/productos/PA-00011/170.jpg', 40, 29, 35),
(47, 3, 9, 'PA-00012', 'Paleta healthy food', 'vistas/img/productos/PA-00012/263.jpg', 40, 28, 35),
(48, 2, 9, 'PA-00013', 'Paletas Break Free', 'vistas/img/productos/PA-00013/587.jpg', 33, 10, 15),
(49, 2, 9, 'PA-00014', 'Eyeshadow Palette', 'vistas/img/productos/PA-00014/768.png', 434, 24, 28),
(50, 1, 9, 'PA-00015', 'Paleta Butterfly ', 'vistas/img/productos/PA-00015/643.jpg', 29, 29, 34),
(52, 2, 9, 'PA-00017', 'Paleta Love Is Sweet', 'vistas/img/productos/PA-00017/863.jpg', 44, 12, 16),
(53, 3, 9, 'PA-00018', 'Paleta multicolor', 'vistas/img/productos/PA-00018/717.jpg', 33, 25, 30),
(54, 2, 9, 'PA-00019', 'Paleta rude', 'vistas/img/productos/PA-00019/298.jpg', 33, 9, 16),
(55, 2, 9, 'PA-00020', 'Paletas Break Free', 'vistas/img/productos/PA-00020/466.jpg', 34, 12, 15),
(56, 1, 9, 'PA-00016', 'Paleta Diamond', 'vistas/img/productos/PA-00016/743.jpg', 20, 30, 35),
(57, 3, 9, 'PA-00021', 'Paleta Rosa Gold Edition', 'vistas/img/productos/PA-00021/968.jpg', 44, 16, 19),
(58, 1, 9, 'PA-00022', 'Paleta Cantoon Girls', 'vistas/img/productos/PA-00022/643.jpg', 12, 22, 25),
(59, 2, 9, 'PA-00023', 'Paleta De Correctores', 'vistas/img/productos/PA-00023/795.jpg', 22, 7, 12),
(60, 12, 9, 'PA-00024', 'Paleta Dream Land', 'vistas/img/productos/PA-00024/141.jpg', 22, 8, 13),
(61, 2, 9, 'PA-00025', 'Paletas Total Effect', 'vistas/img/productos/PA-00025/787.png', 33, 9, 15),
(62, 12, 3, 'LB-00016', 'Labial magico marmol', 'vistas/img/productos/LB-00016/260.jpg', 60, 0.5, 2),
(63, 11, 10, 'BR-00001', 'Brillo Oil Roll On', 'vistas/img/productos/BR-00001/525.jpg', 50, 2, 3.5),
(64, 11, 10, 'BR-00002', 'Brillo Roll On Glitter', 'vistas/img/productos/BR-00002/774.jpg', 45, 1.5, 3),
(65, 12, 10, 'BR-00003', 'Brillo Roll On Magico', 'vistas/img/productos/BR-00003/235.png', 34, 1, 3),
(66, 12, 10, 'BR-00004', 'Brillo Labial En Cojin', 'vistas/img/productos/BR-00004/528.jpg', 44, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idproveedor` int(11) NOT NULL,
  `proveedor` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `contacto` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idproveedor`, `proveedor`, `contacto`, `telefono`, `direccion`, `fecha`) VALUES
(1, 'Importaciones Larchar', 'Melisa Guerrero', 923246569, 'La Esperanza - Trujillo', '1998-02-06'),
(2, 'Importaciones Sanchez', 'Mariana Sanchez', 963524117, 'Calle Lima #456 Chocope', '2022-08-05'),
(3, 'Importaciones China', 'Wilfredo Padilla', 917469222, 'Calle Gonzales Caceda #699 Chocope', '2022-08-05'),
(11, 'Importaciones Cosmetic International', 'Adrian Gonzales', 923246969, 'Chocope', '1999-02-13'),
(12, 'Scalon', 'Fabian Gutierrez', 927489555, 'Guadalupe', '1999-02-13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `nombre` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `dni` int(8) NOT NULL,
  `usuario` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `password` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `perfil` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `foto` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `nombre`, `dni`, `usuario`, `password`, `perfil`, `foto`, `estado`) VALUES
(9, 'Abigail Mostacero Carrera', 75252446, 'abigailmostacero@hotmail.com', '$2a$07$asxx54ahjppf45sd87a5auKJyKBRqvTIiYLL.ezhDafmgu.1YuyNC', 'Administrador', 'vistas/img/usuarios/abigailmostacero@hotmail.com/112.jpg', 1),
(10, 'Zeida Mostacero Carrera ', 74580778, 'zeidamostacero@hotmail.com', '$2a$07$asxx54ahjppf45sd87a5auRyIeF/7SSFyJHtwbt4BE4tcBmIxULgG', 'Almacenero', 'vistas/img/usuarios/zeidamostacero@hotmail.com/543.jpg', 1),
(11, 'Adela Mostacero Carrera', 45657849, 'adelamostacero@hotmail.com', '$2a$07$asxx54ahjppf45sd87a5auO9tYGrmQWIKnnoTGdpW1gwK3oCLUwkO', 'Vendedor', 'vistas/img/usuarios/adelamostacero@hotmail.com/959.jpg', 1),
(12, 'Kevin Tello Arévalo ', 60266420, 'kevintello@hotmail.com', '$2a$07$asxx54ahjppf45sd87a5au1Ejn5ZP41RcjGQuvHY2B8m3nFLHSCyu', 'Vendedor', 'vistas/img/usuarios/kevintello@hotmail.com/775.jpg', 1),
(13, 'María Oliva Gonzales', 75155566, 'mariaoliva@hotmail.com', '$2a$07$asxx54ahjppf45sd87a5auJnyEWu2I/LGrsdLfMawEZGMwUWnuJ6a', 'Vendedor', 'vistas/img/usuarios/mariaoliva@hotmail.com/394.jpg', 1),
(14, 'Carlos Saldaña Chiquinta', 85734922, 'carlosgustavo@hotmail.com', '$2a$07$asxx54ahjppf45sd87a5auelrdZeBYZ4t33w118t1DE5bSBf9deF2', 'Almacenero', 'vistas/img/usuarios/carlosgustavo@hotmail.com/799.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `idvendedor` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `cantidadproductos` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `total` float NOT NULL,
  `metodo_pago` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `codigo`, `idvendedor`, `idcliente`, `cantidadproductos`, `total`, `metodo_pago`, `fecha`) VALUES
(32, 10003, 9, 6, '[{\"id\":\"41\",\"descripcion\":\"Labial Crude Nude\",\"cantidad\":\"2\",\"stock\":\"32\",\"precio\":\"20\",\"total\":\"40\"},{\"id\":\"42\",\"descripcion\":\"Labial HydraLipRojo \",\"cantidad\":\"1\",\"stock\":\"10\",\"precio\":\"30\",\"total\":\"30\"}]', 70, 'Efectivo', '2023-02-07 12:57:34'),
(33, 10004, 9, 8, '[{\"id\":\"41\",\"descripcion\":\"Labial Crude Nude\",\"cantidad\":\"2\",\"stock\":\"30\",\"precio\":\"20\",\"total\":\"40\"},{\"id\":\"43\",\"descripcion\":\"Labial Hydralip\",\"cantidad\":\"1\",\"stock\":\"31\",\"precio\":\"35\",\"total\":\"35\"}]', 75, 'Efectivo', '2023-01-31 03:57:55'),
(34, 10005, 9, 7, '[{\"id\":\"42\",\"descripcion\":\"Labial HydraLipRojo \",\"cantidad\":\"4\",\"stock\":\"1\",\"precio\":\"30\",\"total\":\"120\"}]', 120, 'Efectivo', '2023-01-31 03:59:00'),
(35, 10006, 9, 8, '[{\"id\":\"41\",\"descripcion\":\"Labial Crude Nude\",\"cantidad\":\"1\",\"stock\":\"31\",\"precio\":\"20\",\"total\":\"20\"}]', 20, 'Efectivo', '2023-02-13 04:03:13');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idempleado`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `fk_categoria_productos` (`idcategoria`),
  ADD KEY `fk_proveedor_productos` (`idproveedor`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idproveedor`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_clienteS` (`idcliente`),
  ADD KEY `fk_vendedorS` (`idvendedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idempleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idproveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_categoria_productos` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `fk_proveedor_productos` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_clienteS` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`),
  ADD CONSTRAINT `fk_vendedorS` FOREIGN KEY (`idvendedor`) REFERENCES `usuarios` (`idusuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
