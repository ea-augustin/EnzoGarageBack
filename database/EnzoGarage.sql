-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 25 juin 2021 à 12:12
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `EnzoGarage`
--

-- --------------------------------------------------------

--
-- Structure de la table `advertisement`
--

DROP TABLE IF EXISTS `advertisement`;
CREATE TABLE IF NOT EXISTS `advertisement`
(
    `ref`         int(10) UNSIGNED                    NOT NULL,
    `title`       varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `price`       decimal(8, 2)                       NOT NULL,
    `description` text COLLATE utf8_unicode_ci        NOT NULL,
    `date`        date                                NOT NULL,
    `id_brand`    int(10) UNSIGNED                    NOT NULL,
    `id_fuel`     int(10) UNSIGNED                    NOT NULL,
    `mileage`     mediumint(9)                        NOT NULL,
    `year`        year(4)                             NOT NULL,
    `id_garage`   int(10) UNSIGNED                    NOT NULL,
    `id_img`      int(10) UNSIGNED                    NOT NULL,
    PRIMARY KEY (`ref`),
    KEY `id_brand` (`id_brand`, `id_fuel`, `id_garage`),
    KEY `id_garage` (`id_garage`),
    KEY `id_fuel` (`id_fuel`),
    KEY `id_img` (`id_img`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `brand`
--

DROP TABLE IF EXISTS `brand`;
CREATE TABLE IF NOT EXISTS `brand`
(
    `id_b`     int(10) UNSIGNED                    NOT NULL AUTO_INCREMENT,
    `name_b`   varchar(30) COLLATE utf8_unicode_ci NOT NULL,
    `id_model` int(10) UNSIGNED,
    PRIMARY KEY (`id_b`),
    KEY `Model_FK` (`id_model`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address`
(
    `id_address`    int(10) UNSIGNED                     NOT NULL AUTO_INCREMENT,
    `city_a`        varchar(250) COLLATE utf8_unicode_ci NOT NULL,
    `region_a`      varchar(250) COLLATE utf8_unicode_ci NOT NULL,
    `street_name_a` varchar(50) COLLATE utf8_unicode_ci  NOT NULL,
    `street_num_a`  varchar(50) COLLATE utf8_unicode_ci  NOT NULL,
    `postal_code_a` varchar(50) COLLATE utf8_unicode_ci  NOT NULL,
    PRIMARY KEY (`id_address`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fueltype`
--

DROP TABLE IF EXISTS `fueltype`;
CREATE TABLE IF NOT EXISTS `fueltype`
(
    `id_fuel`   int(10) UNSIGNED                    NOT NULL AUTO_INCREMENT,
    `type_fuel` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (`id_fuel`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `garage`
--

DROP TABLE IF EXISTS `garage`;
CREATE TABLE IF NOT EXISTS `garage`
(
    `id_g`       int(10) UNSIGNED                     NOT NULL AUTO_INCREMENT,
    `name_g`     varchar(50) COLLATE utf8_unicode_ci  NOT NULL,
    `email_g`    varchar(320) COLLATE utf8_unicode_ci NOT NULL,
    `tel_g`      int(10) UNSIGNED ZEROFILL            NOT NULL,
    `id_address` int(10) UNSIGNED                     NOT NULL,
    PRIMARY KEY (`id_g`),
    KEY `Garage_address0_FK` (`id_address`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `model`
--

DROP TABLE IF EXISTS `model`;
CREATE TABLE IF NOT EXISTS `model`
(
    `id_model`   int(10) UNSIGNED                    NOT NULL AUTO_INCREMENT,
    `name_model` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `id_img`     int(10) UNSIGNED                    NOT NULL,
    PRIMARY KEY (`id_model`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `images`
--
# todo: link to pros. change pros to client, link to brand
DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images`
(
    `id_img`   int(10) UNSIGNED                     NOT NULL AUTO_INCREMENT,
    `url_img`  varchar(250) COLLATE utf8_unicode_ci NOT NULL,
    `alt_img`  varchar(200) COLLATE utf8_unicode_ci NOT NULL,
    `id_pro`   int(10) UNSIGNED                     NOT NULL,
    `id_model` int(10) UNSIGNED                     NOT NULL,
    PRIMARY KEY (`id_img`),
    KEY `Image_PRO_FK` (`id_pro`),
    KEY `Image_MOD_FK` (`id_model`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `professional`
--

DROP TABLE IF EXISTS `professional`;
CREATE TABLE IF NOT EXISTS `professional`
(
    `id_pro`        int(10) UNSIGNED                     NOT NULL AUTO_INCREMENT,
    `firstname_pro` varchar(50) COLLATE utf8_unicode_ci  NOT NULL,
    `lastname_pro`  varchar(50) COLLATE utf8_unicode_ci  NOT NULL,
    `email_pro`     varchar(250) COLLATE utf8_unicode_ci NOT NULL,
    `id_address`    int(10) UNSIGNED                     NOT NULL,
    `tel_pro`       int(10) UNSIGNED ZEROFILL            NOT NULL,
    `siren_pro`     bigint(20)                           NOT NULL,
    `id_img`        int(10) UNSIGNED                     NOT NULL,
    `status`        boolean                              NOT NULL,
    `id_g`          int(10) UNSIGNED                     NOT NULL,
    PRIMARY KEY (`id_pro`),
    UNIQUE KEY `siren_pro` (`siren_pro`),
    KEY `Garage_address_FK` (`id_address`),
    KEY `Garage_FK` (`id_g`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `advertisement`
--
ALTER TABLE `advertisement`
    ADD CONSTRAINT `advert_image_5` FOREIGN KEY (`id_img`) REFERENCES `images` (`id_img`),
    ADD CONSTRAINT `advert_garage_1` FOREIGN KEY (`id_garage`) REFERENCES `garage` (`id_g`) ON DELETE NO ACTION ON
        UPDATE NO ACTION,
    ADD CONSTRAINT `advert_fuel_2` FOREIGN KEY (`id_fuel`) REFERENCES `fueltype` (`id_fuel`) ON DELETE NO ACTION ON
        UPDATE NO ACTION,
    ADD CONSTRAINT `advert_brand_3` FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id_b`) ON DELETE NO ACTION ON UPDATE NO
        ACTION;

--
-- Contraintes pour la table `garage`
--
ALTER TABLE `garage`
    ADD CONSTRAINT `Garage_address0_FK` FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`);

--
-- Contraintes pour la table `professional`
--
ALTER TABLE `professional`
    ADD CONSTRAINT `Garage_FK` FOREIGN KEY (`id_g`) REFERENCES `garage` (`id_g`),
    ADD CONSTRAINT `Garage_address_FK` FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`);

--
-- Contraintes pour la table `brand`
--
ALTER TABLE `brand`
    ADD CONSTRAINT `Model_FK` FOREIGN KEY (`id_model`) REFERENCES `model` (`id_model`);

--
-- Contraintes pour la table `images`
--
ALTER TABLE `images`
    ADD CONSTRAINT `Image_PRO_FK` FOREIGN KEY (`id_pro`) REFERENCES `professional` (`id_pro`),
    ADD CONSTRAINT `Image_MOD_FK` FOREIGN KEY (`id_model`) REFERENCES `model` (`id_model`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
