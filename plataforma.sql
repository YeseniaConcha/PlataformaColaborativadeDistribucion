-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-12-2023 a las 18:31:55
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
-- Base de datos: `plataforma`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounts_customuser`
--

CREATE TABLE `accounts_customuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nombre_completo` varchar(70) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `tipo_permisos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `accounts_customuser`
--

INSERT INTO `accounts_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `nombre_completo`, `direccion`, `telefono`, `tipo_permisos`) VALUES
(1, 'pbkdf2_sha256$260000$4tOoEEpnclZnrgFFb5ocfb$4UFafnTDmcxJJ4H6802M1AZMX0Wm9XYa6+Ak2juL4lA=', '2023-12-13 17:30:18.998060', 0, 'administrador', '', '', 'administrador@cloud.uautonoma.cl', 1, 1, '2023-10-15 18:38:09.963911', 'administrador', 'Cinco Pte. N°1670, Talca, Maule', '951584291', 0),
(2, 'pbkdf2_sha256$260000$V2TnYqR4mUxrurnSWYyQIh$5V3EdRjbPpyS43BzlztfiE3Rv5XRPVAQI4LLu5/BdYM=', '2023-12-05 18:49:46.506162', 0, 'usuario', '', '', 'usuario@cloud.uautonoma.cl', 0, 1, '2023-10-15 19:21:06.916219', 'usuario', 'Cinco Pte. N°1670, Talca, Maule', '951584291', 1),
(3, 'pbkdf2_sha256$260000$qLSdkZERelW1eg4GPNLou8$cMvNjTlLDBHJ9DQvyd0TMAYr1dH2af9Kmxl2t7UHP3Y=', NULL, 0, 'otro', '', '', 'otro@gmail.com', 0, 1, '2023-10-15 19:38:15.814318', 'otro', 'av siempre  viva#123', '12323434', 1),
(4, 'pbkdf2_sha256$260000$zbpnheiIuf2IbwjqXnKCB2$MsbqCQKkc5QbF9KT7cS0BPRFdtbVEQvblTmGP1Kuq1I=', '2023-10-17 00:55:38.617843', 0, 'administrador1', '', '', 'administrador@gmail.cl', 1, 1, '2023-10-17 00:55:38.513371', 'administrador', 'avenida siempre viva', '12233423', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounts_customuser_groups`
--

CREATE TABLE `accounts_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounts_customuser_user_permissions`
--

CREATE TABLE `accounts_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounts_permiso`
--

CREATE TABLE `accounts_permiso` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounts_rol`
--

CREATE TABLE `accounts_rol` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add permiso', 7, 'add_roles'),
(26, 'Can change permiso', 7, 'change_roles'),
(27, 'Can delete permiso', 7, 'delete_roles'),
(28, 'Can view permiso', 7, 'view_roles'),
(29, 'Can add noticia', 8, 'add_noticia'),
(30, 'Can change noticia', 8, 'change_noticia'),
(31, 'Can delete noticia', 8, 'delete_noticia'),
(32, 'Can view noticia', 8, 'view_noticia'),
(33, 'Can add Permiso', 9, 'add_permiso'),
(34, 'Can change Permiso', 9, 'change_permiso'),
(35, 'Can delete Permiso', 9, 'delete_permiso'),
(36, 'Can view Permiso', 9, 'view_permiso'),
(37, 'Can add usuario', 10, 'add_customuser'),
(38, 'Can change usuario', 10, 'change_customuser'),
(39, 'Can delete usuario', 10, 'delete_customuser'),
(40, 'Can view usuario', 10, 'view_customuser'),
(41, 'Can add Rol', 11, 'add_rol'),
(42, 'Can change Rol', 11, 'change_rol'),
(43, 'Can delete Rol', 11, 'delete_rol'),
(44, 'Can view Rol', 11, 'view_rol'),
(45, 'Can add documento', 12, 'add_documento'),
(46, 'Can change documento', 12, 'change_documento'),
(47, 'Can delete documento', 12, 'delete_documento'),
(48, 'Can view documento', 12, 'view_documento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(10, 'accounts', 'customuser'),
(9, 'accounts', 'permiso'),
(11, 'accounts', 'rol'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(12, 'plataformaApp', 'documento'),
(8, 'plataformaApp', 'noticia'),
(7, 'plataformaApp', 'roles'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'plataformaApp', '0001_initial', '2023-10-15 18:36:29.658738'),
(2, 'plataformaApp', '0002_noticia', '2023-10-15 18:36:29.716546'),
(3, 'contenttypes', '0001_initial', '2023-10-15 18:36:29.886081'),
(4, 'contenttypes', '0002_remove_content_type_name', '2023-10-15 18:36:29.976885'),
(5, 'auth', '0001_initial', '2023-10-15 18:36:31.255971'),
(6, 'auth', '0002_alter_permission_name_max_length', '2023-10-15 18:36:31.323892'),
(7, 'auth', '0003_alter_user_email_max_length', '2023-10-15 18:36:31.369744'),
(8, 'auth', '0004_alter_user_username_opts', '2023-10-15 18:36:31.382626'),
(9, 'auth', '0005_alter_user_last_login_null', '2023-10-15 18:36:31.439113'),
(10, 'auth', '0006_require_contenttypes_0002', '2023-10-15 18:36:31.444101'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2023-10-15 18:36:31.454063'),
(12, 'auth', '0008_alter_user_username_max_length', '2023-10-15 18:36:31.475001'),
(13, 'auth', '0009_alter_user_last_name_max_length', '2023-10-15 18:36:31.497959'),
(14, 'auth', '0010_alter_group_name_max_length', '2023-10-15 18:36:31.524902'),
(15, 'auth', '0011_update_proxy_permissions', '2023-10-15 18:36:31.545716'),
(16, 'auth', '0012_alter_user_first_name_max_length', '2023-10-15 18:36:31.582591'),
(17, 'accounts', '0001_initial', '2023-10-15 18:36:32.363264'),
(18, 'accounts', '0002_auto_20231013_1931', '2023-10-15 18:36:32.459857'),
(19, 'plataformaApp', '0003_auto_20231013_1931', '2023-10-15 18:36:33.088444'),
(20, 'accounts', '0003_auto_20231013_2006', '2023-10-15 18:36:33.298589'),
(21, 'admin', '0001_initial', '2023-10-15 18:36:33.557906'),
(22, 'admin', '0002_logentry_remove_auto_add', '2023-10-15 18:36:33.567717'),
(23, 'admin', '0003_logentry_add_action_flag_choices', '2023-10-15 18:36:33.579617'),
(24, 'sessions', '0001_initial', '2023-10-15 18:36:33.747437'),
(25, 'accounts', '0004_remove_customuser_rol', '2023-10-15 19:36:42.438952'),
(26, 'plataformaApp', '0004_noticia_imagen', '2023-10-15 19:51:07.406518'),
(27, 'plataformaApp', '0005_auto_20231015_1727', '2023-10-15 20:27:21.044933'),
(28, 'plataformaApp', '0006_auto_20231015_1736', '2023-10-15 20:36:49.200194'),
(29, 'plataformaApp', '0007_documento', '2023-10-17 00:45:20.611476'),
(30, 'plataformaApp', '0008_documento_fecha_publicacion', '2023-10-18 22:54:04.353221'),
(31, 'plataformaApp', '0009_alter_documento_archivo_pdf', '2023-10-18 22:57:24.410952'),
(32, 'plataformaApp', '0010_alter_documento_options', '2023-10-19 00:06:16.322789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3bu6bp8o7qwln114d83mrwdxys2xrnhc', '.eJxVjDsOwyAQRO9CHSFYPmtSpvcZELAQnERYMnYV5e6xJRdJOfPezJv5sK3Vbz0vfiJ2ZcAuv10M6ZnbAegR2n3maW7rMkV-KPyknY8z5dftdP8Oauh1X8dorUJtEkYEBQZRKSBJ1g1aAmFxKMCkBEVoB1kKG8ogxR4NaEeOfb6ufDZX:1r0nOC:z8FYZ400ZrbQAXuIm5iVJVGba6zTaZjHVZjELDCyttM', '2023-11-22 18:34:56.141877'),
('ff1l08kwb44jk2z5bertzm3l4mkqqah3', '.eJxVjEEOwiAQRe_C2hCGQqEu3XsGMjCDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwkzgLEKffLWJ6cN0B3bHemkytrssc5a7Ig3Z5bcTPy-H-HRTs5VsnSOCBsmGE0Vl2A2tDxCZahDR4shE8k88DKeU5jxNaTzpO7CxolcT7A_vEOGE:1rDT3r:2c3pJ7JaOpmXzjd9KNakZjbyysy_D_6c3MwvMAogyXU', '2023-12-27 17:30:19.007102'),
('gmeivfdf1d87txqsyn5qi9c1esx7va8k', '.eJxVjDkOwjAUBe_iGlm2402U9JzB-v4LDqBEipMKcXeIlALaNzPvpQpsaytb56WMpM7KqtPvVgEfPO2A7jDdZo3ztC5j1buiD9r1dSZ-Xg7376BBb9-6OoNBhCJkYkBgji7bEJhQBuNqJBuT9yLVWAGfsvhkU0WbxMmASb0_Ghk47g:1qs60A:E3-GwZaBxN9p2A2jF7kBZltLO5zJYLzqI5ydP73uXaU', '2023-10-29 18:38:10.085657');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plataformaapp_documento`
--

CREATE TABLE `plataformaapp_documento` (
  `id` bigint(20) NOT NULL,
  `nombreDocumento` varchar(500) NOT NULL,
  `descripcionDocumento` varchar(1000) NOT NULL,
  `archivo_pdf` varchar(100) NOT NULL,
  `fecha_publicacion` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `plataformaapp_documento`
--

INSERT INTO `plataformaapp_documento` (`id`, `nombreDocumento`, `descripcionDocumento`, `archivo_pdf`, `fecha_publicacion`) VALUES
(12, 'documento de prueba', 'este es un documento', 'archivos_pdf/Clase_1.pdf', '2023-10-26 18:13:03.639410'),
(13, 'prueba', 'este es un documento de prueba', 'archivos_pdf/Guía_1_FPP_7_marzo.pdf', '2023-12-05 00:27:15.929169');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plataformaapp_noticia`
--

CREATE TABLE `plataformaapp_noticia` (
  `id` bigint(20) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `contenido` longtext NOT NULL,
  `fecha_publicacion` datetime(6) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `plataformaapp_noticia`
--

INSERT INTO `plataformaapp_noticia` (`id`, `titulo`, `contenido`, `fecha_publicacion`, `imagen`) VALUES
(9, 'Políticas intelectuales', 'Charla vía Teams de políticas de propiedades intelectuales de la Universidad Autónoma de Chile\r\nViernes 24 de noviembre, 11:00 hrs', '2023-11-23 19:01:14.659926', 'noticias/Charla.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plataformaapp_roles`
--

CREATE TABLE `plataformaapp_roles` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accounts_customuser`
--
ALTER TABLE `accounts_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `accounts_customuser_groups`
--
ALTER TABLE `accounts_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq` (`customuser_id`,`group_id`),
  ADD KEY `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `accounts_customuser_user_permissions`
--
ALTER TABLE `accounts_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_customuser_user_customuser_id_permission_9632a709_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `accounts_permiso`
--
ALTER TABLE `accounts_permiso`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `accounts_rol`
--
ALTER TABLE `accounts_rol`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `plataformaapp_documento`
--
ALTER TABLE `plataformaapp_documento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `plataformaapp_noticia`
--
ALTER TABLE `plataformaapp_noticia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `plataformaapp_roles`
--
ALTER TABLE `plataformaapp_roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accounts_customuser`
--
ALTER TABLE `accounts_customuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `accounts_customuser_groups`
--
ALTER TABLE `accounts_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `accounts_customuser_user_permissions`
--
ALTER TABLE `accounts_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `accounts_permiso`
--
ALTER TABLE `accounts_permiso`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `accounts_rol`
--
ALTER TABLE `accounts_rol`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `plataformaapp_documento`
--
ALTER TABLE `plataformaapp_documento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `plataformaapp_noticia`
--
ALTER TABLE `plataformaapp_noticia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `plataformaapp_roles`
--
ALTER TABLE `plataformaapp_roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accounts_customuser_groups`
--
ALTER TABLE `accounts_customuser_groups`
  ADD CONSTRAINT `accounts_customuser__customuser_id_bc55088e_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  ADD CONSTRAINT `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `accounts_customuser_user_permissions`
--
ALTER TABLE `accounts_customuser_user_permissions`
  ADD CONSTRAINT `accounts_customuser__customuser_id_0deaefae_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  ADD CONSTRAINT `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
