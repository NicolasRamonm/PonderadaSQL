-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'organizacao'
-- 
-- ---

DROP TABLE IF EXISTS `organizacao`;
		
CREATE TABLE `organizacao` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `descricao` VARCHAR NULL DEFAULT NULL,
  `horas_de_trabalho` INTEGER NULL DEFAULT NULL,
  `avaliacao` INTEGER NULL DEFAULT NULL,
  `posts` INTEGER NULL DEFAULT NULL,
  `id_voluntariado` INTEGER NULL DEFAULT NULL,
  `id_acoes` INTEGER NULL DEFAULT NULL,
  `permissoes` INTEGER NULL DEFAULT NULL,
  `senha` VARCHAR NULL DEFAULT NULL,
  `email` VARCHAR NULL DEFAULT NULL,
  `cnpj` INTEGER NULL DEFAULT NULL,
  `id_foto_perfil` INTEGER NULL DEFAULT NULL,
  `nome` INTEGER NULL DEFAULT NULL,
  `tipo` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'postagem'
-- 
-- ---

DROP TABLE IF EXISTS `postagem`;
		
CREATE TABLE `postagem` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `data` INTEGER NULL DEFAULT NULL,
  `hora` INTEGER NULL DEFAULT NULL,
  `id_foto_perfil` INTEGER NULL DEFAULT NULL,
  `descricao` INTEGER NULL DEFAULT NULL,
  `comentario` INTEGER NULL DEFAULT NULL,
  `nome` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `nome`)
);

-- ---
-- Table 'comentario'
-- 
-- ---

DROP TABLE IF EXISTS `comentario`;
		
CREATE TABLE `comentario` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `conteudo` VARCHAR NULL DEFAULT NULL,
  `id_foto_perfil` INTEGER NULL DEFAULT NULL,
  `hora` INTEGER NULL DEFAULT NULL,
  `nome` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `nome`, `id_foto_perfil`)
);

-- ---
-- Table 'voluntariado'
-- 
-- ---

DROP TABLE IF EXISTS `voluntariado`;
		
CREATE TABLE `voluntariado` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_usuario` INTEGER NULL DEFAULT NULL,
  `id_acao` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'usuario'
-- 
-- ---

DROP TABLE IF EXISTS `usuario`;
		
CREATE TABLE `usuario` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `senha` INTEGER NULL DEFAULT NULL,
  `email` INTEGER NULL DEFAULT NULL,
  `cpf` INTEGER NULL DEFAULT NULL,
  `id_foto_perfil` INTEGER NULL DEFAULT NULL,
  `permissoes` INTEGER NULL DEFAULT NULL,
  `horas_de_trabalho` INTEGER NULL DEFAULT NULL,
  `descricao` INTEGER NULL DEFAULT NULL,
  `posts` INTEGER NULL DEFAULT NULL,
  `tags` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'tipo'
-- 
-- ---

DROP TABLE IF EXISTS `tipo`;
		
CREATE TABLE `tipo` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'acoes'
-- 
-- ---

DROP TABLE IF EXISTS `acoes`;
		
CREATE TABLE `acoes` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `nome` INTEGER NULL DEFAULT NULL,
  `descricao` VARCHAR NULL DEFAULT NULL,
  `horas_de_trabalho` INTEGER NULL DEFAULT NULL,
  `id_foto_perfil` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'comentario_post'
-- 
-- ---

DROP TABLE IF EXISTS `comentario_post`;
		
CREATE TABLE `comentario_post` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_comentario` INTEGER NULL DEFAULT NULL,
  `id_postagem` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'foto_perfil'
-- 
-- ---

DROP TABLE IF EXISTS `foto_perfil`;
		
CREATE TABLE `foto_perfil` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `organizacao` ADD FOREIGN KEY (id_acoes) REFERENCES `acoes` (`id`);
ALTER TABLE `organizacao` ADD FOREIGN KEY (id_foto_perfil) REFERENCES `comentario` (`id_foto_perfil`);
ALTER TABLE `organizacao` ADD FOREIGN KEY (id_foto_perfil) REFERENCES `foto_perfil` (`id`);
ALTER TABLE `organizacao` ADD FOREIGN KEY (nome) REFERENCES `comentario` (`nome`);
ALTER TABLE `organizacao` ADD FOREIGN KEY (nome) REFERENCES `postagem` (`nome`);
ALTER TABLE `postagem` ADD FOREIGN KEY (comentario) REFERENCES `comentario` (`id`);
ALTER TABLE `voluntariado` ADD FOREIGN KEY (id_usuario) REFERENCES `usuario` (`id`);
ALTER TABLE `voluntariado` ADD FOREIGN KEY (id_acao) REFERENCES `acoes` (`id`);
ALTER TABLE `usuario` ADD FOREIGN KEY (id_foto_perfil) REFERENCES `comentario` (`id_foto_perfil`);
ALTER TABLE `usuario` ADD FOREIGN KEY (id_foto_perfil) REFERENCES `foto_perfil` (`id`);
ALTER TABLE `usuario` ADD FOREIGN KEY (posts) REFERENCES `postagem` (`id`);
ALTER TABLE `acoes` ADD FOREIGN KEY (id_foto_perfil) REFERENCES `foto_perfil` (`id`);
ALTER TABLE `comentario_post` ADD FOREIGN KEY (id_comentario) REFERENCES `comentario` (`id`);
ALTER TABLE `comentario_post` ADD FOREIGN KEY (id_postagem) REFERENCES `postagem` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `organizacao` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `postagem` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `comentario` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `voluntariado` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `usuario` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `tipo` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `acoes` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `comentario_post` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `foto_perfil` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `organizacao` (`id`,`descricao`,`horas_de_trabalho`,`avaliacao`,`posts`,`id_voluntariado`,`id_acoes`,`permissoes`,`senha`,`email`,`cnpj`,`id_foto_perfil`,`nome`,`tipo`) VALUES
-- ('','','','','','','','','','','','','','');
-- INSERT INTO `postagem` (`id`,`data`,`hora`,`id_foto_perfil`,`descricao`,`comentario`,`nome`) VALUES
-- ('','','','','','','');
-- INSERT INTO `comentario` (`id`,`conteudo`,`id_foto_perfil`,`hora`,`nome`) VALUES
-- ('','','','','');
-- INSERT INTO `voluntariado` (`id`,`id_usuario`,`id_acao`) VALUES
-- ('','','');
-- INSERT INTO `usuario` (`id`,`senha`,`email`,`cpf`,`id_foto_perfil`,`permissoes`,`horas_de_trabalho`,`descricao`,`posts`,`tags`) VALUES
-- ('','','','','','','','','','');
-- INSERT INTO `tipo` (`id`) VALUES
-- ('');
-- INSERT INTO `acoes` (`id`,`nome`,`descricao`,`horas_de_trabalho`,`id_foto_perfil`) VALUES
-- ('','','','','');
-- INSERT INTO `comentario_post` (`id`,`id_comentario`,`id_postagem`) VALUES
-- ('','','');
-- INSERT INTO `foto_perfil` (`id`) VALUES
-- ('');