                                        #--affiche tous les entrepots.
SELECT * FROM entrepots;


                                        #--affiche toutes les expéditions.
SELECT * FROM expeditions;


#--affiche toutes les expéditions en transit.
SELECT * FROM expeditions
WHERE statut = 'En transit';


#--affiche toutes les expéditions livrées.
SELECT * FROM expeditions
WHERE statut = 'Arrivé à destination';
