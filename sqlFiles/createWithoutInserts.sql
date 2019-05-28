-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dbproject
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbproject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbproject` ;
USE `dbproject` ;

-- -----------------------------------------------------
-- Table `dbproject`.`province`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbproject`.`province` (
  `pid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbproject`.`cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbproject`.`cities` (
  `cid` INT NOT NULL AUTO_INCREMENT,
  `pid` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cid`, `pid`),
  CONSTRAINT `fk_cities_province1`
    FOREIGN KEY (`pid`)
    REFERENCES `dbproject`.`province` (`pid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_cities_province1_idx` ON `dbproject`.`cities` (`pid` ASC);


-- -----------------------------------------------------
-- Table `dbproject`.`weather_stations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbproject`.`weather_stations` (
  `wsid` INT NOT NULL,
  `cid` INT NOT NULL,
  `wsnm` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `elvt` FLOAT NOT NULL,
  `lat` FLOAT NOT NULL,
  `lon` FLOAT NOT NULL,
  `inme` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`wsid`, `cid`),
  CONSTRAINT `fk_weather_stations_cities1`
    FOREIGN KEY (`cid`)
    REFERENCES `dbproject`.`cities` (`cid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_weather_stations_cities1_idx` ON `dbproject`.`weather_stations` (`cid` ASC);


-- -----------------------------------------------------
-- Table `dbproject`.`observations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbproject`.`observations` (
  `obsID` INT NOT NULL AUTO_INCREMENT,
  `wsid` INT NOT NULL,
  `datetime` DATETIME NOT NULL,
  PRIMARY KEY (`obsID`, `wsid`),
  CONSTRAINT `fk_observations_weather_stations1`
    FOREIGN KEY (`wsid`)
    REFERENCES `dbproject`.`weather_stations` (`wsid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_observations_weather_stations1_idx` ON `dbproject`.`observations` (`wsid` ASC);


-- -----------------------------------------------------
-- Table `dbproject`.`ValueType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbproject`.`ValueType` (
  `valueID` INT NOT NULL AUTO_INCREMENT,
  `valueName` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`valueID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbproject`.`obsValues`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbproject`.`obsValues` (
  `obsID` INT NOT NULL,
  `valueID` INT NOT NULL,
  `value` FLOAT NOT NULL,
  PRIMARY KEY (`obsID`, `valueID`),
  CONSTRAINT `fk_obsValues_observations1`
    FOREIGN KEY (`obsID`)
    REFERENCES `dbproject`.`observations` (`obsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_obsValues_ValueType1`
    FOREIGN KEY (`valueID`)
    REFERENCES `dbproject`.`ValueType` (`valueID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_obsValues_ValueType1_idx` ON `dbproject`.`obsValues` (`valueID` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
