-- phpMyAdmin SQL Dump
-- version 6.0.0-dev+20260810.843def3cd8
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 23, 2026 at 05:58 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `focinho_e_bico_pet`
--

-- --------------------------------------------------------

--
-- Table structure for table `agendamentos`
--

CREATE TABLE `agendamentos` (
  `id_Agendamentos` int NOT NULL,
  `Data_Hora_Agendamento` datetime NOT NULL,
  `id_Animal` int NOT NULL,
  `id_Veterinario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `agendamentos`
--

INSERT INTO `agendamentos` (`id_Agendamentos`, `Data_Hora_Agendamento`, `id_Animal`, `id_Veterinario`) VALUES
(1, '2026-11-29 18:00:00', 4, 1),
(2, '2026-12-03 15:00:00', 2, 3),
(3, '2026-12-10 11:00:00', 1, 4),
(4, '2026-12-15 19:00:00', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `animal`
--

CREATE TABLE `animal` (
  `id_Animal` int NOT NULL,
  `Nome_Animal` varchar(255) NOT NULL,
  `Raca` varchar(100) NOT NULL,
  `RG_Animal` varchar(20) DEFAULT NULL,
  `Idade` int DEFAULT NULL,
  `Sexo` varchar(20) DEFAULT NULL,
  `id_Tutor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `animal`
--

INSERT INTO `animal` (`id_Animal`, `Nome_Animal`, `Raca`, `RG_Animal`, `Idade`, `Sexo`, `id_Tutor`) VALUES
(1, 'cleitin', 'Peixe Betta', '4532', 2, 'Masculino', 1),
(2, 'Rabicó', 'Porquinho-da-Índia', '99112-0921', 5, 'Feminino', 2),
(3, 'Dudu', 'Calopsita', '98012-8732', 6, 'Feminino', 3),
(4, 'Sansão', 'Coelho', '99023-6785', 8, 'Masculino', 4);

-- --------------------------------------------------------

--
-- Table structure for table `consultas`
--

CREATE TABLE `consultas` (
  `id_Consultas` int NOT NULL,
  `Data_Hora_Consulta` datetime NOT NULL,
  `id_Animal` int NOT NULL,
  `id_Veterinario` int NOT NULL,
  `id_Agendamento` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `consultas`
--

INSERT INTO `consultas` (`id_Consultas`, `Data_Hora_Consulta`, `id_Animal`, `id_Veterinario`, `id_Agendamento`) VALUES
(1, '2026-11-29 18:15:00', 4, 1, 1),
(2, '2026-12-03 15:45:00', 2, 3, 2),
(3, '2026-12-10 11:50:00', 1, 4, 3),
(4, '2026-12-15 19:30:00', 3, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `especialidades`
--

CREATE TABLE `especialidades` (
  `id_Especialidades` int NOT NULL,
  `Especialidade` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `especialidades`
--

INSERT INTO `especialidades` (`id_Especialidades`, `Especialidade`) VALUES
(1, 'Cirugião'),
(2, 'clinico geral'),
(3, 'Veterinário especialista em peixes'),
(4, 'vacinas veterinárias');

-- --------------------------------------------------------

--
-- Table structure for table `faturamento`
--

CREATE TABLE `faturamento` (
  `id_Faturamento` int NOT NULL,
  `Data_Emissao` date NOT NULL,
  `Valor_Total` decimal(10,2) NOT NULL,
  `id_Tutor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `faturamento`
--

INSERT INTO `faturamento` (`id_Faturamento`, `Data_Emissao`, `Valor_Total`, `id_Tutor`) VALUES
(1, '2026-11-29', 200.00, 1),
(2, '2026-12-03', 150.00, 2),
(3, '2026-12-10', 400.00, 3),
(4, '2026-12-15', 500.00, 4);

-- --------------------------------------------------------

--
-- Table structure for table `pagamentos`
--

CREATE TABLE `pagamentos` (
  `id_Pagamentos` int NOT NULL,
  `valor_do_pagamento` decimal(10,2) DEFAULT NULL,
  `Forma_Pagamento` varchar(50) NOT NULL,
  `Data_Pagamento` date NOT NULL,
  `id_Faturamento` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pagamentos`
--

INSERT INTO `pagamentos` (`id_Pagamentos`, `valor_do_pagamento`, `Forma_Pagamento`, `Data_Pagamento`, `id_Faturamento`) VALUES
(1, 200.00, 'Credito', '2027-01-29', 1),
(2, 150.00, 'Parcelado 10x', '2026-10-03', 2),
(3, 400.00, 'Debito', '2026-12-10', 3),
(4, 500.00, 'Credito', '2026-12-15', 4);

-- --------------------------------------------------------

--
-- Table structure for table `procedimentos_exames_e_prescricoes`
--

CREATE TABLE `procedimentos_exames_e_prescricoes` (
  `id_Procedimentos_Exames_e_Prescricoes` int NOT NULL,
  `Procedimentos` varchar(100) DEFAULT NULL,
  `Exames` varchar(100) DEFAULT NULL,
  `Prescricoes` varchar(255) DEFAULT NULL,
  `id_Consultas` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `procedimentos_exames_e_prescricoes`
--

INSERT INTO `procedimentos_exames_e_prescricoes` (`id_Procedimentos_Exames_e_Prescricoes`, `Procedimentos`, `Exames`, `Prescricoes`, `id_Consultas`) VALUES
(1, 'operação de correção da pata', 'Raio x', 'fisioterapia canina e repouso por 4 semanas', 1),
(2, 'check up de rotina', 'exame geral', 'vitamina c por 2 semanas e anti alegico', 2),
(3, 'check up de rotina', 'exame geral', 'Antifúngicos 2x por 1 semana', 4),
(4, 'Vacina de mixomatose', 'mixomatose', 'Aplicação Imediata', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tutor`
--

CREATE TABLE `tutor` (
  `id_Tutor` int NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  `Telefone` varchar(15) NOT NULL,
  `Endereco` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tutor`
--

INSERT INTO `tutor` (`id_Tutor`, `Nome`, `CPF`, `Telefone`, `Endereco`) VALUES
(1, 'João Gabriel', '123.456.788-00', '99245-4532', 'Praça Doutor José Maria 6004'),
(2, 'Laura', '231.091.128-93', '99112-0921', 'Travessa Floriano Peixoto, 1046'),
(3, 'Lucas', '984.457.238-23', '98012-8732', 'Alameda Marechal Floriano, 230'),
(4, 'João Lucas', '287.235.678-90', '99023-6785', 'Travessa Floriano Peixoto, 1099');

-- --------------------------------------------------------

--
-- Table structure for table `vacinas`
--

CREATE TABLE `vacinas` (
  `id_Vacinas` int NOT NULL,
  `Nome_da_Vacina` varchar(100) NOT NULL,
  `Dose` varchar(50) NOT NULL,
  `Data_da_Dose` date NOT NULL,
  `Data_Proxima_Dose` date DEFAULT NULL,
  `id_Animal` int NOT NULL,
  `id_Veterinario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `veterinario`
--

CREATE TABLE `veterinario` (
  `id_Veterinario` int NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `RG` varchar(20) NOT NULL,
  `CRMV` varchar(20) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `veterinario`
--

INSERT INTO `veterinario` (`id_Veterinario`, `Nome`, `RG`, `CRMV`, `telefone`, `email`) VALUES
(1, 'Dr Lucas', '67.971.931-3', '6004-1', '99103-9381', 'Dr.Lucas@Gmail.com'),
(2, 'Dra. Fernanda', '73.239.919-4', '1046-2', '99123-3940', 'Dra.Fernanda@gmail.com'),
(3, 'Dr. Pedro', '34.345.742-3', '2303-3', '99010-2383', 'Dr.Pedro@Gmail.com'),
(4, 'Dra. Paula', '23.453.452-1', '1099-2', '99312-5869', 'Dra.Paula@Gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `veterinario_especialidade`
--

CREATE TABLE `veterinario_especialidade` (
  `id_Veterinario_Especialidade` int NOT NULL,
  `id_Veterinario` int NOT NULL,
  `id_Especialidades` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD PRIMARY KEY (`id_Agendamentos`),
  ADD UNIQUE KEY `Data_Hora_Agendamento` (`Data_Hora_Agendamento`,`id_Veterinario`),
  ADD KEY `id_Animal` (`id_Animal`),
  ADD KEY `id_Veterinario` (`id_Veterinario`);

--
-- Indexes for table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`id_Animal`),
  ADD UNIQUE KEY `RG_Animal` (`RG_Animal`),
  ADD KEY `id_Tutor` (`id_Tutor`);

--
-- Indexes for table `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id_Consultas`),
  ADD KEY `id_Animal` (`id_Animal`),
  ADD KEY `id_Veterinario` (`id_Veterinario`),
  ADD KEY `id_Agendamento` (`id_Agendamento`);

--
-- Indexes for table `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id_Especialidades`);

--
-- Indexes for table `faturamento`
--
ALTER TABLE `faturamento`
  ADD PRIMARY KEY (`id_Faturamento`),
  ADD KEY `id_Tutor` (`id_Tutor`);

--
-- Indexes for table `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`id_Pagamentos`),
  ADD KEY `id_Faturamento` (`id_Faturamento`);

--
-- Indexes for table `procedimentos_exames_e_prescricoes`
--
ALTER TABLE `procedimentos_exames_e_prescricoes`
  ADD PRIMARY KEY (`id_Procedimentos_Exames_e_Prescricoes`),
  ADD KEY `id_Consultas` (`id_Consultas`);

--
-- Indexes for table `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`id_Tutor`),
  ADD UNIQUE KEY `CPF` (`CPF`),
  ADD UNIQUE KEY `Telefone` (`Telefone`);

--
-- Indexes for table `vacinas`
--
ALTER TABLE `vacinas`
  ADD PRIMARY KEY (`id_Vacinas`),
  ADD KEY `id_Animal` (`id_Animal`),
  ADD KEY `id_Veterinario` (`id_Veterinario`);

--
-- Indexes for table `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`id_Veterinario`),
  ADD UNIQUE KEY `RG` (`RG`),
  ADD UNIQUE KEY `CRMV` (`CRMV`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `veterinario_especialidade`
--
ALTER TABLE `veterinario_especialidade`
  ADD PRIMARY KEY (`id_Veterinario_Especialidade`),
  ADD KEY `id_Veterinario` (`id_Veterinario`),
  ADD KEY `id_Especialidades` (`id_Especialidades`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agendamentos`
--
ALTER TABLE `agendamentos`
  MODIFY `id_Agendamentos` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `animal`
--
ALTER TABLE `animal`
  MODIFY `id_Animal` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id_Consultas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id_Especialidades` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `faturamento`
--
ALTER TABLE `faturamento`
  MODIFY `id_Faturamento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `id_Pagamentos` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `procedimentos_exames_e_prescricoes`
--
ALTER TABLE `procedimentos_exames_e_prescricoes`
  MODIFY `id_Procedimentos_Exames_e_Prescricoes` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tutor`
--
ALTER TABLE `tutor`
  MODIFY `id_Tutor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vacinas`
--
ALTER TABLE `vacinas`
  MODIFY `id_Vacinas` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `id_Veterinario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `veterinario_especialidade`
--
ALTER TABLE `veterinario_especialidade`
  MODIFY `id_Veterinario_Especialidade` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD CONSTRAINT `agendamentos_ibfk_1` FOREIGN KEY (`id_Animal`) REFERENCES `animal` (`id_Animal`),
  ADD CONSTRAINT `agendamentos_ibfk_2` FOREIGN KEY (`id_Veterinario`) REFERENCES `veterinario` (`id_Veterinario`);

--
-- Constraints for table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`id_Tutor`) REFERENCES `tutor` (`id_Tutor`);

--
-- Constraints for table `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`id_Animal`) REFERENCES `animal` (`id_Animal`),
  ADD CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`id_Veterinario`) REFERENCES `veterinario` (`id_Veterinario`),
  ADD CONSTRAINT `consultas_ibfk_3` FOREIGN KEY (`id_Agendamento`) REFERENCES `agendamentos` (`id_Agendamentos`);

--
-- Constraints for table `faturamento`
--
ALTER TABLE `faturamento`
  ADD CONSTRAINT `faturamento_ibfk_1` FOREIGN KEY (`id_Tutor`) REFERENCES `tutor` (`id_Tutor`);

--
-- Constraints for table `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`id_Faturamento`) REFERENCES `faturamento` (`id_Faturamento`);

--
-- Constraints for table `procedimentos_exames_e_prescricoes`
--
ALTER TABLE `procedimentos_exames_e_prescricoes`
  ADD CONSTRAINT `procedimentos_exames_e_prescricoes_ibfk_1` FOREIGN KEY (`id_Consultas`) REFERENCES `consultas` (`id_Consultas`);

--
-- Constraints for table `vacinas`
--
ALTER TABLE `vacinas`
  ADD CONSTRAINT `vacinas_ibfk_1` FOREIGN KEY (`id_Animal`) REFERENCES `animal` (`id_Animal`),
  ADD CONSTRAINT `vacinas_ibfk_2` FOREIGN KEY (`id_Veterinario`) REFERENCES `veterinario` (`id_Veterinario`);

--
-- Constraints for table `veterinario_especialidade`
--
ALTER TABLE `veterinario_especialidade`
  ADD CONSTRAINT `veterinario_especialidade_ibfk_1` FOREIGN KEY (`id_Veterinario`) REFERENCES `veterinario` (`id_Veterinario`),
  ADD CONSTRAINT `veterinario_especialidade_ibfk_2` FOREIGN KEY (`id_Especialidades`) REFERENCES `especialidades` (`id_Especialidades`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
