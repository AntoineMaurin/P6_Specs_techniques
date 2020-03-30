USE ocpizza;

INSERT INTO Ingredient (nom) VALUES
('sauce tomate'),
('jambon'),
('gruyère'),
('mozzarella'),
('crème fraiche'),
('olvie noire'),
('olvie verte'),
('oeuf'),
('chorizo'),
('saumon fumé'),
('champignons de paris'),
('thé glacé'),
('coca'),
('cappuccino');

INSERT INTO Produit (nom, prix) VALUES
('Calzone', 1050),
('Spéciale', 1250),
('Reine', 999),
('2 Saumons', 1299),
('Thé glacé', 199),
('Coca', 199),
('Cappuccino', 149);

INSERT INTO Composition_produit (id_produit , id_ingredient) VALUES
(1, 1),
(1, 2),
(1, 4),
(1, 11),
(2, 2),
(2, 4),
(2, 5),
(3, 2),
(3, 4),
(3, 11),
(4, 4),
(4, 5),
(4, 10),
(5, 12),
(6, 13),
(7, 14);

INSERT INTO Paiement (montant, moyen_paiement) VALUES
(1448, 'carte'),
(999, 'espèces'),
(2250, 'carte'),
(5645, 'chèque');

INSERT INTO Adresse (numero_rue, type_voie, nom_rue, ville, code_postal, type_batiment, pays, commentaire) VALUES
('1', 'rue', 'Chantemerle', 'Poitiers', 86000, 'villa', 'France', ''),
('14 BIS', 'rue', 'Gilbert Landry', 'Mirebeau', 86110, 'villa', 'France', ''),
('9', 'avenue', 'Victor Hugo', 'Bordeaux', 33000, 'Résidence', 'France', 'Appartement 6'),
('43', 'Boulevard', 'Foulques Nerra', 'Toulouse', 31120, 'Commerce', 'France', ''),
('22', 'place', 'République', 'Toulouse', 31200, 'Commerce', 'France', '');

INSERT INTO Pizzeria (id_adresse) VALUES
(4),
(5);

INSERT INTO Compte (email, mot_de_passe) VALUES
('durand.patrick@live.fr', 'bestpassword'),
('vincent.legoff@gmail.com', 'thinkimsafewiththat'),
('nelly.jardinier@laposte.net', 'nelly24700'),
('pablo.rossi@live.fr', 'KJ65SD4F4SDF1S'),
('martin.petit@hotmail.com', '84SDF5WDFSD4DF'),
('tony.leroy@gmail.com', '98F7D22F1SDF4G');

INSERT INTO Client (nom, numero_tel, id_adresse, id_compte) VALUES
('Durand', '0758412475', 1, 1),
('Le Goff', '0641757524', 2, 2),
('Jardinier', '0555791245', 3, 3);

INSERT INTO Staff (nom, type, id_compte) VALUES
('Rossi', 'Pizzaiolo', 4),
('Petit', 'Responsable', 5),
('Leroy', 'Livreur', 6);

INSERT INTO Commande (date_creation, statut, paiement_effectue, mode_livraison, id_paiement, id_client, id_pizzeria, id_adresse) VALUES
('2020-01-01 10:10:10', 'en attente de préparation', false, 'sur place', 1, 1, 1, 1),
('2020-03-05 20:54:37', 'en attente de livraison', true, 'à emporter', 2, 2, 1, 2),
('2019-12-12 20:54:37', 'délivrée', true, 'à emporter', 4, 3, 2, 3);

INSERT INTO Catalogue (id_pizzeria) VALUES
(1),
(2);

INSERT INTO Produits_commandes (id_commande, id_produit, quantite_produit) VALUES
(1, 4, 1),
(1, 7, 1),
(2, 3, 1),
(3, 2, 2),
(3, 4, 2),
(3, 5, 2),
(3, 7, 1);

INSERT INTO Ligne_stock (quantite_ingredient, id_ingredient, id_pizzeria) VALUES
-- produits réalisables : Calzonne - Reine - 2 Saumons - thé - coca
(10, 1, 1),
(9, 2, 1),
(10, 4, 1),
(10, 11, 1),
(7, 5, 1),
(10, 10, 1),
(7, 12, 1),
(7, 13, 1),

-- produits réalisables : Spéciale - Reine - 2 Saumons - thé - cappuccino
(7, 2, 2),
(4, 4, 2),
(5, 5, 2),
(10, 10, 2),
(10, 11, 2),
(7, 12, 2),
(7, 14, 2);
