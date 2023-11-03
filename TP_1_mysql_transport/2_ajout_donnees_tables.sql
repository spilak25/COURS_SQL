USE transport_logistique;
INSERT INTO entrepots (nom_entrepot,adresse,ville,pays)
VALUES ('Entrepot Paris','60 Quai de Jemmapes, 75010 Paris','Paris','France'),
    ('Entrepot Marseille','Marseille','12 Rue Saturne','France'),
    ('Entrepor Lyon','Lyon','Marseille','France'),
    ('Entrepot Perdu','Toulouse','20 Gd Rue Saint-Nicolas','France'),
    ('Entrpot Chine','Chongqing','236 Renmin Rd, Daxigou, Yuzhong District, 400015','Chine');


INSERT INTO expeditions (date_expedition,id_entrepot_source,id_entrepot_destination,poids,statut)
VALUES ('2023-09-01',1,5,120,'En transit'),
('2023-06-19',3,2,18,'Arrivé à destination'),
('1985-02-06',2,4,500,'Prêt à partir'),
('2010-11-12',4,5,13,'Arrivé à destination'),
('2022-01-31',5,1,46,'Prêt à partir'),
('2018-09-28',5,2,950,'En transit'),
('2015-05-13',1,4,2,'En transit'),
('1985-05-06',2,1,6,'Prêt à partir'),
('2023-11-03',4,3,250,'A à destination'),
('2017-07-21',3,5,35,'Prêt à partir');