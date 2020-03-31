CREATE DATABASE IF NOT EXISTS ocpizza CHARACTER SET 'utf8';

USE ocpizza;

CREATE TABLE IF NOT EXISTS Compte (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Adresse (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    numero_rue VARCHAR(20) NOT NULL,
    type_voie VARCHAR(20),
    nom_rue VARCHAR(60) NOT NULL,
    ville VARCHAR(60) NOT NULL,
    code_postal MEDIUMINT UNSIGNED NOT NULL,
    type_batiment VARCHAR(30) NOT NULL,
    pays VARCHAR(60) NOT NULL,
    commentaire TEXT,
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS Pizzeria (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_adresse INT UNSIGNED NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE Pizzeria
ADD CONSTRAINT fk_pizzeria_adresse FOREIGN KEY (id_adresse)
REFERENCES Adresse(id);

CREATE TABLE IF NOT EXISTS Staff (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nom VARCHAR(60) NOT NULL,
    type VARCHAR(30) NOT NULL,
    id_compte INT UNSIGNED NOT NULL,
    id_pizzeria INT UNSIGNED NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE Staff
ADD CONSTRAINT fk_staff_compte FOREIGN KEY (id_compte)
REFERENCES Compte(id);
ALTER TABLE Staff
ADD CONSTRAINT fk_staff_pizzeria FOREIGN KEY (id_pizzeria)
REFERENCES Pizzeria(id);

CREATE TABLE IF NOT EXISTS Catalogue (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_pizzeria INT UNSIGNED NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE Catalogue
ADD CONSTRAINT fk_catalogue_pizzeria FOREIGN KEY (id_pizzeria)
REFERENCES Pizzeria(id);

CREATE TABLE IF NOT EXISTS Client (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nom VARCHAR(60) NOT NULL,
    numero_tel VARCHAR(15),
    id_adresse INT UNSIGNED NOT NULL,
    id_compte INT UNSIGNED NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE Client
ADD CONSTRAINT fk_client_adresse FOREIGN KEY (id_adresse)
REFERENCES Adresse(id);
ALTER TABLE Client
ADD CONSTRAINT fk_client_compte FOREIGN KEY (id_compte)
REFERENCES Compte(id);

CREATE TABLE IF NOT EXISTS Paiement (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    montant INT NOT NULL,
    moyen_paiement VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS Commande (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    date_creation DATETIME NOT NULL,
    statut VARCHAR(50) NOT NULL,
    paiement_effectue BOOLEAN NOT NULL,
    mode_livraison VARCHAR(30) NOT NULL,
    id_paiement INT UNSIGNED NOT NULL,
    id_client INT UNSIGNED NOT NULL,
    id_pizzeria INT UNSIGNED NOT NULL,
    id_adresse INT UNSIGNED NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE Commande
ADD CONSTRAINT fk_commande_paiement FOREIGN KEY (id_paiement)
REFERENCES Paiement(id);

ALTER TABLE Commande
ADD CONSTRAINT fk_commande_client FOREIGN KEY (id_client)
REFERENCES Client(id);

ALTER TABLE Commande
ADD CONSTRAINT fk_commande_pizzeria FOREIGN KEY (id_pizzeria)
REFERENCES Pizzeria(id);

ALTER TABLE Commande
ADD CONSTRAINT fk_commande_adresse FOREIGN KEY (id_adresse)
REFERENCES Adresse(id);

CREATE TABLE IF NOT EXISTS Ingredient (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nom VARCHAR(80) NOT NULL,
    unite_mesure VARCHAR(30),
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS Produit (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nom VARCHAR(80) NOT NULL,
    prix INT NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS Produits_commandes (
    id_commande INT UNSIGNED NOT NULL,
    id_produit INT UNSIGNED NOT NULL,
    quantite_produit SMALLINT NOT NULL,
    PRIMARY KEY (id_commande, id_produit)
);
ALTER TABLE Produits_commandes
ADD CONSTRAINT fk_commande FOREIGN KEY (id_commande)
REFERENCES Commande(id);

ALTER TABLE Produits_commandes
ADD CONSTRAINT fk_produit FOREIGN KEY (id_produit)
REFERENCES Produit(id);

CREATE TABLE IF NOT EXISTS Composition_produit (
    id_produit INT UNSIGNED NOT NULL,
    id_ingredient INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_produit, id_ingredient)
);
ALTER TABLE Composition_produit
ADD CONSTRAINT fk_compo_produit FOREIGN KEY (id_produit)
REFERENCES Produit(id);

ALTER TABLE Composition_produit
ADD CONSTRAINT fk_compo_ingredient FOREIGN KEY (id_ingredient)
REFERENCES Ingredient(id);

CREATE TABLE IF NOT EXISTS Ligne_stock (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    quantite_ingredient MEDIUMINT NOT NULL,
    id_ingredient INT UNSIGNED NOT NULL,
    id_pizzeria INT UNSIGNED NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE Ligne_stock
ADD CONSTRAINT fk_stock_ingredient FOREIGN KEY (id_ingredient)
REFERENCES Ingredient(id);

ALTER TABLE Ligne_stock
ADD CONSTRAINT fk_stock_pizzeria FOREIGN KEY (id_pizzeria)
REFERENCES Pizzeria(id);
