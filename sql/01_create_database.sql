CREATE DATABASE IF NOT EXISTS tifosi
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE tifosi;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS achat;
DROP TABLE IF EXISTS menu_boisson;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS focaccia_ingredient;
DROP TABLE IF EXISTS focaccia;
DROP TABLE IF EXISTS ingredient;
DROP TABLE IF EXISTS boisson;
DROP TABLE IF EXISTS marque;

CREATE USER IF NOT EXISTS 'tifosi'@'localhost'
IDENTIFIED BY 'Tifosi123!';

GRANT ALL PRIVILEGES
ON tifosi.*
TO 'tifosi'@'localhost';

FLUSH PRIVILEGES;


CREATE TABLE marque (
    id_marque INT AUTO_INCREMENT PRIMARY KEY,
    nom_marque VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE boisson (
    id_boisson INT AUTO_INCREMENT PRIMARY KEY,
    nom_boisson VARCHAR(100) NOT NULL UNIQUE,
    id_marque INT NOT NULL,

    CONSTRAINT fk_boisson_marque
        FOREIGN KEY (id_marque)
        REFERENCES marque(id_marque)
);

CREATE TABLE ingredient (
    id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
    nom_ingredient VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE focaccia (
    id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
    nom_focaccia VARCHAR(100) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL CHECK (prix > 0)
);

CREATE TABLE focaccia_ingredient (
    id_focaccia INT NOT NULL,
    id_ingredient INT NOT NULL,
    quantite INT NOT NULL,

    PRIMARY KEY (id_focaccia, id_ingredient),

    CONSTRAINT fk_focaccia_ingredient_focaccia
        FOREIGN KEY (id_focaccia)
        REFERENCES focaccia(id_focaccia),

    CONSTRAINT fk_focaccia_ingredient_ingredient
        FOREIGN KEY (id_ingredient)
        REFERENCES ingredient(id_ingredient)
);

CREATE TABLE menu (
    id_menu INT AUTO_INCREMENT PRIMARY KEY,
    nom_menu VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE menu_boisson (
    id_menu INT NOT NULL,
    id_boisson INT NOT NULL,

    PRIMARY KEY (id_menu, id_boisson),

    CONSTRAINT fk_menu_boisson_menu
        FOREIGN KEY (id_menu)
        REFERENCES menu(id_menu),

    CONSTRAINT fk_menu_boisson_boisson
        FOREIGN KEY (id_boisson)
        REFERENCES boisson(id_boisson)
);

CREATE TABLE client (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nom_client VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE achat (
    id_client INT NOT NULL,
    id_menu INT NOT NULL,
    date_achat DATE NOT NULL,

    PRIMARY KEY (id_client, id_menu, date_achat),

    CONSTRAINT fk_achat_client
        FOREIGN KEY (id_client)
        REFERENCES client(id_client),

    CONSTRAINT fk_achat_menu
        FOREIGN KEY (id_menu)
        REFERENCES menu(id_menu)
);

SET FOREIGN_KEY_CHECKS = 1;