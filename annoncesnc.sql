-------- Initialisation de la base de données ------------

-- Création de la base de données
CREATE DATABASE annoncesnc;

-- Utilisation de la base de données
USE annoncesnc;

-- Table Vendeur
CREATE TABLE Vendeur (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Pseudo VARCHAR(50) NOT NULL
);

-- Table Catégorie
CREATE TABLE Categorie (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(50) NOT NULL
);

-- Table Localisation
CREATE TABLE Localisation (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Ville VARCHAR(50) NOT NULL
);

-- Table Annonce
CREATE TABLE Annonce (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Titre VARCHAR(50) NOT NULL,
    Description TEXT NOT NULL,
    Prix DECIMAL(10, 2),
    LivraisonPossible BOOLEAN,
    AnnonceUrgente BOOLEAN,
    DatePublication DATE,
    ID_Vendeur INT,
    ID_Categorie INT,
    ID_Localisation INT,
    FOREIGN KEY (ID_Vendeur) REFERENCES Vendeur(ID),
    FOREIGN KEY (ID_Categorie) REFERENCES Categorie(ID),
    FOREIGN KEY (ID_Localisation) REFERENCES Localisation(ID)
);

-- Table Photo
CREATE TABLE Photo (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    URL VARCHAR(255) NOT NULL,
    ID_Annonce INT,
    FOREIGN KEY (ID_Annonce) REFERENCES Annonce(ID)
);

-- Table Favoris (Table d'association entre Utilisateur et Annonce)
CREATE TABLE Favoris (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_Utilisateur INT,
    ID_Annonce INT,
    FOREIGN KEY (ID_Utilisateur) REFERENCES Vendeur(ID),
    FOREIGN KEY (ID_Annonce) REFERENCES Annonce(ID)
);

-------- Insertion des données --------

-- Insertion des vendeurs
INSERT INTO vendeur (Pseudo) 
VALUES 
('Gregory'),
('Warren'), 
('Paimin'),
('Yvon'),
('Pascal');
-- Insertion des catégories
INSERT INTO categorie (Nom)
VALUES
('Immobilier'),
('Automobiles'),
('Informatique'),
('Sport'),
('Vêtement');
-- Insertion des localisations
INSERT INTO localisation (Ville) 
VALUES 
('Nouméa'),
('Dumbéa'), 
('Mont-Dore'),
('Païta'),
('Boulouparis');
-- Insertion des annonces, initialise les ID_Annonce
ALTER TABLE Annonce AUTO_INCREMENT = 1;
INSERT INTO Annonce (Titre, Description, Prix, LivraisonPossible, AnnonceUrgente, DatePublication, ID_Vendeur, ID_Categorie, ID_Localisation)
VALUES
('Annonce 1', 'Description de l\'annonce 1', 100.00, 1, 0, '2023-09-19', 1, 2, 3),
('Annonce 2', 'Description de l\'annonce 2', 50.00, 0, 1, '2023-09-19', 3, 2, 1),
('Annonce 3', 'Description de l\'annonce 3', 200.00, 1, 0, '2023-09-18', 2, 1, 1),
('Annonce 4', 'Description de l\'annonce 4', 75.00, 0, 0, '2023-09-18', 2, 3, 3),
('Annonce 5', 'Description de l\'annonce 5', 120.00, 1, 1, '2023-09-17', 4, 5, 1),
('Annonce 6', 'Description de l\'annonce 6', 60.00, 0, 0, '2023-09-17', 3, 4, 1),
('Annonce 7', 'Description de l\'annonce 7', 90.00, 1, 0, '2023-09-16', 3, 1, 2),
('Annonce 8', 'Description de l\'annonce 8', 180.00, 0, 0, '2023-09-16', 5, 2, 3),
('Annonce 9', 'Description de l\'annonce 9', 40.00, 1, 1, '2023-09-15', 1, 1, 1),
('Annonce 10', 'Description de l\'annonce 10', 300.00, 0, 0, '2023-09-15', 4, 3, 2),
('Annonce 11', 'Description de l\'annonce 11', 85.00, 1, 0, '2023-09-14', 2, 2, 1),
('Annonce 12', 'Description de l\'annonce 12', 70.00, 0, 1, '2023-09-14', 5, 1, 2),
('Annonce 13', 'Description de l\'annonce 13', 110.00, 1, 0, '2023-09-13', 1, 4, 3),
('Annonce 14', 'Description de l\'annonce 14', 55.00, 0, 0, '2023-09-13', 3, 5, 2),
('Annonce 15', 'Description de l\'annonce 15', 150.00, 1, 1, '2023-09-12', 4, 1, 1),
('Annonce 16', 'Description de l\'annonce 16', 65.00, 0, 0, '2023-09-12', 2, 2, 3),
('Annonce 17', 'Description de l\'annonce 17', 95.00, 1, 0, '2023-09-11', 3, 3, 1),
('Annonce 18', 'Description de l\'annonce 18', 250.00, 0, 0, '2023-09-11', 5, 4, 2),
('Annonce 19', 'Description de l\'annonce 19', 80.00, 1, 1, '2023-09-10', 4, 1, 3),
('Annonce 20', 'Description de l\'annonce 20', 45.00, 0, 0, '2023-09-10', 1, 2, 1);
-- Insertion des favoris
INSERT INTO favoris(ID_Utilisateur, ID_Annonce)
VALUES
(1, 1),
(2, 2),
(3,3),
(4,4),
(5,5);
-- Insertion des photos
INSERT INTO Photo (URL, ID_Annonce)
VALUES
('URL_de_la_photo_1.jpg', 1), -- Associez cette photo à l'annonce avec l'ID 1
('URL_de_la_photo_2.jpg', 2), -- Associez cette photo à l'annonce avec l'ID 2
('URL_de_la_photo_3.jpg', 3), -- Associez cette photo à l'annonce avec l'ID 3
('URL_de_la_photo_4.jpg', 4), -- Associez cette photo à l'annonce avec l'ID 4
('URL_de_la_photo_5.jpg', 5), -- Associez cette photo à l'annonce avec l'ID 5
('URL_de_la_photo_6.jpg', 6), -- Associez cette photo à l'annonce avec l'ID 1
('URL_de_la_photo_7.jpg', 7), -- Associez cette photo à l'annonce avec l'ID 2
('URL_de_la_photo_8.jpg', 8), -- Associez cette photo à l'annonce avec l'ID 3
('URL_de_la_photo_9.jpg', 9), -- Associez cette photo à l'annonce avec l'ID 4
('URL_de_la_photo_10.jpg', 10), -- Associez cette photo à l'annonce avec l'ID 5
('URL_de_la_photo_11.jpg', 11), -- Associez cette photo à l'annonce avec l'ID 1
('URL_de_la_photo_12.jpg', 12), -- Associez cette photo à l'annonce avec l'ID 2
('URL_de_la_photo_13.jpg', 13), -- Associez cette photo à l'annonce avec l'ID 3
('URL_de_la_photo_14.jpg', 14), -- Associez cette photo à l'annonce avec l'ID 4
('URL_de_la_photo_15.jpg', 15), -- Associez cette photo à l'annonce avec l'ID 5
('URL_de_la_photo_16.jpg', 16), -- Associez cette photo à l'annonce avec l'ID 1
('URL_de_la_photo_17.jpg', 17), -- Associez cette photo à l'annonce avec l'ID 2
('URL_de_la_photo_18.jpg', 18), -- Associez cette photo à l'annonce avec l'ID 3
('URL_de_la_photo_19.jpg', 19), -- Associez cette photo à l'annonce avec l'ID 4
('URL_de_la_photo_20.jpg', 20); -- Associez cette photo à l'annonce avec l'ID 5

------------ Selection des données -------------

use annoncesnc;
-- Afficher les annonces actives triées par vendeur et date publication. Afficher toutes
-- les info des annonces, ainsi que le nom du fichier des photos et le pseudo du vendeur. 
SELECT Pseudo, Titre, Description, Prix, LivraisonPossible, AnnonceUrgente, DatePublication, URL
FROM vendeur
LEFT JOIN annonce ON vendeur.ID = annonce.id_vendeur
LEFT JOIN Photo ON annonce.ID = Photo.ID_Annonce
-- WHERE Titre IS NOT NULL AND Description IS NOT NULL AND Prix IS NOT NULL
ORDER BY vendeur.Pseudo, annonce.DatePublication asc;

--  Afficher le titre, prix, localisation, pseudo du vendeur des annonces classées dans une
-- catégorie de votre choix, triées par date de publication de la plus récente à la plus
-- ancienne. 
SELECT Pseudo, Titre, Prix, Ville, DatePublication, categorie.Nom as Catégories
FROM vendeur
LEFT JOIN annonce ON vendeur.ID = annonce.id_vendeur
LEFT JOIN localisation ON localisation.ID = annonce.ID_Localisation
LEFT JOIN categorie ON categorie.ID = annonce.ID_Categorie
WHERE categorie.Nom = 'Automobiles'
ORDER BY  categorie.Nom asc, annonce.DatePublication desc;

-- Afficher le titre, prix, localisation des annonces favorites d’un utilisateur, triées par
-- catégorie et prix croissant
SELECT annonce.Titre, annonce.Prix, annonce.DatePublication, localisation.Ville
FROM annonce
LEFT JOIN localisation ON localisation.ID = annonce.ID_Localisation
LEFT JOIN categorie ON categorie.ID = annonce.ID_Categorie
INNER JOIN favoris ON favoris.ID_Annonce = annonce.ID
WHERE favoris.ID_Utilisateur = 4
ORDER BY categorie.Nom ASC, annonce.Prix ASC;

select * from annonce

