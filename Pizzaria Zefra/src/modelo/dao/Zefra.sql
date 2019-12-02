DROP DATABASE IF EXISTS zefra;
CREATE DATABASE IF NOT EXISTS zefra;
USE zefra;

-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 16-Ago-2018 às 08:15
-- Versão do servidor: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zefra`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `id` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `comentario` text,
  `nota` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `avaliacao`
--

INSERT INTO `avaliacao` (`id`, `id_produto`, `id_usuario`, `comentario`, `nota`, `data`, `hora`) VALUES
(68, 2, 90, 'Achei mais ou menos, mas pelo preço é aceitável', 6, '2018-08-15', '16:05:18'),
(81, 17, 91, 'Muito bom', 8, '2018-08-15', '17:27:23'),
(91, 3, 92, 'Muito ruim, nunca mais compro', 2, '2018-08-15', '20:19:48'),
(99, 18, 21, 'Horrível', 3, '2018-08-15', '23:33:14'),
(111, 8, 21, 'Podia ser melhor', 5, '2018-08-16', '00:32:44'),
(114, 22, 21, 'O bolo veio em perfeitas condições e é excelente qualidade. Eu recomendo a todos. Único probleminha foi o tempo de entrega que atrasou um dia, mas isso é perdoável.', 9, '2018-08-16', '00:34:43'),
(116, 5, 21, 'Me deixou com muita sede 5 minutos depois', 7, '2018-08-16', '00:35:40'),
(119, 2, 21, 'Adorei', 8, '2018-08-16', '01:39:18'),
(120, 3, 21, 'Ótimo', 2, '2018-08-16', '01:39:38'),
(126, 6, 21, 'Muito bom', 9, '2018-08-16', '02:07:21'),
(128, 17, 97, 'Muito bom o bolo, estão de parabéns!', 9, '2018-08-16', '02:25:37'),
(129, 7, 97, 'Comprei para meus filhos e eles adoraram', 10, '2018-08-16', '02:26:19'),
(132, 15, 97, 'Comprei e veio o mesmo mato que o cavalo da esquina come', 0, '2018-08-16', '02:30:24'),
(133, 11, 97, 'Muito boa, mas é uma pena ter poucas opções de tamanho', 7, '2018-08-16', '02:31:33'),
(134, 2, 97, 'Faz muito mal à saúde', 8, '2018-08-16', '02:31:56'),
(135, 3, 97, 'Ruim que acaba rápido :(', 7, '2018-08-16', '02:51:16'),
(137, 3, 98, 'Entrega e produto de qualidade', 1, '2018-08-16', '02:52:40'),
(138, 12, 98, '', 5, '2018-08-16', '02:53:06'),
(140, 12, 21, 'Razoável', 6, '2018-08-16', '02:54:06'),
(143, 6, 99, '', 8, '2018-08-16', '02:55:54'),
(145, 8, 99, '', 7, '2018-08-16', '02:58:43'),
(146, 4, 99, '', 5, '2018-08-16', '02:59:20'),
(147, 4, 21, '', 6, '2018-08-16', '02:59:40');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `cidade` varchar(58) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `logradouro` varchar(150) DEFAULT NULL,
  `numero` int(11) NOT NULL,
  `complemento` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`id`, `id_usuario`, `cep`, `cidade`, `bairro`, `logradouro`, `numero`, `complemento`) VALUES
(1, 21, '147', 'a', 'w', 'c', 10, 'b'),
(2, 22, '147', 'a', 'w', 'c', 10, 'b'),
(3, 23, '147', 'a', 'w', 'c', 10, 'b'),
(4, 25, '666', 'dsadas', 'd165sa14d65s1a45', 'd1sa451d45as', 12, 'casa'),
(5, 26, 'dasdsadsa', 'dsad', 'sadsa', 'das', 55, 'dasdas'),
(6, 27, '', '', '', 'rua tla', 80, ''),
(7, 28, 'fsdfdsf', 'fsdfsd', 'fdsfds', 'fsdfsd', 10, '10'),
(8, 29, 'fsdfdsfds', 'fdsfds', 'fdsf', 'sdfdsfsd', 1201, 'fdsfsd'),
(9, 34, '12145145', '145145', '154154', '645645', 645, '4114'),
(10, 35, '21740', 'Rio de Janeiro', 'Ma', 'casa', 90, 'casa'),
(38, 81, '1', '2', '4', '1', 1, ''),
(39, 82, '', '', 'afdsds', 'ds4a14', 12, ''),
(40, 83, '1', '1', '1', 'hfghf', 102, '1'),
(41, 84, '', '', '', 'fdfd', 80, ''),
(42, 85, '', '', '', 'ghfgf', 1, ''),
(43, 86, '', '', '', 'jhg', 10, ''),
(44, 87, '21220310', 'RJ', 'Vila da Penha', 'Estrad', 108, 'Ap'),
(45, 88, '', '', '', 'gfhgf', 10, ''),
(46, 89, '1841', '8415414514', '1841841', '4184184', 518541841, '54154'),
(47, 90, '', '', '', 'gfdgfd', 10, ''),
(48, 91, '', '', '', 'fsdfsd', 10, ''),
(49, 92, '', '', '', 'fdsfsd', 10, ''),
(50, 93, '', '', '', 'fdsaf dsf sd', 10, ''),
(51, 94, '', '', '', 'fdsaf dsf sd', 10, ''),
(52, 95, '', '', '', 'fdsfds', 10, ''),
(53, 96, '', '', '', 'fdsfds', 10, ''),
(54, 97, '', '', '', 'fdsfds', 10, ''),
(55, 98, '', '', '', 'hjg', 10, ''),
(56, 99, '', 'f', '', 'fdsfds', 10, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `cargo` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`id`, `id_usuario`, `cargo`) VALUES
(1, 21, 'Admin');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ingrediente`
--

CREATE TABLE `ingrediente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `ingrediente`
--

INSERT INTO `ingrediente` (`id`, `nome`) VALUES
(1, 'Mussarela'),
(2, 'Molho verde'),
(3, 'Orégano'),
(4, 'Tomate'),
(5, 'Presunto'),
(6, 'Milho'),
(7, 'Bacon'),
(8, 'Cebola'),
(9, 'Catupiry'),
(10, 'Azeitona'),
(11, 'Ovos'),
(12, 'Gorgonzola'),
(13, 'Pimenta'),
(14, 'Atum'),
(15, 'Cheddar'),
(16, 'Palmito'),
(17, 'Provolone'),
(18, 'Champignon'),
(19, 'Parmesão'),
(20, 'Calabresa'),
(21, 'Alho frito'),
(22, 'Brócolis'),
(23, 'Goiabada'),
(24, 'Granulado'),
(25, 'Filé Mignon');

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_pedido`
--

CREATE TABLE `item_pedido` (
  `id` int(11) NOT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `quantidade` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `valor` double NOT NULL,
  `id_pedido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `item_pedido`
--

INSERT INTO `item_pedido` (`id`, `id_produto`, `quantidade`, `tipo`, `valor`, `id_pedido`) VALUES
(1, 8, 1, 'pizza', 29, 1),
(2, 2, 1, 'variedade', 5.99, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `id_tipo_pagamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`id`, `data`, `id_usuario`, `hora`, `id_tipo_pagamento`) VALUES
(1, '2018-08-16', 21, '03:14:11', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_pizza`
--

CREATE TABLE `pedido_pizza` (
  `id` int(11) NOT NULL,
  `id_item_pedido` int(11) NOT NULL,
  `id_tamanho` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedido_pizza`
--

INSERT INTO `pedido_pizza` (`id`, `id_item_pedido`, `id_tamanho`) VALUES
(1, 1, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_pizza_ingredientes`
--

CREATE TABLE `pedido_pizza_ingredientes` (
  `id` int(11) NOT NULL,
  `id_item_pedido` int(11) DEFAULT NULL,
  `removido` tinyint(1) NOT NULL,
  `id_ingrediente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedido_pizza_ingredientes`
--

INSERT INTO `pedido_pizza_ingredientes` (`id`, `id_item_pedido`, `removido`, `id_ingrediente`) VALUES
(1, 1, 1, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pizza_ingredientes`
--

CREATE TABLE `pizza_ingredientes` (
  `id` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pizza_ingredientes`
--

INSERT INTO `pizza_ingredientes` (`id`, `id_ingrediente`, `id_produto`) VALUES
(6, 1, 7),
(7, 4, 7),
(8, 10, 7),
(9, 1, 8),
(10, 20, 8),
(11, 8, 8),
(12, 10, 8),
(13, 1, 10),
(14, 9, 10),
(15, 19, 10),
(16, 12, 10),
(17, 10, 10),
(18, 1, 11),
(19, 21, 11),
(20, 7, 11),
(21, 4, 11),
(22, 10, 11),
(23, 1, 12),
(24, 15, 12),
(25, 16, 12),
(26, 10, 12),
(27, 1, 13),
(28, 5, 13),
(29, 9, 13),
(30, 10, 13),
(31, 1, 14),
(32, 5, 14),
(33, 11, 14),
(34, 8, 14),
(35, 16, 14),
(36, 10, 14),
(37, 1, 15),
(38, 22, 15),
(39, 16, 15),
(40, 18, 15),
(41, 10, 15),
(42, 1, 16),
(43, 23, 16),
(44, 1, 17),
(45, 24, 17),
(46, 3, 7),
(47, 25, 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pizza_precos_tamanhos`
--

CREATE TABLE `pizza_precos_tamanhos` (
  `id` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `preco` double NOT NULL,
  `id_tamanho` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pizza_precos_tamanhos`
--

INSERT INTO `pizza_precos_tamanhos` (`id`, `id_produto`, `preco`, `id_tamanho`) VALUES
(10, 7, 14, 1),
(11, 7, 21, 2),
(12, 7, 28, 3),
(13, 7, 33, 4),
(14, 8, 15, 1),
(15, 8, 22, 2),
(16, 8, 29, 3),
(17, 8, 34, 4),
(18, 10, 23, 2),
(19, 10, 30, 3),
(20, 10, 35, 4),
(21, 11, 31, 3),
(22, 11, 36, 4),
(23, 12, 21, 1),
(24, 12, 29, 2),
(25, 12, 36, 3),
(26, 12, 42, 4),
(27, 13, 18, 1),
(28, 13, 23, 2),
(29, 13, 27, 3),
(30, 13, 30, 4),
(31, 14, 19, 1),
(32, 14, 24, 2),
(33, 14, 28, 3),
(34, 14, 31, 4),
(35, 15, 17, 1),
(36, 15, 21, 2),
(37, 15, 24, 3),
(38, 15, 28, 4),
(39, 16, 19, 1),
(40, 16, 23, 2),
(41, 16, 26, 3),
(42, 16, 31, 4),
(43, 17, 19, 1),
(44, 17, 23, 2),
(45, 17, 26, 3),
(46, 17, 31, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `img` varchar(50) DEFAULT NULL,
  `titulo` varchar(100) NOT NULL,
  `descricao` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id`, `tipo`, `img`, `titulo`, `descricao`) VALUES
(2, 'bebida', 'bcoca3l.jpg', 'Coca-Cola', 'Garrafa de 3 litros'),
(3, 'bebida', 'bcoca350ml.jpg', 'Coca-Cola', 'Latinha de 350ml'),
(4, 'sobremesa', 'slaka.jpg', 'Barra de Chocolate Laka', 'Versão Oreo de 150 gramas'),
(5, 'bebida', 'pantart2l.png', 'Guaraná Antarctica', 'Garrafa de 2 litros'),
(6, 'bebida', 'cocacola.jpg', 'Coca-Cola', 'Garrafa de 2 litros'),
(7, 'pizza', 'pmussarela.png', 'Mussarela', ''),
(8, 'pizza', 'pcalabresa.jpg', 'Calabresa', ''),
(10, 'pizza', 'pquatroqueijos.jpg', 'Quatro Queijos', ''),
(11, 'pizza', 'pmexicana.jpg', 'Mexicana', ''),
(12, 'pizza', 'pcheddar.jpg', 'Cheddar com Filé Mignon', ''),
(13, 'pizza', 'pnapolitana.jpg', 'Napolitana', ''),
(14, 'pizza', 'pportuguesa.jpg', 'Portuguesa', ''),
(15, 'pizza', 'pvegetariana.jpg', 'Vegetariana', ''),
(16, 'pizza', 'pjulieta.jpg', 'Romeu & Julieta', ''),
(17, 'pizza', 'pbrigadeiro.jpg', 'Brigadeiro', ''),
(18, 'bebida', 'pfanta2l.png', 'Fanta Laranja', 'Garrafa de 2 litros'),
(19, 'sobremesa', 'sbrigadeiro.jpg', 'Brigadeiro', 'Feito pela casa com chocolate da mais alta qualidade'),
(20, 'sobremesa', 'sgaroto.jpg', 'Caixa de Bombom Garoto', '300 gramas'),
(21, 'sobremesa', 'spudim.jpg', 'Pudim de Leite Condensado', 'Usamos Leite Moça'),
(22, 'sobremesa', 'sbolochoc.jpg', 'Bolo de Chocolate', 'Contém também Chantilly e Morango');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_variedade`
--

CREATE TABLE `produto_variedade` (
  `id` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `preco` double NOT NULL,
  `estoque` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produto_variedade`
--

INSERT INTO `produto_variedade` (`id`, `id_produto`, `preco`, `estoque`) VALUES
(1, 6, 4.99, -1),
(2, 2, 5.99, -1),
(3, 3, 1.99, -1),
(4, 4, 3.5, -1),
(5, 5, 4.99, -1),
(6, 18, 4.39, -1),
(7, 19, 1.99, -1),
(8, 20, 6.9, -1),
(9, 21, 12.99, -1),
(10, 22, 35.9, -1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tamanho`
--

CREATE TABLE `tamanho` (
  `id` int(11) NOT NULL,
  `nome_tamanho` varchar(20) NOT NULL,
  `cm_tamanho` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tamanho`
--

INSERT INTO `tamanho` (`id`, `nome_tamanho`, `cm_tamanho`) VALUES
(1, 'Pequena', 30),
(2, 'Média', 35),
(3, 'Grande', 40),
(4, 'Gigante', 45);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_pagamento`
--

CREATE TABLE `tipo_pagamento` (
  `id` int(11) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipo_pagamento`
--

INSERT INTO `tipo_pagamento` (`id`, `tipo`) VALUES
(1, 'Dinheiro'),
(2, 'Cartão de Crédito'),
(3, 'Cartão de Débito');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `celular` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `dataNascimento`, `email`, `senha`, `telefone`, `celular`) VALUES
(5, 'Leandro', '2018-07-26', 'C', 'D', 'E', 'F'),
(6, 'A', '2018-07-26', 'C', 'D', 'E', 'F'),
(7, 'fdsfds848', NULL, 'fds47f4sd@gmail.com1', 'D', '', ''),
(8, 'A', '2018-07-26', 'C', 'D', 'E', 'F'),
(9, 'A', '2018-07-26', 'C', 'D', 'E', 'F'),
(10, 'A', '2018-07-26', 'C', 'D', 'E', 'F'),
(11, 'A', '2018-07-26', 'C', 'D', 'E', 'F'),
(12, 'A', '2018-07-26', 'C', 'D', 'E', 'F'),
(13, 'A', '2018-07-26', 'C', 'D', 'E', 'F'),
(14, 'A', '2018-07-26', 'C', 'D', 'E', 'F'),
(15, 'A', '2018-07-26', 'C', 'D', 'E', 'F'),
(18, 'Leandro', NULL, 'leandro.musser@gmail.com6', '12345', NULL, NULL),
(19, 'Leandro', NULL, 'leandro.musser@gmail.com1', '12345', NULL, NULL),
(21, 'Leandro Rocha', '1993-08-20', 'leandro.musser@gmail.com', '12345', '', '21985314016'),
(22, 'Leandro', NULL, 'leandro.musser@gmail.com3', '12345', NULL, NULL),
(23, 'Leandro', NULL, 'leandro.musser@gmail.com4', '12345', NULL, NULL),
(25, 'd1a45s14dsa145', NULL, '1d1sa4514d5sa145d1a45s@gmail.com', '123', NULL, NULL),
(26, 'dsadsa', NULL, 'dasdsa@gmail.com', '', 'dsadsad', 'sadas'),
(27, 'dfs9d1sa1', NULL, 'd184as1d8sa184d@gmail.com', '1234', '15178178', '18184148'),
(28, 'd1sfsd841f48', NULL, 'aaaaaawaaaaaa@gmail.com', 'dsfdsf', 'fdsfsd', 'fdsfdsf'),
(29, 'd54sa1d45sa4', NULL, '145145145145145@gmail.com', '123', '1215148', '1451451451'),
(34, 'fsdfds4145', NULL, '54151514@gmail.com', '1', '145145145', '1451541'),
(35, '4dfsfsd14', NULL, '54145da1s45das@gmail.com', '1234', '14651451', '54145154'),
(37, '18da1s4d1as4', NULL, '54145da1s45daws@gmail.com', '1234', '145145154', '1451541'),
(38, '18da1s4d1as4', NULL, '54145da1s45dawsw@gmail.com', '1234', '145145154', '1451541'),
(50, 'd1sa4d1sa4', NULL, 'aaaaaaaaaaaa@gmail.coma', '123', '101111111111', ''),
(57, 'Leandro', NULL, 'aaaaaaa555aaaaa@gmail.com', '123', '', ''),
(58, 'fdsfds', NULL, 'aaaaaaaaaaawaa@gmail.com', '123', '', ''),
(59, 'Leandro', NULL, 'aaaaaaaaaaaa@gmail.comaweaw', '123', '', ''),
(60, 'gfdgfd', NULL, 'aaaawwwwwaadasdsaaaaaaaaa@gmail.com', '1', '12121148', '12121148'),
(61, 'gdfgf', '1990-10-10', 'aaaaaaaaaaaa@gmail.com', '1', '', ''),
(62, 'gdfgf', '1993-08-20', 'aaaaaaaaaaaa@gmail.com1', '1', '', ''),
(63, 'gdfgf', NULL, 'aaaaaaaaaaaa@gmail.com11', '1', '', ''),
(64, 'gdfgf', '1993-08-10', 'aaaaaaaaaaadsadaa@gmail.com11', '1', '', ''),
(65, 'gdfgf', '1910-10-10', 'aaaaaaaaaaadsadaa@gmail.com1100', '1', '', ''),
(66, 'gdfgf', '1910-09-20', 'aaaaaaaaaaadsadaa@gmail.com11000', '1', '', ''),
(67, 'Leandro', NULL, 'leandro.musser@gmail.comabc', '1234', '', ''),
(68, 'f7ds47fsd48fs4d7', '1993-08-10', '4da5sdas7@gmail.com', '1', '', ''),
(69, 'dsa14dsa14', NULL, '1d45sa15das@gmail.com', '123', '', ''),
(70, 'dsa14dsa14', NULL, '1d45sa15das@gmail.com', '123', '', ''),
(71, 'fdsfdsfds', NULL, '1d45sa15das@gmail.coma', '123', '', ''),
(72, 'fdsfdsfds', NULL, '1d45sa15das@gmail.coma', '123', '', ''),
(73, 'fds1465', NULL, '1d45sa15das@gmail.coma99', '123', '', ''),
(74, 'fds1465', NULL, '1d45sa15das@gmail.coma99', '123', '', ''),
(75, 'dsa14das145', NULL, 'd1sad145a@gmail.com', '123', '', ''),
(76, 'dsa14das145', NULL, 'd1sad145a@gmail.com', '123', '', ''),
(77, 'gfd4g4df', NULL, 'd1sad145a@gmail.com5', '123', '', ''),
(78, 'gfd4g4df', NULL, 'd1sad145a@gmail.com5', '123', '', ''),
(79, 'dsa4d1sa45', NULL, 'dasdsa5das56d1sa@gmail.com', '123', '', ''),
(80, 'fdshfg', NULL, 'd4sa14d5sa@gmail.com', '123', '', ''),
(81, 'gdfgfdgfd', NULL, 'gfdgfg4f4@gh.com', '1', '', ''),
(82, 'd1sa4dsa5', NULL, '414145d@gmail.coma', '123', '', ''),
(83, 'gfdgfdgfdggggdf gfd gdf', NULL, 'dasdsaw@gmail.coam1', '1', '12222222222222', '52222222222222'),
(84, '645sa1d465as14d6as', NULL, '1dsa641da45s14d5as@gmail.com', '1', '', ''),
(85, 'fdsfdsfds', '0001-01-01', 'fdsfds@gmail.com', '1', '', ''),
(86, 'FDSFDS', NULL, '4d9sa4das@gmail.com', '123', '', ''),
(87, 'Ana Maria', '1980-01-04', 'ana@gmail.com', '123', '2198888888', '21767667676'),
(88, 'gfdgfdgfdgfd', NULL, 'g4f81g854fd@gmail.com', '1', '', ''),
(89, 'f7ds4f8ds1', '1990-10-10', '1sa54d1sa84das4@gmail.com', '123', '561154141748', '4154154154154'),
(90, 'Maria Lopes', NULL, 'aaaaaaaaaaaa@gmail.coma5', '123', '', ''),
(91, 'Fernando Rose', NULL, 'fd1sa651f4sd65@gmail.com', '123', '', ''),
(92, 'fds4f1sd4', NULL, '1fsd451f4d5s@gmail.com', '123', '', ''),
(93, 'Carlos Roberto', NULL, 'd56as1d65as156dsa1@gmail.com', '123', '', ''),
(94, 'Carlos Roberto', NULL, 'd56as1d65as156dsa1@gmail.coma', '123', '', ''),
(95, 'Marcos', NULL, '1da4s14dsa@gmail.com', '123', '', ''),
(96, 'Marcos', NULL, '1da4s14dsa@gmail.com2', '123', '', ''),
(97, 'Marcos', NULL, '1da4s14dsa@gmail.com20', '123', '', ''),
(98, 'dsa1dsa14', NULL, '145dsa145das@gmail.com', '123', '', ''),
(99, 'fdsfds', NULL, 'fdsf56sd@gmail.com', '123', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_produto` (`id_produto`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `item_pedido_ibfk_2` (`id_produto`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_tipo_pagamento` (`id_tipo_pagamento`);

--
-- Indexes for table `pedido_pizza`
--
ALTER TABLE `pedido_pizza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_item_pedido` (`id_item_pedido`),
  ADD KEY `id_tamanho` (`id_tamanho`);

--
-- Indexes for table `pedido_pizza_ingredientes`
--
ALTER TABLE `pedido_pizza_ingredientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_item_pedido` (`id_item_pedido`),
  ADD KEY `id_ingrediente` (`id_ingrediente`);

--
-- Indexes for table `pizza_ingredientes`
--
ALTER TABLE `pizza_ingredientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ingrediente` (`id_ingrediente`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Indexes for table `pizza_precos_tamanhos`
--
ALTER TABLE `pizza_precos_tamanhos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_produto` (`id_produto`),
  ADD KEY `id_tamanho` (`id_tamanho`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produto_variedade`
--
ALTER TABLE `produto_variedade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Indexes for table `tamanho`
--
ALTER TABLE `tamanho`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_pagamento`
--
ALTER TABLE `tipo_pagamento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ingrediente`
--
ALTER TABLE `ingrediente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `item_pedido`
--
ALTER TABLE `item_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pedido_pizza`
--
ALTER TABLE `pedido_pizza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pedido_pizza_ingredientes`
--
ALTER TABLE `pedido_pizza_ingredientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pizza_ingredientes`
--
ALTER TABLE `pizza_ingredientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `pizza_precos_tamanhos`
--
ALTER TABLE `pizza_precos_tamanhos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `produto_variedade`
--
ALTER TABLE `produto_variedade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tamanho`
--
ALTER TABLE `tamanho`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tipo_pagamento`
--
ALTER TABLE `tipo_pagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `avaliacao_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD CONSTRAINT `item_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `item_pedido_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_tipo_pagamento`) REFERENCES `tipo_pagamento` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pedido_pizza`
--
ALTER TABLE `pedido_pizza`
  ADD CONSTRAINT `pedido_pizza_ibfk_1` FOREIGN KEY (`id_item_pedido`) REFERENCES `item_pedido` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_pizza_ibfk_2` FOREIGN KEY (`id_tamanho`) REFERENCES `tamanho` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pedido_pizza_ingredientes`
--
ALTER TABLE `pedido_pizza_ingredientes`
  ADD CONSTRAINT `pedido_pizza_ingredientes_ibfk_1` FOREIGN KEY (`id_item_pedido`) REFERENCES `item_pedido` (`id`),
  ADD CONSTRAINT `pedido_pizza_ingredientes_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id`),
  ADD CONSTRAINT `pedido_pizza_ingredientes_ibfk_3` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pizza_ingredientes`
--
ALTER TABLE `pizza_ingredientes`
  ADD CONSTRAINT `pizza_ingredientes_ibfk_1` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pizza_ingredientes_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pizza_precos_tamanhos`
--
ALTER TABLE `pizza_precos_tamanhos`
  ADD CONSTRAINT `pizza_precos_tamanhos_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pizza_precos_tamanhos_ibfk_2` FOREIGN KEY (`id_tamanho`) REFERENCES `tamanho` (`id`);

--
-- Limitadores para a tabela `produto_variedade`
--
ALTER TABLE `produto_variedade`
  ADD CONSTRAINT `produto_variedade_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;