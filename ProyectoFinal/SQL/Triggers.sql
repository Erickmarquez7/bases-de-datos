DROP TABLE IF EXISTS Registros;


-- ****************** FUNCIONES Y PROCEDIMIENTOS AUXILIARES PARA DISPARADOR 1 ******************.

-----------------------------------------------------------------------
-- Función que nos ayuda a verificar si existe una Sucursal dado su id.
-----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION checaIdSucursal(id CHAR(13)) 
		RETURNS TEXT
		AS $$
		DECLARE bandera INT;
		BEGIN
			bandera := 2;
			IF(NOT EXISTS (SELECT * FROM Sucursal WHERE rfc = id)) THEN
				bandera := 1;
				RAISE EXCEPTION 'LA SUCURSAL CON ID % NO EXISTE', id;
			END IF;
			IF(bandera = 2) THEN
				RETURN $1;
			END IF;
		END;
		$$
		Language plpgsql;


-----------------------------------------------------------------------------------------------------
-- Función que nos ayuda a verificar que no se ingresen números o caracteres especiales en un nombre.
-----------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION checaNombres(nombre VARCHAR(50)) 
		RETURNS TEXT
		AS $$
		DECLARE bandera INT;
		BEGIN
			bandera := 2;
			IF(nombre ~ '[0-9]') THEN
				bandera := 1;
				RAISE EXCEPTION 'NO SE ACEPTAN DÍGITOS EN EL NOMBRE/APELLIDO';
			END IF;
			IF(nombre ~ '[^[:alnum:]]') THEN
				bandera := 1;
				RAISE EXCEPTION 'NO SE ACEPTAN CARACTERES ESPECIALES EN EL NOMBRE/APELLIDO';
			END IF;
			IF(bandera = 2) THEN
				RETURN $1;
			END IF;
		END;
		$$
		Language plpgsql;
	
-------------------------------------------------
-- Procedimiento que inserta a un nuevo Empleado.
-------------------------------------------------
CREATE OR REPLACE PROCEDURE insertEmpleado(curp IN CHAR(18), nombre IN VARCHAR(50), paterno IN VARCHAR(50), 
					                    materno IN VARCHAR(50), telefono in CHAR(10), calle IN VARCHAR(50), 
					                    numero IN CHAR(4), estado IN VARCHAR, cp IN CHAR(5), 
										email IN VARCHAR(50), rfc IN CHAR(13),  nSS IN CHAR(11),
										nacimiento IN DATE, salario IN FLOAT,fechaInicio IN DATE, 
					                    esEmpleado IN BOOLEAN)									   
    	AS $$
    	BEGIN
        	INSERT INTO Cliente(curp, nombre, paterno, materno, telefono, calle, numero, 
				                    estado, cp, email, rfc, nSS, nacimiento, salario,
				                    fechaInicio, esEmpleado) 
					                VALUES ($1, checaNombres($2), checaNombres($3), checaNombres($4),  
					                        $5, $6, $7, $8, $9, $10, checaIdSucursal($11), $12, $13, $14, $15, $16);
		END;
    	$$
		LANGUAGE plpgsql;
	
	

-- ******************************* DISPARADOR 1 *******************************


-----------------------------------------------------------------
-- Esta tabla almacenará todo registro de inserción de Empleados.
-----------------------------------------------------------------
CREATE TABLE Registros(
	id_reg INT GENERATED BY DEFAULT AS IDENTITY,
	nombreUsuario varchar(50),
	descripcion varchar(50),
	fecha DATE,
	hora TIME,
	PRIMARY KEY(id_reg)
);


----------------------------------------------------------------------------------------
-- Este disparador permite guardar en una tabla el registro de inserciones de Empleados.
----------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION registra_Empleado() RETURNS TRIGGER
	AS
	$$
	BEGIN
		IF TG_OP = 'INSERT' THEN 
			INSERT INTO Registros(nombreUsuario, descripcion, fecha, hora) 
			       VALUES (user,'se añadió a un nuevo empleado', current_date, current_time);
		END IF;
		RETURN NULL;
	END;
	$$
	LANGUAGE plpgsql;

------------------------------------------------------------------------------
-- Creamos el disparador que se lanzará cuando se inserte a un nuevo empleado.
------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER registra_insercion_Empleado
	AFTER INSERT OR UPDATE OR DELETE 
	ON Cliente
	FOR EACH ROW
	EXECUTE PROCEDURE registra_Empleado();
	

-- ******************************* PRUEBA DISPARADOR 1 *******************************

-- Consulta la tabla de los empleados.	
   SELECT * FROM Cliente WHERE esEmpleado = 'true';
	
-- Prueba de insertar de un nuevo empleado
-- Es robusto por lo que si en el nombre se ingresa algo como 'Jua@1' mandará error.
    CALL insertEmpleado(CAST('PADM330696GRRRGTAO' AS CHAR(18)), CAST('Juan' AS VARCHAR(50)), CAST('Castillo' AS VARCHAR(50)), 
			 CAST('Pérez' AS VARCHAR(50)), CAST('5573216848' AS CHAR(10)), CAST('San Agustín' AS VARCHAR(50)),
			 CAST('6091' AS CHAR(4)), CAST('CDMX' AS VARCHAR), CAST('56520' AS CHAR(5)), CAST('JuanCP@gmail.com' AS VARCHAR(50)),
			 CAST('BEDD701029NQM' AS CHAR(13)), CAST('47017492743' AS CHAR(11)), CAST('16-04-1999' AS DATE), CAST(1500.00 AS FLOAT), 
			 CAST('10-03-2021' AS DATE), CAST('true' AS BOOLEAN));	

-- Consulta la tabla de registro de inserción de empleados.	
   SELECT * FROM Registros;




	
------------------------------------------------------------------------------------------------------------------------------------------



-- ****************** FUNCIÓN AUXILIAR PARA DISPARADOR 2 ******************.

--------------------------------------------------------------------------------
-- Función que nos ayuda a saber si dada una alcaldía ya hay sucursales en ella.
--------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION existeAlcaldia(alcaldiaS VARCHAR(50)) 
		RETURNS BOOLEAN
		AS $$
		DECLARE bandera boolean;
		BEGIN
			IF(NOT EXISTS (SELECT * FROM Sucursal WHERE alcaldia = alcaldiaS)) THEN
				bandera := false;
			ELSE 
				bandera := true;
			END IF;
			RETURN bandera;
		END;
		$$
		Language plpgsql;
	


-- ******************************* DISPARADOR 2 *******************************


-------------------------------------------------------------------------------------------
-- Este disparador permite verificar que no se ingrese una sucursal en la misma alcaldía.
-- También NO permite que se elimine información en una Sucursal ya que sería algo delicado.
-------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION check_Operaciones_Sucursal() RETURNS TRIGGER
	AS
	$$
	BEGIN
   		IF(TG_OP = 'INSERT') THEN
			IF(existeAlcaldia(NEW.alcaldia) = true) THEN
				RAISE EXCEPTION 'YA EXISTE UNA SUCURSAL EN LA ALCALDÍA %', NEW.alcaldia;
			END IF;
		END IF;
		IF TG_OP = 'DELETE' THEN
			RAISE EXCEPTION 'NO SE PUEDE ELIMINAR INFORMACIÓN DE UNA SUCURSAL';
		END IF;
		RETURN NULL;
	END;
	$$
	LANGUAGE plpgsql;


---------------------------------------------------------------------------------
-- Creamos el disparador que se lanzará cuando se inserte o elimine una Sucursal.
---------------------------------------------------------------------------------
CREATE TRIGGER check_Sucursal
	BEFORE INSERT OR DELETE
	ON Sucursal
	FOR EACH ROW
	EXECUTE PROCEDURE check_Operaciones_Sucursal();
	
	
-- ******************************* PRUEBA DISPARADOR 2 *******************************


-- Intentamos insertar una sucursal con una alcaldía ya existente.
	INSERT INTO Sucursal (rfc, idInventario, nombre, calle, alcaldia, cp, estado, numero, email, telefono) 
	VALUES ('DDKK106628NCS', 'IN49743690', 'TacoLoco', 'Vicente Guerrero', '29 Briar Crest Drive', 56527, 'CDMX', 4560, 'tacoloko@gmail.com', 5512235691);
	
-- Intentamos eliminar una sucursal.
	DELETE FROM Sucursal WHERE rfc = 'BEDD701029NQM';
	