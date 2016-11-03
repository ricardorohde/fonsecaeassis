-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           10.1.10-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Áreas de Atuação';

-- Copiando dados para a tabela _fonsecaeassis_2016.atuacao: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `atuacao` DISABLE KEYS */;
REPLACE INTO `atuacao` (`id`, `id_icon`, `url_name`, `area`, `qm_cadastr`, `data_cadastr`, `qm_alterou`, `data_alterou`) VALUES
	(1, 5, 'direito-penal-e-penal-economico', 'Direito Penal e Penal Econômico', 1, '2016-10-19 19:53:22', 3, '2016-11-01 23:19:29'),
	(4, 5, 'direito-da-familia', 'Direito da Familia', 1, '2016-10-19 20:38:26', 3, '2016-11-01 23:19:32'),
	(5, 5, 'teste-1', 'Teste 1', 3, '2016-11-01 00:56:22', 3, '2016-11-01 23:24:39'),
	(7, 5, 'teste-2', 'Teste 2', 3, '2016-11-01 00:57:25', 3, '2016-11-01 23:19:27');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Icones das Áreas de Atuação';

-- Copiando dados para a tabela _fonsecaeassis_2016.atuacao_icons: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `atuacao_icons` DISABLE KEYS */;
REPLACE INTO `atuacao_icons` (`id`, `nome`, `foto`, `qm_cadastr`, `data_cadastr`, `qm_alterou`, `data_alterou`) VALUES
	(1, 'Advocacia Civil', 'atuacao_icons/2016/10/advocacia-civil.png', 1, '2016-10-19 19:24:03', 1, '2016-10-19 19:36:16'),
	(3, 'Direito Penal e Penal Econômico', 'atuacao_icons/2016/10/direito-penal-e-penal-economico.png', 1, '2016-10-19 19:40:32', NULL, NULL),
	(4, 'Direto da Familia', 'atuacao_icons/2016/10/direto-da-familia.png', 1, '2016-10-19 20:38:46', NULL, NULL),
	(5, 'Padrão', 'atuacao_icons/2016/11/padrao.png', 3, '2016-11-01 23:19:03', 3, '2016-11-01 23:24:16');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Armazena as fotos selecionadas na opção mais fotos, dependendo do tipo.';

-- Copiando dados para a tabela _fonsecaeassis_2016.banco_fotos: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `banco_fotos` DISABLE KEYS */;
REPLACE INTO `banco_fotos` (`id`, `id_tipo`, `tipo`, `foto`, `data`, `ordem`) VALUES
	(4, 1, 'N', 'banco_fotos/2016/10/tipo-n-id-1-22143.jpg', '2016-10-19 21:14:07', NULL),
	(5, 1, 'N', 'banco_fotos/2016/10/tipo-n-id-1-20077.jpg', '2016-10-19 21:14:07', NULL),
	(6, 1, 'N', 'banco_fotos/2016/10/tipo-n-id-1-13900.jpg', '2016-10-19 21:14:08', NULL),
	(7, 1, 'N', 'banco_fotos/2016/10/tipo-n-id-1-19106.jpg', '2016-10-19 21:14:08', NULL),
	(8, 1, 'N', 'banco_fotos/2016/10/tipo-n-id-1-30357.jpg', '2016-10-19 21:14:08', NULL),
	(9, 1, 'N', 'banco_fotos/2016/10/tipo-n-id-1-21299.jpg', '2016-10-19 21:14:08', NULL),
	(10, 8, 'N', 'banco_fotos/2016/11/tipo-n-id-8-28108.jpg', '2016-11-03 01:26:52', NULL),
	(11, 8, 'N', 'banco_fotos/2016/11/tipo-n-id-8-5998.jpg', '2016-11-03 01:26:54', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='Armazena informações sobre banners de publicidade';

-- Copiando dados para a tabela _fonsecaeassis_2016.banners: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
REPLACE INTO `banners` (`id`, `titulo`, `banner`, `tipo`, `link`, `data_inicial`, `data_final`, `data_atual`, `qm_cadastr`, `qm_alterou`) VALUES
	(9, 'Banner de Apresentação', 'banners/2016/10/banner-de-apresentacao.jpg', 1, 'http://www.cwdigital.com.br/', '2016-10-24', '2016-12-31', '2016-10-24 22:11:27', 3, 3),
	(12, '01', 'banners/2016/11/01.png', 1, '', '2016-11-01', '2016-12-31', '2016-11-01 21:59:19', 3, 3);
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

-- Copiando dados para a tabela _fonsecaeassis_2016.banners_tipo: ~0 rows (aproximadamente)
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

-- Copiando dados para a tabela _fonsecaeassis_2016.contato: ~0 rows (aproximadamente)
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

-- Copiando dados para a tabela _fonsecaeassis_2016.cursos: ~0 rows (aproximadamente)
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

-- Copiando dados para a tabela _fonsecaeassis_2016.cursos_matriculas: ~0 rows (aproximadamente)
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

-- Copiando dados para a tabela _fonsecaeassis_2016.eventos: ~0 rows (aproximadamente)
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

-- Copiando dados para a tabela _fonsecaeassis_2016.institucional: ~0 rows (aproximadamente)
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Informações de links';

-- Copiando dados para a tabela _fonsecaeassis_2016.links: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
REPLACE INTO `links` (`id`, `titulo`, `link`, `qm_cadastr`, `data_cadastr`, `qm_alterou`, `data_alterou`) VALUES
	(2, 'OAB - Rondônia', 'http://www.oab-ro.org.br/', 1, '2016-10-19 00:41:58', 1, '2016-10-19 00:44:47'),
	(3, 'Link 2', '#', 3, '2016-11-01 23:05:03', NULL, NULL),
	(4, 'Link 3', '#', 3, '2016-11-01 23:05:12', NULL, NULL),
	(5, 'Link 4', '#', 3, '2016-11-01 23:05:21', NULL, NULL),
	(6, 'Link 5', '#', 3, '2016-11-01 23:05:32', NULL, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Armazena informações de cadastros de noticias';

-- Copiando dados para a tabela _fonsecaeassis_2016.noticias: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
REPLACE INTO `noticias` (`id`, `url_name`, `categoria`, `titulo`, `subtitulo`, `autor`, `colunista`, `fonte`, `destaque`, `destaque_tipo`, `noticia`, `data`, `data_fslide`, `video`, `foto`, `marca_foto`, `contador`, `coluna`, `qm_cadastr`, `qm_alterou`) VALUES
	(1, 'semana-da-esa-programacao-conta-com-duas-palestras-no-interior', 'artigo', 'Semana da ESA: programação conta com duas palestras no interior', '', 'Ascom OAB/RO', NULL, 'Ascom OAB/RO', 'sim', NULL, '<p>A programa&ccedil;&atilde;o desta semana da Escola Superior da Advocacia de Rond&ocirc;nia (ESA/RO) contar&aacute; com duas palestras. Em Cacoal, os advogados poder&atilde;o assistir &agrave; palestra &ldquo;A Atua&ccedil;&atilde;o do Advogado, Advogada no Processo Penal&rdquo;, na quinta-feira (3). J&aacute; na Subse&ccedil;&atilde;o de Guajar&aacute;-Mirim, o tema a ser exposto no s&aacute;bado (5) &eacute; &ldquo;Inova&ccedil;&otilde;es no C&oacute;digo de &Eacute;tica e Disciplina&rdquo;.</p>\r\n\r\n<p>As palestras ser&atilde;o ministradas, respectivamente, pelo advogado criminalista Roberto Parentoni e pelo presidente do Tribunal de &Eacute;tica e Disciplina da OAB/RO, Jorge Junior Miranda de Ara&uacute;jo.</p>\r\n\r\n<p>O diretor-geral da ESA/RO, Eduardo Ab&iacute;lio Diniz, afirma que o calend&aacute;rio segue repleto de eventos de qualidade. &ldquo;Vamos continuar promovendo cursos e palestras com profissionais renomados tanto em Porto Velho, como nos munic&iacute;pios do interior do estado&rdquo;, ressalta.</p>\r\n\r\n<p>Veja a programa&ccedil;&atilde;o completa e clique para se inscrever:<br />\r\n3/11 &ndash;&nbsp;<a href="http://esa.oab-ro.org.br/a-atuacao-do-advogado-advogada-no-processo-penal" target="_blank">&ldquo;A Atua&ccedil;&atilde;o do Advogado, Advogada no Processo Penal&rdquo;</a>&nbsp;(Cacoal)<br />\r\n5/11 &ndash;&nbsp;<a href="http://esa.oab-ro.org.br/inovacoes-no-codigo-de-etica-e-disciplina-guajara-mirim-05112016" target="_blank">&ldquo;Inova&ccedil;&otilde;es no C&oacute;digo de &Eacute;tica e Disciplina&rdquo;</a>&nbsp;(Guajar&aacute;-Mirim)</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2016-10-19 18:56:22', NULL, '', 'noticias/2016/10/titulo.jpg', 0, 14, NULL, 1, 3),
	(3, 'ena-cursos-de-especializacao-a-distancia-tem-matriculas-abertas-ate-dia-6-de-novembro', 'artigo', 'ENA: Cursos de especialização a distância têm matrículas abertas até dia 6 de novembro', 'Excelente Opurtunidade', 'OAB/RO', NULL, 'Escola Nacional de Advocacia', 'nao', NULL, '<p>As aulas dos cursos que atingirem o n&uacute;mero m&iacute;nimo para funcionamento come&ccedil;ar&atilde;o no dia 16 de novembro</p>\r\n\r\n<p>Termina no pr&oacute;ximo dia 6 de novembro o prazo para realiza&ccedil;&atilde;o de matr&iacute;culas nos cursos de especializa&ccedil;&atilde;o em Direito na modalidade a dist&acirc;ncia. S&atilde;o oferecidos cursos de especializa&ccedil;&atilde;o nas &aacute;reas de Advocacia Criminal; Advocacia Imobili&aacute;ria, Urban&iacute;stica, Registral e Notarial; Advocacia Penal Empresarial; Advocacia Trabalhista e Previdenci&aacute;ria; Advocacia Tribut&aacute;ria; Direito das Fam&iacute;lias; Direito Eleitoral; e Direito Processual Civil.</p>\r\n\r\n<p>As aulas dos cursos que atingirem o n&uacute;mero m&iacute;nimo para funcionamento come&ccedil;ar&atilde;o no dia 16 de novembro. As inscri&ccedil;&otilde;es s&atilde;o feitas pelo site da Unisc,&nbsp;<a href="http://www.unisc.br/direito_ead." target="_blank">clique aqui.&nbsp;</a></p>\r\n\r\n<p>Os cursos d&atilde;o direito a acesso completo &agrave; Biblioteca Virtual da Proview (Com mais de 600 obras atualizadas). Jovens advogados, aqueles com at&eacute; 5 anos de registro na OAB, ter&atilde;o desconto de 15% no valor do curso.</p>\r\n\r\n<p><a href="http://www.oab-ro.org.br/core/wp-content/uploads/2016/10/pos-graduacao-ead-em-direito-novos-cursos.jpg"><img alt="pos-graduacao-ead-em-direito-novos-cursos" src="http://www.oab-ro.org.br/core/wp-content/uploads/2016/10/pos-graduacao-ead-em-direito-novos-cursos-430x1024.jpg" style="float:left; height:auto; margin-bottom:10px; margin-right:13px; margin-top:10px; width:auto" /></a></p>\r\n', '2016-10-19 00:58:31', NULL, '', 'noticias/2016/10/oab-ro.jpg', 0, 23, NULL, 1, 3),
	(4, 'oab-ro-credencia-31-novos-advogados-durante-solenidade-em-porto-velho', 'artigo', 'OAB/RO credencia 31 novos advogados durante solenidade em Porto Velho', '', 'Maria Joaquina', NULL, 'Ascom OAB/RO', 'nao', NULL, '<p>Na noite desta quinta-feira (27), a Seccional Rond&ocirc;nia da Ordem dos Advogados do Brasil (OAB/RO) realizou a entrega solene de credenciais a 31 novos advogados e 5 estagi&aacute;rios. Os profissionais fizeram o juramento, em seguida, foram parabenizados pela dire&ccedil;&atilde;o da entidade e receberam a credencial da OAB/RO, a carteira da Caixa de Assist&ecirc;ncia dos Advogados de Rond&ocirc;nia (Caaro) e o Manual do Jovem Advogado.</p>\r\n\r\n<p>O presidente da OAB/RO, Andrey Cavalcante saudou a todos os novos inscritos na OAB/RO desejando sucesso na carreira e destacando a import&acirc;ncia do advogado para a manuten&ccedil;&atilde;o da justi&ccedil;a e a responsabilidade de agir com respeito aos princ&iacute;pios &eacute;ticos. &ldquo;Parab&eacute;ns pela conquista que muito dignifica a Ordem dos Advogados do Brasil. Tenho certeza que a nova fase ser&aacute; repleta de muitas lutas, mas tamb&eacute;m de muitas alegrias. O longo e duro caminho percorrido desde a forma&ccedil;&atilde;o superior at&eacute; o sucesso por meio do ingresso definitivo na OAB se renova agora. A Ordem &eacute; a casa da cidadania brasileira. Ela ser&aacute;, a partir de agora, e de modo muito mais particular, a casa de casa um dos profissionais credenciados. Sejam bem-vindos!&rdquo;.</p>\r\n\r\n<p>&ldquo;Nesse in&iacute;cio de carreia &eacute; importante que os senhores se preparem para fazer o melhor, que se destaquem, mas antes disso, fa&ccedil;am uma autoavalia&ccedil;&atilde;o de seus objetivos. Advogar n&atilde;o &eacute; f&aacute;cil, mas chegar at&eacute; aqui, com certeza tamb&eacute;m n&atilde;o foi f&aacute;cil. Participem da OAB, conhe&ccedil;am seus direitos de prerrogativas. Todo o sistema OAB est&aacute; de portas abertas para receb&ecirc;-los e apoi&aacute;-los neste come&ccedil;o. Aqui &eacute; a casa de voc&ecirc;s&rdquo;, destacou o vice-presidente da OAB Jovem, Everton Melo da Rosa.</p>\r\n\r\n<p>O vice-presidente da Caaro, Max Rolim, falou sobre os conv&ecirc;nios e benef&iacute;cios que a Caixa de Assist&ecirc;ncia vem buscando constantemente para os advogados. &ldquo;Temos oferecido v&aacute;rios servi&ccedil;os e realizado v&aacute;rias campanhas de sa&uacute;de, prestado aux&iacute;lio maternidade para as advogadas. Com este cart&atilde;o que os senhores receberam hoje, &eacute; poss&iacute;vel acessar os conv&ecirc;nios que temos em todo o estado, com desconto nas mais diversas &aacute;reas como vestu&aacute;rio, sa&uacute;de, est&eacute;tica, restaurantes, cursos. Estamos aqui para dar todo o apoio a voc&ecirc;s. Sejam bem-vindos e tenham muito sucesso&rdquo;.</p>\r\n\r\n<p><a href="http://www.oab-ro.org.br/core/wp-content/uploads/2016/10/entrega-carteiras-27.10-111.jpg"><img alt="A nova advogada Veraline Rodrigues Diocleciano foi a oradora dos novos profissionais " src="http://www.oab-ro.org.br/core/wp-content/uploads/2016/10/entrega-carteiras-27.10-111-300x200.jpg" style="float:left; height:auto; margin-bottom:0px; margin-right:13px; margin-top:0px; width:auto" /></a></p>\r\n\r\n<p>A nova advogada Veraline Rodrigues Diocleciano foi a oradora dos novos profissionais</p>\r\n\r\n<p>A nova advogada Veraline Rodrigues Diocleciano falou em nome dos novos profissionais e comentou sobre a emo&ccedil;&atilde;o de poder ingressar na carreira. &ldquo;A advocacia &eacute; desafiadora e nosso mercado &eacute; bastante concorrente, ent&atilde;o eu quero agradecer a Deus, aos familiares e amigos, que nos apoiaram tanto e deram muito incentivo para que pud&eacute;ssemos estar aqui hoje, com tanta alegria, com a vit&oacute;ria de poder fazer parte da OAB Rond&ocirc;nia&rdquo;.</p>\r\n\r\n<p>A sess&atilde;o solene contou ainda com a presen&ccedil;a de v&aacute;rios advogados, conselheiros seccionais, presidentes e membros de Comiss&otilde;es, representantes de Subse&ccedil;&otilde;es, do desembargador Paulo Mori, al&eacute;m de familiares e amigos dos novos advogados e estagi&aacute;rios.</p>\r\n\r\n<p><strong>Sess&atilde;o de Acolhimento</strong><br />\r\nAntes de receberem a credencial, os novos profissionais da advocacia participaram da programa&ccedil;&atilde;o da Sess&atilde;o de Acolhimento, promovida pela Caja, que teve in&iacute;cio na manh&atilde; de quinta (27), &agrave;s 8h, com visitas aos &oacute;rg&atilde;os do Poder Judici&aacute;rio, familiarizando os novos advogados. Na parte da tarde, foram ministradas palestras e em seguida realizada a apresenta&ccedil;&atilde;o da estrutura da sede da OAB/RO e da Caaro, com sorteio de livros e coffee break.</p>\r\n', '2016-10-28 00:36:20', NULL, '', 'noticias/2016/10/noticia-titulo.jpg', 0, 9, NULL, 1, 3),
	(5, '1-modulo-do-curso-de-pos-graduacao-em-pratica-previdenciaria-do-infoc-e-realizado-na-oab-ro', 'noticia', '1º módulo do curso de pós-graduação em prática previdenciária do Infoc é realizado na OAB/RO', 'Estão abertas as inscrições para a 7ª edição do Prêmio Conciliar é Legal, promovido pelo Conselho Nacional de Justiça (CNJ)', 'Anônimo', NULL, 'OAB - Rondônia', 'sim', NULL, '<p><a href="http://www.oab-ro.org.br/noticia/iniciada-a-7a-edicao-do-premio-conciliar-e-legal/">Est&atilde;o abertas as inscri&ccedil;&otilde;es para a 7&ordf; edi&ccedil;&atilde;o do Pr&ecirc;mio Conciliar &eacute; Legal, promovido pelo Conselho Nacional de Justi&ccedil;a (CNJ) em parceria com os tribunais brasileiros. O pr&ecirc;mio tem como objetivo identificar, disseminar e estimular a realiza&ccedil;&atilde;o de a&ccedil;&otilde;es de moderniza&ccedil;&atilde;o na &aacute;rea da Justi&ccedil;a, principalmente aquelas que contribuem para pacifica&ccedil;&atilde;o de conflitos. Para participar, &eacute; preciso preencher formul&aacute;rio e encaminhar a pr&aacute;tica por meio do endere&ccedil;o eletr&ocirc;nico premioconciliar@cnj.jus.br, identificando o nome do participante e da pr&aacute;tica.</a></p>\r\n', '2016-10-24 19:58:51', NULL, '', 'noticias/2016/10/iniciada-a-7-edicao-do-premio-conciliar-e-legal.jpg', 0, 19, NULL, 3, 3),
	(6, 'tjro-publica-edicao-especial-do-diario-da-justica-com-novo-regimento-interno', 'noticia', 'TJRO publica edição especial do Diário da Justiça com novo Regimento Interno', 'O Tribunal de Justiça do Estado de Rondônia publicou nesta sexta-feira, 21, edição especial do Diário da Justiça Eletrônico com o novo texto do Regimento Interno do TJRO. O documento tem 118 páginas, disponibilizadas ao público em PDF por meio da pág', '', NULL, '', 'sim', NULL, '', '2016-10-24 22:17:23', NULL, '', 'noticias/2016/10/tjro-publica-edicao-especial-do-diario-da-justica-com-novo-regimento-interno.jpg', 0, 2, NULL, 3, 3),
	(7, 'oab-representa-sociedade-civil-em-reuniao-dos-tres-poderes-sobre-seguranca-publica', 'publicacao', 'OAB representa sociedade civil em reunião dos Três Poderes sobre segurança pública', '', 'OAB - RO', NULL, 'http://www.oab.org.br/', 'nao', NULL, '<p>sexta-feira, 28 de outubro de 2016 &agrave;s 16h04</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Bras&iacute;lia &ndash; A OAB Nacional foi a &uacute;nica entidade da sociedade civil a participar de reuni&atilde;o dos Tr&ecirc;s Poderes nesta sexta-feira (28) para tratar da quest&atilde;o da seguran&ccedil;a p&uacute;blica. O presidente da Ordem, Claudio Lamachia, apresentou tr&ecirc;s propostas sobre o tema. Participaram do encontro os chefes dos tr&ecirc;s Poderes, Michel Temer, C&aacute;rmen L&uacute;cia e Renan Calheiros, as For&ccedil;as Armadas e ministros de diversas pastas.</p>\r\n\r\n<p>Durante a reuni&atilde;o, realizada no Pal&aacute;cio do Itamaraty, Lamachia relembrou a atua&ccedil;&atilde;o hist&oacute;rica da OAB na defesa dos direitos humanos e de um sistema prisional que sirva ao seu prop&oacute;sito: punir e ressocializar. &ldquo;A OAB Nacional e as seccionais atuam, historicamente, em favor da moderniza&ccedil;&atilde;o do sistema de seguran&ccedil;a e do cumprimento da lei no sistema carcer&aacute;rio&rdquo;, afirmou.</p>\r\n\r\n<p>&ldquo;O sucesso do Sistema de Justi&ccedil;a e de seguran&ccedil;a p&uacute;blica s&oacute; &eacute; poss&iacute;vel quando as regras s&atilde;o cumpridas. Ambientes marcados por ilegalidades, superlota&ccedil;&atilde;o e viola&ccedil;&atilde;o de integridade f&iacute;sica apenas fortalecem o crime organizado e prejudicam a reinser&ccedil;&atilde;o social dos detentos, colocando toda a sociedade em risco&rdquo;, completou.</p>\r\n\r\n<p>Lamachia cobrou, mais uma vez, que o Estado retome o poder nos pres&iacute;dios, tanto federais quanto estaduais, atualmente tomado por fac&ccedil;&otilde;es criminosas. A OAB ajuizou a ADI 5.170, solicitando que o Supremo declare a responsabilidade do Estado pelos danos morais causados aos detentos quando submetidos &agrave; pris&atilde;o em condi&ccedil;&otilde;es subumanas, insalubres, degradantes ou de superlota&ccedil;&atilde;o. O processo &eacute; relatado pela ministra Rosa Weber e aguarda julgamento. Tamb&eacute;m acompanha procedimentos internacionais sobre o assunto.</p>\r\n\r\n<p>Os tr&ecirc;s pontos apresentados pela OAB s&atilde;o: estabelecer periodicidade para reuni&atilde;o dos secret&aacute;rios de seguran&ccedil;a do pa&iacute;s; estudo de medidas de desburocratiza&ccedil;&atilde;o do uso dos recursos dispon&iacute;veis para investimento em seguran&ccedil;a e no sistema carcer&aacute;rio e uso da estrutura de seguran&ccedil;a legada pela Copa e pelas Olimp&iacute;adas e efetiva&ccedil;&atilde;o da interliga&ccedil;&atilde;o das c&acirc;meras de seguran&ccedil;a com delegacias .</p>\r\n\r\n<p>De acordo com Lamachia, os cinco pontos, desenvolvidos em colabora&ccedil;&atilde;o com as 27 Seccionais da Ordem, t&ecirc;m como objetivos maior disponibiliza&ccedil;&atilde;o de recursos para a &aacute;rea de seguran&ccedil;a, melhoria do sistema prisional, com efetiva ressocializa&ccedil;&atilde;o dos presos, libera&ccedil;&atilde;o de mais agentes para atuar nas cidades e a diminui&ccedil;&atilde;o da inseguran&ccedil;a com a melhoria do policiamento ostensivo.</p>\r\n\r\n<p>Tamb&eacute;m participaram da reuni&atilde;o o presidente da C&acirc;mara, deputado Rodrigo Maia; o procurador-geral da Rep&uacute;blica, Rodrigo Janot; os ministros Alexandre de Moraes (Justi&ccedil;a), Raul Jungmann (Defesa), S&eacute;rgio Etchegoyen (Seguran&ccedil;a Institucional) e Jos&eacute; Serra (Rela&ccedil;&otilde;es Exteriores); o diretor da Pol&iacute;cia Federal, Leandro Daiello; os comandantes das For&ccedil;as Armadas, almirante Eduardo Bacellar Leal (Marinha), general Eduardo Villas B&ocirc;as (Ex&eacute;rcito) e tenente-brigadeiro Nivaldo Rossato (Aeron&aacute;utica).</p>\r\n', '2016-10-29 01:06:58', NULL, '', 'noticias/2016/10/oab-representa-sociedade-civil-em-reuniao-dos-tres-poderes-sobre-seguranca-publica.jpg', 0, 22, NULL, 3, 3),
	(8, 'oab-em-movimento', 'publicacao', 'OAB em Movimento', 'Confira as principais notícias entre 21 e 27 de outubro', 'OAB - RO', NULL, 'http://www.oab.org.br/', 'nao', NULL, '<p>sexta-feira, 28 de outubro de 2016 &agrave;s 16h00</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Bras&iacute;lia - Confira a se&ccedil;&atilde;o OAB em Movimento desta semana, que apresenta as principais not&iacute;cias da advocacia e da cidadania protagonizadas pela Ordem. Em destaque, a san&ccedil;&atilde;o da lei que mant&eacute;m a advocacia no Simples Nacional, o apoio da OAB a projetos de reforma pol&iacute;tica a garantir de seguran&ccedil;a a advogados nas depend&ecirc;ncias da Pol&iacute;cia Federal, entre outros. Confira abaixo:</p>\r\n\r\n<p><strong><a href="http://www.oab.org.br/noticia/52382/oab-celebra-sancao-de-projeto-que-mantem-advocacia-do-simples-nacional?argumentoPesquisa=movimento" target="_blank">Simples</a></strong></p>\r\n\r\n<p>Foi sancionada nesta quinta-feira (27) a lei que manteve a advocacia na Tabela IV do Supersimples. Em cerim&ocirc;nia no Pal&aacute;cio do Planalto, o presidente nacional da OAB, Claudio Lamachia, celebrou a aprova&ccedil;&atilde;o sem vetos do projeto, &ldquo;que garantir&aacute; dignidade tribut&aacute;ria a milhares de advogados de todo o pa&iacute;s&rdquo;.&nbsp;</p>\r\n\r\n<p><strong><a href="http://www.oab.org.br/noticia/52366/reforma-politica-oab-apoia-clausula-de-barreira-e-fim-das-coligacoes-partidarias?argumentoPesquisa=barreira" target="_blank">Reforma Pol&iacute;tica</a></strong></p>\r\n\r\n<p>O Conselho Pleno da OAB aprovou o apoio da entidade a dois projetos legislativos que buscam uma reforma pol&iacute;tica republicana. A Ordem encampar&aacute; as propostas previstas em PECs para o fim das coliga&ccedil;&otilde;es partid&aacute;rias em elei&ccedil;&otilde;es proporcionais e o estabelecimento de uma cl&aacute;usula de desempenho para partidos pol&iacute;ticos.</p>\r\n\r\n<p><a href="http://www.oab.org.br/noticia/52371/a-ministro-oab-requer-garantias-de-seguranca-para-advogados-nas-dependencias-da-pf" target="_blank"><strong>Seguran&ccedil;a a advogados</strong></a></p>\r\n\r\n<p>A OAB requereu ao ministro da Justi&ccedil;a, Alexandre de Moraes, provid&ecirc;ncia para assegurar a advogados prote&ccedil;&atilde;o nas depend&ecirc;ncias da Pol&iacute;cia Federal em todo o Pa&iacute;s. A entidade citou casos recentes envolvendo detidos no &acirc;mbito da Opera&ccedil;&atilde;o Lava Jato em que populares promoveram atos de hostilidade, amea&ccedil;a e intimida&ccedil;&atilde;o dirigidos a advogados, os quais, acompanhando seu constituinte, apenas exerciam regular fun&ccedil;&atilde;o profissional.</p>\r\n\r\n<p><strong><a href="http://www.oab.org.br/noticia/52368/punicoes-a-juizes-no-brasil-sao-deboche-a-sociedade-diz-presidente-da-oab" target="_blank">Ju&iacute;zes</a></strong></p>\r\n\r\n<p>Lamachia criticou duramente as penas previstas para ju&iacute;zes que cometem atos ilegais no Brasil. Em entrevista ao UOL, ele disse que afastar ju&iacute;zes pagando sal&aacute;rio ou aposentadoria &eacute; um &quot;deboche &agrave; sociedade.&quot;</p>\r\n\r\n<p><strong><a href="http://www.oab.org.br/noticia/52378/oab-publica-resolucao-que-regulamenta-contagem-de-prazos-em-dias-uteis" target="_blank">Dias &uacute;teis</a></strong></p>\r\n\r\n<p>A OAB publicou a Resolu&ccedil;&atilde;o n. 9/2016, que regulamenta a contagem dos prazos em dias &uacute;teis nos processos internos da entidade. A medida foi aprovada na reuni&atilde;o mais recente do Conselho Pleno da Ordem, em setembro, e publicada agora no &quot;Di&aacute;rio Oficial da Uni&atilde;o&quot;. O objetivo &eacute; aproximar a atua&ccedil;&atilde;o da OAB do que prev&ecirc; o Novo C&oacute;digo de Processo Civil.</p>\r\n\r\n<p><strong><a href="http://www.oab.org.br/noticia/52381/artigo-do-presidente-pos-graduacao-criminal" target="_blank">P&oacute;s-gradua&ccedil;&atilde;o criminal</a></strong></p>\r\n\r\n<p>O presidente da OAB publicou artigo no jornal &ldquo;Zero Hora&rdquo; sobre o atual quadro ca&oacute;tico do sistema prisional brasileiro. &ldquo;O sistema prisional n&atilde;o pode ser um dep&oacute;sito de pessoas. Sua administra&ccedil;&atilde;o deve ser feita de maneira eficiente, com um volume de recursos condizente com a demanda. &Eacute; preciso tamb&eacute;m que se estabele&ccedil;am pol&iacute;ticas p&uacute;blicas eficientes e permanentes de ressocializa&ccedil;&atilde;o&rdquo;, afirma no texto.</p>\r\n\r\n<p><strong><a href="http://www.oab.org.br/noticia/52379/oab-firma-acordo-de-cooperacao-para-fortalecimento-de-observatorios-sociais" target="_blank">Observat&oacute;rios Sociais</a></strong></p>\r\n\r\n<p>A OAB Nacional assinou na &uacute;ltima semana acordo de coopera&ccedil;&atilde;o com o Conselho Federal de Contabilidade e o Observat&oacute;rio Social do Brasil para trabalho conjunto em controle social. O objetivo &eacute; estimular o trabalho conjunto em prol da transpar&ecirc;ncia p&uacute;blica, preven&ccedil;&atilde;o &agrave; corrup&ccedil;&atilde;o, efici&ecirc;ncia da gest&atilde;o p&uacute;blica, &eacute;tica e integridade nas rela&ccedil;&otilde;es entre p&uacute;blico e privado.</p>\r\n\r\n<p><strong><a href="http://www.oab.org.br/noticia/52380/aplicativo-da-oab-recebe-centenas-de-denuncias-de-caixa-2-em-eleicoes-municipais" target="_blank">Caixa 2</a></strong></p>\r\n\r\n<p>A Ouvidoria-Geral da OAB consolidou na &uacute;ltima semana os dados referentes ao aplicativo desenvolvido pela Ordem para monitorar den&uacute;ncias de suspeita de Caixa 2 nas elei&ccedil;&otilde;es municipais deste ano. No total, 723 manifesta&ccedil;&otilde;es foram enviadas &agrave; ouvidoria por meio do aplicativo, 215 delas acompanhadas de m&iacute;dias anexadas. Do total, 496 manifesta&ccedil;&otilde;es (68,18%) passaram pela primeira triagem da Ouvidoria, quando s&atilde;o visualizados elementos m&iacute;nimos para o prosseguimento da den&uacute;ncia.</p>\r\n\r\n<p><strong><a href="http://www.oab.org.br/noticia/52370/stf-atende-oab-e-proibe-reducao-de-horario-do-trt-da-paraiba" target="_blank">Hor&aacute;rio de atendimento</a></strong></p>\r\n\r\n<p>Ap&oacute;s requerimento da OAB Nacional, o STF determinou que o Tribunal Regional do Trabalho da 13&ordf; Regi&atilde;o, na Para&iacute;ba, restabele&ccedil;a seu hor&aacute;rio de atendimento, alterado ap&oacute;s resolu&ccedil;&atilde;o administrativa. A decis&atilde;o foi tomada pelo ministro Luiz Fux, relator de A&ccedil;&atilde;o Direta de Inconstitucionalidade que debate o assunto.</p>\r\n\r\n<p><strong><a href="http://www.oab.org.br/noticia/52383/deu-na-midia-apos-atuacao-da-oab-trf-1-suspende-quebra-de-sigilo-de-jornalista" target="_blank">Sigilo garantido</a></strong></p>\r\n\r\n<p>A m&iacute;dia nacional repercutiu a atua&ccedil;&atilde;o da OAB contra a quebra do sigilo telef&ocirc;nico de jornalista, uma viola&ccedil;&atilde;o da prerrogativa profissional da imprensa de n&atilde;o revelar suas fontes. Nesta quarta-feira (26), o TRF-1 concedeu habeas corpus ao rep&oacute;rter Murilo Ramos, da revista &ldquo;&Eacute;poca&rdquo;, para cassar a decis&atilde;o de primeiro grau que autorizou a quebra do seu sigilo.</p>\r\n\r\n<p><strong><a href="http://www.oab.org.br/noticia/52374/lamachia-inaugura-sala-dos-advogados-em-forum-de-joao-pessoa" target="_blank">Caravana 1</a></strong></p>\r\n\r\n<p>O presidente nacional da OAB participou nesta semana da Caravana das Prerrogativas na Para&iacute;ba. Na ter&ccedil;a-feira, em Jo&atilde;o Pessoa, inaugurou a Sala dos Advogados no F&oacute;rum Trabalhista Maximiano Figueiredo. &quot;Os advogados s&atilde;o agentes da promo&ccedil;&atilde;o da Justi&ccedil;a, as salas de advogados materializam a indispensabilidade da advocacia na administra&ccedil;&atilde;o da Justi&ccedil;a. N&atilde;o se pode pensar em Justi&ccedil;a sem uma advocacia forte, atuante e independente&quot;, declarou.</p>\r\n\r\n<p><strong><a href="http://www.oab.org.br/noticia/52376/caravana-das-prerrogativas-realiza-audiencia-publica-na-paraiba" target="_blank">Caravana 2</a></strong></p>\r\n\r\n<p>A Caravana Nacional das Prerrogativas esteve em Guarabira, cidade do interior paraibano, para ouvir a advocacia da regi&atilde;o em uma audi&ecirc;ncia p&uacute;blica. Na ocasi&atilde;o, o presidente nacional da OAB, juntamente com os demais participantes, esteve reunido com a magistratura local, onde exp&ocirc;s os anseios da advocacia. &ldquo;A Caravana das Prerrogativas &eacute; important&iacute;ssima, pois demonstra o comprometimento que a OAB e o Conselho Federal t&ecirc;m em rela&ccedil;&atilde;o a esta causa. O advogado &eacute; a voz de toda a sociedade e de todo cidad&atilde;o em ju&iacute;zo&rdquo;, afirmou Lamachia.</p>\r\n\r\n<p><strong><a href="http://www.oab.org.br/noticia/52375/caravana-oab-pb-lanca-aplicativo-e-manual-das-prerrogativas-do-advogado" target="_blank">Caravana 3</a></strong></p>\r\n\r\n<p>A Caravana Nacional de Prerrogativas cumpriu mais uma etapa com o lan&ccedil;amento pela comiss&atilde;o de Defesa das Prerrogativas da Ordem dos Advogados do Brasil, Seccional Para&iacute;ba (OAB-PB), do aplicativo (Android) e o Manual das Prerrogativas da OAB-PB.&nbsp;</p>\r\n\r\n<p><strong><a href="http://www.oab.org.br/noticia/52364/lamachia-destaca-protagonismo-da-oab-e-advocacia-em-defesa-da-sociedade" target="_blank">Defesa da sociedade</a></strong></p>\r\n\r\n<p>O presidente nacional da OAB, Claudio Lamachia, reafirmou, durante a abertura do Col&eacute;gio de Presidentes de Subse&ccedil;&otilde;es, ocorrido em Porto Alegre (RS), que a Ordem atuou ativamente em diferentes &aacute;reas, englobando temas espec&iacute;ficos da advocacia e da sociedade.&nbsp;</p>\r\n\r\n<p><strong><a href="http://www.oab.org.br/noticia/52369/nota-de-esclarecimento-a-sociedade" target="_blank">Nota &agrave; sociedade</a></strong></p>\r\n\r\n<p>O Conselho Federal da OAB e a Seccional de S&atilde;o Paulo publicaram nota conjunta &agrave; sociedade sobre o ingresso no CNJ de Reclama&ccedil;&atilde;o Disciplinar contra magistrados trabalhistas da 2&ordf; Regi&atilde;o, que despacharam em Reclama&ccedil;&otilde;es Trabalhistas promovendo adiamento de audi&ecirc;ncias para 2017, sob a justificativa de ades&atilde;o a um ato definido pela sua associa&ccedil;&atilde;o de classe, como contra a PEC 241/2016 (controle de gastos p&uacute;blicos), PEC 62/2015 (desvincula&ccedil;&atilde;o de subs&iacute;dios da magistratura dos subs&iacute;dios dos ministros do STF) e PL 280/2016 (abuso de autoridade).</p>\r\n\r\n<p><strong><a href="http://www.oab.org.br/noticia/52365/ena-divulga-calendario-de-cursos-telepresenciais-de-novembro" target="_blank">Cursos da ENA</a></strong></p>\r\n\r\n<p>A Escola Nacional de Advocacia divulgou o calend&aacute;rio de cursos telepresenciais para o m&ecirc;s de novembro. As aulas s&atilde;o oferecidas pela AASP (Associa&ccedil;&atilde;o dos Advogados de S&atilde;o Paulo) em parceria com a ENA e est&atilde;o dispon&iacute;veis em diversas cidades de todo o pa&iacute;s.&nbsp;</p>\r\n\r\n<p><strong><a href="http://www.oab.org.br/noticia/52377/xx-exame-de-ordem-confira-o-resultado-final-da-2-fase" target="_blank">Exame de Ordem</a></strong></p>\r\n\r\n<p>Foi divulgado o resultado final do XX Exame de Ordem Unificado, ap&oacute;s a an&aacute;lise e a considera&ccedil;&atilde;o dos recursos interpostos.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2016-10-29 01:26:14', NULL, 'www.youtube.com.br', 'noticias/2016/10/oab-em-movimento-confira-as-principais-noticias-entre-21-e-27-de-outubro.jpg', 0, 27, NULL, 3, 3),
	(9, 'oab-apoia-1-seminario-da-campanha-de-divulgacao-do-esocial-e-efd-reinf-em-rondonia', 'artigo', 'OAB apoia 1º Seminário da Campanha de Divulgação do eSocial e EFD Reinf em Rondônia', '', 'Link externo -  OAB/RO', NULL, 'Ascom OAB/RO', 'nao', NULL, '<p>A Ordem dos Advogados do Brasil &ndash; Seccional Rond&ocirc;nia (OAB/RO) apoia a realiza&ccedil;&atilde;o do &ldquo;1&ordm; Semin&aacute;rio da Campanha de Divulga&ccedil;&atilde;o do eSocial e EFD Reinf em Rond&ocirc;nia&rdquo;, na pr&oacute;xima sexta-feira (4), de 8h &agrave;s 12h, no Teatro Banzeiros, em Porto Velho. O evento &eacute; promovido pelo Servi&ccedil;o Nacional de Aprendizagem Rural em Rond&ocirc;nia (Senar/RO) com o objetivo de fomentar a forma&ccedil;&atilde;o profissional no meio rural.</p>\r\n\r\n<p>O eSocial &eacute; o instrumento de unifica&ccedil;&atilde;o da presta&ccedil;&atilde;o das informa&ccedil;&otilde;es referentes &agrave; escritura&ccedil;&atilde;o das obriga&ccedil;&otilde;es fiscais, previdenci&aacute;rias e trabalhistas e tem por finalidade padronizar sua transmiss&atilde;o, valida&ccedil;&atilde;o, armazenamento e distribui&ccedil;&atilde;o, constituindo um ambiente nacional.</p>\r\n\r\n<p>De acordo com o gerente de arrecada&ccedil;&atilde;o do Senar/RO, Paulo S&eacute;rgio de Avellar, com o advento do eSocial, na pr&aacute;tica e de forma resumida, podemos dizer que o eSocial ser&aacute; como uma folha de pagamento digital com as informa&ccedil;&otilde;es relevantes acerca do contrato de trabalho, com um maior controle sobre as informa&ccedil;&otilde;es referentes &agrave; sa&uacute;de e seguran&ccedil;a do trabalhador.</p>\r\n\r\n<p>&ldquo;Com isso, espera-se garantir aos trabalhadores o correto cumprimento das leis trabalhistas e previdenci&aacute;rias&rdquo;, afirma Paula Abidiane da Silva, assistente t&eacute;cnica em arrecada&ccedil;&atilde;o do Senar/RO.</p>\r\n\r\n<p>O evento acontece na pr&oacute;xima sexta-feira (4), de 8h &agrave;s 12h, no Teatro Banzeiros localizado na Rua Jos&eacute; do Patroc&iacute;nio, 512, Centro, em Porto Velho. As inscri&ccedil;&otilde;es s&atilde;o gratuitas. Mais informa&ccedil;&otilde;es pelo telefone (69) 3224-1399 e pelo site&nbsp;<a href="http://www.senar-ro.org.br/" target="_blank">www.senar-ro.org.br</a></p>\r\n\r\n<p>&nbsp;</p>\r\n', '2016-10-31 18:55:25', NULL, '', NULL, 0, 56, NULL, 3, NULL),
	(11, '54we', 'artigo', '54we', '', '', NULL, '', 'nao', NULL, '<p>rwerwrew</p>\r\n', '2016-10-31 23:44:47', NULL, '', NULL, 0, 11, NULL, 3, NULL);
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
	(3, 'anderson-batista-designer', 'Anderson Batista - Designer', 'pessoal.andersonbatista@gmail.com', '1995-07-22', 1, 'anderson', 'a30b59adfa3943b419658009c97c4fcb', 'usuarios/2016/07/anderson.png', 's', 1, 29, '::1', '2016-10-26 22:52:18', 1, '2016-07-20 14:45:24', NULL, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela _fonsecaeassis_2016.ws_siteviews: ~27 rows (aproximadamente)
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
	(17, '2016-10-19', 1, 1, 154),
	(18, '2016-10-24', 1, 1, 85),
	(19, '2016-10-25', 6, 6, 429),
	(20, '2016-10-26', 5, 7, 342),
	(21, '2016-10-28', 6, 6, 232),
	(22, '2016-10-29', 4, 4, 185),
	(23, '2016-10-30', 1, 1, 176),
	(24, '2016-10-31', 3, 3, 356),
	(25, '2016-11-01', 3, 3, 472),
	(26, '2016-11-02', 2, 4, 358),
	(27, '2016-11-03', 3, 3, 301);
/*!40000 ALTER TABLE `ws_siteviews` ENABLE KEYS */;


-- Copiando estrutura para tabela _fonsecaeassis_2016.ws_siteviews_agent
DROP TABLE IF EXISTS `ws_siteviews_agent`;
CREATE TABLE IF NOT EXISTS `ws_siteviews_agent` (
  `agent_id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `agent_views` decimal(10,0) NOT NULL,
  PRIMARY KEY (`agent_id`),
  KEY `idx_1` (`agent_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela _fonsecaeassis_2016.ws_siteviews_agent: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `ws_siteviews_agent` DISABLE KEYS */;
REPLACE INTO `ws_siteviews_agent` (`agent_id`, `agent_name`, `agent_views`) VALUES
	(1, 'Chrome', 54),
	(2, 'Firefox', 3);
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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela _fonsecaeassis_2016.ws_siteviews_online: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `ws_siteviews_online` DISABLE KEYS */;
REPLACE INTO `ws_siteviews_online` (`online_id`, `online_session`, `online_startview`, `online_endview`, `online_ip`, `online_url`, `online_agent`, `agent_name`) VALUES
	(75, 't1hap56nvdb8qt34bjrirp17i7', '2016-11-03 00:31:18', '2016-11-03 02:03:45', '::1', '/servidor/fonsecaeassis/2016/noticia/oab-representa-sociedade-civil-em-reuniao-dos-tres-poderes-sobre-seguranca-publica', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36', 'Chrome'),
	(78, 'o112q7sgabq0f15b4r7277j0c7', '2016-11-03 01:29:06', '2016-11-03 02:11:31', '::1', '/servidor/fonsecaeassis/2016/artigos', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36', 'Chrome');
/*!40000 ALTER TABLE `ws_siteviews_online` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
