SET search_path = Carpooling;

-- Retournez la marque, le modèle et l’emplacement d’origine des véhicules
SELECT marque, modele, nomEmplacement
FROM Vehicule
WHERE nomEmplacement IS NOT NULL;

-- Retournez la marque, le modèle et l’emplacement d’origine des véhicules y compris les
-- marques et modèles qui n’ont pas de localisation 
SELECT marque, modele, nomEmplacement
FROM Vehicule;

-- Retournez les emplacements sans véhicules 
SELECT * 
FROM Emplacement e
WHERE e.nbrVehicules = 0;

-- Retournez tous les véhicules dont le domicile est situé dans la ville de Montréal
SELECT * 
FROM Vehicule
WHERE nomEmplacement IN (
	SELECT nomEmplacement
	FROM Emplacement
	WHERE ville = 'Montréal'
);


-- Retournez les emplacements et le nombre de voitures hybrides à chaque emplacement
SELECT e.*, COUNT(CASE WHEN type = 'hybride' THEN 1 END) AS nbVoituresHybrides
FROM Emplacement e
LEFT JOIN Vehicule v ON v.nomEmplacement = e.nomEmplacement
GROUP BY e.nomEmplacement;


-- Retournez les plaques d’immatriculation des véhicules qui ont été utilisés (pas seulement
-- réservés) 
SELECT DISTINCT v.plaqueImmatriculation 
FROM Vehicule v, Utilisation u, Reservation r 
WHERE(v.plaqueImmatriculation = r.vehiculeId) AND (r.reservationId = u.reservationId);


-- Retournez toutes les informations des membres (personnes physiques) vivant dans une
-- ville avec un emplacement qui a des voitures hybrides
SELECT * 
FROM Membre 
WHERE ville IN(
	SELECT ville
	FROM Emplacement e
	LEFT JOIN Vehicule v ON v.nomEmplacement = e.nomEmplacement
	WHERE (type = 'hybride')
);

-- Retournez toutes les informations des véhicules à l’emplacement Montréal qui sont libres
-- le 23/01/2023 à 10 h
SELECT * 
FROM Vehicule
WHERE nomEmplacement IN (
	SELECT nomEmplacement
	FROM Emplacement
	WHERE ville = 'Montréal'
) AND plaqueImmatriculation NOT IN (
	SELECT vehiculeId
	FROM Reservation
	WHERE reservationStart < '2023-01-23 10:00:00' AND
	reservationEnd > '2023-01-23 10:00:00'
);

-- Retournez les plaques d’immatriculation et le nombre de réservations de chaque véhicule
-- (y compris ceux sans réservation, c’est-à-dire que le nombre de réservations est 0)
SELECT plaqueImmatriculation, COUNT(reservationId) AS "nbReservations"
FROM Vehicule v
LEFT JOIN Reservation r ON v.plaqueImmatriculation = r.vehiculeId
GROUP BY plaqueImmatriculation;

-- Quel est le véhicule avec la consommation de carburant la plus élevée ?
SELECT *
FROM Vehicule
WHERE consommation = (
	SELECT MAX(consommation) 
	FROM Vehicule
);

-- Retournez la consommation de carburant maximale, moyenne et minimale par catégorie
-- de véhicule
SELECT type,
MAX(consommation) AS consommationMax,
ROUND(AVG(consommation), 2) AS consommationMoyenne,
MIN(consommation) AS consommationMin
FROM Vehicule 
GROUP BY type;

-- Retournez tous les membres qui ont réservé un véhicule à un endroit autre que leur
-- emplacement d’origine même si le type de véhicule existe à leur emplacement d’origine
SELECT DISTINCT m.*
FROM Membre m
JOIN Reservation r ON m.mId = r.mId
JOIN Vehicule v ON r.vehiculeId = v.plaqueImmatriculation
WHERE m.nomEmplacement != v.nomEmplacement;