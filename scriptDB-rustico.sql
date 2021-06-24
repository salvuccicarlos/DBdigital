-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DH_EntregaBD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DH_EntregaBD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DH_EntregaBD` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `DH_EntregaBD` ;

-- -----------------------------------------------------
-- Table `DH_EntregaBD`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DH_EntregaBD`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DH_EntregaBD`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DH_EntregaBD`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DH_EntregaBD`.`notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DH_EntregaBD`.`notas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `fecha_creacion` DATE NOT NULL,
  `fecha_modificacion` DATE NOT NULL,
  `descripcion` TEXT NOT NULL,
  `id_usuarios` INT NOT NULL,
  `id_categorias` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_usuarios_idx` (`id_usuarios` ASC) VISIBLE,
  INDEX `id_categorias_idx` (`id_categorias` ASC) VISIBLE,
  CONSTRAINT `id_usuarios`
    FOREIGN KEY (`id_usuarios`)
    REFERENCES `DH_EntregaBD`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_categorias`
    FOREIGN KEY (`id_categorias`)
    REFERENCES `DH_EntregaBD`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
