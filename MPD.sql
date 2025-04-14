CREATE DATABASE IF NOT EXISTS `AgenceVoyages`;

USE `AgenceVoyages`;

CREATE TABLE IF NOT EXISTS `Client` (
  `ClientID` INT PRIMARY KEY AUTO_INCREMENT,
  `nom` VARCHAR(50),
  `prenom` VARCHAR(50),
  `email` VARCHAR(100) UNIQUE NOT NULL,
  `telephone` VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS `Contact` (
  `ContactID` INT PRIMARY KEY AUTO_INCREMENT,
  `nom` VARCHAR(50),
  `prenom` VARCHAR(50),
  `email` VARCHAR(100) UNIQUE NOT NULL,
  `telephone` VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS `Hebergement` (
  `HebergementID` INT PRIMARY KEY AUTO_INCREMENT,
  `type` VARCHAR(50) NOT NULL,
  `ContactID` INT UNIQUE NOT NULL,
  FOREIGN KEY (`ContactID`) REFERENCES `Contact`(`ContactID`)
);

CREATE TABLE IF NOT EXISTS `Voyage` (
  `VoyageID` INT PRIMARY KEY AUTO_INCREMENT,
  `ville` VARCHAR(50) NOT NULL,
  `pays` VARCHAR(50) NOT NULL,
  `date` DATE DEFAULT CURRENT_DATE,
  `prix` DECIMAL(6,2) NOT NULL CHECK (`prix` > 0),
  `nombre_de_places` INT NOT NULL,
  `HebergementID` INT UNIQUE NOT NULL,
  FOREIGN KEY (`HebergementID`) REFERENCES `Hebergement`(`HebergementID`)
);

CREATE TABLE IF NOT EXISTS `Reservation` (
  `ReservationID` INT PRIMARY KEY AUTO_INCREMENT,
  `status` VARCHAR(20) DEFAULT 'En attente',
  `date_reservation` DATE DEFAULT CURRENT_DATE,
  `ClientID` INT NOT NULL,
  `VoyageID` INT NOT NULL,
  FOREIGN KEY (`VoyageID`) REFERENCES `Voyage`(`VoyageID`),
  FOREIGN KEY (`ClientID`) REFERENCES `Client`(`ClientID`)
);

CREATE TABLE IF NOT EXISTS `Paiement` (
  `PaiementID` INT PRIMARY KEY AUTO_INCREMENT,
  `methode_paiement` VARCHAR(20) NOT NULL CHECK (`methode_paiement` IN ('Virement', 'Espèces')),
  `date_paiement` DATE DEFAULT CURRENT_DATE,
  `montant_payé` DECIMAL(6,2) NOT NULL CHECK (`montant_payé` > 0),
  `ReservationID` INT NOT NULL,
  FOREIGN KEY (`ReservationID`) REFERENCES `Reservation`(`ReservationID`)
);

CREATE TABLE IF NOT EXISTS `Transport` (
  `TransportID` INT PRIMARY KEY AUTO_INCREMENT,
  `nom` VARCHAR(50) NOT NULL,
  `places` INT NOT NULL,
  `type` VARCHAR(50) NOT NULL,
  `compagnie` VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Proposition_transport` (
  `VoyageID` INT NOT NULL,
  `TransportID` INT NOT NULL,
  PRIMARY KEY (`VoyageID`, `TransportID`),
  FOREIGN KEY (`VoyageID`) REFERENCES `Voyage`(`VoyageID`),
  FOREIGN KEY (`TransportID`) REFERENCES `Transport`(`TransportID`)
);

CREATE TABLE IF NOT EXISTS `Guide_touristique` (
  `GuideID` INT PRIMARY KEY AUTO_INCREMENT,
  `nom` VARCHAR(50),
  `prenom` VARCHAR(50),
  `email` VARCHAR(100) UNIQUE NOT NULL,
  `telephone` VARCHAR(20) UNIQUE NOT NULL,
  `tarif` DECIMAL(6,2) NOT NULL CHECK (`tarif` > 0),
  `VoyageID` INT UNIQUE NOT NULL,
  FOREIGN KEY (`VoyageID`) REFERENCES `Voyage`(`VoyageID`)
);