                                        #--creation base de donnée transport_logistique.
CREATE DATABASE transport_logistique;
USE transport_logistique;


                                        #--création de la table entrepots.
CREATE TABLE entrepots (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom_entrepot VARCHAR(100),
    adresse VARCHAR(100),
    ville VARCHAR(100),
    pays VARCHAR(100)
);


                                        #--création de la table expeditions.
CREATE TABLE expeditions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_expedition DATE,
    id_entrepot_source INT,
    FOREIGN KEY (id_entrepot_source) REFERENCES entrepots(id),
    id_entrepot_destination INT,
    FOREIGN KEY (id_entrepot_destination) REFERENCES entrepots(id),
    poids DECIMAL(5, 2),
    statut VARCHAR(100)
);