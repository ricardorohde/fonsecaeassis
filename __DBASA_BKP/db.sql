-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           10.1.8-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.3.0.5124
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.adv_associados
DROP TABLE IF EXISTS `adv_associados`;
CREATE TABLE IF NOT EXISTS `adv_associados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_name` varchar(250) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `oab_reg` varchar(30) NOT NULL,
  `oab_uf` char(2) NOT NULL,
  `foto` varchar(250) NOT NULL,
  `qm_cadastr` int(11) NOT NULL,
  `data_cadastr` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qm_alterou` int(11) DEFAULT NULL,
  `data_alterou` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_adv_associados_qm_alterou` (`qm_alterou`),
  KEY `fk_adv_associados_qm_cadastr` (`qm_cadastr`),
  CONSTRAINT `fk_adv_associados_qm_alterou` FOREIGN KEY (`qm_alterou`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_adv_associados_qm_cadastr` FOREIGN KEY (`qm_cadastr`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Cadastros de Advogados Associados';

-- Copiando dados para a tabela _fonsecaeassis_2016.adv_associados: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `adv_associados` DISABLE KEYS */;
REPLACE INTO `adv_associados` (`id`, `url_name`, `nome`, `oab_reg`, `oab_uf`, `foto`, `qm_cadastr`, `data_cadastr`, `qm_alterou`, `data_alterou`) VALUES
	(2, 'felipe-teste', 'Felipe Teste', '12345', 'RO', 'associados/2016/10/felipe-teste.jpg', 1, '2016-10-19 00:30:27', 1, NULL),
	(3, 'vitor-macedo', 'Vitor Macedo', '24570', 'RO', 'associados/2016/10/vitor-macedo.jpg', 1, '2016-10-19 00:30:27', 1, NULL),
	(4, 'paraibinha', 'Paraibinha', '03483', 'RO', 'associados/2016/10/paraibinha.jpg', 1, '2016-10-19 00:30:27', NULL, NULL),
	(5, 'antonio-jorge', 'Antonio Jorge', '103494', 'RO', 'associados/2016/10/antonio-jorge.jpg', 1, '2016-10-19 00:30:27', 1, '2016-10-19 00:31:57');
/*!40000 ALTER TABLE `adv_associados` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.atuacao
DROP TABLE IF EXISTS `atuacao`;
CREATE TABLE IF NOT EXISTS `atuacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_icon` int(11) NOT NULL,
  `url_name` varchar(250) NOT NULL,
  `area` varchar(100) NOT NULL,
  `qm_cadastr` int(11) NOT NULL,
  `data_cadastr` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qm_alterou` int(11) DEFAULT NULL,
  `data_alterou` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_atuacao_id_icon` (`id_icon`),
  KEY `fk_atuacao_qm_cadastr` (`qm_cadastr`),
  KEY `fk_atuacao_qm_alterou` (`qm_alterou`),
  CONSTRAINT `fk_atuacao_id_icon` FOREIGN KEY (`id_icon`) REFERENCES `atuacao_icons` (`id`),
  CONSTRAINT `fk_atuacao_qm_alterou` FOREIGN KEY (`qm_alterou`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_atuacao_qm_cadastr` FOREIGN KEY (`qm_cadastr`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Áreas de Atuação';

-- Copiando dados para a tabela _fonsecaeassis_2016.atuacao: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `atuacao` DISABLE KEYS */;
REPLACE INTO `atuacao` (`id`, `id_icon`, `url_name`, `area`, `qm_cadastr`, `data_cadastr`, `qm_alterou`, `data_alterou`) VALUES
	(1, 1, 'direito-penal-e-penal-economico', 'Direito Penal e Penal Econômico', 1, '2016-10-19 19:53:22', 1, '2016-10-19 20:28:04'),
	(4, 3, 'direito-da-familia', 'Direito da Familia', 1, '2016-10-19 20:38:26', 1, '2016-10-19 21:05:18');
/*!40000 ALTER TABLE `atuacao` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.atuacao_icons
DROP TABLE IF EXISTS `atuacao_icons`;
CREATE TABLE IF NOT EXISTS `atuacao_icons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `foto` varchar(250) NOT NULL,
  `qm_cadastr` int(11) NOT NULL,
  `data_cadastr` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qm_alterou` int(11) DEFAULT NULL,
  `data_alterou` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_atuacao_icons_qm_cadastr` (`qm_cadastr`),
  KEY `fk_atuacao_icons_qm_alterou` (`qm_alterou`),
  CONSTRAINT `fk_atuacao_icons_qm_alterou` FOREIGN KEY (`qm_alterou`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_atuacao_icons_qm_cadastr` FOREIGN KEY (`qm_cadastr`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Icones das Áreas de Atuação';

-- Copiando dados para a tabela _fonsecaeassis_2016.atuacao_icons: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `atuacao_icons` DISABLE KEYS */;
REPLACE INTO `atuacao_icons` (`id`, `nome`, `foto`, `qm_cadastr`, `data_cadastr`, `qm_alterou`, `data_alterou`) VALUES
	(1, 'Advocacia Civil', 'atuacao_icons/2016/10/advocacia-civil.png', 1, '2016-10-19 19:24:03', 1, '2016-10-19 19:36:16'),
	(3, 'Direito Penal e Penal Econômico', 'atuacao_icons/2016/10/direito-penal-e-penal-economico.png', 1, '2016-10-19 19:40:32', NULL, NULL),
	(4, 'Direto da Familia', 'atuacao_icons/2016/10/direto-da-familia.png', 1, '2016-10-19 20:38:46', NULL, NULL);
/*!40000 ALTER TABLE `atuacao_icons` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.banco_fotos
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Armazena as fotos selecionadas na opção mais fotos, dependendo do tipo.';

-- Copiando dados para a tabela _fonsecaeassis_2016.banco_fotos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `banco_fotos` DISABLE KEYS */;
REPLACE INTO `banco_fotos` (`id`, `id_tipo`, `tipo`, `foto`, `data`, `ordem`) VALUES
	(4, 1, 'N', 'banco_fotos/2016/10/tipo-n-id-1-22143.jpg', '2016-10-19 21:14:07', NULL),
	(5, 1, 'N', 'banco_fotos/2016/10/tipo-n-id-1-20077.jpg', '2016-10-19 21:14:07', NULL),
	(6, 1, 'N', 'banco_fotos/2016/10/tipo-n-id-1-13900.jpg', '2016-10-19 21:14:08', NULL),
	(7, 1, 'N', 'banco_fotos/2016/10/tipo-n-id-1-19106.jpg', '2016-10-19 21:14:08', NULL),
	(8, 1, 'N', 'banco_fotos/2016/10/tipo-n-id-1-30357.jpg', '2016-10-19 21:14:08', NULL),
	(9, 1, 'N', 'banco_fotos/2016/10/tipo-n-id-1-21299.jpg', '2016-10-19 21:14:08', NULL);
/*!40000 ALTER TABLE `banco_fotos` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.banners
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

-- Copiando dados para a tabela _fonsecaeassis_2016.banners: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
REPLACE INTO `banners` (`id`, `titulo`, `banner`, `tipo`, `link`, `data_inicial`, `data_final`, `data_atual`, `qm_cadastr`, `qm_alterou`) VALUES
	(8, 'SLIDE2', 'banners/2016/07/slide2.jpg', 1, '#', '2016-07-13', '2016-08-31', '2016-07-13 23:17:46', 1, NULL);
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.banners_tipo
DROP TABLE IF EXISTS `banners_tipo`;
CREATE TABLE IF NOT EXISTS `banners_tipo` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  `dimens_w` varchar(50) NOT NULL,
  `dimens_h` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo`),
  KEY `tipo` (`tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Tipos de banners';

-- Copiando dados para a tabela _fonsecaeassis_2016.banners_tipo: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `banners_tipo` DISABLE KEYS */;
REPLACE INTO `banners_tipo` (`id_tipo`, `tipo`, `dimens_w`, `dimens_h`) VALUES
	(1, 'slide', '1920', '680');
/*!40000 ALTER TABLE `banners_tipo` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.clientes
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

-- Copiando dados para a tabela _fonsecaeassis_2016.clientes: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
REPLACE INTO `clientes` (`id`, `fantasia`, `razao_social`, `email`, `telefone`, `situacao`) VALUES
	(1, 'teste', 'teste1', 'pessoal.andersonbatista@gmail.com', '', 0),
	(2, 'Cw Digital - Subisidiaria', 'CW Digital - Brasil LTDA', 'empresa@cwdigital.com.br', '', 0),
	(3, 'empresa abc', 'empresa', 'contato@cwdigital.com.br', '', 1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.clima_dados
DROP TABLE IF EXISTS `clima_dados`;
CREATE TABLE IF NOT EXISTS `clima_dados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cidade` varchar(100) NOT NULL,
  `uf` char(2) NOT NULL,
  `data_atualizado` date NOT NULL,
  `data_previsao` date NOT NULL,
  `id_sigla` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `temp_max` int(2) NOT NULL,
  `temp_min` int(2) NOT NULL,
  `iuv` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clima_dados_id_sigla` (`id_sigla`),
  CONSTRAINT `fk_clima_dados_id_sigla` FOREIGN KEY (`id_sigla`) REFERENCES `clima_sigla` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dados sobre o clima';

-- Copiando dados para a tabela _fonsecaeassis_2016.clima_dados: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `clima_dados` DISABLE KEYS */;
/*!40000 ALTER TABLE `clima_dados` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.clima_sigla
DROP TABLE IF EXISTS `clima_sigla`;
CREATE TABLE IF NOT EXISTS `clima_sigla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` varchar(3) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='Sigla das condições do clima';

-- Copiando dados para a tabela _fonsecaeassis_2016.clima_sigla: ~40 rows (aproximadamente)
/*!40000 ALTER TABLE `clima_sigla` DISABLE KEYS */;
REPLACE INTO `clima_sigla` (`id`, `sigla`, `descricao`) VALUES
	(1, 'ec', 'Encoberto com Chuvas Isoladas'),
	(2, 'ci', 'Chuvas Isoladas'),
	(3, 'c', 'Chuva'),
	(4, 'in', 'Instável'),
	(5, 'pp', 'Poss. de Pancadas de Chuva'),
	(6, 'cm', 'Chuva pela Manhã'),
	(7, 'cn', 'Chuva a Noite'),
	(8, 'pt', 'Pancadas de Chuva a Tarde'),
	(9, 'pm', 'Pancadas de Chuva pela Manhã'),
	(10, 'np', 'Nublado e Pancadas de Chuva'),
	(11, 'pc', 'Pancadas de Chuva'),
	(12, 'pn', 'Parcialmente Nublado'),
	(13, 'cv', 'Chuvisco'),
	(14, 'ch', 'Chuvoso'),
	(15, 't', 'Tempestade'),
	(16, 'ps', 'Predomínio de Sol'),
	(17, 'e', 'Encoberto'),
	(18, 'n', 'Nublado'),
	(19, 'cl', 'Céu Claro'),
	(20, 'nv', 'Nevoeiro'),
	(21, 'g', 'Geada'),
	(22, 'ne', 'Neve'),
	(23, 'nd', 'Não Definido'),
	(24, 'pnt', 'Pancadas de Chuva a Noite'),
	(25, 'psc', 'Possibilidade de Chuva'),
	(26, 'pcm', 'Possibilidade de Chuva pela Manhã'),
	(27, 'pct', 'Possibilidade de Chuva a Tarde'),
	(28, 'pcn', 'Possibilidade de Chuva a Noite'),
	(29, 'npt', 'Nublado com Pancadas a Tarde'),
	(30, 'npn', 'Nublado com Pancadas a Noite'),
	(31, 'ncn', 'Nublado com Poss. de Chuva a Noite'),
	(32, 'nct', 'Nublado com Poss. de Chuva a Tarde'),
	(33, 'ncm', 'Nubl. c/ Poss. de Chuva pela Manhã'),
	(34, 'npm', 'Nublado com Pancadas pela Manhã'),
	(35, 'npp', 'Nublado com Possibilidade de Chuva'),
	(36, 'vn', 'Variação de Nebulosidade'),
	(37, 'ct', 'Chuva a Tarde'),
	(38, 'ppn', 'Poss. de Panc. de Chuva a Noite'),
	(39, 'ppt', 'Poss. de Panc. de Chuva a Tarde'),
	(40, 'ppm', 'Poss. de Panc. de Chuva pela Manhã');
/*!40000 ALTER TABLE `clima_sigla` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.colunistas
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

-- Copiando dados para a tabela _fonsecaeassis_2016.colunistas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `colunistas` DISABLE KEYS */;
/*!40000 ALTER TABLE `colunistas` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.contato
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

-- Copiando dados para a tabela _fonsecaeassis_2016.contato: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `contato` DISABLE KEYS */;
REPLACE INTO `contato` (`id`, `nome`, `email`, `assunto`, `mensagem`, `data`, `ip`) VALUES
	(1, 'teste', 'teste@teste.com', 'teste', 'teste', '2016-08-04', '::1');
/*!40000 ALTER TABLE `contato` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.cotacao
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

-- Copiando dados para a tabela _fonsecaeassis_2016.cotacao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cotacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotacao` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.cursos
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

-- Copiando dados para a tabela _fonsecaeassis_2016.cursos: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
REPLACE INTO `cursos` (`id`, `url_name`, `curso`, `valor`, `carga`, `modalidade`, `descricao`, `cronograma`, `responsavel`, `foto`, `qm_cadastr`, `qm_alterou`) VALUES
	(2, 'i-simposio-norte-brasileiro-de-biorregulacao-funcional', 'I Simpósio Norte Brasileiro de Biorregulação Funcional', 'R$ 50,00', '180 Horas', 'presencial', '<h2>O que &eacute; biorregula&ccedil;&atilde;o e como funciona</h2>\r\n\r\n<p>Na terapia de biorregula&ccedil;&atilde;o, o paciente &eacute; tratado como um sistema biol&oacute;gico, e a doen&ccedil;a s&atilde;o definidos como um desequilibrio de etiologia multifatorial.</p>\r\n\r\n<p>Desreguladores end&oacute;crinos a introxica&ccedil;&atilde;o cumulativa, poluentes org&acirc;nicos persistentes e res&iacute;duos metab&oacute;licos, podem criar altera&ccedil;&otilde;es no sistema org&acirc;nico. A auto regula&ccedil;&atilde;o, inata no organismo pode ficar danificada ou alterada e a detoxifica&ccedil;&atilde;o ou tratamento de suplementa&ccedil;&atilde;o facilita a elimina&ccedil;&atilde;o de toxicidade a partir da matriz extracelular.</p>\r\n', '<h2>Sabado&nbsp;</h2>\r\n\r\n<p>domindo&nbsp;</p>\r\n\r\n<p>ladk ad</p>\r\n\r\n<p>aldkalkd</p>\r\n\r\n<p>aldklakda</p>\r\n\r\n<p>adlkaldk</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'Dr. Francisco Vianna Oliveira Filho', 'cursos/2016/07/teste.jpg', 1, 1);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.cursos_matriculas
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

-- Copiando dados para a tabela _fonsecaeassis_2016.cursos_matriculas: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `cursos_matriculas` DISABLE KEYS */;
REPLACE INTO `cursos_matriculas` (`id`, `id_curso`, `cur_nome`, `cur_telefone`, `cur_cidade`, `cur_uf`, `cur_email`, `cur_data_inscricao`, `cur_ip`) VALUES
	(10, 2, 'CREATIVE WEBSITES GEAN', '(69) 84285809', 'Rolim de Moura', 'RO', 'geanbertani@gmail.com', '2016-07-28', '::1');
/*!40000 ALTER TABLE `cursos_matriculas` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.depoimentos
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Depoimentos dos alunos, sobre cursos já realizados';

-- Copiando dados para a tabela _fonsecaeassis_2016.depoimentos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `depoimentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `depoimentos` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.enquete
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

-- Copiando dados para a tabela _fonsecaeassis_2016.enquete: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `enquete` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquete` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.enquete_usuario
DROP TABLE IF EXISTS `enquete_usuario`;
CREATE TABLE IF NOT EXISTS `enquete_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_enquete` int(11) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registrar os usuários que votaram';

-- Copiando dados para a tabela _fonsecaeassis_2016.enquete_usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `enquete_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquete_usuario` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.enquete_votos
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

-- Copiando dados para a tabela _fonsecaeassis_2016.enquete_votos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `enquete_votos` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquete_votos` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.eventos
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

-- Copiando dados para a tabela _fonsecaeassis_2016.eventos: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
REPLACE INTO `eventos` (`id`, `url_name`, `evento`, `data`, `local`, `cidadeuf`, `foto`, `marca_foto`, `destaque`, `fotografo`, `qm_cadastr`, `qm_alterou`) VALUES
	(1, 'seminario-de-biorregulacao', 'Seminário de Biorregulação', '2016-07-20 13:50:23', 'Sindsef', 'Rolim de Moura - RO', 'eventos/2016/07/seminario-de-biorregulacao.jpeg', NULL, 'sim', 'Sidnei Gimenez', NULL, NULL);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.institucional
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

-- Copiando dados para a tabela _fonsecaeassis_2016.institucional: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `institucional` DISABLE KEYS */;
REPLACE INTO `institucional` (`id`, `empresa`, `logradouro`, `numero`, `bairro`, `cidade`, `uf`, `cep`, `telefone`, `email`, `quem_somos`, `foto`, `qm_cadastr`, `qm_alterou`) VALUES
	(1, 'Fonseca & Assis - Advogados Associados', 'Rua Joaquim Nabuco', '1774', 'Centro', 'Porto Velho', 'RO', '76804-066', '(69) 3224-6357', 'atendimento@fonsecaeassis.com.br', '<p>O ITENA-instituto de terapias e naturologia &eacute; uma empresa com seus ideais voltados para impactar a vida de pessoas que estejam interessadas em vivenciar,aprender, conhecer e aperfei&ccedil;oar novas e eficazes formas de ter auto-conhecimento, sa&uacute;de e qualidade de vida.</p>\r\n\r\n<p>Acreditamos que a falta destes conhecimentos nestas &aacute;reas traz resultados negativos a toda a sociedade.</p>\r\n\r\n<p>A sa&uacute;de &eacute; o bem maior a ser cuidado e mantido e os meios atuais de tratamento e diagn&oacute;stico da medicina s&atilde;o ineficientes quando se trata de manter o ser humano com sa&uacute;de, embora &uacute;teis e indiscutivelmente v&aacute;lidas em casos em que a vida est&aacute; sob risco ou quando o paciente j&aacute; se encontra em estado lesional, para a manuten&ccedil;&atilde;o da homeostase ou equil&iacute;brio se mostra ineficaz.</p>\r\n\r\n<p>NESTE SITE todos podem muito em breve lerem os relatos ver&iacute;dicos e documentados de clientes e alunos que vivenciaram em suas vidas pessoal e profissional os benef&iacute;cios dos nossos servi&ccedil;os de assessoria em cursos, palestras,e avalia&ccedil;&otilde;es de biorresson&acirc;ncia qu&acirc;ntica magn&eacute;tica.</p>\r\n\r\n<p>SOMOS UM INSTITUTO COMPROMETIDO COM A VERDADE SOBRE O QUE &Eacute; TER SA&Uacute;DE E QUALIDADE DE VIDA, PORQUE ACREDITAMOS QUE SER SAUD&Aacute;VEL &Eacute; NATURAL</p>\r\n', 'institucional/2016/07/itena-instituto-de-terapias-e-naturologia.jpg', 1, 1);
/*!40000 ALTER TABLE `institucional` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.links
DROP TABLE IF EXISTS `links`;
CREATE TABLE IF NOT EXISTS `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `link` varchar(250) NOT NULL,
  `qm_cadastr` int(11) NOT NULL,
  `data_cadastr` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qm_alterou` int(11) DEFAULT NULL,
  `data_alterou` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_links_qm_cadastr` (`qm_cadastr`),
  KEY `fk_links_qm_alterou` (`qm_alterou`),
  CONSTRAINT `fk_links_qm_alterou` FOREIGN KEY (`qm_alterou`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_links_qm_cadastr` FOREIGN KEY (`qm_cadastr`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Informações de links';

-- Copiando dados para a tabela _fonsecaeassis_2016.links: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
REPLACE INTO `links` (`id`, `titulo`, `link`, `qm_cadastr`, `data_cadastr`, `qm_alterou`, `data_alterou`) VALUES
	(2, 'OAB - Rondônia', 'http://www.oab-ro.org.br/', 1, '2016-10-19 00:41:58', 1, '2016-10-19 00:44:47');
/*!40000 ALTER TABLE `links` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.menu
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Menu';

-- Copiando dados para a tabela _fonsecaeassis_2016.menu: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
REPLACE INTO `menu` (`id_menu`, `id_menu_tipo`, `titulo`, `case`, `pagina`, `ico_menu`, `ativo`) VALUES
	(1, 1, 'Usuários', 'usuarios', '#', 'fa-users', 'true'),
	(2, 1, 'TV', 'tvs', '#', 'fa-desktop', 'false'),
	(3, 1, 'Eventos', 'eventos', '#', 'fa-photo', 'false'),
	(4, 1, 'Cursos', 'cursos', '#', 'fa-certificate', 'false'),
	(5, 1, 'Videos', 'videos', '#', 'fa-video-camera', 'false'),
	(6, 1, 'Depoimentos', 'depoimentos', '#', 'fa-comments', 'false'),
	(7, 1, 'Institucional', 'institucional', '#', 'fa-university', 'true'),
	(8, 1, 'Matrículas', 'matriculas', '#', 'fa-edit', 'false'),
	(9, 1, 'Artigos e Publicações', 'noticias', '#', 'fa-newspaper-o', 'true'),
	(10, 1, 'Banners', 'banners', '#', 'fa-bullhorn', 'true'),
	(11, 1, 'Atuação', 'atuacao', '#', 'fa-briefcase', 'true'),
	(12, 1, 'Links', 'links', '#', 'fa-link', 'true'),
	(13, 1, 'Banco de Curriculos', 'curriculos', '#', 'fa-file-pdf-o', 'true'),
	(14, 1, 'Associados', 'associados', '#', 'fa-street-view', 'true');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.menu_sub
DROP TABLE IF EXISTS `menu_sub`;
CREATE TABLE IF NOT EXISTS `menu_sub` (
  `id_menu_sub` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `case` varchar(100) NOT NULL,
  `pagina` varchar(150) NOT NULL,
  `ico_menu` varchar(50) NOT NULL DEFAULT 'fa-angle-double-right',
  PRIMARY KEY (`id_menu_sub`),
  KEY `fkmenu_sub_id_menu` (`id_menu`),
  KEY `idx_menu_sub_titulo` (`titulo`),
  CONSTRAINT `fk_menu_sub_id_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='Menu Sub';

-- Copiando dados para a tabela _fonsecaeassis_2016.menu_sub: ~24 rows (aproximadamente)
/*!40000 ALTER TABLE `menu_sub` DISABLE KEYS */;
REPLACE INTO `menu_sub` (`id_menu_sub`, `id_menu`, `titulo`, `case`, `pagina`, `ico_menu`) VALUES
	(1, 1, 'Novo Cadastro', 'usuarios', 'cadastrar', 'fa-angle-double-right'),
	(2, 1, 'Listar Cadastros', 'usuarios', 'listar', 'fa-angle-double-right'),
	(3, 2, 'Novo Cadastro', 'tvs', 'cadastrar', 'fa-angle-double-right'),
	(4, 2, 'Listar Cadastros', 'tvs', 'listar', 'fa-angle-double-right'),
	(5, 3, 'Novo Cadastro', 'eventos', 'cadastrar', 'fa-angle-double-right'),
	(6, 3, 'Listar Cadastros', 'eventos', 'listar', 'fa-angle-double-right'),
	(7, 4, 'Novo Cadastro', 'cursos', 'cadastrar', 'fa-angle-double-right'),
	(8, 4, 'Listar Cadastros', 'cursos', 'listar', 'fa-angle-double-right'),
	(9, 5, 'Novo Cadastro', 'videos', 'cadastrar', 'fa-angle-double-right'),
	(10, 5, 'Listar Cadastros', 'videos', 'listar', 'fa-angle-double-right'),
	(11, 6, 'Listar Cadastros', 'depoimentos', 'listar', 'fa-angle-double-right'),
	(12, 7, 'Editar Cadastro', 'institucional', 'editar', 'fa-angle-double-right'),
	(13, 8, 'Listar Cadastros', 'matriculas', 'listar', 'fa-angle-double-right'),
	(14, 9, 'Novo Cadastro', 'noticias', 'cadastrar', 'fa-angle-double-right'),
	(15, 9, 'Listar Cadastros', 'noticias', 'listar', 'fa-angle-double-right'),
	(16, 10, 'Novo Cadastro', 'banners', 'cadastrar', 'fa-angle-double-right'),
	(17, 10, 'Listar Cadastros', 'banners', 'listar', 'fa-angle-double-right'),
	(18, 11, 'Novo Cadastro', 'atuacao', 'cadastrar', 'fa-angle-double-right'),
	(19, 11, 'Listar Cadastros', 'atuacao', 'listar', 'fa-angle-double-right'),
	(20, 12, 'Novo Cadastro', 'links', 'cadastrar', 'fa-angle-double-right'),
	(21, 12, 'Listar Cadastros', 'links', 'listar', 'fa-angle-double-right'),
	(22, 13, 'Listar Cadastros', 'curriculos', 'listar', 'fa-angle-double-right'),
	(23, 14, 'Novo Cadastro', 'associados', 'cadastrar', 'fa-angle-double-right'),
	(24, 14, 'Listar Cadastros', 'associados', 'listar', 'fa-angle-double-right');
/*!40000 ALTER TABLE `menu_sub` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.menu_sub_nav
DROP TABLE IF EXISTS `menu_sub_nav`;
CREATE TABLE IF NOT EXISTS `menu_sub_nav` (
  `id_menu_sub_nav` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu_sub` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `case` varchar(100) NOT NULL,
  `pagina` varchar(150) NOT NULL,
  `ico_menu` varchar(50) NOT NULL DEFAULT 'fa-angle-double-right',
  PRIMARY KEY (`id_menu_sub_nav`),
  KEY `fkmenu_sub_id_menu_sub` (`id_menu_sub`),
  CONSTRAINT `fk_menu_sub_id_menu_sub` FOREIGN KEY (`id_menu_sub`) REFERENCES `menu_sub` (`id_menu_sub`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Menu Sub Nav';

-- Copiando dados para a tabela _fonsecaeassis_2016.menu_sub_nav: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `menu_sub_nav` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_sub_nav` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.menu_tipo
DROP TABLE IF EXISTS `menu_tipo`;
CREATE TABLE IF NOT EXISTS `menu_tipo` (
  `id_menu_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  PRIMARY KEY (`id_menu_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Menu Tipo';

-- Copiando dados para a tabela _fonsecaeassis_2016.menu_tipo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `menu_tipo` DISABLE KEYS */;
REPLACE INTO `menu_tipo` (`id_menu_tipo`, `tipo`) VALUES
	(1, 'painel_adm_sidebar'),
	(2, 'painel_est_sidebar');
/*!40000 ALTER TABLE `menu_tipo` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.newsletter_usuario
DROP TABLE IF EXISTS `newsletter_usuario`;
CREATE TABLE IF NOT EXISTS `newsletter_usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `e-mail` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Usuários cadastrados na newsletter';

-- Copiando dados para a tabela _fonsecaeassis_2016.newsletter_usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `newsletter_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_usuario` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.noticias
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

-- Copiando dados para a tabela _fonsecaeassis_2016.noticias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
REPLACE INTO `noticias` (`id`, `url_name`, `categoria`, `titulo`, `subtitulo`, `autor`, `colunista`, `fonte`, `destaque`, `destaque_tipo`, `noticia`, `data`, `data_fslide`, `video`, `foto`, `marca_foto`, `contador`, `coluna`, `qm_cadastr`, `qm_alterou`) VALUES
	(1, 'titulo', 'artigo', 'Titulo', 'Sub', 'João Neto', NULL, 'Uol Noticias', 'sim', NULL, '<p>teste</p>\r\n', '2016-10-19 20:56:48', '0000-00-00 00:00:00', '', 'noticias/2016/10/titulo.jpg', 0, NULL, NULL, 1, NULL),
	(3, 'oab-ro', 'artigo', 'OAB RO', 'Noticia Subtitulo', 'Creative Websites', NULL, 'OAB RO', 'nao', NULL, '<p>teste</p>\r\n', '2016-10-19 21:21:27', '0000-00-00 00:00:00', '', 'noticias/2016/10/oab-ro.jpg', 0, NULL, NULL, 1, NULL),
	(4, 'noticia-titulo', 'artigo', 'Noticia Titulo', 'Noticia Subtitulo', 'Maria Joaquina', NULL, 'Alerta Rolim', 'nao', NULL, '<p>teste</p>\r\n', '2016-10-19 21:22:04', '0000-00-00 00:00:00', '', 'noticias/2016/10/noticia-titulo.jpg', 0, 2, NULL, 1, NULL);
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.noticias_categoria
DROP TABLE IF EXISTS `noticias_categoria`;
CREATE TABLE IF NOT EXISTS `noticias_categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) NOT NULL,
  `cat_url` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `cat_url` (`cat_url`),
  KEY `categoria` (`categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Categorias das Noticias';

-- Copiando dados para a tabela _fonsecaeassis_2016.noticias_categoria: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `noticias_categoria` DISABLE KEYS */;
REPLACE INTO `noticias_categoria` (`id_categoria`, `categoria`, `cat_url`) VALUES
	(1, 'Artigo', 'artigo'),
	(2, 'Publicação', 'publicacao'),
	(3, 'Notícia', 'noticia');
/*!40000 ALTER TABLE `noticias_categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.tv
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

-- Copiando dados para a tabela _fonsecaeassis_2016.tv: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tv` DISABLE KEYS */;
/*!40000 ALTER TABLE `tv` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.usuarios
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

-- Copiando dados para a tabela _fonsecaeassis_2016.usuarios: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
REPLACE INTO `usuarios` (`id`, `url_name`, `nome`, `email`, `data_nasc`, `sexo`, `login`, `senha`, `foto`, `ativo`, `nivel`, `cont_acesso`, `ip`, `ultimo_acesso`, `qm_cadastr`, `dt_cadastr`, `qm_alterou`, `dt_alterou`) VALUES
	(1, 'cw-digital-brasil', 'CW Digital - Brasil', 'admin@cwdigital.com.br', '2016-08-01', 1, 'creative', '19d910ef608e4947aa0c6dcee352a3e8', 'usuarios/2016/10/creative.jpg', 's', 1, 60, '::1', '2016-10-18 21:36:39', 1, NULL, 1, '2016-10-18 21:36:34'),
	(3, 'anderson-batista-designer', 'Anderson Batista - Designer', 'pessoal.andersonbatista@gmail.com', '1995-07-22', 1, 'anderson', 'a30b59adfa3943b419658009c97c4fcb', 'usuarios/2016/07/anderson.png', 's', 1, 20, '::1', '2016-10-07 20:13:13', 1, '2016-07-20 14:45:24', NULL, NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.videos
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

-- Copiando dados para a tabela _fonsecaeassis_2016.videos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.videos_categoria
DROP TABLE IF EXISTS `videos_categoria`;
CREATE TABLE IF NOT EXISTS `videos_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_name` varchar(50) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_name` (`url_name`),
  KEY `categoria` (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Categorias de Videos';

-- Copiando dados para a tabela _fonsecaeassis_2016.videos_categoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `videos_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos_categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.ws_siteviews
DROP TABLE IF EXISTS `ws_siteviews`;
CREATE TABLE IF NOT EXISTS `ws_siteviews` (
  `siteviews_id` int(11) NOT NULL AUTO_INCREMENT,
  `siteviews_date` date NOT NULL,
  `siteviews_users` decimal(10,0) NOT NULL,
  `siteviews_views` decimal(10,0) NOT NULL,
  `siteviews_pages` decimal(10,0) NOT NULL,
  PRIMARY KEY (`siteviews_id`),
  KEY `idx_1` (`siteviews_date`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela _fonsecaeassis_2016.ws_siteviews: ~17 rows (aproximadamente)
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
	(12, '2016-08-05', 1, 1, 1),
	(13, '2016-10-04', 2, 2, 1624),
	(14, '2016-10-07', 1, 1, 73),
	(15, '2016-10-11', 1, 1, 9),
	(16, '2016-10-18', 1, 1, 205),
	(17, '2016-10-19', 1, 1, 154);
/*!40000 ALTER TABLE `ws_siteviews` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.ws_siteviews_agent
DROP TABLE IF EXISTS `ws_siteviews_agent`;
CREATE TABLE IF NOT EXISTS `ws_siteviews_agent` (
  `agent_id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `agent_views` decimal(10,0) NOT NULL,
  PRIMARY KEY (`agent_id`),
  KEY `idx_1` (`agent_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela _fonsecaeassis_2016.ws_siteviews_agent: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `ws_siteviews_agent` DISABLE KEYS */;
REPLACE INTO `ws_siteviews_agent` (`agent_id`, `agent_name`, `agent_views`) VALUES
	(1, 'Chrome', 19);
/*!40000 ALTER TABLE `ws_siteviews_agent` ENABLE KEYS */;

-- Copiando estrutura para tabela _fonsecaeassis_2016.ws_siteviews_online
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela _fonsecaeassis_2016.ws_siteviews_online: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `ws_siteviews_online` DISABLE KEYS */;
REPLACE INTO `ws_siteviews_online` (`online_id`, `online_session`, `online_startview`, `online_endview`, `online_ip`, `online_url`, `online_agent`, `agent_name`) VALUES
	(25, '1s9mt0suq60cviirq1olhdc4q6', '2016-10-19 18:47:22', '2016-10-19 23:52:37', '::1', '/servidor/fonsecaeassis/2016/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.59 Safari/537.36', 'Chrome');
/*!40000 ALTER TABLE `ws_siteviews_online` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
