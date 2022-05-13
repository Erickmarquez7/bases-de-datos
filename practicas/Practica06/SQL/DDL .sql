DROP SCHEMA IF EXISTS public CASCADE;

CREATE SCHEMA public;

/* 
	Tablas Llave Primaria Normal
*/

--Supervisor
CREATE TABLE Supervisor(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) CHECK(curp SIMILAR TO '[a-z]{4}[0-9]{6}[a-z]{8}') UNIQUE,
	nombreSup VARCHAR(50) NOT NULL CHECK(nombreSup <> ''),
	paternoSup VARCHAR(50) NOT NULL CHECK(paternoSup <> ''),
	maternoSup VARCHAR(50) NOT NULL CHECK(maternoSup <> ''),
	calleSup VARCHAR NOT NULL CHECK(calleSup <> ''),
	numeroSup CHAR(4) NOT NULL CHECK(numeroSup SIMILAR TO '[0-9]{4}'),
	estadoSup VARCHAR NOT NULL CHECK(estadoSup <> ''),
	cpSup CHAR(5) NOT NULL CHECK(cpSup SIMILAR TO '[0-9]{5}'),
	generoSup CHAR(1) NOT NULL CHECK(generoSup = 'M' OR generoSup = 'F'),
	nacimientoSup DATE NOT NULL CHECK(nacimientoSup > '1950-01-01' AND nacimientoSup < '2022-12-31'),
	telefonoSup CHAR(10) NOT NULL CHECK(telefonoSup SIMILAR TO '[0-9]{10}'),
	salarioSup FLOAT NOT NULL CHECK(salarioSup > 0),
	rfcSup CHAR(13) NOT NULL CHECK(CHAR_LENGTH(rfcSup) = 13)
);

--Clinica
CREATE TABLE Clinica(
	idClinica CHAR(5) NOT NULL CHECK(idClinica SIMILAR TO '[A-Z]{3}[0-9]{2}') UNIQUE,
	nombreCli VARCHAR(30) NOT NULL CHECK(nombreCli <> ''),
	calleCli VARCHAR NOT NULL CHECK(calleCli <> ''),
	estadoCli VARCHAR NOT NULL CHECK(estadoCli <> ''),
	cpCli CHAR(5) NOT NULL CHECK (cpCli SIMILAR TO '[0-9]{5}'),
	telefonoCli CHAR(10) NOT NULL CHECK(telefonoCli SIMILAR TO '[0-9]{10}'),
	horarioCli TIME NOT NULL
);

--Juguete
CREATE TABLE Juguete(
	idProducto CHAR(10) NOT NULL CHECK(CHAR_LENGTH(idProducto) = 10) UNIQUE ,
	nombre VARCHAR(30) NOT NULL CHECK(nombre <> ''),
	precio FLOAT NOT NULL CHECK(precio>0),
	numUnidades INT NOT NULL CHECK(numUnidades>0),
	descripcion VARCHAR NOT NULL CHECK(descripcion <> ''),
	nombreArchivo VARCHAR NOT NULL CHECK(nombreArchivo <> '')
);

--Accesorio
CREATE TABLE Accesorio(
	idProducto CHAR(10) NOT NULL CHECK(CHAR_LENGTH(idProducto) = 10) UNIQUE,
	nombre VARCHAR(30) NOT NULL CHECK(nombre <> ''),
	precio FLOAT NOT NULL CHECK(precio>0),
	numUnidades INT NOT NULL CHECK(numUnidades>0),
	descripcion VARCHAR NOT NULL CHECK(descripcion <> ''),
	nombreArchivo VARCHAR NOT NULL CHECK(nombreArchivo <> '')
);

--Medicamento
CREATE TABLE Medicamento(
	idProducto CHAR(10) NOT NULL CHECK(CHAR_LENGTH(idProducto) = 10) UNIQUE,
	nombre VARCHAR(30) NOT NULL CHECK(nombre <> ''),
	precio FLOAT NOT NULL CHECK(precio>0),
	numUnidades INT NOT NULL CHECK(numUnidades>0),
	descripcion VARCHAR NOT NULL CHECK(descripcion <> ''),
	nombreArchivo VARCHAR NOT NULL CHECK(nombreArchivo <> ''),
	caducidad DATE NOT NULL CHECK(caducidad > '2022-01-01')
);

--Comida
CREATE TABLE Comida(
	idProducto CHAR(10) NOT NULL CHECK(CHAR_LENGTH(idProducto) = 10) UNIQUE,
	nombre VARCHAR(30) NOT NULL CHECK(nombre <> ''),
	precio FLOAT NOT NULL CHECK(precio>0),
	numUnidades INT NOT NULL CHECK(numUnidades>0),
	descripcion VARCHAR NOT NULL CHECK(descripcion <> ''),
	nombreArchivo VARCHAR NOT NULL CHECK(nombreArchivo <> ''),
	caducidad DATE NOT NULL CHECK(caducidad > '2022-01-01')
);

/* 
	Tablas Llave Primaria Compuesta
*/

--Consultorio
CREATE TABLE Consultorio(
	idClinica CHAR(5) NOT NULL CHECK(idClinica SIMILAR TO '[A-Z]{3}[0-9]{2}') UNIQUE,
	idCuarto CHAR(2) NOT NULL CHECK(idCuarto SIMILAR TO '[0-9]{2}') UNIQUE
);

--Cuarto Cuidados
CREATE TABLE CuartoCuidados(
	idClinica CHAR(5) NOT NULL CHECK(idClinica SIMILAR TO '[A-Z]{3}[0-9]{2}') UNIQUE, 
	idCuarto CHAR(2) NOT NULL CHECK(idCuarto SIMILAR TO '[0-9]{2}') UNIQUE
);

--Caja
CREATE TABLE Caja(
	idClinica CHAR(5) NOT NULL CHECK(idClinica SIMILAR TO '[A-Z]{3}[0-9]{2}') UNIQUE, 
	idCaja CHAR(2) NOT NULL CHECK(idCaja SIMILAR TO '[0-9]{2}') UNIQUE
);

/* 
	Tablas Llave Foranea
*/

--Tener Juguete
CREATE TABLE TenerJuguete(
	idClinica CHAR(5) NOT NULL,
	idProducto CHAR(10) NOT NULL
);

--Tener Accesorio
CREATE TABLE TenerAccesorio(
	idClinica CHAR(5) NOT NULL,
	idProducto CHAR(10) NOT NULL
);

--Tener Medicamento
CREATE TABLE TenerMedicamento(
	idClinica CHAR(5) NOT NULL,
	idProducto CHAR(10) NOT NULL
);

--Tener Comida
CREATE TABLE TenerComida(
	idClinica CHAR(5) NOT NULL,
	idProducto CHAR(10) NOT NULL
);

--Vender Juguete
CREATE TABLE VenderJuguete(
	idProducto CHAR(10) NOT NULL,
	idCaja CHAR(2) NOT NULL,
	idClinica CHAR(5) NOT NULL
);

--Vender Accesorio
CREATE TABLE VenderAccesorio(
	idProducto CHAR(10) NOT NULL,
	idCaja CHAR(2) NOT NULL,
	idClinica CHAR(5) NOT NULL
);

--Vender Medicamento
CREATE TABLE VenderMedicamento(
	idProducto CHAR(10) NOT NULL,
	idCaja CHAR(2) NOT NULL,
	idClinica CHAR(5) NOT NULL
);

--Vender Comida
CREATE TABLE VenderComida(
	idProducto CHAR(10) NOT NULL,
	idCaja CHAR(2) NOT NULL,
	idClinica CHAR(5) NOT NULL
);

--Supervisar
CREATE TABLE Supervisar(
	curp CHAR(18) NOT NULL,
	idClinica CHAR(5) NOT NULL,
	nombreSup VARCHAR(50) NOT NULL CHECK(nombreSup <> ''),
	paternoSup VARCHAR(50) NOT NULL CHECK(paternoSup <> ''),
	maternoSup VARCHAR(50) NOT NULL CHECK(maternoSup <> ''),
	numeroSup CHAR(4) NOT NULL CHECK(numeroSup SIMILAR TO '[0-9]{4}'),
	calleSup VARCHAR NOT NULL CHECK(calleSup <> ''),
	estadoSup VARCHAR NOT NULL CHECK(estadoSup <> ''),
	cpSup CHAR(5) NOT NULL CHECK(cpSup SIMILAR TO '[0-9]{5}'),
	generoSup CHAR(1) NOT NULL CHECK(generoSup = 'M' OR generoSup = 'F'),
	nacimientoSup DATE NOT NULL,
	telefonoSup CHAR(10) NOT NULL CHECK(telefonoSup SIMILAR TO '[0-9]{10}'),
	salarioSup FLOAT NOT NULL CHECK(salarioSup > 0),
	rfcSup CHAR(13) NOT NULL CHECK(CHAR_LENGTH(rfcSup) = 13),
	nombreCli VARCHAR(30) NOT NULL CHECK(nombreCli <> ''),
	numeroCli CHAR(4) NOT NULL CHECK(numeroCli SIMILAR TO '[0-9]{4}'),
	calleCli VARCHAR NOT NULL CHECK(calleCli <> ''),
	estadoCli VARCHAR NOT NULL CHECK(estadoCli <> ''),
	cpCli CHAR(5) NOT NULL CHECK (cpCli SIMILAR TO '[0-9]{5}'),
	telefonoCli CHAR(10) NOT NULL CHECK(telefonoCli SIMILAR TO '[0-9]{10}'),
	horarioCli TIME NOT NULL,
	inicioSupervicion DATE NOT NULL CHECK(inicioSupervicion > '1970-01-01' AND inicioSupervicion < '2022-12-31'),
	finSupervicion DATE NOT NULL CHECK(inicioSupervicion > '1970-01-01' AND inicioSupervicion < '2022-12-31')
);

--Generar Recibo Normal
CREATE TABLE GenerarReciboNormal(
	idRecibo CHAR(4) NOT NULL,
	idConsulta CHAR(5) NOT NULL,
	idMascota CHAR(5) NOT NULL,
	servicioBrindado VARCHAR NOT NULL CHECK(servicioBrindado <> ''),
	nombreTrabajador VARCHAR(50) NOT NULL CHECK(nombreTrabajador <> ''),
	nombreMascota VARCHAR(20) NOT NULL CHECK(nombreMascota <> ''),
	nombreDuenio VARCHAR(50) NOT NULL CHECK(nombreDuenio <> ''),
	precio FLOAT NOT NULL CHECK(precio > 0),
	fechaProxCita DATE NOT NULL CHECK(fechaProxCita > '2021-01-01'),
	medicamento VARCHAR NOT NULL,
	motivoConsulta VARCHAR NOT NULL CHECK(motivoConsulta <> ''),
	estadoMascota VARCHAR NOT NULL CHECK(estadoMascota <> '')
);


--Generar Recibo Emergencia
CREATE TABLE GenerarReciboEmergencia(
	idRecibo CHAR(4) NOT NULL,
	idConsulta CHAR(5) NOT NULL,
	idMascota CHAR(5) NOT NULL,
	servicioBrindado VARCHAR NOT NULL CHECK(servicioBrindado <> ''),
	nombreTrabajador VARCHAR(50) NOT NULL CHECK(nombreTrabajador <> ''),
	nombreMascota VARCHAR(20) NOT NULL CHECK(nombreMascota <> ''),
	nombreDuenio VARCHAR(50) NOT NULL CHECK(nombreDuenio <> ''),
	precio FLOAT NOT NULL CHECK(precio > 0),
	procedimientoEmitido VARCHAR NOT NULL CHECK(procedimientoEmitido <> ''),
	sintomasMascota VARCHAR NOT NULL CHECK(sintomasMascota <> ''),
	codigoEmergencia VARCHAR NOT NULL CHECK(codigoEmergencia = 'verde' OR codigoEmergencia = 'amarillo' OR codigoEmergencia = 'rojo')
);

--Generar Recibo Tratamiento
CREATE TABLE GenerarReciboTratamiento(
	idRecibo CHAR(4) NOT NULL,
	idConsulta CHAR(5) NOT NULL,
	idMascota CHAR(5) NOT NULL,
	servicioBrindado VARCHAR NOT NULL CHECK(servicioBrindado <> ''),
	nombreTrabajador VARCHAR(50) NOT NULL CHECK(nombreTrabajador <> ''),
	nombreMascota VARCHAR(20) NOT NULL CHECK(nombreMascota <> ''),
	nombreDuenio VARCHAR(50) NOT NULL CHECK(nombreDuenio <> ''),
	precio FLOAT NOT NULL CHECK(precio > 0),
	servicioDado VARCHAR NOT NULL CHECK(servicioDado <> '')
);

/* 
	Tablas Llave Mezclada (Primarias, Compuestas y Foraneas)
*/

--Cliente Normal
CREATE TABLE ClienteNormal(
	curpClienteNormal CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curpClienteNormal) = 18) CHECK(curpClienteNormal SIMILAR TO '[a-z]{4}[0-9]{6}[a-z]{8}') UNIQUE,
	idCaja CHAR(2) NOT NULL,
	idClinica CHAR(5) NOT NULL,
	nombre VARCHAR(50) NOT NULL CHECK(nombre <> ''),
	paterno VARCHAR(50) NOT NULL CHECK(paterno <> ''),
	materno VARCHAR(50) NOT NULL CHECK(materno <> ''),
	numero CHAR(4) NOT NULL CHECK(numero SIMILAR TO '[0-9]{4}'),
	calle VARCHAR NOT NULL CHECK(calle <> ''),
	estado VARCHAR NOT NULL CHECK(estado <> ''),
	cp CHAR(5) NOT NULL CHECK(cp SIMILAR TO '[0-9]{5}'),
	genero CHAR(1) NOT NULL CHECK(genero = 'M' OR genero = 'F'),
	nacimiento DATE NOT NULL CHECK(nacimiento > '1950-01-01' AND nacimiento < '2022-12-31'),
	telefono CHAR(10) NOT NULL CHECK(telefono SIMILAR TO '[0-9]{10}')
);

--Cliente Frecuente
CREATE TABLE ClienteFrecuente(
	curpClienteFrecuente CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curpClienteFrecuente) = 18) CHECK(curpClienteFrecuente SIMILAR TO '[a-z]{4}[0-9]{6}[a-z]{8}') UNIQUE,
	idCaja CHAR(2) NOT NULL,
	idClinica CHAR(5) NOT NULL,
	nombre VARCHAR(50) NOT NULL CHECK(nombre <> ''),
	paterno VARCHAR(50) NOT NULL CHECK(paterno <> ''),
	materno VARCHAR(50) NOT NULL CHECK(materno <> ''),
	numero CHAR(4) NOT NULL CHECK(numero SIMILAR TO '[0-9]{4}'),
	calle VARCHAR NOT NULL CHECK(calle <> ''),
	estado VARCHAR NOT NULL CHECK(estado <> ''),
	cp CHAR(5) NOT NULL CHECK(cp SIMILAR TO '[0-9]{5}'),
	genero CHAR(1) NOT NULL CHECK(genero = 'M' OR genero = 'F'),
	nacimiento DATE NOT NULL CHECK(nacimiento > '1950-01-01' AND nacimiento < '2022-12-31'),
	telefono CHAR(10) NOT NULL CHECK(telefono SIMILAR TO '[0-9]{10}'),
	email VARCHAR(50) NOT NULL CHECK(email SIMILAR TO '[0-z]{0,30}[@]{1}[a-z]{0,10}[.]{1}[a-z]{2,5}') 
);

--Fisico
CREATE TABLE Fisico(
	idFisico CHAR(8) NOT NULL CHECK(idFisico <> '') CHECK(idFisico SIMILAR TO '[0-9]{4}[a-z]{4}') UNIQUE,
	curpClienteNormal CHAR(18) NOT NULL,
	curpClienteFrecuente CHAR(18) NOT NULL
);

--Internet
CREATE TABLE Internet(
	numTarjeta CHAR(16) NOT NULL CHECK(numTarjeta SIMILAR TO '[0-9]{16}') UNIQUE,
	curpClienteNormal CHAR(18) NOT NULL,
	curpClienteFrecuente CHAR(18) NOT NULL,
	nombreTitular VARCHAR(50) NOT NULL CHECK(nombreTitular <> ''),
	vencimiento DATE NOT NULL,
	cvv CHAR(4) NOT NULL CHECK(cvv SIMILAR TO '[0-9]{4}')
);

--Veterinario
CREATE TABLE Veterinario(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) CHECK(curp SIMILAR TO '[a-z]{4}[0-9]{6}[a-z]{8}') UNIQUE,
	idClinica CHAR(5) NOT NULL,
	nombre VARCHAR(50) NOT NULL CHECK(nombre <> ''),
	paterno VARCHAR(50) NOT NULL CHECK(paterno <> ''),
	materno VARCHAR(50) NOT NULL CHECK(materno <> ''),
	calle VARCHAR NOT NULL CHECK(calle <> ''),
	numero CHAR(4) NOT NULL CHECK(numero SIMILAR TO '[0-9]{4}'),
	estado VARCHAR NOT NULL CHECK(estado <> ''),
	cp CHAR(5) NOT NULL CHECK(cp SIMILAR TO '[0-9]{5}'),
	genero CHAR(1) NOT NULL CHECK(genero = 'M' OR genero = 'F'),
	nacimiento DATE NOT NULL CHECK(nacimiento > '1950-01-01' AND nacimiento < '2022-12-31'),
	telefono CHAR(10) NOT NULL CHECK(telefono SIMILAR TO '[0-9]{10}'),
	salario FLOAT NOT NULL CHECK(salario > 0),
	rfc CHAR(13) NOT NULL CHECK(CHAR_LENGTH(rfc) = 13),
	numPacientes INT NOT NULL CHECK(numPacientes>0),
	horarioInicio TIME NOT NULL,
	horarioFin TIME NOT NULL
);

--Estilista
CREATE TABLE Estilista(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) CHECK(curp SIMILAR TO '[a-z]{4}[0-9]{6}[a-z]{8}') UNIQUE,
	idClinica CHAR(5) NOT NULL,
	nombre VARCHAR(50) NOT NULL CHECK(nombre <> ''),
	paterno VARCHAR(50) NOT NULL CHECK(paterno <> ''),
	materno VARCHAR(50) NOT NULL CHECK(materno <> ''),
	calle VARCHAR NOT NULL CHECK(calle <> ''),
	numero CHAR(4) NOT NULL CHECK(numero SIMILAR TO '[0-9]{4}'),
	estado VARCHAR NOT NULL CHECK(estado <> ''),
	cp CHAR(5) NOT NULL CHECK(cp SIMILAR TO '[0-9]{5}'),
	genero CHAR(1) CHECK(genero = 'M' OR genero = 'F'),
	nacimiento DATE NOT NULL CHECK(nacimiento > '1950-01-01' AND nacimiento < '2022-12-31'),
	telefono CHAR(10) NOT NULL CHECK(telefono SIMILAR TO '[0-9]{10}'),
	salario FLOAT NOT NULL CHECK(salario > 0),
	numCertificado INT NOT NULL CHECK(numCertificado>0)
);

--Recibo
CREATE TABLE Recibo(
	idRecibo CHAR(4) NOT NULL CHECK(idRecibo SIMILAR TO '[N,E,T]{1}[0-9]{3}') UNIQUE,
	idCaja CHAR(2) NOT NULL,
	idClinica CHAR(5) NOT NULL,
	servicioBrindado VARCHAR NOT NULL CHECK(servicioBrindado <> ''),
	nombreTrabajador VARCHAR(50) NOT NULL CHECK(nombreTrabajador <> ''),
	nombreMascota VARCHAR(20) NOT NULL CHECK(nombreMascota <> ''),
	nombreDuenio VARCHAR(50) NOT NULL CHECK(nombreDuenio <> '')
);

--Mascota
CREATE TABLE Mascota(
	idMascota CHAR(5) NOT NULL CHECK(idMascota SIMILAR TO '[A-Z]{3}[0-9]{2}') UNIQUE,
	curpClienteNormal CHAR(18) NOT NULL,
	curpClienteFrecuente CHAR(18) NOT NULL,
	nombre VARCHAR(15) NOT NULL CHECK(nombre <> ''),
	nacimiento DATE NOT NULL CHECK(nacimiento > '1995-01-01' AND nacimiento < '2022-12-31'),
	peso FLOAT NOT NULL CHECK(peso > 0 AND peso < 150),
	especie VARCHAR NOT NULL CHECK(especie <> ''),
	raza VARCHAR NOT NULL CHECK(raza <> ''),
	nombreDeDuenio VARCHAR(50) NOT NULL CHECK(nombreDeDuenio <> '')
);

--Normal
CREATE TABLE Normal(
	idConsulta CHAR(5) NOT NULL CHECK(idConsulta SIMILAR TO '[0-9]{2}') UNIQUE,
	idMascota CHAR(5) NOT NULL  CHECK(idMascota SIMILAR TO '[A-Z]{3}[0-9]{2}') UNIQUE,
	curp CHAR(18) NOT NULL,
	precio FLOAT NOT NULL CHECK(precio > 0),
	fechaProxCita DATE NOT NULL CHECK(fechaProxCita > '2022-01-01'),
	medicamento VARCHAR NOT NULL CHECK(medicamento <> ''),
	motivoConsulta VARCHAR NOT NULL CHECK(motivoConsulta <> ''),
	estadoMascota VARCHAR NOT NULL CHECK(estadoMascota <> '')
);

--Emergencia
CREATE TABLE Emergencia(
	idConsulta CHAR(5) NOT NULL CHECK(idConsulta SIMILAR TO '[0-9]{2}') UNIQUE,
	idMascota CHAR(5) NOT NULL  CHECK(idMascota SIMILAR TO '[A-Z]{3}[0-9]{2}') UNIQUE,
	curp CHAR(18) NOT NULL,
	precio FLOAT NOT NULL CHECK(precio > 0),
	procedimientoEmitido VARCHAR NOT NULL CHECK(procedimientoEmitido <> ''),
	sintomasMascota VARCHAR NOT NULL CHECK(sintomasMascota <> ''),
	codigoEmergencia VARCHAR NOT NULL CHECK(codigoEmergencia = 'verde' OR codigoEmergencia = 'amarillo' OR codigoEmergencia = 'rojo')
);

--Tratamiento
CREATE TABLE Tratamiento(
	idConsulta CHAR(5) NOT NULL CHECK(idConsulta SIMILAR TO '[0-9]{2}') UNIQUE,
	idMascota CHAR(5) NOT NULL CHECK(idMascota SIMILAR TO '[A-Z]{3}[0-9]{2}') UNIQUE ,
	curp CHAR(18) NOT NULL,
	precio FLOAT NOT NULL CHECK(precio > 0),
	servicioDado VARCHAR NOT NULL CHECK(servicioDado <> '')
);

/*
	Llaves Primarias Normales
*/
--Llave Supervisor
ALTER TABLE supervisor ADD CONSTRAINT supervisor_pkey PRIMARY KEY(curp);
--Llave Clinica
ALTER TABLE clinica ADD CONSTRAINT clinica_pkey PRIMARY KEY(idClinica);
--Llave Juguete
ALTER TABLE juguete ADD CONSTRAINT juguete_pkey PRIMARY KEY(idProducto);
--Llave Accesorio
ALTER TABLE accesorio ADD CONSTRAINT accesorio_pkey PRIMARY KEY(idProducto);
--Llave Medicamento
ALTER TABLE medicamento ADD CONSTRAINT medicamento_pkey PRIMARY KEY(idProducto);
--Llave Accesorio
ALTER TABLE comida ADD CONSTRAINT comida_pkey PRIMARY KEY(idProducto);

/*
	Llaves Primarias Compuestas
*/
--Llave Consultorio
ALTER TABLE consultorio ADD CONSTRAINT consultorio_pkey PRIMARY KEY(idClinica, idCuarto);
ALTER TABLE consultorio ADD CONSTRAINT consultorio_fkey FOREIGN KEY(idClinica)
REFERENCES clinica(idClinica);
--Llave Cuarto Cuidados
ALTER TABLE cuartoCuidados ADD CONSTRAINT cuartoCuidados_pkey PRIMARY KEY(idClinica, idCuarto);
ALTER TABLE cuartoCuidados ADD CONSTRAINT cuartoCuidados_fkey FOREIGN KEY(idClinica)
REFERENCES clinica(idClinica);
--Llave Caja
ALTER TABLE caja ADD CONSTRAINT caja_pkey PRIMARY KEY(idClinica, idCaja);
ALTER TABLE caja ADD CONSTRAINT caja_fkey FOREIGN KEY(idClinica)
REFERENCES clinica(idClinica);
/*
	Llaves Foraneas(Solo tienen este tipo de llaves)
*/
--Llaves Tener Juguete
ALTER TABLE tenerJuguete ADD CONSTRAINT tenerJuguete_fkey1 FOREIGN KEY(idClinica)
REFERENCES clinica(idClinica);
ALTER TABLE tenerJuguete ADD CONSTRAINT tenerJuguete_fkey2 FOREIGN KEY(idProducto)
REFERENCES juguete(idProducto);
--Llaves Tener Accesorio
ALTER TABLE tenerAccesorio ADD CONSTRAINT tenerAccesorio_fkey1 FOREIGN KEY(idClinica)
REFERENCES clinica(idClinica);
ALTER TABLE tenerAccesorio ADD CONSTRAINT tenerAccesorio_fkey2 FOREIGN KEY(idProducto)
REFERENCES accesorio(idProducto);
--Llaves Tener Medicamento
ALTER TABLE tenerMedicamento ADD CONSTRAINT tenerMedicamento_fkey1 FOREIGN KEY(idClinica)
REFERENCES clinica(idClinica);
ALTER TABLE tenerMedicamento ADD CONSTRAINT tenerMedicamento_fkey2 FOREIGN KEY(idProducto)
REFERENCES medicamento(idProducto);
--Llaves Tener Comida
ALTER TABLE tenerComida ADD CONSTRAINT tenerComida_fkey1 FOREIGN KEY(idClinica)
REFERENCES clinica(idClinica);
ALTER TABLE tenerComida ADD CONSTRAINT tenerComida_fkey2 FOREIGN KEY(idProducto)
REFERENCES comida(idProducto);
--Llaves Vender Juguete
ALTER TABLE venderJuguete ADD CONSTRAINT venderJuguete_fkey1 FOREIGN KEY(idProducto)
REFERENCES juguete(idProducto);
ALTER TABLE venderJuguete ADD CONSTRAINT venderJuguete_fkey2 FOREIGN KEY(idClinica)
REFERENCES clinica(idClinica);
ALTER TABLE venderJuguete ADD CONSTRAINT venderJuguete_fkey3 FOREIGN KEY(idCaja)
REFERENCES caja(idCaja);
--Llaves Vender Accesorio
ALTER TABLE venderAccesorio ADD CONSTRAINT venderAccesorio_fkey1 FOREIGN KEY(idProducto)
REFERENCES accesorio(idProducto);
ALTER TABLE venderAccesorio ADD CONSTRAINT venderAccesorio_fkey2 FOREIGN KEY(idClinica)
REFERENCES clinica(idClinica);
ALTER TABLE venderAccesorio ADD CONSTRAINT venderAccesorio_fkey3 FOREIGN KEY(idCaja)
REFERENCES caja(idCaja);
--Llaves Vender Medicamento
ALTER TABLE venderMedicamento ADD CONSTRAINT venderMedicamento_fkey1 FOREIGN KEY(idProducto)
REFERENCES medicamento(idProducto);
ALTER TABLE venderMedicamento ADD CONSTRAINT venderMedicamento_fkey2 FOREIGN KEY(idClinica)
REFERENCES clinica(idClinica);
ALTER TABLE venderMedicamento ADD CONSTRAINT venderAccesorio_fkey3 FOREIGN KEY(idCaja)
REFERENCES caja(idCaja);
--Llaves Vender Comida
ALTER TABLE venderMedicamento ADD CONSTRAINT venderComida_fkey1 FOREIGN KEY(idProducto)
REFERENCES comida(idProducto);
ALTER TABLE venderMedicamento ADD CONSTRAINT venderComida_fkey2 FOREIGN KEY(idClinica)
REFERENCES clinica(idClinica);
ALTER TABLE venderMedicamento ADD CONSTRAINT venderComida_fkey3 FOREIGN KEY(idCaja)
REFERENCES caja(idCaja);
--Llaves Supervisar
ALTER TABLE supervisar ADD CONSTRAINT supervisar_fkey1 FOREIGN KEY(curp)
REFERENCES supervisor(curp);
ALTER TABLE supervisar ADD CONSTRAINT supervisar_fkey2 FOREIGN KEY(idClinica)
REFERENCES clinica(idClinica);
--Llaves Generar Recibo Normal
ALTER TABLE generarReciboNormal ADD CONSTRAINT generarReciboNormal_fkey1 FOREIGN KEY(idRecibo)
REFERENCES recibo(idRecibo);
ALTER TABLE generarReciboNormal ADD CONSTRAINT generarReciboNormal_fkey2 FOREIGN KEY(idConsulta)
REFERENCES normal(idConsulta);
ALTER TABLE generarReciboNormal ADD CONSTRAINT generarReciboNormal_fkey3 FOREIGN KEY(idMascota)
REFERENCES mascota(idMascota);
--Llaves Generar Recibo Emergencia
ALTER TABLE generarReciboEmergencia ADD CONSTRAINT generarReciboEmergencia_fkey1 FOREIGN KEY(idRecibo)
REFERENCES recibo(idRecibo);
ALTER TABLE generarReciboEmergencia ADD CONSTRAINT generarReciboEmergencia_fkey2 FOREIGN KEY(idConsulta)
REFERENCES normal(idConsulta);
ALTER TABLE generarReciboEmergencia ADD CONSTRAINT generarReciboEmergencia_fkey3 FOREIGN KEY(idMascota)
REFERENCES mascota(idMascota);
--Llaves Generar Recibo Tratamiento
ALTER TABLE generarReciboTratamiento ADD CONSTRAINT generarReciboTratamiento_fkey1 FOREIGN KEY(idRecibo)
REFERENCES recibo(idRecibo);
ALTER TABLE generarReciboTratamiento ADD CONSTRAINT generarReciboTratamiento_fkey2 FOREIGN KEY(idConsulta)
REFERENCES normal(idConsulta);
ALTER TABLE generarReciboTratamiento ADD CONSTRAINT generarReciboTratamiento_fkey3 FOREIGN KEY(idMascota)
REFERENCES mascota(idMascota);
/*
	Llaves Mezcladas (Primarias, Compuestas y Foraneas)
*/
--Llaves Cliente Normal
ALTER TABLE clienteNormal ADD CONSTRAINT clienteNormal_pkey PRIMARY KEY(curpClienteNormal);
ALTER TABLE clienteNormal ADD CONSTRAINT clienteNormal_fkey1 FOREIGN KEY(idCaja)
REFERENCES caja(idCaja);
ALTER TABLE clienteNormal ADD CONSTRAINT clienteNormal_fkey2 FOREIGN KEY(idClinica)
REFERENCES clinica(idClinica);
--Llaves Cliente Frecuente
ALTER TABLE clienteFrecuente ADD CONSTRAINT clienteFrecuente_pkey PRIMARY KEY(curpClienteFrecuente);
ALTER TABLE clienteFrecuente ADD CONSTRAINT clienteFrecuente_fkey1 FOREIGN KEY(idCaja)
REFERENCES caja(idCaja);
ALTER TABLE clienteFrecuente ADD CONSTRAINT clienteFrecuente_fkey2 FOREIGN KEY(idClinica)
REFERENCES clinica(idClinica);
--Llaves Fisico
ALTER TABLE fisico ADD CONSTRAINT fisico_pkey PRIMARY KEY(idFisico);
ALTER TABLE fisico ADD CONSTRAINT fisico_fkey1 FOREIGN KEY(curpClienteNormal)
REFERENCES clienteNormal(curpClienteNormal);
ALTER TABLE fisico ADD CONSTRAINT fisico_fkey2 FOREIGN KEY(curpClienteFrecuente)
REFERENCES clienteFrecuente(curpClienteFrecuente);
--Llaves Internet
ALTER TABLE internet ADD CONSTRAINT internet_pkey PRIMARY KEY(numTarjeta);
ALTER TABLE internet ADD CONSTRAINT internet_fkey1 FOREIGN KEY(curpClienteNormal)
REFERENCES clienteNormal(curpClienteNormal);
ALTER TABLE internet ADD CONSTRAINT internet_fkey2 FOREIGN KEY(curpClienteFrecuente)
REFERENCES clienteFrecuente(curpClienteFrecuente);
--Llaves Veterinario
ALTER TABLE veterinario ADD CONSTRAINT veterinario_pkey PRIMARY KEY(curp);
ALTER TABLE veterinario ADD CONSTRAINT veterinario_fkey1 FOREIGN KEY(idClinica)
REFERENCES clinica(idClinica);
--Llaves Estilista
ALTER TABLE estilista ADD CONSTRAINT estilista_pkey PRIMARY KEY(curp);
ALTER TABLE estilista ADD CONSTRAINT estilista_fkey1 FOREIGN KEY(idClinica)
REFERENCES clinica(idClinica);
--Llaves Recibo
ALTER TABLE recibo ADD CONSTRAINT recibo_pkey PRIMARY KEY(idRecibo);
ALTER TABLE recibo ADD CONSTRAINT recibo_fkey1 FOREIGN KEY(idCaja)
REFERENCES caja(idCaja);
ALTER TABLE recibo ADD CONSTRAINT recibo_fkey2 FOREIGN KEY(idClinica)
REFERENCES clinica(idClinica);
--Llaves Mascota
ALTER TABLE mascota ADD CONSTRAINT mascota_pkey PRIMARY KEY(idMascota);
ALTER TABLE mascota ADD CONSTRAINT mascota_fkey1 FOREIGN KEY(curpClienteNormal)
REFERENCES clienteNormal(curpClienteNormal);
ALTER TABLE mascota ADD CONSTRAINT mascota_fkey2 FOREIGN KEY(curpClienteFrecuente)
REFERENCES clienteFrecuente(curpClienteFrecuente);
--Llaves Normal
ALTER TABLE normal ADD CONSTRAINT normal_pkey PRIMARY KEY(idConsulta, idMascota);
ALTER TABLE normal ADD CONSTRAINT normal_fkey1 FOREIGN KEY(idMascota)
REFERENCES mascota(idMascota);
ALTER TABLE normal ADD CONSTRAINT mascota_fkey2 FOREIGN KEY(curp)
REFERENCES veterinario(curp);
--Llaves Emergencia
ALTER TABLE emergencia ADD CONSTRAINT emergencia_pkey PRIMARY KEY(idConsulta, idMascota);
ALTER TABLE emergencia ADD CONSTRAINT emergencia_fkey1 FOREIGN KEY(idMascota)
REFERENCES mascota(idMascota);
ALTER TABLE emergencia ADD CONSTRAINT emergencia_fkey2 FOREIGN KEY(curp)
REFERENCES veterinario(curp);
--Llaves Tratamiento
ALTER TABLE tratamiento ADD CONSTRAINT tratamiento_pkey PRIMARY KEY(idConsulta, idMascota);
ALTER TABLE tratamiento ADD CONSTRAINT tratamiento_fkey1 FOREIGN KEY(idMascota)
REFERENCES mascota(idMascota);
ALTER TABLE tratamiento ADD CONSTRAINT tratamiento_fkey2 FOREIGN KEY(curp)
REFERENCES estilista(curp);