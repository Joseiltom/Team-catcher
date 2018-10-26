-- MySQL Workbench Synchronization
-- Generated: 2018-10-20 15:10
-- Model: Sakila Full
-- Version: 2.0
-- Project: Name of the project
-- Author: Mike

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `TeamCatcher` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `TeamCatcher`.`Usuario` (
  `cpf` INT(11) NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `cep` VARCHAR(11) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `senha` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `TeamCatcher`.`Evento` (
  `codigo` INT(11) NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `horaInicio` TIME NOT NULL,
  `horaFinal` TIME NOT NULL,
  `data` DATE NOT NULL,
  `local` VARCHAR(50) NOT NULL,
  `custo` FLOAT(11) NOT NULL,
  `capacidadeMinima` INT(11) NOT NULL,
  `capacidadeMaxima` INT(11) NOT NULL,
  `descricao` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `TeamCatcher`.`Participacao` (
  `Usuario_cpf` INT(11) NOT NULL,
  `Evento_codigo` INT(11) NOT NULL,
  `status` VARCHAR(30) NOT NULL,
  `numeroInscricao` INT(11) NOT NULL,
  `dataInscricao` DATE NOT NULL,
  PRIMARY KEY (`Usuario_cpf`, `Evento_codigo`),
  INDEX `fk_Usuario_has_Evento_Evento1_idx` (`Evento_codigo` ASC),
  INDEX `fk_Usuario_has_Evento_Usuario_idx` (`Usuario_cpf` ASC),
  CONSTRAINT `fk_Usuario_has_Evento_Usuario`
    FOREIGN KEY (`Usuario_cpf`)
    REFERENCES `TeamCatcher`.`Usuario` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Evento_Evento1`
    FOREIGN KEY (`Evento_codigo`)
    REFERENCES `TeamCatcher`.`Evento` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
