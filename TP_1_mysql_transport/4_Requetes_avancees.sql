#--affiche les entrepots qui ont envoyé au moins une expédition en transit.
SELECT * FROM expeditions 
WHERE id_entrepot_source <> 0;


#--afficher les entrepôts qui ont reçu au moins une expédition en transit.
SELECT * FROM entrepots
WHERE id IN (
    SELECT id_entrepot_destination
    FROM expeditions
    WHERE statut = 'en transit'
);


#--Affichez les expéditions qui ont un poids supérieur à 100 kg et qui sont en transit.
SELECT * FROM expeditions 
WHERE poids > 100 AND statut = 'en transit';


#--affichez le nombre d'expéditions envoyées par chaque entrepôt
#--le compteur permet de récupérer le nombre d'expeditions envoyés pour chaques entrepots (ON ),
#-- le group by permet de trier les entrpots
SELECT entrepots.id, nom_entrepot, COUNT(expeditions.id) FROM entrepots 
LEFT JOIN expeditions ON entrepots.id = expeditions.id_entrepot_source
GROUP BY entrepots.id, nom_entrepot;


#--Affichez le nombre total d'expéditions en transit. 
#--le count(*) permet de compter les lignes où le status est "En transit"
SELECT COUNT(*) FROM expeditions
WHERE statut = 'en transit';


#-- la même chose avec les expeditions livrés
SELECT COUNT(*) FROM expeditions
WHERE statut = 'arrivé à destination';


#--Affichez le nombre total d'expéditions pour chaque mois de l'année en cours. les alias servent a mettre en ordre 
SELECT MONTH(date_expedition) AS 'Mois', COUNT(*) AS 'Nombre total d expeditions' FROM expeditions
WHERE YEAR(date_expedition) = YEAR(CURRENT_DATE())
GROUP BY MONTH(date_expedition);


#--Affichez les entrepôts qui ont envoyé des expéditions au cours des 30 derniers jours.
SELECT entrepots.* FROM entrepots
JOIN expeditions ON entrepots.id = expeditions.id_entrepot_source
WHERE expeditions.date_expedition >= DATE_SUB(NOW(), INTERVAL 30 DAY);


#-- même chose en changeant source et destination
SELECT entrepots.* FROM entrepots
JOIN expeditions ON entrepots.id = expeditions.id_entrepot_destination
WHERE expeditions.date_expedition >= DATE_SUB(NOW(), INTERVAL 30 DAY);


#--Affichez les expéditions qui ont été livrées dans un délai de moins de 5 jours ouvrables.
SELECT * FROM expeditions
WHERE statut = 'Arrivé à destination' AND DATEDIFF(expeditions.date_expedition, now()) <= 5