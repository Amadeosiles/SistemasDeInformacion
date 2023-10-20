-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.22-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para basededatos
CREATE DATABASE IF NOT EXISTS `basededatos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci */;
USE `basededatos`;

-- Volcando estructura para tabla basededatos.buscarcurso
CREATE TABLE IF NOT EXISTS `buscarcurso` (
  `idCurso` int(11) NOT NULL,
  `NombreMateria` varchar(50) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `Modalidad` varchar(50) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Lugar` varchar(50) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `Duracion` varchar(30) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla basededatos.buscarcurso: ~10 rows (aproximadamente)
INSERT INTO `buscarcurso` (`idCurso`, `NombreMateria`, `Modalidad`, `Fecha`, `Lugar`, `Duracion`) VALUES
	(1, 'Programacion en Pyton', 'Presencial', '2023-10-20', 'Universidad Nacional', '60 horas'),
	(2, 'Diseño Grafico', 'Virtual', '2023-11-05', 'Plataforma Virtual', '90 horas'),
	(3, 'Marketing Digital', 'Presencial', '2023-10-25', 'Universidad de los Andes', '120 horas'),
	(4, 'Fotografia', 'Presencial', '2023-11-01', 'Alianza Francesa', '80 horas'),
	(5, 'Finanzas Personales', 'Virtual', '2023-11-10', 'Plataforma Virtual', '60 horas'),
	(6, 'Desarrollo Web', 'Presencial', '2023-11-15', 'Universidad Javeriana', '90 horas'),
	(7, 'Ingles Avanzado', 'Virtual', '2023-11-20', 'Plataforma Virtual', '120 horas'),
	(8, 'Liderazgo y Gestion de Equipos', 'Presencial', '2023-11-30', 'Universidad Nacional', '60 horas'),
	(9, 'Nutricion y Dieta Equilibrada', 'Presencial', '2023-12-05', 'Universidad de los Andes', '90 horas'),
	(10, 'Aprendizaje Automatico', 'Virtual', '2023-12-10', 'Plataforma Virtual', '120 horas');

-- Volcando estructura para tabla basededatos.docente
CREATE TABLE IF NOT EXISTS `docente` (
  `idDocente` int(11) NOT NULL AUTO_INCREMENT,
  `idGrupoCurso` int(11) NOT NULL DEFAULT 0,
  `nombreDocente` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`idDocente`),
  KEY `FK__grupocurso` (`idGrupoCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla basededatos.docente: ~11 rows (aproximadamente)
INSERT INTO `docente` (`idDocente`, `idGrupoCurso`, `nombreDocente`) VALUES
	(1, 3, 'Jairo Mendez'),
	(2, 2, 'Juan Vargas'),
	(4, 6, 'Carlos Reinaga'),
	(5, 4, 'Juan Revollo'),
	(6, 8, 'Miguel Lima'),
	(7, 7, 'Anibal Gutierres'),
	(8, 6, 'Ruth Montaño'),
	(9, 10, 'Fatima Flores'),
	(10, 5, 'Edwin Mejia'),
	(11, 1, 'Henry Escalera'),
	(12, 9, 'Sandy Antezana');

-- Volcando estructura para tabla basededatos.grupocurso
CREATE TABLE IF NOT EXISTS `grupocurso` (
  `idGrupo` int(11) NOT NULL AUTO_INCREMENT,
  `NombreMateria` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT '0',
  `NumGrupo` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT 'b''0''',
  PRIMARY KEY (`idGrupo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla basededatos.grupocurso: ~10 rows (aproximadamente)
INSERT INTO `grupocurso` (`idGrupo`, `NombreMateria`, `NumGrupo`) VALUES
	(1, 'Programacion en Phyton ', '1'),
	(2, 'Diseño Grafico', '1'),
	(3, 'Marketing Digital', '1'),
	(4, 'Fotografia', '1'),
	(5, 'Finanzas personales', '2'),
	(6, 'Desarrollo Web', '2'),
	(7, 'Ingles Avanzado', '3'),
	(8, 'Liderazgo y gestion de equipos', '3'),
	(9, 'Nutricion y dieta equilibrada', '3'),
	(10, 'Aprendizaje Automatico', '3');

-- Volcando estructura para tabla basededatos.lista
CREATE TABLE IF NOT EXISTS `lista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- Volcando datos para la tabla basededatos.lista: ~11 rows (aproximadamente)
INSERT INTO `lista` (`id`, `Nombre`) VALUES
	(1, 'Real Madrid'),
	(2, 'Manchester United'),
	(3, 'Barcelona'),
	(4, 'Arsenal'),
	(5, 'Flamengo'),
	(6, 'Fluminense'),
	(7, 'Racing'),
	(8, 'Bolivar'),
	(9, 'The Strongest'),
	(10, 'Wilstermann'),
	(11, 'Aurora');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
