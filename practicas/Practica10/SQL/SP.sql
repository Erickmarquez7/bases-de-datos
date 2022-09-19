CREATE LANGUAGE plpgsql;

--------------------------------------- REGISTRA A UN VETERINARIO --------------------------------------- 

    CREATE OR REPLACE PROCEDURE addVeterinario(curp IN CHAR(18), idClinia IN CHAR(5),
                       			       		   nombre IN VARCHAR(50), paterno IN VARCHAR(50), 
					                           materno IN VARCHAR(50), calle IN TEXT, 
					                           numero IN CHAR(4), estado IN VARCHAR, 
					                           cp IN CHAR(5), genero IN CHAR(1), 
					                           nacimiento IN DATE, telefono in CHAR(10),
                        		               salario IN FLOAT, rfc IN CHAR(13), 
					                           numPacientes IN INT, horarioInicio IN TIME, 
					                           horarioFin IN TIME)									   
    	AS $$
    	BEGIN
        	INSERT INTO Veterinario(curp, idClinica, nombre, paterno, materno, calle, numero, 
				                    estado, cp, genero, nacimiento, telefono, salario, rfc, 
				                    numPacientes, horarioInicio, horarioFin) 
					                VALUES ($1, $2, checaNombres($3), checaNombres($4), checaNombres($5),  
					                        $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17);
		END;
    	$$
		LANGUAGE plpgsql;
	
	
-- Consulta la tabla de los veterinarios.	
	SELECT * FROM Veterinario;
	
	
-- Prueba de insertar a un veterinario
    CALL addVeterinario (CAST('juan160401pkplarcx' AS CHAR(18)), CAST('ZOA37' AS CHAR(5)), CAST('Juan' AS VARCHAR(50)), CAST('Pardo' AS VARCHAR(50)), 
			 CAST('Castillo' AS VARCHAR(50)), CAST('San Agustín' AS VARCHAR), CAST('6091' AS CHAR(4)), CAST('México' AS VARCHAR), 
			 CAST('56520' AS CHAR(5)), CAST('M' AS CHAR(1)), CAST('2001-04-16' AS DATE), CAST('5573216848' AS CHAR(10)), CAST(1500.00 AS FLOAT), 
			 CAST('AJUN9427987PCT' AS CHAR(13)), CAST(15 AS INT), CAST('8:00:00' AS TIME), CAST('5:00:00' AS TIME));
	
		
	

---------------------------------------  ELIMINA A UN VETERINARIO --------------------------------------- 

	CREATE OR REPLACE PROCEDURE deleteVeterinario(curpVet IN CHAR(18))
    		AS $$
			BEGIN
				IF NOT EXISTS (SELECT * FROM Veterinario WHERE curp = $1) THEN
					RAISE EXCEPTION 'El veterinario con curp % no existe', $1;
				ELSE
					DELETE FROM Veterinario WHERE curp = $1;
				END IF;
    		END;
			$$
	    	Language plpgsql;	
	
-- Prueba de eliminar a un veterinario.	
	CALL deleteVeterinario(CAST('juan160401pkplarcx' AS CHAR(18)));
	
-- Consulta a la tabla de los veterinarios.	
	SELECT * FROM Veterinario;	
	
	
	
-- **************** Función auxiliar que ayuda a verificar que no se ingresen números o caracteres especiales ****************
	CREATE OR REPLACE FUNCTION checaNombres(nombreCheck VARCHAR(50)) 
		RETURNS TEXT
		AS $$
		DECLARE bandera INT;
		BEGIN
			bandera := 2;
			IF(nombreCheck ~ '[0-9]') THEN
				bandera := 1;
				RAISE EXCEPTION 'NO SE ACEPTAN DÍGITOS EN EL NOMBRE/APELLIDO';
			END IF;
			IF(nombreCheck ~ '[^[:alnum:]]') THEN
				bandera := 1;
				RAISE EXCEPTION 'NO SE ACEPTAN CARACTERES ESPECIALES EN EL NOMBRE/APELLIDO';
			END IF;
			IF(bandera = 2) THEN
				RETURN $1;
			END IF;
		END;
		$$
		Language plpgsql;
	