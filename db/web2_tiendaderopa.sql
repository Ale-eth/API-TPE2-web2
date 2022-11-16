-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 15-11-2022 a las 20:17:27
-- Versión del servidor: 5.7.34
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `web2_tiendaderopa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `descripcion`) VALUES
(1, 'Gorras', 'para la cabeza'),
(2, 'Remeras', 'Varios colores y modelos'),
(3, 'Pantalones', 'Largos, cortos y termicos. Ideales para trekking'),
(4, 'Zapatillas', 'Urbanas y de trabajo.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `id_categoriaFK` int(11) NOT NULL,
  `nombre` varchar(11) NOT NULL,
  `precio` decimal(15,0) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `id_categoriaFK`, `nombre`, `precio`, `descripcion`) VALUES
(1, 1, 'Gorra Roja', '50', 'Gorra color rojo del club independiente'),
(2, 1, 'Gorra Negra', '45', 'Gorra negra Thrasher'),
(3, 1, 'Gorra Verde', '41', 'Gorra color verde'),
(4, 2, 'Remera Cort', '32', 'Musculosa, ideal gimnasio'),
(5, 2, 'Remera Larg', '43', 'Marca puma'),
(6, 2, 'Remera Term', '66', 'Ideal trekking, montaña y ejercicio para el invierno'),
(7, 3, 'Pantalon Co', '31', 'Para el verano, apto pileta y mar'),
(8, 3, 'Pantalon La', '54', 'Para invierno, termico'),
(9, 4, 'Futbol', '38', 'Para F5, los de Messi 2022'),
(10, 4, 'Urbanas', '75', 'Nike, ultimo modelo'),
(11, 4, 'Botin de se', '109', 'Aptos para todo tipo de trabajo pesado. Ideal fabrica'),
(12, 2, 'TEST', '20', 'TEST');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `email`, `password`) VALUES
(1, 'admin@admin.com', '$2y$10$g/wCF1NI6dj2zUBJmUPTw.7luoB7iSaPu6hBlIAFQB1QjOm30bwzq'),
(2, 'normal@normal.com', '$2y$10$OXW0BRMGYxbf63ed5eVbx.DNSOgC/L7IHGJkWvnQy7Cv30XmQJdm2');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria_FK` (`id_categoriaFK`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoriaFK`) REFERENCES `categoria` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
