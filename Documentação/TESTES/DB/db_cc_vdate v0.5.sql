-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 13-Set-2018 às 21:27
-- Versão do servidor: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cc`
--
CREATE DATABASE db_cc;
USE db_cc;
-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_crianca`
--

CREATE TABLE `tb_crianca` (
  `id` int(11) NOT NULL,
  `nomeCrianca` varchar(60) NOT NULL,
  `partoCrianca` varchar(10) NOT NULL,
  `horaNascCrianca` varchar(5) DEFAULT NULL,
  `dataNascCrianca` date NOT NULL,
  `pesoCrianca` double(11,2) DEFAULT NULL,
  `alturaCrianca` double(11,2) DEFAULT NULL,
  `sexoCrianca` char(1) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `localidade` varchar(50) DEFAULT NULL,
  `idPai` int(11) NOT NULL,
  `idMae` int(11) NOT NULL,
  `idadeGestacional` int(11) NOT NULL,
  `idcrypt` varchar(32) NOT NULL,
  `cartaoSUS` VARCHAR(18) NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_crianca`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_mae`
--

CREATE TABLE `tb_mae` (
  `id` int(11) NOT NULL,
  `nome_mae` varchar(60) NOT NULL,
  `idade` int(11) NOT NULL,
  `profissao` varchar(60) NOT NULL,
  `numConPN` int(11) NULL,
  `filhosV` int(11) NOT NULL,
  `filhosM` int(11) NOT NULL,
  `filhosA` int(11) NOT NULL,
  `municipioPN` varchar(60) NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_mae`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pai`
--

CREATE TABLE `tb_pai` (
  `id` int(11) NOT NULL,
  `nome_pai` varchar(60) NOT NULL,
  `idade` int(11) NOT NULL,
  `membrosFamilia` int(11) NOT NULL,
  `renda` double(11,2) DEFAULT NULL,
  `profissao` varchar(60) NOT NULL,
  `acs` varchar(60) DEFAULT NULL,
  `obs` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_pai`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_peso_semana`
--

CREATE TABLE `tb_peso_semana` (
  `id` int(11) NOT NULL,
  `semana` int(11) NOT NULL,
  `data` date NOT NULL,
  `peso` double(11,2) NOT NULL,
  `idCrianca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_peso_semana`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_testes`
--

CREATE TABLE `tb_testes` (
  `id` int(11) NOT NULL,
  `tPData` date DEFAULT NULL,
  `tPResul` varchar(15) DEFAULT NULL,
  `tOrelhaData` date DEFAULT NULL,
  `tOrelhaResul` varchar(15) DEFAULT NULL,
  `tLinguaData` date DEFAULT NULL,
  `tLinguaResul` varchar(15) DEFAULT NULL,
  `perCefalicoCrianca` double(11,2) DEFAULT NULL,
  `perToraxico` double(11,2) DEFAULT NULL,
  `apgar1Crianca` int(11) DEFAULT NULL,
  `apgar5Crianca` int(11) DEFAULT NULL,
  `idCrianca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_testes`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `id` int(11) NOT NULL,
  `nome_usuario` varchar(70) NOT NULL,
  `login_usuario` varchar(15) NOT NULL,
  `senha_usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_usuario`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_vacinas`
--

CREATE TABLE `tb_vacinas` (
  `id` int(11) NOT NULL,
  `apl1` date DEFAULT NULL,
  `apl2` date DEFAULT NULL,
  `apl3` date DEFAULT NULL,
  `ref1` date DEFAULT NULL,
  `ref2` date DEFAULT NULL,
  `tipo` varchar(16) NOT NULL,
  `idCrianca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_vacinas`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_crianca`
--
ALTER TABLE `tb_crianca`
  ADD PRIMARY KEY (`id`,`idPai`,`idMae`),
  ADD UNIQUE KEY `idcrypt_UNIQUE` (`idcrypt`),
  ADD KEY `fk_tb_crianca_tb_pai1_idx` (`idPai`),
  ADD KEY `fk_tb_crianca_tb_mae1_idx` (`idMae`);

--
-- Indexes for table `tb_mae`
--
ALTER TABLE `tb_mae`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pai`
--
ALTER TABLE `tb_pai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_peso_semana`
--
ALTER TABLE `tb_peso_semana`
  ADD PRIMARY KEY (`id`,`idCrianca`),
  ADD KEY `fk_tb_peso_semana_tb_crianca1_idx` (`idCrianca`);

--
-- Indexes for table `tb_testes`
--
ALTER TABLE `tb_testes`
  ADD PRIMARY KEY (`id`,`idCrianca`),
  ADD KEY `fk_tb_testes_tb_crianca1_idx` (`idCrianca`);

--
-- Indexes for table `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_vacinas`
--
ALTER TABLE `tb_vacinas`
  ADD PRIMARY KEY (`id`,`idCrianca`),
  ADD KEY `fk_tb_vacinas_tb_crianca1_idx` (`idCrianca`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_crianca`
--
ALTER TABLE `tb_crianca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tb_mae`
--
ALTER TABLE `tb_mae`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tb_pai`
--
ALTER TABLE `tb_pai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tb_peso_semana`
--
ALTER TABLE `tb_peso_semana`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `tb_testes`
--
ALTER TABLE `tb_testes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_vacinas`
--
ALTER TABLE `tb_vacinas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tb_crianca`
--
ALTER TABLE `tb_crianca`
  ADD CONSTRAINT `fk_tb_crianca_tb_mae1` FOREIGN KEY (`idMae`) REFERENCES `tb_mae` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_crianca_tb_pai1` FOREIGN KEY (`idPai`) REFERENCES `tb_pai` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_peso_semana`
--
ALTER TABLE `tb_peso_semana`
  ADD CONSTRAINT `fk_tb_peso_semana_tb_crianca1` FOREIGN KEY (`idCrianca`) REFERENCES `tb_crianca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_testes`
--
ALTER TABLE `tb_testes`
  ADD CONSTRAINT `fk_tb_testes_tb_crianca1` FOREIGN KEY (`idCrianca`) REFERENCES `tb_crianca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_vacinas`
--
ALTER TABLE `tb_vacinas`
  ADD CONSTRAINT `fk_tb_vacinas_tb_crianca1` FOREIGN KEY (`idCrianca`) REFERENCES `tb_crianca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
