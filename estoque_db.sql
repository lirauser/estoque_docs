-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: estoque_db
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `fornecedores`
--

DROP TABLE IF EXISTS `fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedores` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contato` varchar(255) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `nome_fornecedor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedores`
--

LOCK TABLES `fornecedores` WRITE;
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
INSERT INTO `fornecedores` VALUES (2,'markson@gmail.com','Rua da Tabela casa 11','Markson Computadores'),(3,'codakeletronicos@gmail.com','Rua das Couvas 93','Codak Eletronicos'),(4,'garnize@email.com','Rua X','Garnizé'),(5,'gm@email.com','Rua da Conivencia 175','Laudencio Moveis'),(6,'ciamaquinas@gmail.com','Av. das Americas Km 3000','Cia das Maquinas');
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `criado_em` datetime(6) DEFAULT NULL,
  `data_expiracao` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `imagem_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `preco` decimal(38,2) DEFAULT NULL,
  `qtd_estoque` int DEFAULT NULL,
  `tipo_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnpbpkkc8h170u8j4xdpjagd7i` (`tipo_id`),
  CONSTRAINT `FKnpbpkkc8h170u8j4xdpjagd7i` FOREIGN KEY (`tipo_id`) REFERENCES `tipo_produtos` (`id`),
  CONSTRAINT `produtos_chk_1` CHECK ((`qtd_estoque` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'2025-06-01 16:48:17.142134',NULL,'Móvel que serve para portar discos','produtos/fbcf9c4a-4afd-4e45-a038-b597a37ae9ce_movel1.jpg','Porta-discos',1250.00,5,1),(2,'2025-06-01 16:51:30.727520',NULL,'Laptop da marca ASO','produtos/512e855c-4b9a-40fd-ad25-9e1f1d4aa5e6_eletronico1.jpeg','Computador',6500.00,31,1),(4,'2025-06-02 15:13:00.952009',NULL,'Batedeira da ARNO','produtos/173d30b6-092d-442b-bf64-d850f5dc6cf1_eletrodomestico1.jpeg','Batedeira',253.00,60,3);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_produtos`
--

DROP TABLE IF EXISTS `tipo_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_produtos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_produtos`
--

LOCK TABLES `tipo_produtos` WRITE;
/*!40000 ALTER TABLE `tipo_produtos` DISABLE KEYS */;
INSERT INTO `tipo_produtos` VALUES (1,'Eletrodomestico'),(2,'Eletronico'),(3,'Movel');
/*!40000 ALTER TABLE `tipo_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacoes`
--

DROP TABLE IF EXISTS `transacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacoes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `atualizado_em` datetime(6) DEFAULT NULL,
  `criado_em` datetime(6) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `nota` varchar(255) DEFAULT NULL,
  `status` enum('CANCELADO','CONCLUÍDO','PENDENTE','PROCESSANDO') DEFAULT NULL,
  `tipo_movimentacao` enum('ENTRADA','RETORNO_FORNECEDOR','SAIDA') DEFAULT NULL,
  `total_preco` decimal(38,2) DEFAULT NULL,
  `total_produtos` int DEFAULT NULL,
  `fornecedor_id` bigint DEFAULT NULL,
  `produto_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsl5om07ueuj6dlamm4dgfak16` (`fornecedor_id`),
  KEY `FK9s1qiku3n1hqo46gy4gfurhsc` (`produto_id`),
  CONSTRAINT `FK9s1qiku3n1hqo46gy4gfurhsc` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `FKsl5om07ueuj6dlamm4dgfak16` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacoes`
--

LOCK TABLES `transacoes` WRITE;
/*!40000 ALTER TABLE `transacoes` DISABLE KEYS */;
INSERT INTO `transacoes` VALUES (1,NULL,'2025-06-01 16:51:42.176911','Adicionando 50 computadores.','Aguardando chegar mais.','CONCLUÍDO','ENTRADA',225000.00,50,2,2),(2,NULL,'2025-06-02 15:24:50.964962','Produto B','Qualquer nota','CONCLUÍDO','ENTRADA',5060.00,20,4,4),(3,NULL,'2025-06-02 15:25:41.065120','Produto B','Qualquer nota','CONCLUÍDO','ENTRADA',2530.00,10,3,4),(4,NULL,'2025-06-02 15:28:10.947447','Comp caseiro','Qualquer','CONCLUÍDO','ENTRADA',130000.00,20,3,2),(5,NULL,'2025-06-02 15:29:15.369356',NULL,NULL,'CONCLUÍDO','SAIDA',6250.00,5,NULL,1);
/*!40000 ALTER TABLE `transacoes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-02 15:44:05
