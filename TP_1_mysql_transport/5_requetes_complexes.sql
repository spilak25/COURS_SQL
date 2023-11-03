#--Affichez les expéditions en transit qui ont été initiées par un entrepôt situé en France et à destination d'un entrepôt situé en Chine 
#--(on a pas setup les continents).

SELECT entrepots.* FROM expeditions
JOIN entrepots ON expeditions.id_entrepot_source = entrepots.id
JOIN entrepots destination ON expeditions.id_entrepot_destination = destination.id
WHERE expeditions.statut = 'En transit' AND entrepots.pays = 'France' AND destination.pays = 'Chine';


#--Affichez les entrepôts qui ont envoyé des expéditions à destination d'un entrepôt situé dans le même pays. 
#--join as destination permet de différencier le pays testé du pays de base
SELECT entrepots.* FROM entrepots
JOIN expeditions ON entrepots.id = expeditions.id_entrepot_source
JOIN entrepots AS destinations ON expeditions.id_entrepot_destination = destinations.id
WHERE entrepots.pays = destinations.pays;


#--Affichez les entrepôts qui ont envoyé des expéditions à destination d'un entrepôt situé dans un pays différent.
#--changement du = en <> pour le pays différents
SELECT entrepots.* FROM entrepots
JOIN expeditions ON entrepots.id = expeditions.id_entrepot_source
JOIN entrepots AS destinations ON expeditions.id_entrepot_destination = destinations.id
WHERE entrepots.pays <> destinations.pays;