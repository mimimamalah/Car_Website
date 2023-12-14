SET search_path = Carpooling;

-- crée une table AVENDRE et qui insère les informations d’un véhicule 
-- dès que la valeur d’odomètre spécifique au type de véhicule est atteinte
CREATE OR REPLACE FUNCTION odometre_max_Vehicule() RETURNS TRIGGER AS $$
DECLARE 
	limOdometre INT;
	BEGIN	
		SELECT limiteOdometre INTO limOdometre FROM TypeVehicule WHERE type = NEW.type;
		IF(NEW.odometre >= limOdometre) THEN
		CREATE TABLE IF NOT EXISTS AVENDRE (
				plaqueImmatriculation	VARCHAR(10) NOT NULL,
				marque                  VARCHAR(15) NOT NULL,
				modele                  VARCHAR(15) NOT NULL,
				nomEmplacement			VARCHAR(20) DEFAULT NULL,
				odometre				INT NOT NULL CHECK (odometre > 0),
				miseEnService 			DATE NOT NULL CHECK (miseEnService > '1900-01-01'),
				consommation			NUMERIC(4,2) NOT NULL CHECK (consommation > 0),
				type					VARCHAR(15) NOT NULL CHECK ( type IN ('hybride', 'regulier', 'miniCamionette')),
				PRIMARY KEY (plaqueImmatriculation),
				FOREIGN KEY (nomEmplacement) REFERENCES Emplacement ON DELETE SET NULL,
				FOREIGN KEY (type) REFERENCES TypeVehicule ON UPDATE CASCADE ON DELETE RESTRICT
			);
		INSERT INTO AVENDRE (plaqueImmatriculation,marque,modele,nomEmplacement,
							 odometre,miseEnService,consommation,type) 
							 VALUES (NEW.plaqueImmatriculation,NEW.marque,
									 NEW.modele,NEW.nomEmplacement,NEW.odometre,
									 NEW.miseEnService,NEW.consommation,NEW.type);
		END IF;
		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;	

CREATE OR REPLACE TRIGGER odometre_max_Vehicule 
AFTER UPDATE ON Vehicule 
FOR EACH ROW EXECUTE PROCEDURE odometre_max_Vehicule();

-- déclencheurs supplémentaires

CREATE OR REPLACE FUNCTION set_reduction_cotisation() RETURNS TRIGGER AS $$
    BEGIN
        IF (SELECT age FROM Membre WHERE mId = NEW.mId) >= 25 AND 
            ((SELECT dernierAccident FROM Membre WHERE mId = NEW.mId) IS NULL OR 
            (CURRENT_DATE - (SELECT dernierAccident FROM Membre WHERE mId = NEW.mId) > 365)) THEN
            NEW.reductionCotisation := NEW.cotisationAnnuelle * 0.10;
        END IF;
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER reduction_cotisation BEFORE INSERT OR UPDATE ON MembreAutopartage
FOR EACH ROW EXECUTE FUNCTION set_reduction_cotisation();

-- modifie le nombre de véhicules dans un emplacement lorsqu'on insère ou supprime un véhicule à cet emplacement 
CREATE OR REPLACE FUNCTION add_nbrVehicule_Emplacement() RETURNS TRIGGER AS $$
	BEGIN
		IF (TG_OP = 'INSERT') THEN
			UPDATE Emplacement 
			SET nbrVehicules = nbrVehicules + 1
			WHERE nomEmplacement = NEW.nomEmplacement;
			RETURN NEW;
		ELSIF (TG_OP = 'DELETE') THEN
			UPDATE Emplacement 
			SET nbrVehicules = nbrVehicules - 1
			WHERE nomEmplacement = OLD.nomEmplacement;
			RETURN NEW;
		END IF;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER add_nbrVehicule_Emplacement 
AFTER INSERT OR DELETE ON Vehicule 
FOR EACH ROW EXECUTE PROCEDURE add_nbrVehicule_Emplacement();

-- modifie l'odomètre d'un véhicule lorsqu'on l'utilise
CREATE OR REPLACE FUNCTION odometre_Vehicule() RETURNS TRIGGER AS $$
	BEGIN
		UPDATE Vehicule v
		SET odometre = NEW.odometreFinal
		WHERE plaqueImmatriculation = (
		SELECT vehiculeID FROM Reservation  
			WHERE reservationId = NEW.reservationID);
		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER odometre_Vehicule 
AFTER INSERT ON Utilisation 
FOR EACH ROW EXECUTE PROCEDURE odometre_Vehicule();



