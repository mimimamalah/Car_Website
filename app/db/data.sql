SET search_path = Carpooling;

INSERT INTO Emplacement VALUES ('Ahuntsic', '443', 'Boul Henri-Bourassa E', 'Montréal', 'H3L 1C5', '50, 150', 60, 0);
INSERT INTO Emplacement VALUES ('Anjou', '6500', 'Bd Joseph-Renaud', 'Montréal', 'H1K 3V4', '90, 170', 40, 0);
INSERT INTO Emplacement VALUES ('Laval', '5', 'Bd Cartier O', 'Laval', 'H7N 0A3', '75, 175', 40, 0);
INSERT INTO Emplacement VALUES ('Trois-Rivières', '1450', 'Rue de l''Hippodrome', 'Trois-Rivières', 'G9A 5L9', '25, 125', 40, 0);
INSERT INTO Emplacement VALUES ('Sherbrooke', '63', 'Rue King O', 'Sherbrooke', 'J1H 1P1', '15, 80', 45, 0);
INSERT INTO Emplacement VALUES ('Québec', '825', '4e Avenue', 'Québec', 'G1J 3A6', '135, 20', 55, 0);

INSERT INTO TypeVehicule VALUES ('hybride', 10.00, 0.25, 150000, 7);
INSERT INTO TypeVehicule VALUES ('regulier', 8.00, 0.38, 180000);
INSERT INTO TypeVehicule VALUES ('miniCamionette', 12.00, 0.45, 220000);

INSERT INTO Vehicule (plaqueImmatriculation, marque, modele, nomEmplacement, imageV1, imageV2, odometre, miseEnService, consommation, type)
    VALUES ('P25 DRF', 'Honda', 'Accord', 'Ahuntsic',
         'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-111.jpg',
        'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-101.jpg',
        100000, '2015-01-01', 8, 'regulier');
INSERT INTO Vehicule (plaqueImmatriculation, marque, modele, nomEmplacement, imageV1, imageV2, odometre, miseEnService, consommation, type)
    VALUES ('H14 FLA', 'Volkswagen', 'Jetta', 'Ahuntsic',
         'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-111.jpg',
     'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-101.jpg',
      24680, '2019-01-01', 7.5, 'regulier');
INSERT INTO Vehicule (plaqueImmatriculation, marque, modele, nomEmplacement,imageV1, imageV2, odometre, miseEnService, consommation, type)
    VALUES ('Q13 JVR', 'Ford', 'Fiesta', 'Québec',
         'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-111.jpg',
     'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-101.jpg',
      18000, '2020-01-01', 7.60, 'regulier');
INSERT INTO Vehicule (plaqueImmatriculation, marque, modele, nomEmplacement, imageV1, imageV2, odometre, miseEnService, consommation, type)
    VALUES ('M22 GDJ', 'Honda', 'Insight', 'Laval',
         'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-111.jpg',
     'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-101.jpg',
      110000, '2014-01-01', 3.4, 'hybride');
INSERT INTO Vehicule (plaqueImmatriculation, marque, modele, nomEmplacement, imageV1, imageV2, odometre, miseEnService, consommation, type)
    VALUES ('Y07 KHR', 'Honda', 'Insight', 'Sherbrooke',
         'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-111.jpg',
     'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-101.jpg',
      12400, '2021-01-01', 3.6, 'hybride');
INSERT INTO Vehicule (plaqueImmatriculation, marque, modele, nomEmplacement, imageV1, imageV2, odometre, miseEnService, consommation, type)
    VALUES ('X99 NJI', 'Ford', 'Transit', null,
         'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-111.jpg',
     'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-101.jpg',
      76240, '2017-01-01', 12.6, 'miniCamionette');
INSERT INTO Vehicule (plaqueImmatriculation, marque, modele, nomEmplacement, imageV1, imageV2, odometre, miseEnService, consommation, type)
    VALUES ('W03 XBF', 'Ford', 'Transit', null,
         'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-111.jpg',
     'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-101.jpg',
      62900, '2018-01-01', 12.7, 'miniCamionette');
INSERT INTO Vehicule (plaqueImmatriculation, marque, modele, nomEmplacement, imageV1, imageV2, odometre, miseEnService, consommation, type)
    VALUES ('MER XBF', 'Mercedes', 'AMG', null,
         'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-111.jpg',
     'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-101.jpg',
      62900, '2018-01-01', 12.7, 'regulier');
INSERT INTO Vehicule (plaqueImmatriculation, marque, modele, nomEmplacement, imageV1, imageV2, odometre, miseEnService, consommation, type)
    VALUES ('LAM XBF', 'Lamborghini', 'Huracan', null,
         'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-111.jpg',
     'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-101.jpg',
      62900, '2018-01-01', 12.7, 'regulier');
INSERT INTO Vehicule (plaqueImmatriculation, marque, modele, nomEmplacement, imageV1, imageV2, odometre, miseEnService, consommation, type)
    VALUES ('FER XBF', 'Ferrari', '812', null,
     'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-111.jpg',
     'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-101.jpg',
      62900, '2018-01-01', 12.7, 'regulier');
INSERT INTO Vehicule (plaqueImmatriculation, marque, modele, nomEmplacement, imageV1, imageV2, odometre, miseEnService, consommation, type)
    VALUES ('MCL XBF', 'McLaren', '720 S', null,
    'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-111.jpg',
     'https://hips.hearstapps.com/amv-prod-cad-assets.s3.amazonaws.com/wp-content/uploads/2016/02/2016-Lamborghini-Huracan-LP610-4-Spyder-101.jpg',
       62900,'2018-01-01', 12.7, 'regulier');

INSERT INTO Assurance VALUES ('ABCDE12345', 'P25 DRF', '2022-05-01', '2023-05-01', 'AssureAuto');
INSERT INTO Assurance VALUES ('ATCBE81673', 'H14 FLA', '2022-12-01', '2023-12-01', 'PolyAssure');
INSERT INTO Assurance VALUES ('ABCDF12348', 'Q13 JVR', '2023-02-01', '2024-02-01', 'AssureAuto');
INSERT INTO Assurance VALUES ('ABBDE12545', 'M22 GDJ', '2022-09-22', '2023-09-22', 'AssureAuto');
INSERT INTO Assurance VALUES ('ABCEB12185', 'Y07 KHR', '2023-02-16', '2024-02-16', 'AssureAuto');
INSERT INTO Assurance VALUES ('BCCDE14345', 'X99 NJI', '2023-04-14', '2024-04-14', 'AssureAuto');
INSERT INTO Assurance VALUES ('ABCEE19345', 'W03 XBF', '2022-04-20', '2023-04-20', 'AssureAuto');

INSERT INTO Membre (nom, prenom, nomEmplacement, mdp, numero, rue, ville, codePostal, numeroCompteBanque, nomBanque, addrElectronique, age, dernierAccident, permisConduite)
    VALUES ('Pierre', 'Samuel', 'Laval', 'Password1', '116', 'Rue Cousineau', 'Laval', 'H7G 3J5', '4539274033452378', 'PolyBank', 'samuel.pierre@polymtl.ca', 35, NULL, 'P1234-123456-12');
INSERT INTO Membre (nom, prenom, nomEmplacement, mdp, numero, rue, ville, codePostal, numeroCompteBanque, nomBanque, addrElectronique, age, dernierAccident, permisConduite)
    VALUES ('Petibon', 'Romuald', 'Ahuntsic', 'abc123!', '1000', 'Av. Émile-Journault', 'Montréal', 'H2M 2E7', '4539286395717621', 'PolyBank', 'romuald_petibon@gmail.com', 21, NULL, 'P5678-789012-34');
INSERT INTO Membre (nom, prenom, nomEmplacement, mdp, numero, rue, ville, codePostal, numeroCompteBanque, nomBanque, addrElectronique, age, dernierAccident, permisConduite)
    VALUES ('Raster', 'Jacques', 'Trois-Rivières', 'wBuFa%o92$s!MoZ', '4245', 'Bd des Récollets', 'Trois-Rivières', 'G9A 6M1', '4539650337486427', 'PolyBank', 'jacras@videotron.com', 48, '2020-02-14', 'R9012-345678-56');
INSERT INTO Membre (nom, prenom, nomEmplacement, mdp, numero, rue, ville, codePostal, numeroCompteBanque, nomBanque, addrElectronique, age, dernierAccident, permisConduite)
    VALUES ('Cochet', 'Alissa', 'Québec', 'Alissa16', '810', 'Grande Allée O', 'Québec', 'G1R 2H1', '4539365277059190', 'PolyBank', 'alissa16@yahoo.com', 24, '2023-04-01', 'C3456-901234-78');
INSERT INTO Membre (nom, prenom, nomEmplacement, mdp, numero, rue, ville, codePostal, numeroCompteBanque, nomBanque, addrElectronique, age, dernierAccident, permisConduite)
    VALUES ('Badere', 'Marc', 'Ahuntsic', 'Password2', '200', 'Bd Crémazie O', 'Montréal', 'H2P 1C6', '4539312431588540', 'PolyBank', 'marcBadere@gmail.com', 49, NULL, 'B7890-567890-90');
INSERT INTO Membre (nom, prenom, nomEmplacement, mdp, numero, rue, ville, codePostal, numeroCompteBanque, nomBanque, addrElectronique, age, dernierAccident, permisConduite)
    VALUES ('Simard', 'Simon', 'Ahuntsic', 'idkMaybeDucks', '9534', 'Av. De Chateaubriand', 'Montréal', 'H2M 1Y4', '4539844872928091', 'PolyBank', 'simon.simard@gmail.com', 18, '2022-10-31', 'S2345-234567-23');
INSERT INTO Membre (nom, prenom, nomEmplacement, mdp, numero, rue, ville, codePostal, numeroCompteBanque, nomBanque, addrElectronique, age, dernierAccident, permisConduite)
    VALUES ('Doe', 'John', 'Sherbrooke', '1Mouthwash', '810', 'Rue du Conseil', 'Sherbrooke', 'J1G 1L3', '4539396443177664', 'PolyBank', 'johndoe@gmail.com', 28, '2023-01-01', 'D4567-456789-45');
INSERT INTO Membre (nom, prenom, nomEmplacement, mdp, numero, rue, ville, codePostal, numeroCompteBanque, nomBanque, addrElectronique, age, dernierAccident, permisConduite)
    VALUES ('Smith', 'Emily', 'Québec', 'bestGPANorthAmerica4.0', '855', 'Av. Holland', 'Québec', 'G1S 3S5', '4539577622158170', 'ETSBank', 'emily.smith@yahoo.com', 43, NULL, 'S7415-952346-82');
INSERT INTO Membre (nom, prenom, nomEmplacement, mdp, numero, rue, ville, codePostal, numeroCompteBanque, nomBanque, addrElectronique, age, dernierAccident, permisConduite)
    VALUES ('Jones', 'Jacob', 'Trois-Rivières', 'caillouRoche13', '995', 'Rue St Prosper', 'Trois-Rivières', 'G9A 3V7', '4539299982231035', 'PolyBank', 'jacob.jones@hotmail.com', 37, '2006-12-31', 'J7139-976431-41');
INSERT INTO Membre (nom, prenom, nomEmplacement, mdp, numero, rue, ville, codePostal, numeroCompteBanque, nomBanque, addrElectronique, age, dernierAccident, permisConduite)
    VALUES ('Wilson', 'Anna', 'Ahuntsic', 'insertNameOfFirstDog', '2005', 'Rue Victor Doré', 'Montréal', 'H3M 1S4', '4539923021869865', 'PolyBank', 'anna.wilson@outlook.com', 22, NULL, 'W8246-624855-96');

INSERT INTO MembreCoop VALUES (1, 1200);
INSERT INTO MembreCoop VALUES (2, 750);
INSERT INTO MembreCoop VALUES (3, 3300);
INSERT INTO MembreCoop VALUES (4, 400);
INSERT INTO MembreCoop VALUES (5, 3270);

INSERT INTO MembreAutopartage (mId, cotisationAnnuelle) VALUES (6, 280);
INSERT INTO MembreAutopartage (mId, cotisationAnnuelle) VALUES (7, 150);
INSERT INTO MembreAutopartage (mId, cotisationAnnuelle) VALUES (8, 900);
INSERT INTO MembreAutopartage (mId, cotisationAnnuelle) VALUES (9, 1200);
INSERT INTO MembreAutopartage (mId, cotisationAnnuelle) VALUES (10, 300);

INSERT INTO Reservation VALUES ('RSV0001', '2022-05-01 10:00:00', '2022-05-03 10:00:00', 'Équippé d''un siège bébé', 'P25 DRF', 4);
INSERT INTO Reservation VALUES ('RSV0002', '2022-06-15 14:30:00', '2022-06-17 14:30:00', 'Vaulant chauffant', 'Y07 KHR', 1);
INSERT INTO Reservation VALUES ('RSV0003', '2023-04-01 10:00:00', '2023-04-03 09:15:00', NULL, 'P25 DRF', 4);
INSERT INTO Reservation VALUES ('RSV0004', '2023-04-10 18:45:00', '2023-04-12 18:45:00', 'GPS intégré', 'M22 GDJ', 2);
INSERT INTO Reservation VALUES ('RSV0005', '2023-01-22 9:00:00', '2023-01-22 12:00:00', 'équippé d''un porte-vélo', 'H14 FLA', 6);
INSERT INTO Reservation VALUES ('RSV0006', '2023-10-11 08:30:00', '2023-10-14 08:30:00', NULL, 'X99 NJI', 3);

INSERT INTO Facture VALUES ('FAC0001', 4, '2022-05-03 10:00:00','2022-06-03 10:00:00', 'payed');
INSERT INTO Facture VALUES ('FAC0002', 1, '2022-06-17 14:30:00','2022-07-17 14:30:00', 'payed');
INSERT INTO Facture VALUES ('FAC0003', 4, '2023-04-03 09:15:00','2023-05-03 09:15:00', 'unpaid');
INSERT INTO Facture VALUES ('FAC0005', 2, '2023-04-12 18:45:00','2023-05-12 18:45:00', 'unpaid');
INSERT INTO Facture VALUES ('FAC0006', 6, '2023-01-03 12:00:00','2023-02-03 12:00:00', 'unpaid');
INSERT INTO Facture VALUES ('FAC0007', 3, '2023-10-14 08:30:00','2023-11-14 08:30:00', 'unpaid');

INSERT INTO Utilisation VALUES ('UTL0001', 100000, 110000, 'FAC0001','RSV0001');
INSERT INTO Utilisation VALUES ('UTL0002', 110000, 120000, 'FAC0001','RSV0001');
INSERT INTO Utilisation VALUES ('UTL0003', 120000, 130000, 'FAC0001','RSV0001');
INSERT INTO Utilisation VALUES ('UTL0004', 12400, 15000, 'FAC0002','RSV0002');
INSERT INTO Utilisation VALUES ('UTL0005', 130000, 150000, 'FAC0003','RSV0003');
INSERT INTO Utilisation VALUES ('UTL0006', 150000, 180000, 'FAC0003','RSV0003');
INSERT INTO Utilisation VALUES ('UTL0007', 110000, 140000, 'FAC0003','RSV0004');