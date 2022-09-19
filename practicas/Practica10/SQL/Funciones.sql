CREATE LANGUAGE plpgsql;

----------------------- FUNCIÓN QUE CALCULA LA EDAD -----------------------------

CREATE OR REPLACE FUNCTION calculaEdad(curp CHAR(18))
	RETURNS TEXT
	AS $$
	
	DECLARE anio INT;
	DECLARE mes INT;
	DECLARE dia INT;
	DECLARE anioActual INT;
	DECLARE mesActual INT;
	DECLARE diaActual INT;
	DECLARE edad INT;
	DECLARE edadTexto TEXT;
	
	BEGIN
	-- Obtenemos la fecha actual por partes
	anioActual :=  date_part('year', now());
	mesActual :=  date_part('month', now());
	diaActual :=  date_part('day', now());
	
	-- Obtenemos la fecha de nacimiento del cliente por partes
	dia := CAST((SUBSTRING ($1,9,2)) AS INT);
    mes := CAST((SUBSTRING ($1,7,2)) AS INT);
	IF  CAST((SUBSTRING ($1,5,1)) AS INT) > 0 THEN
		anio := 1900 + CAST((SUBSTRING ($1,5,2)) AS INT);
	ELSE
		anio := 2000 + CAST((SUBSTRING ($1,5,2)) AS INT);
	END IF;
	
	edad := anioActual - anio - 1;
	edadTexto := 'EDAD: ' || edad || ' años';
   
    IF mesActual >= mes THEN
        IF diaActual >= dia THEN
            edad := edad + 1;
	    	edadTexto := 'EDAD: ' || edad || ' años';
        END IF;
    END IF;
    RETURN edadTexto;
	END;
	$$
	LANGUAGE plpgsql;

-- Prueba de  edad
SELECT calculaEdad(CAST('ICMF970310HDFRRRAO' AS CHAR(18)));



----------------------- FUNCIÓN QUE CALCULA LOS INGRESOS -----------------------------

-- Está función se nos complicó a todo el equipo :CC, no entendimos muy bien cómo solucionarla debido a que implicaba acceder a muchas tablas
-- todo lo que teníamos nos mandaba error y sólo nos confundía más por eso decidimos quitarlo :c
