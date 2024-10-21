-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28/09/2024 às 09:26
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

CREATE DATABASE blog_db
USE blog_db

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `blog_db`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `content`, `image`, `created_at`) VALUES
(15, 2, 'Mulan (1998)', 'Mulan é um filme de 1998 dos estúdios Disney, em sua era clássica. Animado em 2D e com pouco uso de 3D para lapidar cenários, sua animação é fluída e com cores vibrantes que remetem a estética chinesa com perfeição. O character design é muito bem planejado, cada um dos personagens é cativante e cumprem seu papel na trama. O roteiro é interessante e prende a atenção do telespectador com maestria, Mulan finge ser um homem para ir no lugar de seu pai enfermo à invasão huno. A protagonista é considerada uma princesa mas não por ter nascido uma ou por ter se casado com um príncipe, mas sim por ter salvo a China. Fortemente recomendo a animação para aqueles que não consumiram ainda, definitivamente um dos meus filmes favoritos.', 'WhatsApp_Image_2024-09-28_at_02.45.44.jpeg', '2024-09-28 05:54:53'),
(16, 2, 'The Owl House (2020)', 'The Owl House é uma série animada de 2020 dos estúdios Disney. Sua animação é em 2D e seu character design é único, cada personagem exala personalidade e carisma. A série ganhou certo destaque na mídia pela grande representatividade em seus protagonistas, algo que difere e muito de outras propriedades da Disney. Sua história é mágica e com um certo grau de suspense e comédia, acompanhamos Luz Noceda, uma humana presa num mundo fantástico, seu maior desejo é se tornar uma bruxa assim como as diversas encontradas naquele universo. Luz também anseia voltar para casa, o mundo humano. Porém, oque trouxe sucesso para The Owl House também se tornou sua ruína com um encerramento antecipado, a série definitivamente vale o tempo investido, sua história é complexa e cativante.', 'WhatsApp_Image_2024-09-28_at_02.45.44_1.jpeg', '2024-09-28 05:55:30'),
(17, 2, 'Gravity Falls (2012)', 'Gravity Falls é uma série animada de 2012 dos estúdios Disney. Sua animação segue o padrão 2D já vistas em outras mídias da empresa, sua ambientação é única e definitivamente uma das pioneiras nas animações de suspense e comédia, servindo até os dias atuais como inspiração para artistas. A história da animação é misteriosa, induzindo teorias e dúvidas ao telespectador. A série cultivou incontáveis fãs merecidamente, até os dias atuais o público clama por uma continuação e respostas para teorias jamais resolvidas. A trama começa com os gêmeos Dipper e Mabel indo passar o verão na pacata cidade de Gravity Falls com seu tio-avô, mas são surpreendidos ao descobrir diversos eventos paranormais e criaturas monstruosas rondando a cidade. Definitivamente uma obra im…', 'WhatsApp_Image_2024-09-28_at_02.45.45.jpeg', '2024-09-28 05:55:49'),
(18, 2, 'Steven Universe (2013)', 'Steven Universe é uma série animada de 2013 do canal Cartoon Network. É admirável o trabalho impecável na trilha sonora da animação, todas as músicas conseguem ser memoráveis e emocionantes, levando o telespectador a se identificar com algumas delas. É necessário mencionar também seu design de cenários e personagens, como por exemplo a protagonista Pérola que tem seu design com linhas retas e finas, remetendo ao telespectador uma figura delicada e elegante. Ou a protagonista Ametista que possui um character design mais bagunçado e livre, representando bem a personalidade desleixada do personagem. A trama possui muita representatividade escondida nas entrelinhas, seus episódios trazem grandes ensinamentos sobre amadurecimento e família, onde acompanhamos Stev…', 'WhatsApp_Image_2024-09-28_at_02.45.45_1.jpeg', '2024-09-28 05:56:08'),
(19, 1, 'The Chipmunk Adventure (1987)', 'The Chipmunk Adventure é um filme animado de 1987, de comédia musical e aventura. Apesar de se tratar de um estúdio pequeno, é notável o esforço colocado na obra. O design das esquiletes é encantador e um destaque no filme, a paleta de cores causam certa nostalgia atualmente, pode se dizer que se encaixa perfeitamente com a época em que foi proposto. O roteiro segue os esquilos e as esquiletes fazendo uma corrida de balões de ar quente ao redor do mundo. Enquanto Dave está em uma viagem, sem notar que se tratava de uma fachada para contrabando de diamantes. A trama então continua com os esquilos viajando o mundo enquanto são perseguidos pelos contrabandistas de diamantes. Apesar do filme não ser tão conhecido, sua qualidade é inegável e definitivamente vale conferir.', 'WhatsApp_Image_2024-09-28_at_02.45.45_2.jpeg', '2024-09-28 05:57:59');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'igorlubu', 'pbkdf2:sha256:600000$FBi1VT7QTia6dS8G$7ac5a843af1c7c1b4eb61cd7b7963c3dd7684a7e021b8b6f6bc929c731b75e33'),
(2, 'juliana', 'pbkdf2:sha256:600000$MFWGlgbZsFfHF1Qr$184a08c7adf44a5028d533ef88e19374f22e81ddd87e8930a23cecd2240ec9e7');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
