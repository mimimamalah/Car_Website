DROP SCHEMA IF EXISTS Carpooling CASCADE;
CREATE SCHEMA Carpooling;

SET search_path = Carpooling;

CREATE TABLE IF NOT EXISTS Emplacement (
	nomEmplacement			VARCHAR(20) NOT NULL,
    numero                  VARCHAR(6) NOT NULL,
    rue                     VARCHAR(40) NOT NULL,
    ville                   VARCHAR(20) NOT null,
    codePostal              CHAR(7) NOT NULL,
	carte					VARCHAR(30) NOT NULL,
	nbStationnements		INT NOT NULL,	
	nbrVehicules            INT NOT NULL CHECK(nbrVehicules < nbStationnements),
	PRIMARY KEY (nomEmplacement),
	CHECK (nbStationnements > 0)
);

CREATE TABLE IF NOT EXISTS TypeVehicule (
	type					VARCHAR(15) NOT NULL CHECK ( type IN ('hybride', 'regulier', 'miniCamionette')),
    prixHoraire             NUMERIC(5,2),
    prixKilometre           NUMERIC(3,2),
    limiteOdometre          INT,
	recharge				NUMERIC CHECK (recharge > 0),
	PRIMARY KEY (type)
);


CREATE TABLE IF NOT EXISTS Vehicule (
	plaqueImmatriculation	VARCHAR(10) NOT NULL,
    marque                  VARCHAR(15) NOT NULL,
    modele                  VARCHAR(15) NOT NULL,
	nomEmplacement			VARCHAR(20) DEFAULT NULL,
	rating					NUMERIC(2,1) DEFAULT 0 CHECK (rating >= 0 AND rating <= 5),
	odometre				INT NOT NULL CHECK (odometre > 0),
	miseEnService 			DATE NOT NULL CHECK (miseEnService > '1900-01-01'),
	consommation			NUMERIC(4,2) NOT NULL CHECK (consommation > 0),
	type					VARCHAR(15) NOT NULL CHECK ( type IN ('hybride', 'regulier', 'miniCamionette')),
	PRIMARY KEY (plaqueImmatriculation),
	FOREIGN KEY (nomEmplacement) REFERENCES Emplacement ON DELETE SET NULL,
	FOREIGN KEY (type) REFERENCES TypeVehicule ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS Assurance (
    numAssurance			VARCHAR(15) NOT NULL,
    plaqueImmatriculation   VARCHAR(10) NOT NULL,
	debutAssurance			DATE NOT NULL,
	echeanceAssurance		DATE NOT NULL CHECK (echeanceAssurance > debutAssurance),
	assureur 				VARCHAR(15) NOT NULL,
    PRIMARY KEY (numAssurance),
    FOREIGN KEY (plaqueImmatriculation) REFERENCES Vehicule
);

CREATE TABLE IF NOT EXISTS Membre (
    mId						SERIAL NOT NULL,
	nom						VARCHAR(20) NOT NULL,
	prenom					VARCHAR(20) NOT NULL,
    nomEmplacement          VARCHAR(20) NOT NULL,
    mdp						VARCHAR(25) NOT NULL,
    numero                  VARCHAR(6) NOT NULL,
    rue                     VARCHAR(40) NOT NULL,
    ville                   VARCHAR(20) NOT null,
    codePostal              CHAR(7) NOT NULL,
    numeroCompteBanque		CHAR(16) NOT NULL,
	nomBanque				VARCHAR(20) NOT NULL,
    addrElectronique		VARCHAR(30) NOT NULL,
    age						INT NOT NULL CHECK (age >= 18),
    dernierAccident         DATE DEFAULT NULL,
    permisConduite          CHAR(15) NOT NULL,
    PRIMARY KEY (mId),
    FOREIGN KEY (nomEmplacement) REFERENCES Emplacement ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS MembreCoop (
	mId						SERIAL NOT NULL,
	montantParts			INT NOT NULL CHECK (montantParts > 0),
	PRIMARY KEY (mId),
    FOREIGN KEY (mId) REFERENCES Membre ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS MembreAutopartage (
	mId						SERIAL,
	cotisationAnnuelle		NUMERIC(7,2) NOT NULL CHECK (cotisationAnnuelle > 0),
	reductionCotisation		NUMERIC(7,2) DEFAULT 0 CHECK (reductionCotisation < cotisationAnnuelle),
	PRIMARY KEY (mId),
    FOREIGN KEY (mId) REFERENCES Membre ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS MembreGold (
	mId						SERIAL NOT NULL,
	montantParts			INT NOT NULL CHECK (montantParts > 0),
	cotisationAnnuelle		NUMERIC(7,2) NOT NULL CHECK (cotisationAnnuelle > 0),
	reductionCotisation		NUMERIC(7,2) DEFAULT 0 CHECK (reductionCotisation < cotisationAnnuelle),
	PRIMARY KEY (mId),
	FOREIGN KEY (mId) REFERENCES Membre ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS MembreSilver (
	mId						SERIAL NOT NULL,
	montantParts			INT NOT NULL CHECK (montantParts > 0),
	cotisationAnnuelle		NUMERIC(7,2) NOT NULL CHECK (cotisationAnnuelle > 0),
	reductionCotisation		NUMERIC(7,2) DEFAULT 0 CHECK (reductionCotisation < cotisationAnnuelle),
	PRIMARY KEY (mId),
	FOREIGN KEY (mId) REFERENCES Membre ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS MembreBronze (
	mId						SERIAL NOT NULL,
	montantParts			INT NOT NULL CHECK (montantParts > 0),
	cotisationAnnuelle		NUMERIC(7,2) NOT NULL CHECK (cotisationAnnuelle > 0),
	reductionCotisation		NUMERIC(7,2) DEFAULT 0 CHECK (reductionCotisation < cotisationAnnuelle),
	PRIMARY KEY (mId),
	FOREIGN KEY (mId) REFERENCES Membre ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS MembrePlatinium (
	mId						SERIAL NOT NULL,
	montantParts			INT NOT NULL CHECK (montantParts > 0),
	cotisationAnnuelle		NUMERIC(7,2) NOT NULL CHECK (cotisationAnnuelle > 0),
	reductionCotisation		NUMERIC(7,2) DEFAULT 0 CHECK (reductionCotisation < cotisationAnnuelle),
	PRIMARY KEY (mId),
	FOREIGN KEY (mId) REFERENCES Membre ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TYPE bill_status AS ENUM ('payed', 'unpaid');

CREATE TABLE IF NOT EXISTS Facture (
	uniqueId 				VARCHAR(8),
    mId                     SERIAL,
	dateFacturation			DATE NOT NULL,
	dateEcheance			DATE NOT NULL,
	statut					bill_status NOT NULL ,
	PRIMARY KEY (uniqueId),
    FOREIGN KEY (mId) REFERENCES Membre
);

CREATE TABLE IF NOT EXISTS Reservation (
	reservationId			VARCHAR(8),
	reservationStart		TIMESTAMP,
    reservationEnd			TIMESTAMP
	CHECK (reservationEnd > reservationStart),
	exigencesSup			VARCHAR(50),
	vehiculeId				VARCHAR(10),	
	mId						SERIAL,
	PRIMARY KEY (reservationId),
	FOREIGN KEY (vehiculeId)	REFERENCES Vehicule,
	FOREIGN KEY (mId) REFERENCES Membre
);

CREATE TABLE IF NOT EXISTS Utilisation (
	utilisationId			VARCHAR(8),
	odometreInit			INT NOT NULL,
	odometreFinal			INT NOT NULL,
    uniqueId                VARCHAR(8) NOT NULL,
	reservationId			VARCHAR(8) NOT NULL,
	PRIMARY KEY (utilisationId),
    FOREIGN KEY (uniqueId) REFERENCES Facture,
	FOREIGN KEY (reservationId) REFERENCES Reservation
);
