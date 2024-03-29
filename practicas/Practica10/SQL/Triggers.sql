 ------------------------------ INVIERTE EL APELLIDO PATERNO CON EL APELLIDO MATERNO DE UN SUPERVISOR  ------------------------------

--Creamos un procedimiento que nos ayude a intercambiar los apellos de un Supervisor.
CREATE OR REPLACE PROCEDURE cambiaApellido(curpSup CHAR(18))
	AS $$
	DECLARE aPaterno varchar(50);
	DECLARE aMaterno varchar(50);
	BEGIN
    	IF NOT EXISTS (SELECT * FROM Supervisor WHERE curp = $1) THEN
	   		RAISE EXCEPTION 'El supervisor con curp % no existe', $1;
		ELSE
	 		SELECT paternoSup INTO aPaterno FROM Supervisor WHERE curp = $1;
		 	SELECT maternoSup INTO aMaterno FROM Supervisor WHERE curp = $1;
		  	UPDATE Supervisor SET paternoSup = aMaterno WHERE paternoSup = aPaterno;
		  	UPDATE Supervisor SET maternoSup = aPaterno WHERE maternoSup = aMaterno;
		END IF;
	END;
	$$
	LANGUAGE plpgsql;


-- Esta tabla almacenará el registro de los intercambios de apellidos.
CREATE TABLE registraCambios(
	id_reg INT GENERATED BY DEFAULT AS IDENTITY,
	nombreUsuario varchar(50),
	tipo varchar(50),
	fecha DATE,
	hora TIME,
	PRIMARY KEY(id_reg)
);


--Creamos la función que habrá de responder al disparador.
CREATE OR REPLACE FUNCTION check_apellidos() RETURNS TRIGGER
	AS $$
	BEGIN						   
		IF(TG_OP = 'UPDATE') THEN
			INSERT INTO registraCambios(nombreUsuario,tipo, fecha, hora) 
			VALUES (user,'se intercambiaron apellidos', current_date, current_time);
		END IF;
   	RETURN null;
	END;
	$$
	LANGUAGE plpgsql;
	
	
--Creamos el disparador;
CREATE OR REPLACE TRIGGER cambio_apellidos
	AFTER UPDATE 
	ON Supervisor
	FOR EACH ROW
	EXECUTE PROCEDURE check_apellidos();
	
	
-- Consulta la tabla de los Supervisores.	
SELECT * FROM Supervisor;

-- Prueba de intercambiar los apellidos de un supervisor (es el primero de la tabla)		.
CALL cambiaApellido ('CLBA382706QAFWXZEC');
							
-- Consulta la tabla de los registros.			
SELECT * FROM registraCambios;




-------------------------------------- EVITA MODIFICAR Y BORRAR EN LA TABLA MASCOTA --------------------------------------

--Creamos la función que habrá de responder al disparador.
CREATE OR REPLACE FUNCTION  check_operacion() RETURNS TRIGGER
	AS
	$$
	BEGIN
		IF TG_OP = 'UPDATE' THEN
			RAISE EXCEPTION 'NO SE PUEDE MODIFICAR LA TABLA DE LAS MASCOTAS';
		END IF;
		IF TG_OP = 'DELETE' THEN
			RAISE EXCEPTION 'NO SE PUEDE ELIMINAR EN LA TABLA DE LAS MASCOTAS';
		END IF;
		RETURN NULL;
	END;
	$$
	LANGUAGE plpgsql;

--Creamos el disparador;
CREATE OR REPLACE TRIGGER hacer_operacion
	AFTER UPDATE OR DELETE
	ON Mascota
	FOR EACH ROW
	EXECUTE PROCEDURE check_operacion();
	
	
-- Pruebas de modificar y borrar a una mascota		
UPDATE Mascota SET idMascota = 'KAR16' WHERE idMascota = 'JGI01';	
DELETE FROM Mascota WHERE idMascota = 'JGI01';
