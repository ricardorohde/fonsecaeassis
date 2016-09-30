-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.10-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela _painel_2016.banco_fotos
DROP TABLE IF EXISTS `banco_fotos`;
CREATE TABLE IF NOT EXISTS `banco_fotos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo` int(11) NOT NULL,
  `tipo` varchar(1) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ordem` int(11) DEFAULT NULL COMMENT 'Ordem das Fotos',
  PRIMARY KEY (`id`),
  KEY `id_tipo` (`id_tipo`),
  KEY `tipo` (`tipo`),
  KEY `nome` (`foto`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='Armazena as fotos selecionadas na opção mais fotos, dependendo do tipo.';

-- Copiando dados para a tabela _painel_2016.banco_fotos: ~18 rows (aproximadamente)
/*!40000 ALTER TABLE `banco_fotos` DISABLE KEYS */;
REPLACE INTO `banco_fotos` (`id`, `id_tipo`, `tipo`, `foto`, `data`, `ordem`) VALUES
	(1, 1, 'E', 'banco_fotos/2016/07/tipo-e-id-1-7530.jpg', '2016-07-22 08:06:24', NULL),
	(2, 1, 'E', 'banco_fotos/2016/07/tipo-e-id-1-578.jpg', '2016-07-22 08:06:24', NULL),
	(3, 1, 'E', 'banco_fotos/2016/07/tipo-e-id-1-603.jpg', '2016-07-22 08:06:24', NULL),
	(4, 1, 'E', 'banco_fotos/2016/07/tipo-e-id-1-16979.jpg', '2016-07-22 08:06:24', NULL),
	(5, 1, 'E', 'banco_fotos/2016/07/tipo-e-id-1-14224.jpg', '2016-07-22 08:06:24', NULL),
	(6, 1, 'E', 'banco_fotos/2016/07/tipo-e-id-1-27384.jpg', '2016-07-22 08:06:24', NULL),
	(7, 1, 'E', 'banco_fotos/2016/07/tipo-e-id-1-19409.jpg', '2016-07-22 08:48:05', NULL),
	(8, 1, 'E', 'banco_fotos/2016/07/tipo-e-id-1-18975.jpg', '2016-07-22 08:48:05', NULL),
	(9, 1, 'E', 'banco_fotos/2016/07/tipo-e-id-1-9782.jpg', '2016-07-22 08:48:05', NULL),
	(10, 1, 'E', 'banco_fotos/2016/07/tipo-e-id-1-26935.jpg', '2016-07-22 08:48:06', NULL),
	(11, 1, 'E', 'banco_fotos/2016/07/tipo-e-id-1-12652.jpg', '2016-07-22 08:48:06', NULL),
	(12, 1, 'E', 'banco_fotos/2016/07/tipo-e-id-1-16036.jpg', '2016-07-22 08:48:06', NULL),
	(13, 1, 'E', 'banco_fotos/2016/07/tipo-e-id-1-20259.jpg', '2016-07-22 08:48:39', NULL),
	(14, 1, 'E', 'banco_fotos/2016/07/tipo-e-id-1-9013.jpg', '2016-07-22 08:48:39', NULL),
	(15, 1, 'E', 'banco_fotos/2016/07/tipo-e-id-1-21450.jpg', '2016-07-22 08:48:39', NULL),
	(16, 1, 'E', 'banco_fotos/2016/07/tipo-e-id-1-26939.jpg', '2016-07-22 08:48:40', NULL),
	(17, 1, 'E', 'banco_fotos/2016/07/tipo-e-id-1-3104.jpg', '2016-07-22 08:48:40', NULL),
	(18, 1, 'E', 'banco_fotos/2016/07/tipo-e-id-1-30808.jpg', '2016-07-22 08:48:40', NULL);
/*!40000 ALTER TABLE `banco_fotos` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.banners
DROP TABLE IF EXISTS `banners`;
CREATE TABLE IF NOT EXISTS `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `banner` varchar(100) NOT NULL,
  `tipo` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `data_inicial` date NOT NULL,
  `data_final` date NOT NULL,
  `data_atual` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qm_cadastr` int(9) NOT NULL,
  `qm_alterou` int(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `banner` (`banner`),
  KEY `titulo` (`titulo`),
  KEY `fk_banners_tipo` (`tipo`),
  KEY `fk_banners_qm_cadastr` (`qm_cadastr`),
  KEY `fk_banners_qm_alterou` (`qm_alterou`),
  CONSTRAINT `fk_banners_qm_alterou` FOREIGN KEY (`qm_alterou`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_banners_qm_cadastr` FOREIGN KEY (`qm_cadastr`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_banners_tipo` FOREIGN KEY (`tipo`) REFERENCES `banners_tipo` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Armazena informações sobre banners de publicidade';

-- Copiando dados para a tabela _painel_2016.banners: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
REPLACE INTO `banners` (`id`, `titulo`, `banner`, `tipo`, `link`, `data_inicial`, `data_final`, `data_atual`, `qm_cadastr`, `qm_alterou`) VALUES
	(7, 'SLIDE', 'banners/2016/07/slide.jpg', 1, '#', '2016-07-13', '2016-08-31', '2016-07-13 22:55:59', 1, 1),
	(8, 'SLIDE2', 'banners/2016/07/slide2.jpg', 1, '#', '2016-07-13', '2016-08-31', '2016-07-13 23:17:46', 1, NULL);
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.banners_tipo
DROP TABLE IF EXISTS `banners_tipo`;
CREATE TABLE IF NOT EXISTS `banners_tipo` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  `dimens_w` varchar(50) NOT NULL,
  `dimens_h` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo`),
  KEY `tipo` (`tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Tipos de banners';

-- Copiando dados para a tabela _painel_2016.banners_tipo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `banners_tipo` DISABLE KEYS */;
REPLACE INTO `banners_tipo` (`id_tipo`, `tipo`, `dimens_w`, `dimens_h`) VALUES
	(1, 'slide', '1920', '680');
/*!40000 ALTER TABLE `banners_tipo` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.clientes
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fantasia` varchar(50) NOT NULL,
  `razao_social` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefone` varchar(50) NOT NULL,
  `situacao` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela _painel_2016.clientes: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
REPLACE INTO `clientes` (`id`, `fantasia`, `razao_social`, `email`, `telefone`, `situacao`) VALUES
	(1, 'teste', 'teste1', 'pessoal.andersonbatista@gmail.com', '', 0),
	(2, 'Cw Digital - Subisidiaria', 'CW Digital - Brasil LTDA', 'empresa@cwdigital.com.br', '', 0),
	(3, 'empresa abc', 'empresa', 'contato@cwdigital.com.br', '', 1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.colunistas
DROP TABLE IF EXISTS `colunistas`;
CREATE TABLE IF NOT EXISTS `colunistas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_name` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `sobre` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qm_cadastr` int(11) NOT NULL,
  `qm_alterou` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nome` (`nome`),
  KEY `fk_colunistas_qm_cadastr` (`qm_cadastr`),
  KEY `fk_colunistas_qm_alterou` (`qm_alterou`),
  KEY `url_name` (`url_name`),
  CONSTRAINT `fk_colunistas_qm_alterou` FOREIGN KEY (`qm_alterou`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_colunistas_qm_cadastr` FOREIGN KEY (`qm_cadastr`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informações de Colunistas';

-- Copiando dados para a tabela _painel_2016.colunistas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `colunistas` DISABLE KEYS */;
/*!40000 ALTER TABLE `colunistas` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.contato
DROP TABLE IF EXISTS `contato`;
CREATE TABLE IF NOT EXISTS `contato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `assunto` varchar(100) NOT NULL,
  `mensagem` text NOT NULL,
  `data` date NOT NULL,
  `ip` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Informações de contatos através do site';

-- Copiando dados para a tabela _painel_2016.contato: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `contato` DISABLE KEYS */;
REPLACE INTO `contato` (`id`, `nome`, `email`, `assunto`, `mensagem`, `data`, `ip`) VALUES
	(1, 'teste', 'teste@teste.com', 'teste', 'teste', '2016-08-04', '::1');
/*!40000 ALTER TABLE `contato` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.cotacao
DROP TABLE IF EXISTS `cotacao`;
CREATE TABLE IF NOT EXISTS `cotacao` (
  `id_cotacao` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(30) NOT NULL,
  `cotacao` float(15,2) NOT NULL,
  `variacao` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `atualizado` date NOT NULL,
  PRIMARY KEY (`id_cotacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dados de cotação financeira de dolar, euro, bovespa.';

-- Copiando dados para a tabela _painel_2016.cotacao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cotacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotacao` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.cursos
DROP TABLE IF EXISTS `cursos`;
CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_name` varchar(255) NOT NULL,
  `curso` varchar(255) NOT NULL,
  `valor` varchar(50) DEFAULT NULL,
  `carga` varchar(50) DEFAULT NULL,
  `modalidade` varchar(50) DEFAULT NULL,
  `descricao` text,
  `cronograma` text NOT NULL,
  `responsavel` varchar(100) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `qm_cadastr` int(11) NOT NULL,
  `qm_alterou` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Informações sobres os cursos';

-- Copiando dados para a tabela _painel_2016.cursos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
REPLACE INTO `cursos` (`id`, `url_name`, `curso`, `valor`, `carga`, `modalidade`, `descricao`, `cronograma`, `responsavel`, `foto`, `qm_cadastr`, `qm_alterou`) VALUES
	(2, 'i-simposio-norte-brasileiro-de-biorregulacao-funcional', 'I Simpósio Norte Brasileiro de Biorregulação Funcional', 'R$ 50,00', '180 Horas', 'presencial', '<h2>O que &eacute; biorregula&ccedil;&atilde;o e como funciona</h2>\r\n\r\n<p>Na terapia de biorregula&ccedil;&atilde;o, o paciente &eacute; tratado como um sistema biol&oacute;gico, e a doen&ccedil;a s&atilde;o definidos como um desequilibrio de etiologia multifatorial.</p>\r\n\r\n<p>Desreguladores end&oacute;crinos a introxica&ccedil;&atilde;o cumulativa, poluentes org&acirc;nicos persistentes e res&iacute;duos metab&oacute;licos, podem criar altera&ccedil;&otilde;es no sistema org&acirc;nico. A auto regula&ccedil;&atilde;o, inata no organismo pode ficar danificada ou alterada e a detoxifica&ccedil;&atilde;o ou tratamento de suplementa&ccedil;&atilde;o facilita a elimina&ccedil;&atilde;o de toxicidade a partir da matriz extracelular.</p>\r\n', '<h2>Sabado&nbsp;</h2>\r\n\r\n<p>domindo&nbsp;</p>\r\n\r\n<p>ladk ad</p>\r\n\r\n<p>aldkalkd</p>\r\n\r\n<p>aldklakda</p>\r\n\r\n<p>adlkaldk</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'Dr. Francisco Vianna Oliveira Filho', 'cursos/2016/07/teste.jpg', 1, 1);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.cursos_matriculas
DROP TABLE IF EXISTS `cursos_matriculas`;
CREATE TABLE IF NOT EXISTS `cursos_matriculas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_curso` int(11) NOT NULL,
  `cur_nome` varchar(100) NOT NULL,
  `cur_telefone` varchar(20) NOT NULL,
  `cur_cidade` varchar(100) NOT NULL,
  `cur_uf` char(2) NOT NULL,
  `cur_email` varchar(100) NOT NULL,
  `cur_data_inscricao` date NOT NULL,
  `cur_ip` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cursos_matriculas_id_curso` (`id_curso`),
  CONSTRAINT `fk_cursos_matriculas_id_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Informações das matrículas relacionadas aos cursos';

-- Copiando dados para a tabela _painel_2016.cursos_matriculas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cursos_matriculas` DISABLE KEYS */;
REPLACE INTO `cursos_matriculas` (`id`, `id_curso`, `cur_nome`, `cur_telefone`, `cur_cidade`, `cur_uf`, `cur_email`, `cur_data_inscricao`, `cur_ip`) VALUES
	(10, 2, 'CREATIVE WEBSITES GEAN', '(69) 84285809', 'Rolim de Moura', 'RO', 'geanbertani@gmail.com', '2016-07-28', '::1');
/*!40000 ALTER TABLE `cursos_matriculas` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.depoimentos
DROP TABLE IF EXISTS `depoimentos`;
CREATE TABLE IF NOT EXISTS `depoimentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_nome` varchar(100) NOT NULL,
  `dep_cidade` varchar(100) NOT NULL,
  `dep_uf` char(2) NOT NULL,
  `dep_email` varchar(100) NOT NULL,
  `dep_curso` varchar(100) NOT NULL,
  `dep_mensagem` text NOT NULL,
  `dep_autoriza` char(5) NOT NULL,
  `dep_data` date NOT NULL,
  `dep_ip` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Depoimentos dos alunos, sobre cursos já realizados';

-- Copiando dados para a tabela _painel_2016.depoimentos: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `depoimentos` DISABLE KEYS */;
REPLACE INTO `depoimentos` (`id`, `dep_nome`, `dep_cidade`, `dep_uf`, `dep_email`, `dep_curso`, `dep_mensagem`, `dep_autoriza`, `dep_data`, `dep_ip`) VALUES
	(6, 'GEAN MARQUES DA SILVA BERTANI', 'Rolim de Moura', 'RO', 'geanbertani@gmail.com', 'Biorregulação Funcional', 'Isso é somente um teste de depoimentos é real. Este depoimento é feito por participantes dos cursos, todos podem deixar seus depoimentos aqui. ', 'true', '2016-07-27', '::1'),
	(7, 'GEAN MARQUES DA SILVA BERTANI', 'Rolim de Moura', 'RO', 'geanbertani@gmail.com', 'Biorregulação Funcional', 'Isso é somente um teste de depoimentos é real. Este depoimento é feito por participantes dos cursos, todos podem deixar seus depoimentos aqui. ', 'false', '2016-07-28', '::1'),
	(8, 'GEAN MARQUES DA SILVA BERTANI', 'Rolim de Moura', 'RO', 'geanbertani@gmail.com', 'Biorregulação Funcional', 'Isso é somente um teste de depoimentos é real. Este depoimento é feito por participantes dos cursos, todos podem deixar seus depoimentos aqui. ', 'false', '2016-07-27', '::1'),
	(9, 'GEAN MARQUES DA SILVA BERTANI', 'Rolim de Moura', 'RO', 'geanbertani@gmail.com', 'Biorregulação Funcional', 'Isso é somente um teste de depoimentos é real. Este depoimento é feito por participantes dos cursos, todos podem deixar seus depoimentos aqui. ', 'false', '2016-07-27', '::1');
/*!40000 ALTER TABLE `depoimentos` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.enquete
DROP TABLE IF EXISTS `enquete`;
CREATE TABLE IF NOT EXISTS `enquete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pergunta` varchar(250) NOT NULL,
  `resp1` varchar(250) NOT NULL,
  `resp2` varchar(250) NOT NULL,
  `resp3` varchar(250) NOT NULL,
  `resp4` varchar(250) NOT NULL,
  `status` char(1) NOT NULL COMMENT 'A = Ativa | D = Desativada',
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `qm_cadastr` int(11) NOT NULL,
  `qm_alterou` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informações sobre enquetes';

-- Copiando dados para a tabela _painel_2016.enquete: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `enquete` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquete` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.enquete_usuario
DROP TABLE IF EXISTS `enquete_usuario`;
CREATE TABLE IF NOT EXISTS `enquete_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_enquete` int(11) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registrar os usuários que votaram';

-- Copiando dados para a tabela _painel_2016.enquete_usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `enquete_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquete_usuario` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.enquete_votos
DROP TABLE IF EXISTS `enquete_votos`;
CREATE TABLE IF NOT EXISTS `enquete_votos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_enquete` int(11) NOT NULL,
  `voto1` int(11) NOT NULL,
  `voto2` int(11) NOT NULL,
  `voto3` int(11) NOT NULL,
  `voto4` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informações dos votos das respectivas enquetes';

-- Copiando dados para a tabela _painel_2016.enquete_votos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `enquete_votos` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquete_votos` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.eventos
DROP TABLE IF EXISTS `eventos`;
CREATE TABLE IF NOT EXISTS `eventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_name` varchar(255) NOT NULL,
  `evento` varchar(50) DEFAULT NULL,
  `data` timestamp NULL DEFAULT NULL,
  `local` varchar(150) DEFAULT NULL,
  `cidadeuf` varchar(100) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `marca_foto` int(11) DEFAULT NULL,
  `destaque` varchar(3) DEFAULT 'nao',
  `fotografo` varchar(250) DEFAULT NULL,
  `qm_cadastr` int(11) DEFAULT NULL,
  `qm_alterou` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evento` (`evento`),
  KEY `url_name` (`url_name`),
  KEY `fk_eventos_qm_cadastr` (`qm_cadastr`),
  KEY `fk_eventos_qm_alterou` (`qm_alterou`),
  CONSTRAINT `fk_eventos_qm_alterou` FOREIGN KEY (`qm_alterou`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_eventos_qm_cadastr` FOREIGN KEY (`qm_cadastr`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Armazena informações de cadastro de galerias';

-- Copiando dados para a tabela _painel_2016.eventos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
REPLACE INTO `eventos` (`id`, `url_name`, `evento`, `data`, `local`, `cidadeuf`, `foto`, `marca_foto`, `destaque`, `fotografo`, `qm_cadastr`, `qm_alterou`) VALUES
	(1, 'seminario-de-biorregulacao', 'Seminário de Biorregulação', '2016-07-20 13:50:23', 'Sindsef', 'Rolim de Moura - RO', 'eventos/2016/07/seminario-de-biorregulacao.jpeg', NULL, 'sim', 'Sidnei Gimenez', NULL, NULL);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.institucional
DROP TABLE IF EXISTS `institucional`;
CREATE TABLE IF NOT EXISTS `institucional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` varchar(100) NOT NULL,
  `logradouro` varchar(100) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `telefone` varchar(14) NOT NULL,
  `email` varchar(100) NOT NULL,
  `quem_somos` text NOT NULL,
  `foto` varchar(250) NOT NULL,
  `qm_cadastr` int(11) NOT NULL,
  `qm_alterou` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_institucional_qm_cadastr` (`qm_cadastr`),
  KEY `fk_institucional_qm_alterou` (`qm_alterou`),
  CONSTRAINT `fk_institucional_qm_alterou` FOREIGN KEY (`qm_alterou`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_institucional_qm_cadastr` FOREIGN KEY (`qm_cadastr`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Armazena as informações de dados institucionais.';

-- Copiando dados para a tabela _painel_2016.institucional: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `institucional` DISABLE KEYS */;
REPLACE INTO `institucional` (`id`, `empresa`, `logradouro`, `numero`, `bairro`, `cidade`, `uf`, `cep`, `telefone`, `email`, `quem_somos`, `foto`, `qm_cadastr`, `qm_alterou`) VALUES
	(1, 'ITENA - Instituto de Terapias e Naturologia', 'Avenida Curitiba', '4372', 'Centro', 'Rolim de Moura', 'RO', '76940-000', '(69) 3442-1969', 'contato@itena.com.br', '<p>O ITENA-instituto de terapias e naturologia &eacute; uma empresa com seus ideais voltados para impactar a vida de pessoas que estejam interessadas em vivenciar,aprender, conhecer e aperfei&ccedil;oar novas e eficazes formas de ter auto-conhecimento, sa&uacute;de e qualidade de vida.</p>\r\n\r\n<p>Acreditamos que a falta destes conhecimentos nestas &aacute;reas traz resultados negativos a toda a sociedade.</p>\r\n\r\n<p>A sa&uacute;de &eacute; o bem maior a ser cuidado e mantido e os meios atuais de tratamento e diagn&oacute;stico da medicina s&atilde;o ineficientes quando se trata de manter o ser humano com sa&uacute;de, embora &uacute;teis e indiscutivelmente v&aacute;lidas em casos em que a vida est&aacute; sob risco ou quando o paciente j&aacute; se encontra em estado lesional, para a manuten&ccedil;&atilde;o da homeostase ou equil&iacute;brio se mostra ineficaz.</p>\r\n\r\n<p>NESTE SITE todos podem muito em breve lerem os relatos ver&iacute;dicos e documentados de clientes e alunos que vivenciaram em suas vidas pessoal e profissional os benef&iacute;cios dos nossos servi&ccedil;os de assessoria em cursos, palestras,e avalia&ccedil;&otilde;es de biorresson&acirc;ncia qu&acirc;ntica magn&eacute;tica.</p>\r\n\r\n<p>SOMOS UM INSTITUTO COMPROMETIDO COM A VERDADE SOBRE O QUE &Eacute; TER SA&Uacute;DE E QUALIDADE DE VIDA, PORQUE ACREDITAMOS QUE SER SAUD&Aacute;VEL &Eacute; NATURAL</p>\r\n', 'institucional/2016/07/itena-instituto-de-terapias-e-naturologia.jpg', 1, 1);
/*!40000 ALTER TABLE `institucional` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.menu
DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu_tipo` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `case` varchar(100) NOT NULL,
  `pagina` varchar(150) NOT NULL,
  `ico_menu` varchar(50) NOT NULL DEFAULT '',
  `ativo` char(5) NOT NULL DEFAULT 'true',
  PRIMARY KEY (`id_menu`),
  KEY `fk_menu_id_menutipo` (`id_menu_tipo`),
  CONSTRAINT `fk_menu_id_menu_tipo` FOREIGN KEY (`id_menu_tipo`) REFERENCES `menu_tipo` (`id_menu_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Menu';

-- Copiando dados para a tabela _painel_2016.menu: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
REPLACE INTO `menu` (`id_menu`, `id_menu_tipo`, `titulo`, `case`, `pagina`, `ico_menu`, `ativo`) VALUES
	(1, 1, 'Usuários', 'usuarios', '#', 'entypo-user', 'true'),
	(2, 1, 'TV', 'tvs', '#', 'entypo-monitor', 'true'),
	(3, 1, 'Eventos', 'eventos', '#', 'entypo-calendar', 'true'),
	(4, 1, 'Cursos', 'cursos', '#', 'entypo-doc-text', 'true'),
	(5, 1, 'Videos', 'videos', '#', 'entypo-video', 'true'),
	(6, 1, 'Depoimentos', 'depoimentos', '#', 'entypo-comment', 'true'),
	(7, 1, 'Configurações', 'institucional', '#', 'entypo-cog', 'true'),
	(8, 1, 'Matrículas', 'matriculas', '#', 'entypo-clipboard', 'true'),
	(9, 1, 'Contato', 'contato', '#', 'entypo-phone', 'true'),
	(14, 1, 'Banners', 'banners', '#', 'entypo-window', 'true'),
	(15, 1, 'Clientes', 'clientes', '', 'entypo-users', 'true');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.menu_sub
DROP TABLE IF EXISTS `menu_sub`;
CREATE TABLE IF NOT EXISTS `menu_sub` (
  `id_menu_sub` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `case` varchar(100) NOT NULL,
  `pagina` varchar(150) NOT NULL,
  `ico_menu` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_menu_sub`),
  KEY `fkmenu_sub_id_menu` (`id_menu`),
  KEY `idx_menu_sub_titulo` (`titulo`),
  CONSTRAINT `fk_menu_sub_id_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='Menu Sub';

-- Copiando dados para a tabela _painel_2016.menu_sub: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `menu_sub` DISABLE KEYS */;
REPLACE INTO `menu_sub` (`id_menu_sub`, `id_menu`, `titulo`, `case`, `pagina`, `ico_menu`) VALUES
	(2, 1, 'Abrir', 'usuarios', 'listar', ''),
	(3, 2, 'Novo Cadastro', 'tvs', 'cadastrar', 'entypo-plus'),
	(4, 2, 'Listar Cadastros', 'tvs', 'listar', ''),
	(5, 3, 'Novo Cadastro', 'eventos', 'cadastrar', ''),
	(6, 3, 'Listar Cadastros', 'eventos', 'listar', ''),
	(7, 4, 'Novo Cadastro', 'cursos', 'cadastrar', ''),
	(8, 4, 'Listar Cadastros', 'cursos', 'listar', ''),
	(9, 5, 'Novo Cadastro', 'videos', 'cadastrar', ''),
	(10, 5, 'Listar Cadastros', 'videos', 'listar', ''),
	(11, 6, 'Listar Cadastros', 'depoimentos', 'listar', ''),
	(12, 7, 'Configurações Gerais', 'institucional', 'editar', ''),
	(13, 8, 'Listar Cadastros', 'matriculas', 'listar', ''),
	(14, 9, 'Listar Cadastros', 'contato', 'listar', ''),
	(15, 14, 'Novo Cadastro', 'banners', 'cadastrar', ''),
	(16, 14, 'Listar Cadastros', 'banners', 'listar', ''),
	(17, 15, 'Novo Cadastro', 'clientes', 'cadastrar', ''),
	(18, 15, 'Listar Clientes', 'clientes', 'listar', '');
/*!40000 ALTER TABLE `menu_sub` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.menu_sub_nav
DROP TABLE IF EXISTS `menu_sub_nav`;
CREATE TABLE IF NOT EXISTS `menu_sub_nav` (
  `id_menu_sub_nav` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu_sub` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `case` varchar(100) NOT NULL,
  `pagina` varchar(150) NOT NULL,
  `ico_menu` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_menu_sub_nav`),
  KEY `fkmenu_sub_id_menu_sub` (`id_menu_sub`),
  CONSTRAINT `fk_menu_sub_id_menu_sub` FOREIGN KEY (`id_menu_sub`) REFERENCES `menu_sub` (`id_menu_sub`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Menu Sub Nav';

-- Copiando dados para a tabela _painel_2016.menu_sub_nav: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `menu_sub_nav` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_sub_nav` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.menu_tipo
DROP TABLE IF EXISTS `menu_tipo`;
CREATE TABLE IF NOT EXISTS `menu_tipo` (
  `id_menu_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  PRIMARY KEY (`id_menu_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Menu Tipo';

-- Copiando dados para a tabela _painel_2016.menu_tipo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `menu_tipo` DISABLE KEYS */;
REPLACE INTO `menu_tipo` (`id_menu_tipo`, `tipo`) VALUES
	(1, 'painel_adm_sidebar'),
	(2, 'painel_est_sidebar');
/*!40000 ALTER TABLE `menu_tipo` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.newsletter_usuario
DROP TABLE IF EXISTS `newsletter_usuario`;
CREATE TABLE IF NOT EXISTS `newsletter_usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `e-mail` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Usuários cadastrados na newsletter';

-- Copiando dados para a tabela _painel_2016.newsletter_usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `newsletter_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_usuario` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.noticias
DROP TABLE IF EXISTS `noticias`;
CREATE TABLE IF NOT EXISTS `noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_name` varchar(255) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `subtitulo` varchar(250) DEFAULT NULL,
  `autor` varchar(50) DEFAULT NULL,
  `colunista` int(11) DEFAULT NULL,
  `fonte` varchar(100) DEFAULT NULL,
  `destaque` varchar(3) DEFAULT NULL,
  `destaque_tipo` varchar(50) DEFAULT NULL,
  `noticia` text NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_fslide` timestamp NULL DEFAULT NULL,
  `video` varchar(50) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `marca_foto` int(11) NOT NULL DEFAULT '0' COMMENT '0=não adiciona marca, 1=adiciona marca',
  `contador` int(11) DEFAULT NULL,
  `coluna` varchar(3) DEFAULT NULL,
  `qm_cadastr` int(11) NOT NULL,
  `qm_alterou` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `titulo` (`titulo`),
  KEY `fk_noticias_colunista` (`colunista`),
  KEY `fk_noticias_qm_cadastr` (`qm_cadastr`),
  KEY `fk_noticias_qm_alterou` (`qm_alterou`),
  KEY `fk_noticias_categoria` (`categoria`),
  CONSTRAINT `fk_noticias_categoria` FOREIGN KEY (`categoria`) REFERENCES `noticias_categoria` (`cat_url`),
  CONSTRAINT `fk_noticias_colunista` FOREIGN KEY (`colunista`) REFERENCES `colunistas` (`id`),
  CONSTRAINT `fk_noticias_qm_alterou` FOREIGN KEY (`qm_alterou`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_noticias_qm_cadastr` FOREIGN KEY (`qm_cadastr`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Armazena informações de cadastros de noticias';

-- Copiando dados para a tabela _painel_2016.noticias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.noticias_categoria
DROP TABLE IF EXISTS `noticias_categoria`;
CREATE TABLE IF NOT EXISTS `noticias_categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) NOT NULL,
  `cat_url` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `cat_url` (`cat_url`),
  KEY `categoria` (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Categorias das Noticias';

-- Copiando dados para a tabela _painel_2016.noticias_categoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `noticias_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticias_categoria` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.tv
DROP TABLE IF EXISTS `tv`;
CREATE TABLE IF NOT EXISTS `tv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_name` varchar(255) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `aovivo` char(5) NOT NULL DEFAULT 'false',
  `descricao` text NOT NULL,
  `ativo` char(5) NOT NULL DEFAULT 'true',
  `qm_cadastr` int(11) NOT NULL,
  `data_cadastr` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qm_alterou` int(11) DEFAULT NULL,
  `data_alterou` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tv_qm_cadastr` (`qm_cadastr`),
  KEY `fk_tv_qm_alterou` (`qm_alterou`),
  KEY `titulo` (`titulo`),
  KEY `fk_tv_categoria` (`categoria`),
  CONSTRAINT `fk_tv_categoria` FOREIGN KEY (`categoria`) REFERENCES `videos_categoria` (`url_name`),
  CONSTRAINT `fk_tv_qm_alterou` FOREIGN KEY (`qm_alterou`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_tv_qm_cadastr` FOREIGN KEY (`qm_cadastr`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link de Iframe para exibir a TV';

-- Copiando dados para a tabela _painel_2016.tv: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tv` DISABLE KEYS */;
/*!40000 ALTER TABLE `tv` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_name` varchar(255) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `data_nasc` date DEFAULT NULL,
  `sexo` int(1) DEFAULT NULL,
  `login` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `foto` varchar(250) DEFAULT NULL,
  `ativo` varchar(1) DEFAULT 's',
  `nivel` int(1) DEFAULT NULL,
  `cont_acesso` int(11) unsigned DEFAULT '0',
  `ip` varchar(30) DEFAULT NULL,
  `ultimo_acesso` timestamp NULL DEFAULT NULL,
  `qm_cadastr` int(9) DEFAULT NULL,
  `dt_cadastr` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `qm_alterou` int(9) DEFAULT NULL,
  `dt_alterou` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `id` (`id`),
  KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Armazena informações dos usuarios do painel';

-- Copiando dados para a tabela _painel_2016.usuarios: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
REPLACE INTO `usuarios` (`id`, `url_name`, `nome`, `email`, `data_nasc`, `sexo`, `login`, `senha`, `foto`, `ativo`, `nivel`, `cont_acesso`, `ip`, `ultimo_acesso`, `qm_cadastr`, `dt_cadastr`, `qm_alterou`, `dt_alterou`) VALUES
	(1, 'cw-digital-brasil', 'CW Digital - Brasil', 'admin@cwdigital.com.br', '2016-08-01', 1, 'cwdigital', 'e10adc3949ba59abbe56e057f20f883e', 'usuarios/2016/09/cwdigital.png', 's', 1, 89, '::1', '2016-09-06 14:02:31', 1, NULL, 1, '2016-09-05 15:06:03'),
	(3, 'anderson-batista-designer', 'Anderson Batista - Designer', 'pessoal.andersonbatista@gmail.com', '1995-07-22', 1, 'anderson', 'a30b59adfa3943b419658009c97c4fcb', 'usuarios/2016/07/anderson.png', 's', 1, 1, '::1', NULL, 1, '2016-07-20 14:45:24', NULL, NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.videos
DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_name` varchar(255) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `iframe` varchar(100) DEFAULT NULL,
  `youtube` varchar(100) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL,
  `destaque` varchar(3) NOT NULL,
  `autor` varchar(50) DEFAULT NULL,
  `data` date NOT NULL,
  `foto` varchar(250) DEFAULT NULL,
  `descricao` text NOT NULL,
  `tipo` varchar(5) NOT NULL,
  `data_inicial` timestamp NULL DEFAULT NULL,
  `data_final` timestamp NULL DEFAULT NULL,
  `transmissao` varchar(10) NOT NULL,
  `qm_cadastr` int(9) NOT NULL,
  `dt_cadastr` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qm_alterou` int(9) DEFAULT NULL,
  `dt_alterou` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `url_name` (`url_name`),
  KEY `titulo` (`titulo`),
  KEY `fk_videos_qm_cadastr` (`qm_cadastr`),
  KEY `fk_videos_qm_alterou` (`qm_alterou`),
  KEY `fk_videos_categoria` (`categoria`),
  CONSTRAINT `fk_videos_categoria` FOREIGN KEY (`categoria`) REFERENCES `videos_categoria` (`url_name`),
  CONSTRAINT `fk_videos_qm_alterou` FOREIGN KEY (`qm_alterou`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_videos_qm_cadastr` FOREIGN KEY (`qm_cadastr`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Armazena informações de cadastro de videos.';

-- Copiando dados para a tabela _painel_2016.videos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.videos_categoria
DROP TABLE IF EXISTS `videos_categoria`;
CREATE TABLE IF NOT EXISTS `videos_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_name` varchar(50) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_name` (`url_name`),
  KEY `categoria` (`categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='Categorias de Videos';

-- Copiando dados para a tabela _painel_2016.videos_categoria: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `videos_categoria` DISABLE KEYS */;
REPLACE INTO `videos_categoria` (`id`, `url_name`, `categoria`, `color`) VALUES
	(1, 'educacao', 'Educação', 'blue2'),
	(2, 'entretenimento', 'Entretenimento', 'purple'),
	(3, 'esporte', 'Esporte', 'green2'),
	(4, 'policia', 'Policía', 'red'),
	(5, 'politica', 'Política', 'blue'),
	(6, 'bronca-livre', 'Bronca Livre', 'red2'),
	(7, 'tribuna-livre', 'Tribuna Livre', 'purple2'),
	(8, 'saude', 'Saúde', 'orange'),
	(9, 'ao-vivo', 'Ao Vivo', 'gray'),
	(10, 'pinga-fogo', 'Pinga Fogo', 'orange'),
	(11, 'palavra-fato', 'Palavra de Fato', 'red2'),
	(13, 'religiao', 'Religião', 'blue2'),
	(14, 'tecnologia', 'Tecnologia', 'green'),
	(15, 'agricultura', 'Agricultura', 'green2'),
	(16, 'cultura', 'Cultura', 'blue'),
	(17, 'economia', 'Economia', 'red');
/*!40000 ALTER TABLE `videos_categoria` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.ws_siteviews
DROP TABLE IF EXISTS `ws_siteviews`;
CREATE TABLE IF NOT EXISTS `ws_siteviews` (
  `siteviews_id` int(11) NOT NULL AUTO_INCREMENT,
  `siteviews_date` date NOT NULL,
  `siteviews_users` decimal(10,0) NOT NULL,
  `siteviews_views` decimal(10,0) NOT NULL,
  `siteviews_pages` decimal(10,0) NOT NULL,
  PRIMARY KEY (`siteviews_id`),
  KEY `idx_1` (`siteviews_date`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela _painel_2016.ws_siteviews: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `ws_siteviews` DISABLE KEYS */;
REPLACE INTO `ws_siteviews` (`siteviews_id`, `siteviews_date`, `siteviews_users`, `siteviews_views`, `siteviews_pages`) VALUES
	(1, '2016-07-15', 1, 1, 4),
	(2, '2016-07-19', 2, 2, 96),
	(3, '2016-07-20', 2, 2, 78),
	(4, '2016-07-22', 1, 1, 339),
	(5, '2016-07-23', 1, 1, 40),
	(6, '2016-07-23', 1, 1, 40),
	(7, '2016-07-25', 1, 1, 9),
	(8, '2016-07-26', 1, 1, 12),
	(9, '2016-07-27', 1, 1, 128),
	(10, '2016-07-29', 1, 1, 1),
	(11, '2016-08-04', 1, 1, 33),
	(12, '2016-08-05', 1, 1, 1);
/*!40000 ALTER TABLE `ws_siteviews` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.ws_siteviews_agent
DROP TABLE IF EXISTS `ws_siteviews_agent`;
CREATE TABLE IF NOT EXISTS `ws_siteviews_agent` (
  `agent_id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `agent_views` decimal(10,0) NOT NULL,
  PRIMARY KEY (`agent_id`),
  KEY `idx_1` (`agent_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela _painel_2016.ws_siteviews_agent: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ws_siteviews_agent` DISABLE KEYS */;
REPLACE INTO `ws_siteviews_agent` (`agent_id`, `agent_name`, `agent_views`) VALUES
	(1, 'Chrome', 13);
/*!40000 ALTER TABLE `ws_siteviews_agent` ENABLE KEYS */;


-- Copiando estrutura para tabela _painel_2016.ws_siteviews_online
DROP TABLE IF EXISTS `ws_siteviews_online`;
CREATE TABLE IF NOT EXISTS `ws_siteviews_online` (
  `online_id` int(11) NOT NULL AUTO_INCREMENT,
  `online_session` varchar(255) CHARACTER SET latin1 NOT NULL,
  `online_startview` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `online_endview` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `online_ip` varchar(255) CHARACTER SET latin1 NOT NULL,
  `online_url` varchar(255) CHARACTER SET latin1 NOT NULL,
  `online_agent` varchar(255) CHARACTER SET latin1 NOT NULL,
  `agent_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`online_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela _painel_2016.ws_siteviews_online: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ws_siteviews_online` DISABLE KEYS */;
REPLACE INTO `ws_siteviews_online` (`online_id`, `online_session`, `online_startview`, `online_endview`, `online_ip`, `online_url`, `online_agent`, `agent_name`) VALUES
	(19, '56mvis74qni93fko60v9fpofb1', '2016-08-05 08:32:45', '2016-08-05 08:42:45', '::1', '/servidor/itena/2016/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 'Chrome');
/*!40000 ALTER TABLE `ws_siteviews_online` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
