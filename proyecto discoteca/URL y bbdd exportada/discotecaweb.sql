-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-02-2025 a las 18:35:03
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
-- Base de datos: `discotecaweb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `albumes`
--

CREATE TABLE `albumes` (
  `cod_album` tinyint(3) UNSIGNED NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `fecha` year(4) NOT NULL,
  `cod_grupo` tinyint(3) UNSIGNED DEFAULT NULL,
  `portada` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `albumes`
--

INSERT INTO `albumes` (`cod_album`, `titulo`, `fecha`, `cod_grupo`, `portada`) VALUES
(1, 'Sadcore', '2020', 1, '1.jpg'),
(2, 'Clásico e inéditos', '2020', 1, '2.jpg'),
(3, 'Cicatrices', '2018', 2, '3.jpg'),
(4, 'Caja Negra', '2014', 2, '4.jpg'),
(5, 'Nimrod', '1997', 3, '5.jpg'),
(6, 'Dookie', '1994', 3, '6.jpg'),
(7, 'Animales', '2005', 4, '7.jpg'),
(8, 'Baires', '2009', 4, '8.jpg'),
(9, 'At folsom prison', '1971', 5, '9.jpg'),
(10, 'AmericanII: Unchained', '1996', 5, '10.jpg'),
(11, 'Animal', '1998', 6, '11.jpg'),
(12, 'El Africano', '1993', 6, '12.jpg'),
(13, 'Scorpion', '2018', 7, '13.jpg'),
(14, 'Views', '2018', 7, '14.jpg'),
(15, 'Shoot for the Stars, Aim for the Moon', '2020', 8, '15.jpg'),
(16, 'Mett the Woo', '2021', 8, '16.jpg'),
(17, 'Cypress Hill III: Temples of Boom', '1995', 9, '17.png'),
(18, 'Black Sunday', '1993', 9, '18.png'),
(19, 'Enter the Wu-Tang (36 Chambers.)', '1993', 10, '19.png'),
(20, 'Iron Flag', '2001', 10, '20.png'),
(21, 'The Eminem Show', '2002', 11, '21.jpg'),
(22, 'Encore', '2004', 11, '22.png'),
(23, 'Alter Ego', '2020', 12, '23.jpg'),
(24, 'Five', '2017', 12, '24.jpg'),
(25, 'BL4QKFY4H', '2015', 13, '25.jpg'),
(26, 'INNADIFLAMES', '2009', 13, '26.jpg'),
(27, 'iTunes Live from London', '2010', 14, '27.jpg'),
(28, 'Can\'t Be Tamed', '2015', 14, '28.jpg'),
(29, 'The Big Picture', '2000', 15, '29.jpg'),
(30, 'The Danger Zone', '2011', 15, '30.jpg'),
(31, 'Pain Is Love', '2001', 16, '31.jpg'),
(32, 'The Last Temptation', '2002', 16, '32.jpg'),
(33, 'triple vynil box set', '2012', 17, '33.jpg'),
(34, 'Recess', '2014', 17, '34.jpg'),
(35, 'Machine Fucking Head live', '2012', 18, '35.jpg'),
(36, 'Unto the Locust', '2011', 18, '36.jpg'),
(37, 'Viva la Vida or Death and All His Friends', '2008', 19, '37.jpg'),
(38, 'A Head Full of Dreams', '2015', 19, '38.jpg'),
(39, 'The Colour and the Shape', '1997', 20, '39.jpg'),
(40, 'Echoes, Silence, Patience & Grace y Greatest Hits', '2007', 20, '40.jpg'),
(41, '…Y el último', '2019', 21, '41.jpg'),
(42, 'Recalculando Ruta', '2017', 21, '42.jpg'),
(43, 'One more light', '2015', 22, '43.jpg'),
(44, 'Hybrid Theory', '2000', 22, '44.jpg'),
(45, 'Evolve', '2017', 23, '45.jpg'),
(46, 'Mercury-Act1', '2021', 23, '46.jpg'),
(47, 'Blurryface', '2015', 24, '47.webp'),
(48, 'Trench', '2018', 24, '48.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `albumes_generos`
--

CREATE TABLE `albumes_generos` (
  `cod_album` tinyint(3) UNSIGNED NOT NULL,
  `cod_genero` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `albumes_generos`
--

INSERT INTO `albumes_generos` (`cod_album`, `cod_genero`) VALUES
(1, 13),
(2, 13),
(3, 13),
(4, 13),
(5, 11),
(5, 12),
(6, 11),
(6, 15),
(7, 15),
(7, 16),
(8, 12),
(9, 2),
(10, 2),
(11, 10),
(12, 10),
(13, 7),
(14, 7),
(15, 7),
(16, 7),
(17, 7),
(18, 13),
(19, 13),
(20, 13),
(21, 7),
(22, 7),
(23, 1),
(24, 1),
(25, 3),
(25, 7),
(26, 3),
(26, 7),
(27, 9),
(28, 9),
(29, 7),
(30, 7),
(31, 7),
(32, 7),
(33, 4),
(34, 4),
(35, 5),
(36, 18),
(37, 12),
(38, 9),
(39, 15),
(40, 6),
(41, 13),
(42, 13),
(43, 9),
(44, 15),
(45, 12),
(46, 12),
(47, 7),
(48, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canciones`
--

CREATE TABLE `canciones` (
  `cod_cancion` smallint(5) UNSIGNED NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `duracion` time DEFAULT NULL,
  `num_pista` tinyint(3) UNSIGNED NOT NULL,
  `cod_album` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `canciones`
--

INSERT INTO `canciones` (`cod_cancion`, `titulo`, `duracion`, `num_pista`, `cod_album`) VALUES
(1, 'Gulag Sessions', '00:04:33', 1, 1),
(2, 'Sadcore', '00:04:05', 2, 1),
(3, 'Mil y una', '00:03:54', 3, 1),
(4, 'Sincero', '00:05:11', 4, 1),
(5, 'La decisión', '00:04:56', 5, 1),
(6, 'Amor eres tu', '00:05:54', 6, 1),
(7, 'Cartas a la vida', '00:04:39', 7, 1),
(8, 'Bohemian Rap', '00:06:15', 8, 1),
(9, 'Me visto y voy', '00:03:03', 9, 1),
(10, 'Ya me hice un hombre', '00:05:13', 10, 1),
(11, 'Altibajos', '00:03:38', 1, 2),
(12, 'Crisálida', '00:03:12', 2, 2),
(13, 'Pecado Capital', '00:03:06', 3, 2),
(14, 'Yo era, yo soy', '00:03:20', 4, 2),
(15, 'La verdad', '00:04:29', 5, 2),
(16, 'Oro', '00:05:16', 6, 2),
(17, 'Morir soñando', '00:04:39', 7, 2),
(18, 'Real', '00:03:55', 8, 2),
(19, 'Fuera de serie', '00:03:25', 9, 2),
(20, 'Karma', '00:02:58', 10, 2),
(21, 'Piratas', '00:04:06', 1, 3),
(22, 'Cicatrices', '00:03:00', 2, 3),
(23, 'Alfa y Omega', '00:03:09', 3, 3),
(24, 'Bicho Raro', '00:03:57', 4, 3),
(25, 'Niño de cristal', '00:03:21', 5, 3),
(26, 'Pecados', '00:03:24', 6, 3),
(27, 'Underground Kings', '00:02:42', 7, 3),
(28, 'Generacion perdida', '00:03:04', 8, 3),
(29, 'Ey mama', '00:03:39', 9, 3),
(30, 'Balada', '00:03:03', 10, 3),
(31, 'Cuentas pendientes', '00:04:06', 1, 4),
(32, 'Morir joven', '00:03:00', 2, 4),
(33, 'Contar hasta diez', '00:03:09', 3, 4),
(34, 'Maquiavelo', '00:03:57', 4, 4),
(35, 'Excesos', '00:03:21', 5, 4),
(36, 'Sabor amargo', '00:03:24', 6, 4),
(37, 'Fuck name', '00:02:42', 7, 4),
(38, 'Remember', '00:03:04', 8, 4),
(39, 'Sigo vivo', '00:03:39', 9, 4),
(40, 'Que guapo estas callado', '00:03:03', 10, 4),
(51, 'Nice Guys Finish Last', '00:02:49', 1, 5),
(52, 'Hitchin\' a Ride', '00:02:51', 2, 5),
(53, 'The Grouch', '00:02:12', 3, 5),
(54, 'Redundant', '00:03:17', 4, 5),
(55, 'Scattered', '00:03:02', 5, 5),
(56, 'All the Time', '00:02:10', 6, 5),
(57, 'Worry Rock', '00:02:27', 7, 5),
(58, 'Platypus (I Hate You)', '00:02:21', 8, 5),
(59, 'Uptight', '00:03:04', 9, 5),
(60, 'Last Ride In', '00:03:47', 10, 5),
(61, 'Jinx', '00:02:12', 11, 5),
(62, 'Haushinka', '00:03:25', 12, 5),
(63, 'Burnout', '00:02:07', 1, 6),
(64, 'Having a Blast', '00:02:44', 2, 6),
(65, 'Chump', '00:02:54', 3, 6),
(66, 'Longview', '00:03:59', 4, 6),
(67, 'Welcome to Paradise', '00:03:44', 5, 6),
(68, 'Pulling Teeth', '00:02:31', 6, 6),
(69, 'Basket Case', '00:03:01', 7, 6),
(70, 'She', '00:02:14', 8, 6),
(71, 'Sassafras Roots', '00:02:37', 9, 6),
(72, 'When I Come Around', '00:02:58', 10, 6),
(73, 'Coming Clean', '00:01:34', 11, 6),
(74, 'Emenius Sleepus', '00:01:43', 12, 6),
(75, 'Princesas', '00:03:37', 1, 7),
(76, 'Animales', '00:02:51', 2, 7),
(77, 'Lo Que Tengo Yo Adentro', '00:03:09', 3, 7),
(78, 'Todo', '00:04:47', 4, 7),
(79, 'Como Lo Tienes Tu', '00:03:54', 5, 7),
(80, 'Niña de Papa', '00:03:13', 6, 7),
(81, 'Caramelo', '00:04:20', 7, 7),
(82, 'Que Alegria Mas Tonta', '00:03:02', 8, 7),
(83, 'Matar al Cartero', '00:03:27', 9, 7),
(84, 'Superjunkies', '00:04:10', 10, 7),
(85, 'Madrid', '00:03:29', 11, 7),
(86, 'Quiero Hacerlo Esta Noche Contigo', '00:02:30', 12, 7),
(87, 'No queremos ser como los demas', '00:03:13', 1, 8),
(88, 'Rum rum', '00:02:56', 2, 8),
(89, 'El bar de la esquina', '00:05:35', 3, 8),
(90, 'En una noche cualquiera', '00:03:27', 4, 8),
(91, 'Señor kioskero', '00:03:05', 5, 8),
(101, 'Folsom Prison Blues', '00:02:43', 1, 9),
(102, 'Dark as a Dungeon', '00:03:06', 2, 9),
(103, 'I Still Miss Someone', '00:01:36', 3, 9),
(104, 'Cocaine Blues', '00:03:02', 4, 9),
(105, '25 Minutes to Go', '00:03:32', 5, 9),
(106, 'Orange Blossom Special', '00:03:02', 6, 9),
(107, 'The Long Black Veil', '00:04:00', 7, 9),
(108, 'Jackson', '00:02:57', 8, 9),
(109, 'I Got Stripes', '00:01:43', 9, 9),
(110, 'Green,Green Grass of Home', '00:03:00', 10, 9),
(111, 'Rowboat', '00:03:44', 1, 10),
(112, 'Sea of Heartbreak', '00:03:25', 2, 10),
(113, 'Rusty Cage', '00:02:42', 3, 10),
(114, 'Country Boy', '00:02:31', 4, 10),
(115, 'Memories are Made Of This', '00:02:19', 5, 10),
(116, 'Spiritual', '00:05:06', 6, 10),
(117, 'The Kneeling Drunkyard´s Plea', '00:02:31', 7, 10),
(118, 'Southern Accents', '00:04:41', 8, 10),
(119, 'Mean Eyed Cat', '00:02:32', 9, 10),
(120, 'I´ve Been Everywhere', '00:03:17', 10, 10),
(121, 'El Camaleón', '00:02:40', 1, 11),
(122, 'El Mate', '00:02:40', 2, 11),
(123, 'Calentón', '00:01:25', 3, 11),
(124, 'Mama Yo Quiero', '00:05:40', 4, 11),
(125, 'Ciudad Maravillosa', '00:02:00', 5, 11),
(126, 'Juega Conmigo', '00:03:30', 6, 11),
(127, 'Bien Arriba', '00:02:47', 7, 11),
(128, 'El Orangután', '00:02:50', 8, 11),
(129, 'Se Mueve', '00:02:56', 9, 11),
(130, 'Trantela', '00:03:00', 10, 11),
(131, 'E-O-E(El Africano)', '00:03:04', 1, 12),
(132, 'Hey,Vos!', '00:02:01', 2, 12),
(133, 'Salta', '00:01:45', 3, 12),
(134, 'Póntelo Pónselo', '00:02:15', 4, 12),
(135, 'El Africano', '00:03:17', 5, 12),
(136, 'Que Noche Anoche', '00:02:34', 6, 12),
(137, 'El Boliche Se Quemó', '00:01:56', 7, 12),
(138, '1,2,3,Cha Cha Cha', '00:03:00', 8, 12),
(139, 'Al Palo', '00:02:47', 9, 12),
(140, 'Palo-E', '00:02:58', 10, 12),
(151, 'Survival', '00:05:34', 1, 13),
(152, 'Nonstop', '00:05:16', 2, 13),
(153, 'Elevate', '00:03:15', 3, 13),
(154, 'Emotionless', '00:05:16', 4, 13),
(155, 'Gods Plan', '00:03:19', 5, 13),
(156, 'Im upset', '00:04:43', 6, 13),
(157, '8 out of 10', '00:03:56', 7, 13),
(158, 'Mob Ties', '00:03:16', 8, 13),
(159, 'Cant take a joke', '00:04:21', 9, 13),
(160, 'Sandras Rose', '00:05:32', 10, 13),
(161, 'Keep the Family Close', '00:05:29', 1, 14),
(162, 'Nine', '00:02:13', 2, 14),
(163, 'U with me?', '00:02:50', 3, 14),
(164, 'Fell no ways', '00:03:34', 4, 14),
(165, 'Hype', '00:04:21', 5, 14),
(166, 'Redemption', '00:03:25', 6, 14),
(167, 'You and me', '00:02:45', 7, 14),
(168, 'Still here', '00:03:43', 8, 14),
(169, 'Controlla', '00:04:53', 9, 14),
(170, 'One Dance', '00:03:40', 10, 14),
(171, 'Gramys', '00:02:16', 11, 14),
(172, 'Bad Bitch From Tokyo', '00:02:48', 1, 15),
(173, 'Aim for the moon', '00:03:34', 2, 15),
(174, 'For the night', '00:02:56', 3, 15),
(175, 'Ganstas', '00:03:35', 4, 15),
(176, 'Yea Yea', '00:02:50', 5, 15),
(177, 'Creature', '00:05:32', 6, 15),
(178, 'Snitching', '00:03:40', 7, 15),
(179, 'Make it Rain', '00:04:21', 8, 15),
(180, 'The Woo', '00:03:02', 9, 15),
(181, 'Enjoy you self', '00:04:09', 10, 15),
(182, 'Mood Swings', '00:03:33', 11, 15),
(183, 'Something special', '00:02:38', 12, 15),
(184, 'What You Know bout Love', '00:03:40', 13, 15),
(185, 'Meet the woo', '00:02:21', 1, 16),
(186, 'Welcome to the Party', '00:03:35', 2, 16),
(187, 'Hawk Em', '00:01:59', 3, 16),
(188, 'Better Have your gun ', '00:03:29', 4, 16),
(189, 'Scenario', '00:04:42', 5, 16),
(190, 'Dior', '00:03:36', 6, 16),
(191, 'Feeling', '00:02:41', 7, 16),
(192, 'PTSD', '00:03:29', 8, 16),
(193, 'Brother Man', '00:03:03', 9, 16),
(201, 'Spark Another Owl', '00:03:40', 1, 17),
(202, 'Throw Your Set', '00:04:08', 2, 17),
(203, 'Stoned Raiders', '00:02:54', 3, 17),
(204, 'Illusions', '00:04:28', 4, 17),
(205, 'Killa Hill Niggas', '00:04:03', 5, 17),
(206, 'Boom Biddy Bye Bye', '00:04:04', 6, 17),
(207, 'No Rest for the Wicked', '00:05:01', 7, 17),
(208, 'Make a Move', '00:04:33', 8, 17),
(209, 'Killafornia', '00:02:56', 9, 17),
(210, 'Funk Freakers', '00:03:16', 10, 17),
(211, 'Locotes', '00:03:39', 11, 17),
(212, 'Let It Rain', '00:01:46', 12, 17),
(213, 'I Wanna Get High', '00:02:54', 1, 18),
(214, 'I Ain\'t Goin\' Out Like That', '00:04:27', 2, 18),
(215, 'Insante in the Brain', '00:03:29', 3, 18),
(216, 'When The Sh-- Goes Down', '00:03:08', 4, 18),
(217, 'Lick A Shot', '00:03:23', 5, 18),
(218, 'Cock The Hammer', '00:04:25', 6, 18),
(219, 'Interlude', '00:01:16', 7, 18),
(220, 'Legalize It', '00:03:40', 8, 18),
(221, 'Hits From the Bong', '00:00:46', 9, 18),
(222, 'What Go Around Come Around, Kid', '00:02:40', 10, 18),
(223, 'Bring da Ruckus', '00:04:11', 1, 19),
(224, 'Shame on a Nigga', '00:02:57', 2, 19),
(225, 'Clan in da front', '00:04:33', 3, 19),
(226, 'Wu-Tang: 7th Chamber', '00:06:06', 4, 19),
(227, 'Can It Be All So Simple', '00:06:52', 5, 19),
(228, 'Da Mystery of Chessboxin', '00:04:47', 6, 19),
(229, 'Wu-Tang Clan Ain´t Nuthing ta F´Witt', '00:03:36', 7, 19),
(230, 'C.R.E.A.M', '00:04:12', 8, 19),
(231, 'Method Man', '00:05:50', 9, 19),
(232, 'Protect Ya Neck', '00:04:51', 10, 19),
(233, 'Tearz', '00:04:17', 11, 19),
(234, 'The Hood', '00:04:11', 1, 20),
(235, 'Rules', '00:03:53', 2, 20),
(236, 'Chrome Wheels', '00:04:15', 3, 20),
(237, 'Soul Power (Black Jungle)', '00:04:53', 4, 20),
(238, 'Uzi (Pinky Ring)', '00:05:20', 5, 20),
(239, 'One of These Days', '00:04:14', 6, 20),
(240, 'Ya\'all Been Warned', '00:04:15', 7, 20),
(241, 'Babies', '00:05:08', 8, 20),
(242, 'Radioactive', '00:03:30', 9, 20),
(243, 'Back In The Game', '00:04:34', 10, 20),
(244, 'Iron Flag', '00:06:26', 11, 20),
(245, 'Dashing(Reasons)', '00:04:46', 12, 20),
(251, 'White America', '00:05:24', 1, 21),
(252, 'Businesss', '00:04:11', 2, 21),
(253, 'Cleanin Out My Closet', '00:04:47', 3, 21),
(254, 'The Kiss', '00:01:15', 4, 21),
(255, 'Soldier', '00:03:46', 5, 21),
(256, 'Say Goodbye Hollywood', '00:04:32', 6, 21),
(257, 'Drips', '00:04:45', 7, 21),
(258, 'Without Me', '00:04:50', 8, 21),
(259, 'Sing for the moment', '00:05:39', 9, 21),
(260, 'Superman', '00:05:50', 10, 21),
(261, 'Hailie´s Song', '00:05:20', 11, 21),
(262, 'When The Music Stops', '00:04:29', 12, 21),
(263, 'Evil Deeds', '00:04:19', 1, 22),
(264, 'Never Enough', '00:02:39', 2, 22),
(265, 'Yellow Brick Road', '00:05:46', 3, 22),
(266, 'Like Toy Soldiers', '00:04:56', 4, 22),
(267, 'Mosh', '00:05:17', 5, 22),
(268, 'Puke', '00:04:07', 6, 22),
(269, 'Christopher Reeves', '00:04:00', 7, 22),
(270, 'My 1st Single', '00:05:02', 8, 22),
(271, 'Rain Man', '00:05:13', 9, 22),
(272, 'Big Weenie', '00:04:26', 10, 22),
(273, 'Just Lose It', '00:04:08', 11, 22),
(274, 'Ass Like That', '00:04:25', 12, 22),
(275, 'Carita De Inocente', '00:03:11', 1, 23),
(276, 'Si Supieras', '00:03:58', 2, 23),
(277, 'Señorita Por Favor', '00:03:42', 3, 23),
(278, 'Dec. 21', '00:03:22', 4, 23),
(279, 'Es Muy Tarde', '00:03:36', 5, 23),
(280, 'Lotería', '00:03:36', 6, 23),
(281, 'Me Robaste La Vida', '00:03:28', 7, 23),
(282, 'Contra La Pared', '00:03:53', 8, 23),
(283, 'Morir Solo', '00:04:02', 9, 23),
(284, 'Pull Up', '00:03:32', 10, 23),
(285, 'Adicto', '00:03:30', 11, 23),
(286, 'Cita', '00:03:36', 12, 23),
(287, 'No Te Olvides', '00:03:51', 1, 24),
(288, 'Culpa Al Corazón', '00:03:42', 2, 24),
(289, 'Dilema', '00:04:10', 3, 24),
(290, 'La Carretera', '00:03:58', 4, 24),
(291, 'Ganas Locas', '00:03:20', 5, 24),
(292, 'Deja Vu', '00:03:15', 5, 24),
(293, 'Asalto', '00:03:39', 6, 24),
(294, 'Just As I Am', '00:03:44', 7, 24),
(295, 'Amor Prohibido', '00:04:09', 8, 24),
(296, 'Moneda', '00:03:06', 9, 24),
(297, 'X', '00:03:52', 10, 24),
(298, 'Tumbao', '00:03:40', 11, 24),
(299, 'El Clavo', '00:02:53', 12, 24),
(300, 'Cúrame', '00:03:22', 13, 24),
(301, 'Al 100%', '00:02:12', 1, 25),
(302, 'Me dicen Fyahbwoy', '00:02:03', 2, 25),
(303, '1979', '00:02:07', 3, 25),
(304, 'Pull up', '00:01:57', 4, 25),
(305, 'Hablando de weed', '00:01:57', 5, 25),
(306, 'General Fyah', '00:02:04', 6, 25),
(307, 'Tanto por ti', '00:02:23', 7, 25),
(308, 'Hijos de la noche', '00:02:15', 8, 25),
(309, 'El Binghi y el Fyah', '00:02:10', 9, 25),
(310, 'A freaky dem', '00:01:53', 10, 25),
(311, 'Dweet now', '00:02:00', 11, 25),
(312, '10:00 AM', '00:02:14', 12, 25),
(313, 'Mañana ya veré', '00:02:11', 13, 25),
(314, 'Introbwoy', '00:01:15', 1, 26),
(315, 'Innadiflames', '00:02:30', 2, 26),
(316, 'Reggae liphe', '00:01:54', 3, 26),
(317, 'Fenomenal', '00:02:11', 4, 26),
(318, 'Fuma weed', '00:01:45', 5, 26),
(319, 'A veces', '00:02:02', 6, 26),
(320, 'Fashion victims', '00:01:49', 7, 26),
(321, 'Alianza no trata Pt II', '00:01:55', 8, 26),
(322, 'Malianteria', '00:01:46', 9, 26),
(323, 'Ya te avise', '00:01:57', 10, 26),
(324, 'Isopropanol', '00:02:18', 11, 26),
(325, 'No estamos creyendo', '00:03:12', 12, 26),
(326, 'Nuestros dias', '00:02:10', 13, 26),
(327, 'Politics dem', '00:01:56', 14, 26),
(328, '«Back To Tennessee»', '00:06:06', 1, 27),
(329, 'Thrillbilly', '00:04:23', 2, 27),
(330, 'See You Again', '00:03:42', 3, 27),
(331, '7 Things', '00:04:05', 4, 27),
(332, 'Fly on the Wall', '00:02:56', 5, 27),
(333, 'The Climb', '00:04:48', 6, 27),
(334, 'Butterfly Fly Away', '00:03:55', 7, 27),
(335, 'Thrillbilly', '00:05:01', 8, 27),
(336, 'Liberty Walk', '00:04:09', 1, 28),
(337, 'Who Owns My Heart', '00:03:33', 2, 28),
(338, 'Can\'t Be Tamed', '00:02:50', 3, 28),
(339, 'Every Rose Has Its Thor', '00:03:51', 4, 28),
(340, 'Two More Lonely People', '00:03:11', 5, 28),
(341, 'Forgiveness and Love', '00:03:31', 6, 28),
(342, 'Permanent December', '00:03:37', 7, 28),
(343, 'Stay', '00:04:21', 8, 28),
(344, 'Scars', '00:03:43', 9, 28),
(345, 'Take Me Along', '00:04:09', 10, 28),
(346, 'Robot', '00:03:43', 11, 28),
(347, 'My Heart Beats For Love', '00:03:42', 12, 28),
(351, 'The Big Picture (intro)', '00:02:59', 1, 29),
(352, 'Ebonics', '00:03:26', 2, 29),
(353, 'Size \'Em Up', '00:03:56', 3, 29),
(354, 'Deadly Combination', '00:02:33', 4, 29),
(355, '\'98 Freestyle', '00:04:32', 5, 29),
(356, 'Holdin\' It Down', '00:04:40', 6, 29),
(357, 'The Heist', '00:03:03', 7, 29),
(358, 'The Enemy', '00:02:49', 8, 29),
(359, 'Fall back', '00:03:03', 9, 29),
(360, 'Flamboyant', '00:03:08', 10, 29),
(361, 'Casualties of a Dice game', '00:03:19', 11, 29),
(362, '8 iz Enuff', '00:04:20', 1, 30),
(363, 'Harlem N.Y.C', '00:04:46', 2, 30),
(364, 'You Know What I\'m About', '00:04:26', 3, 30),
(365, '98 Halftime Radio', '00:03:39', 4, 30),
(366, 'Yours', '00:04:10', 5, 30),
(367, 'Work Pt.II', '00:03:06', 6, 30),
(368, 'Tru Master', '00:04:40', 7, 30),
(369, 'Cluemanati', '00:04:49', 8, 30),
(370, '5 fingers of Death', '00:04:53', 9, 30),
(371, 'Let me find out', '00:02:35', 10, 30),
(372, 'Pain is Love', '00:01:18', 1, 31),
(373, 'Dial M For Murder', '00:03:32', 2, 31),
(374, 'Livin\' It Up', '00:04:17', 3, 31),
(375, 'The Inc.', '00:03:56', 4, 31),
(376, 'Always On Time', '00:04:05', 5, 31),
(377, 'Down A** B**ch', '00:05:31', 6, 31),
(378, 'Never Again', '00:04:19', 7, 31),
(379, 'Worldwide Gangsta', '00:03:20', 8, 31),
(380, 'Leo (Skit)', '00:02:18', 9, 31),
(381, 'I\'m Real', '00:04:54', 10, 31),
(382, 'Ja Rule (Smokin & Ridin)', '00:04:51', 11, 31),
(383, 'Intro', '00:00:20', 1, 32),
(384, 'Thug Lovin\'', '00:04:50', 2, 32),
(385, 'Mesmerize', '00:04:38', 3, 32),
(386, 'Pop Niggas', '00:04:29', 4, 32),
(387, 'The Pledge', '00:03:54', 5, 32),
(388, 'Murder Reigns', '00:04:02', 6, 32),
(389, 'Last Temptation', '00:04:58', 7, 32),
(390, 'Murder Me', '00:05:15', 8, 32),
(391, 'The Warning', '00:05:05', 9, 32),
(392, 'Connected', '00:04:54', 10, 32),
(401, 'rock n\' roll', '00:04:45', 1, 33),
(402, 'scary monsters and nice sprites', '00:04:04', 2, 33),
(403, 'kill everybody', '00:04:58', 3, 33),
(404, 'breakn\' a sweat', '00:05:03', 4, 33),
(405, 'scatta', '00:03:55', 5, 33),
(406, 'with you, friends', '00:06:29', 6, 33),
(407, 'first of the year', '00:04:22', 7, 33),
(408, 'Kyoto', '00:03:20', 8, 33),
(409, 'the devil\'s den', '00:04:53', 9, 33),
(410, 'Bangarang', '00:03:35', 10, 33),
(411, 'All Is Fair in Love and Bropstep', '00:04:09', 1, 34),
(412, 'Recess', '00:03:58', 2, 34),
(413, 'Stranger', '00:04:50', 3, 34),
(414, 'Try It Out', '00:03:49', 4, 34),
(415, 'Dirty vibe', '00:03:27', 5, 34),
(416, 'Ragga Bomb', '00:04:19', 6, 34),
(417, 'Fuck That', '00:03:50', 7, 34),
(418, 'Ease my mind', '00:05:03', 8, 34),
(419, 'Fire Away', '00:05:43', 9, 34),
(420, 'Be still and know', '00:05:44', 1, 35),
(421, 'imperium', '00:06:45', 2, 35),
(422, 'beautiful mourning', '00:04:50', 3, 35),
(423, 'the blood, the sweat, the tears', '00:04:15', 4, 35),
(424, 'aesthetics of hate', '00:05:30', 5, 35),
(425, 'old', '00:04:09', 6, 35),
(426, 'I Am Hell', '00:08:28', 1, 36),
(427, 'Locust', '00:07:36', 2, 36),
(428, 'This Is the End', '00:06:12', 3, 36),
(429, 'Darkness Within', '00:06:28', 4, 36),
(430, 'Pearls Before the Swine', '00:07:20', 5, 36),
(431, 'Who We Are', '00:07:07', 6, 36),
(432, 'The Sentinel', '00:05:13', 7, 36),
(433, 'Witch Hunt', '00:04:47', 8, 36),
(451, 'Life in Technicolor', '00:02:29', 1, 37),
(452, 'Cementeries of London', '00:03:21', 2, 37),
(453, 'Lost!', '00:03:55', 3, 37),
(454, '42', '00:03:57', 4, 37),
(455, 'Lovers in Japan', '00:03:57', 5, 37),
(456, 'Yes', '00:04:04', 6, 37),
(457, 'Viva la Vida', '00:04:01', 7, 37),
(458, 'Violet Hill', '00:03:42', 8, 37),
(459, 'Strawberry Swing', '00:04:09', 9, 37),
(460, 'Death and All His Friends', '00:03:30', 10, 37),
(461, 'A Head Full of Dreams', '00:03:43', 1, 38),
(462, 'Birds', '00:03:49', 2, 38),
(463, 'Hymn for the Weekend', '00:04:18', 3, 38),
(464, 'Everglow', '00:04:42', 4, 38),
(465, 'Adventure of a Lifetime', '00:04:23', 5, 38),
(466, 'Fun', '00:04:27', 6, 38),
(467, 'Kaleidoscope', '00:01:51', 7, 38),
(468, 'Army of One', '00:03:22', 8, 38),
(469, 'Amazing Day', '00:04:31', 9, 38),
(470, 'Color Of Spectrum', '00:05:30', 10, 38),
(471, 'Doll', '00:01:23', 1, 39),
(472, 'Monkey Wrench', '00:03:51', 2, 39),
(473, 'Hey, Johnny Park!', '00:04:08', 3, 39),
(474, 'My Poor Brain', '00:03:33', 4, 39),
(475, 'Wind Up', '00:02:32', 5, 39),
(476, 'Up in Arms', '00:02:15', 6, 39),
(477, 'My Hero', '00:04:20', 7, 39),
(478, 'See You', '00:02:26', 8, 39),
(479, 'Enough Space', '00:02:37', 9, 39),
(480, 'Everlong', '00:04:10', 11, 39),
(481, 'The Pretender', '00:04:29', 1, 40),
(482, 'Let It Die', '00:04:05', 2, 40),
(483, 'Erase/Replace', '00:04:13', 3, 40),
(484, 'Long Road to Ruin', '00:03:44', 4, 40),
(485, 'Come Alive', '00:05:10', 5, 40),
(486, 'Stranger Things Have Happened', '00:05:21', 6, 40),
(487, 'Cheer Up, Boys (Your Make Up Is Running)', '00:03:41', 7, 40),
(488, 'Summer\'s End', '00:04:37', 8, 40),
(489, 'Ballad of the Beaconsfield Miners', '00:02:32', 9, 40),
(490, 'Statues', '00:03:47', 10, 40),
(501, 'Todos los días son hoy', '00:05:04', 1, 41),
(502, 'El ciclo de la vida', '00:04:32', 2, 41),
(503, 'El mejor momento de tu día ', '00:03:00', 3, 41),
(504, 'And you don\'t stop', '00:02:00', 4, 41),
(505, 'Lo que ven cuando me miran', '00:03:54', 5, 41),
(506, 'Dudas', '03:04:00', 6, 41),
(507, 'Un nuevo yo despier', '00:03:17', 7, 41),
(508, 'Nuestro secreto', '00:03:25', 8, 41),
(509, 'Dara ra ra rá ', '00:02:50', 9, 41),
(510, 'Haz. Más', '00:02:55', 10, 41),
(511, 'De acero inolvidable ', '00:03:14', 11, 41),
(512, 'Desde que tengo memoria ', '00:04:15', 12, 41),
(513, 'Rap contra el racismo', '00:06:14', 13, 41),
(514, '... y el último del último ', '00:05:04', 14, 41),
(515, 'Haz tu propio rap contra racismo ', '00:03:14', 15, 41),
(516, 'Según el guión', '00:03:11', 1, 42),
(517, 'Hoy sí', '00:04:32', 2, 42),
(518, 'Por las segundas', '00:03:00', 3, 42),
(519, 'Lo que ellos quieren ', '00:02:00', 4, 42),
(520, 'Sólo hace falta un', '00:03:54', 5, 42),
(521, 'Mi estilo de vida ', '00:03:04', 6, 42),
(522, 'Soy y no soy ', '00:03:17', 7, 42),
(523, 'Camino sobre el agua ', '00:03:25', 8, 42),
(524, 'Pensar menos, sentir más ', '00:02:50', 9, 42),
(525, 'El origen', '00:04:50', 10, 42),
(526, 'No podemos', '00:03:14', 11, 42),
(527, 'Guerra y paz', '00:04:15', 12, 42),
(528, 'Recalculando ruta ', '00:06:14', 13, 42),
(529, 'Mi odisea', '00:06:00', 14, 42),
(530, 'Introspección', '00:03:14', 15, 42),
(531, 'Papercut', '00:03:05', 1, 43),
(532, 'One Step Closer', '00:02:35', 2, 43),
(533, 'With You (Dust Brothers)', '00:03:23', 3, 43),
(534, 'Points of Authority', '00:04:04', 4, 43),
(535, 'Crawling', '00:03:29', 5, 43),
(536, 'Runaway', '00:03:04', 6, 43),
(537, 'By Myself', '00:03:10', 7, 43),
(538, 'In the End', '00:03:36', 8, 43),
(539, 'A Place For My Head ', '00:03:24', 9, 43),
(540, 'Forgotten', '00:03:14', 10, 43),
(541, 'Cure for the Itch', '00:02:37', 11, 43),
(542, 'Pushing Me Away', '00:03:11', 12, 43),
(543, 'Nobody Can Save Me', '00:03:45', 1, 44),
(544, 'Todos los días son hoy', '00:03:31', 2, 44),
(545, 'Nobody Can Save Me', '00:03:31', 3, 44),
(546, 'Good Goodbye', '00:03:51', 4, 44),
(547, 'Talking to Myself', '00:03:36', 5, 44),
(548, 'Battle Symphony', '00:03:34', 6, 44),
(549, 'Invisible Mike Shinoda', '00:02:49', 7, 44),
(550, 'Heavy (con Kiiara) ', '00:03:37', 8, 44),
(551, 'Next To Me', '00:03:50', 1, 45),
(552, 'I Dont\'t Know Why', '00:03:10', 2, 45),
(553, 'Whatever It Takes', '00:03:21', 3, 45),
(554, 'Believer', '00:03:24', 4, 45),
(555, 'Walking The Wire', '00:03:52', 5, 45),
(556, 'Rise Up', '00:03:51', 6, 45),
(557, 'I\'ll Make It Up to You', '00:04:22', 7, 45),
(558, 'Yesterday', '00:03:25', 8, 45),
(559, 'Mouth Of The River', '00:03:41', 9, 45),
(560, 'Thunder', '00:03:07', 10, 45),
(561, 'Start Over', '00:03:06', 11, 45),
(562, 'Dancing in the dark', '00:03:07', 12, 45),
(563, 'My Life', '00:03:04', 1, 46),
(564, 'Lonely', '00:02:39', 2, 46),
(565, 'Wrecked', '00:04:04', 3, 46),
(566, 'Monday', '00:03:07', 4, 46),
(567, '#1', '00:03:25', 5, 46),
(568, 'Easy Come Easy Go', '00:02:59', 6, 46),
(569, 'Giants', '00:03:30', 7, 46),
(570, 'It\'s Ok', '00:03:22', 8, 46),
(571, 'Dull Knives', '00:03:33', 9, 46),
(572, 'Follow You', '00:02:55', 10, 46),
(573, 'Cutthroat', '00:02:49', 11, 46),
(574, 'No Time for Toxic People', '00:03:27', 12, 46),
(575, 'Heavydirtysoul', '00:03:54', 1, 47),
(576, 'Stressed Out', '00:03:22', 2, 47),
(577, 'Ride', '00:03:34', 3, 47),
(578, 'Fairly Local', '00:03:27', 4, 47),
(579, 'Tear in My Heart', '00:03:08', 5, 47),
(580, 'Lane Boy', '00:04:13', 6, 47),
(581, 'The Judge', '00:04:57', 7, 47),
(582, 'Doubt', '00:03:11', 8, 47),
(583, 'Polarize', '00:03:46', 9, 47),
(584, 'We Don\'t Believe What\'s on TV', '00:02:57', 10, 47),
(585, 'Message Man', '00:04:00', 11, 47),
(586, 'Hometown', '00:03:54', 12, 47),
(587, 'Jumpsuit', '00:03:58', 1, 48),
(588, 'Levitate', '00:02:25', 2, 48),
(589, 'Morph', '00:04:18', 3, 48),
(590, 'My Blood', '00:03:49', 4, 48),
(591, 'Chlorine', '00:05:24', 5, 48),
(592, 'Smithereens', '00:02:57', 6, 48),
(593, 'Neon Gravestones', '00:04:00', 7, 48),
(594, 'The Hype', '00:04:25', 8, 48),
(595, 'Nico and the Niners', '00:03:45', 9, 48),
(596, 'Cut My Lip', '00:04:42', 10, 48),
(597, 'Bandito', '00:05:31', 11, 48),
(598, 'Pet Cheetah', '00:03:18', 12, 48),
(599, 'Legend', '00:02:52', 13, 48),
(600, 'Leave The City', '00:04:40', 14, 48);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `cod_genero` tinyint(3) UNSIGNED NOT NULL,
  `genero` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`cod_genero`, `genero`) VALUES
(1, 'Bachata'),
(2, 'Country'),
(3, 'Dancehall'),
(4, 'Dubstep'),
(5, 'Groove metal'),
(6, 'Hard rock'),
(7, 'Hip hop'),
(8, 'Metal alternativo'),
(9, 'Pop'),
(10, 'Pop latino'),
(11, 'Pop punk'),
(12, 'Pop Rock'),
(13, 'Rap'),
(14, 'Rapcore'),
(15, 'Rock alternativo'),
(16, 'Rock and roll'),
(17, 'Rock electrónico'),
(18, 'Thrash metal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE `grupos` (
  `cod_grupo` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `nacionalidad` varchar(35) NOT NULL DEFAULT 'No disponible',
  `biografia` varchar(500) NOT NULL,
  `foto` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`cod_grupo`, `nombre`, `nacionalidad`, `biografia`, `foto`) VALUES
(1, 'Subze', 'Española', 'Su nombre de pila es Miguel Ángel,23 años, lleva desde 2005 haciendo música, tiene un estilo directo, crítico,\r\nprofundo y transgresor.', '1.jpg'),
(2, 'Natos y Waor ', 'Española', 'Natos y Waor son dos cantantes de RAP, Gonzalo y Fernando respectivamente que se conocieron en Madrid\r\nhaciendo batallas de gallo, empezaron a hablar y desde entonces cantan juntos.', '2.jpg'),
(3, 'Green Day', 'Estadounidense', 'Grupo estadounidense de música rock con reminiscencias punk, formado en 1988 en Berkeley e integrado por Billie Joe Armstrong (voz, guitarra), Mike Dirnt (bajo) y Tre Cool (batería). Billie Joe Armstrong y Mike Dirnt, vecinos de la localidad californiana de Rodeo, formaron la banda a finales de los años ochenta', '3.jpg'),
(4, 'Pereza', 'Española', 'Pereza fue un grupo musical de rock español activo de 2001 a 2011 y originario del barrio de la Alameda de Osuna (Madrid), compuesto por Rubén y Leiva', '4.jpg'),
(5, 'Jhonny Cash', 'Estadounidense', 'Nació el 26 de febrero de 1932 en Kingsland, Arkansas, como pionero del rockabilly y el rock and roll en los años 50,\r\nen las décadas en las que fue un representante internacional de la música country y falleció en\r\nel Baptist Hospital de Nashville por complicaciones de diabetes. El músico fue enterrado\r\nal lado de su esposa en el Hendersonville Memory Gardens de Hendersonville, Tennessee.', '5.jpg'),
(6, 'King Africa', 'Argentina', 'En 1993 lanza su primer disco, que alcanzó el disco de oro en Argentina, este incluía el primer gran éxito de la banda (Salta), en 1994 editan la segunda producción (Al Palo)ambos de larga duración tuvieron como solista a Martin Laacré.Luego en 1995 y después de alcanzar en gran parte de Hispanoamérica, se presentan triunfalmente en el Festival de Viña del Mar.En 1996 y por diferencias entre los productores y el vocalista,Laacré se aleja de la banda.', '6.jpg'),
(7, 'Drake', 'Nacionalidad', ' Aubrey Drake Graham, conocido simplemente como Drake, es un músico, cantante, compositor, productor discográfico y actor canadiense', '7.jpeg'),
(8, 'Pop Smoke', 'Estadounidense', 'Bashar Barakah Jackson, conocido profesionalmente como Pop Smoke, fue un rapero, cantante y compositor estadounidense de origen panameño. Nacido y criado en Canarsie, Brooklyn, Pop Smoke comenzó su carrera musical en 2018.', '8.jpg'),
(9, 'Cypres Hill', 'Estadounidense', 'Cypress Hill es un grupo de Hip Hop proveniente de Los Angeles. Fue formado en 1986 y a lo largo de su amplia carrea han vendido más de 46 millones de Álbumes. Grupo formado por:  DJ Muggs, B-Real, Sen Dog, Eric \"Bobo\" Correa.', '9.png'),
(10, 'Wu-Tang Clan', 'Estadounidense', 'Wu-Tang Clan es un grupo de rap originario de State Islan, Nueva York, Estados Unidos. El grupo está formado por 9 MC´s. Todos sus miembtos han lanzado albumes solistas, y el grupo ha producido diferente grupos y solistas. Este era el plan desde el principio del grupo:convertirse en un imperior y tomar la comunidad del rap con la saturación de buenos artistas.', '10.png'),
(11, 'Eminem', 'estadounidense', 'Nació en Saint Joseph, Misuri.En su preadolescencia, Mathers se interesó mucho en el hip hop. Durante la pubertad, Mathers fue inscrito en la escuela Lincoln High School donde participó en batallas de freestyle. Abandonó la escuela a los 17 años para ir poco a poco abriendose camino en la industria musical hasta acabar convirtiéndose en uno de los raperos más conocidos a nivel mundial del siglo XXI.', '11.jpg'),
(12, 'Prince Royce', 'estadounidense', 'Geoffrey Royce Rojas comenzó su carrera artística cuando era muy joven. Nació el 11 de mayo de 1989 en Bronx, Nueva York, y su ascendencia es dominicana. Conocido como Prince Royce, el cantante, compositor y productor dio sus primeros pasos en el arte a sus 13 años, escribiendo poesías y luego musicalizándolas.', '12.png'),
(13, 'swan fyahbwoy', 'Madrid', 'Elán Swan Fernández , más conocido como Fyahbwoy o El chico del fuego, es un artista de dancehall de Madrid, España, y miembro fundador delcolectivo Madrid Dancehall Crew MDC', '13.jpg'),
(14, 'Miley Cyrus', 'Estados Unidos', 'Miley Ray Cyrus 23 de noviembre de 1992, Franklin, Tennessee, nacida como Destiny Hope Cyrus, es un cantante y compositora pop norteamericana. Miley es hija de una estrella del country, Billy Ray Cyrus. Nació con un defecto en el corazón, lo que causa que tenga en reposo una frecuencia cardíaca anormal.', '14.jpg'),
(15, 'Big L', 'Estadounidense', 'Big L o Lamont Coleman nació y creció en Harlem , Nueva York, donde a mediana edad comenzó su carrera rapeando con \'Three The Hard Way\'. Su primera aparición profesional fue con Lord Finesse en la canción \'Yes You May (Remix) en 1992\'. Lanzó su álbum debut \'Lifestylez Ov Da Poor & Dangerous\' en 1995 y ha contribuído significativamente a la escena del hip hop y rap mundial.', '15.jpg'),
(16, 'Ja Rule', 'Estadounidense', 'Jeffrey Atkins (Nueva York, 29 de febrero de 1976), más conocido como Ja Rule, es un rapero, cantante, escritor de canciones, productor de discos, ejecutivo de discos, y actor estadounidense. Rule es conocido por su característica voz y por promocionar su productora The Inc. todo el tiempo. Rule ha incluido seis de sus álbumes en el top ten de la Billboard (dos de ellos llegando al número uno).', '16.jpg'),
(17, 'Skrillex', 'Estadounidense', 'Sonny John Moore nacido el 15 de enero de 1988 en Los Ángeles, California es conocido por su nombre artístico Skrillex, es un productor estadounidense de música electrónica de los géneros dubstep, brostep y electro house, además de haber sido vocalista de la banda de post-hardcore From First to Last, entre los años 2004 y 2007.', '17.jpg'),
(18, 'Machine Head', 'Estadounidense', 'Machine Head es una banda estadounidense de groove metal formada el 12 de octubre de 1991 en Oakland, Estado de California. Robb Flynn formó Machine Head en 1991 con Adam Duce, Logan Mader y Tony Constanza. El primer álbum de la banda, Burn My Eyes, fue un gran éxito tanto en Europa como en los Estados Unidos, Machine Head alcanzaría el éxito con sus álbumes posteriores. La banda estuvo a punto de disolverse en 2002, pero al final no lo hicieron.', '18.jpg'),
(19, 'Coldplay', 'Inglesa', 'Coldplay es una banda británica de pop rock y rock alternativo formada en Londres en 1996. Está integrada por Chris Martin, Jon Buckland, Guy Berryman y Will Champion. Es uno de los grupos más relevantes de principios de la década de los 2000.', '19.jpg'),
(20, 'Foofighters', 'Estadounidense', 'Foo Fighters es una banda de rock estadounidense formada en la ciudad de Seattle en 1994 por Dave Grohl, exbaterista de Nirvana y Scream.', '20.jpg'),
(21, 'El Chojin', 'Española', 'Domingo Antonio Edjang Moreno, más conocido por su nombre artístico El Chojin, es un rapero y compositor español.', '21.jpg'),
(22, 'Linkin Park', 'Estadounidense', 'Linkin Park es una banda estadounidense de rock alternativo procedente de Agoura Hills, California. Se formó en 1996. Integrada por Mike Shinoda, Dave Farrell, Joe Hahn, Brad Delson, Rob Bourdon y Chester Bennington, este último como voz principal.', '22.jpg'),
(23, 'Imagine Dragons', 'Estadounidense', 'Imagine Dragons se formó en 2008 con Dan Reynolds como vocalista junto a otros estudiantes de la Universidad Brigham Young. Al tiempo, llegaría quien hoy es su guitarrista, Wayne Sermon. Luego, fue llamado Ben McKee, su bajista y, más adelante, Daniel Platzman, su baterista.', '23.jpg'),
(24, 'Twenty One Pilots', 'Estadounidense', 'Twenty One Pilots se formó en 2009 por el vocalista Tyler Joseph junto con Nick Thomas y Chris Salih, quienes se fueron en 2011. Desde su partida, la formación ha consistido en Tyler Joseph y el baterista Josh Dun. El dúo es principalmente conocido por los sencillos Stressed Out, Ride y Heathens', '24.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `user` varchar(50) NOT NULL,
  `pass` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `user`, `pass`) VALUES
(1, 'pepe@gmail.com', 0x98f4b21f17e45022073a35256ee4298c);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `albumes`
--
ALTER TABLE `albumes`
  ADD PRIMARY KEY (`cod_album`),
  ADD UNIQUE KEY `portada` (`portada`),
  ADD KEY `cod_grupo` (`cod_grupo`);

--
-- Indices de la tabla `albumes_generos`
--
ALTER TABLE `albumes_generos`
  ADD PRIMARY KEY (`cod_album`,`cod_genero`),
  ADD KEY `cod_genero` (`cod_genero`);

--
-- Indices de la tabla `canciones`
--
ALTER TABLE `canciones`
  ADD PRIMARY KEY (`cod_cancion`),
  ADD KEY `cod_album` (`cod_album`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`cod_genero`),
  ADD UNIQUE KEY `genero` (`genero`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`cod_grupo`),
  ADD UNIQUE KEY `foto` (`foto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user` (`user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `albumes`
--
ALTER TABLE `albumes`
  ADD CONSTRAINT `albumes_ibfk_1` FOREIGN KEY (`cod_grupo`) REFERENCES `grupos` (`cod_grupo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `albumes_generos`
--
ALTER TABLE `albumes_generos`
  ADD CONSTRAINT `albumes_generos_ibfk_1` FOREIGN KEY (`cod_album`) REFERENCES `albumes` (`cod_album`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `albumes_generos_ibfk_2` FOREIGN KEY (`cod_genero`) REFERENCES `generos` (`cod_genero`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `canciones`
--
ALTER TABLE `canciones`
  ADD CONSTRAINT `canciones_ibfk_1` FOREIGN KEY (`cod_album`) REFERENCES `albumes` (`cod_album`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
