-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 22-Maio-2018 às 11:10
-- Versão do servidor: 5.6.13
-- versão do PHP: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `cinefra`
--
CREATE DATABASE IF NOT EXISTS `cinefra` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cinefra`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `conta`
--

CREATE TABLE IF NOT EXISTS `conta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `dataCadastro` date DEFAULT NULL,
  `horaCadastro` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Extraindo dados da tabela `conta`
--

INSERT INTO `conta` (`id`, `email`, `senha`, `dataCadastro`, `horaCadastro`) VALUES
(1, 'leandro.musser@gmail.com', '123', '2018-04-23', '00:57:00'),
(36, 'p@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', '2018-04-23', '00:57:27'),
(37, 'dasd2sa@gmail.coma22', 'c4ca4238a0b923820dcc509a6f75849b', '2018-04-23', '00:57:57'),
(38, 'dasd2sa@gmail.coma23', 'c4ca4238a0b923820dcc509a6f75849b', '2018-04-23', '00:58:38'),
(39, 'dasd2sa@gmail.coma24', 'c4ca4238a0b923820dcc509a6f75849b', '2018-04-23', '01:08:03'),
(40, 'dasd2sa@gmail.coma29', 'c4ca4238a0b923820dcc509a6f75849b', '2018-04-23', '01:16:28'),
(41, 'dasd2sa@gmail.coma299', 'c4ca4238a0b923820dcc509a6f75849b', '2018-04-23', '01:19:43'),
(42, 'g@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', '2018-04-23', '22:00:28'),
(43, '854dsa45dsa4@gmai.com', 'c4ca4238a0b923820dcc509a6f75849b', '2018-04-24', '09:35:26'),
(44, 'd8sa87dsa@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', '2018-04-26', '09:22:28'),
(45, '87dsa487d4sa87ds@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', '2018-05-08', '09:22:30'),
(46, '87dsa487d4sa87ds@gmail.com1', 'c4ca4238a0b923820dcc509a6f75849b', '2018-05-08', '09:47:36'),
(47, 'd87sa487dsa@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', '2018-05-15', '09:42:42'),
(48, 'd87sa487dsa@gmail.com1', 'c4ca4238a0b923820dcc509a6f75849b', '2018-05-15', '09:43:06');

-- --------------------------------------------------------

--
-- Estrutura da tabela `conta_admin`
--

CREATE TABLE IF NOT EXISTS `conta_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idConta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conta_admin_ibfk_1` (`idConta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `conta_admin`
--

INSERT INTO `conta_admin` (`id`, `idConta`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `filme`
--

CREATE TABLE IF NOT EXISTS `filme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `classificacao_indicativa` varchar(2) DEFAULT NULL,
  `sinopse` text,
  `lancamento` date DEFAULT NULL,
  `saida` date DEFAULT NULL,
  `legendado` tinyint(1) DEFAULT NULL,
  `dublado` tinyint(1) DEFAULT NULL,
  `2d` tinyint(1) DEFAULT NULL,
  `3d` tinyint(1) DEFAULT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `top` tinyint(1) DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `filme`
--

INSERT INTO `filme` (`id`, `titulo`, `classificacao_indicativa`, `sinopse`, `lancamento`, `saida`, `legendado`, `dublado`, `2d`, `3d`, `categoria`, `top`, `duracao`) VALUES
(2, 'Rampage: Destruição Total', '14', 'O primatologista Davis Okoye (Dwayne Johnson) é um homem fechado que compartilha um vínculo inabalável com George, um gorila muito inteligente, que está sob seus cuidados desde o nascimento. Porém, quando um experimento genético desonesto é feito em um grupo de predadores que inclui o primata, os animais se transformam em monstros que destroem tudo em seu caminho. Agora Okoye tenta conseguir um antídoto e impedir que seu amigo provoque uma catástrofe global.', '2018-04-12', '2019-03-12', 1, 1, 1, 1, 'Ação', 1, 107),
(3, 'Capitão América: Guerra Civil', '12', 'O ataque de Ultron faz com que os políticos decidam controlar os Vingadores, já que seus atos afetam toda a humanidade. Tal decisão coloca o Capitão América em rota de colisão com o Homem de Ferro.', '2016-04-16', '2026-04-16', 0, 1, 1, 1, 'Ação/Aventura/Suspense', 0, 147),
(4, 'Vingadores: Guerra Infinita', '12', 'Homem de Ferro, Thor, Hulk e os Vingadores se unem para combater seu inimigo mais poderoso, o maligno Thanos. Em uma missão para coletar todas as seis pedras infinitas, Thanos planeja usá-las para infligir sua vontade maléfica sobre a realidade.', '2018-04-26', '2035-04-16', 1, 1, 1, 1, 'Ação/Aventura/Suspense', 1, 156),
(5, 'Venom', '?', 'Eddie Brock (Tom Hardy) é um jornalista que investiga o misterioso trabalho de um cientista, suspeito de utilizar cobaias humanas em experimentos mortais. Quando ele acaba entrando em contato com um simbionte alienígena, Eddie se torna Venom, uma máquina de matar incontrolável, que nem ele pode conter.', '2018-10-04', '2018-11-04', 1, 1, 1, 1, 'Ação/Ficção científica', 0, -1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagem`
--

CREATE TABLE IF NOT EXISTS `imagem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(10) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Extraindo dados da tabela `imagem`
--

INSERT INTO `imagem` (`id`, `tipo`, `titulo`) VALUES
(2, 'carousel', 'Promoção'),
(3, 'carousel', 'Promoção'),
(7, 'carousel', 'Lançamento'),
(8, 'galeria', 'Cinema'),
(9, 'galeria', 'Cinema'),
(10, 'galeria', 'Cinema'),
(11, 'galeria', 'Cinema para crianças'),
(12, 'galeria', 'Compra de ingressos'),
(13, 'galeria', 'Comida e refrigerante');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `conta_admin`
--
ALTER TABLE `conta_admin`
  ADD CONSTRAINT `conta_admin_ibfk_1` FOREIGN KEY (`idConta`) REFERENCES `conta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
