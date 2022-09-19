/* Script para la creación de la base de datos Little Frinds */

--Creacion del esquema
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;
COMMENT ON SCHEMA public IS 'El esquema que viene por defecto en postgres';


/* ------------------------------------------------  TABLAS  ------------------------------------------------------ */


/*********************************** Tablas Llave Primaria Normal ***********************************/

--Supervisor
CREATE TABLE Supervisor(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) CHECK(curp SIMILAR TO '[A-Z]{4}[0-9]{6}[A-Z]{8}') UNIQUE,
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
COMMENT ON TABLE Supervisor IS 'Tabla que contiene la información de los supervisores de las clinicas';
COMMENT ON COLUMN Supervisor.curp IS 'Identificador del supervisor la cual es su curp ';
COMMENT ON COLUMN Supervisor.nombreSup IS 'Nombre del supervisor';
COMMENT ON COLUMN Supervisor.paternoSup IS 'Apellido Paterno del supervisor';
COMMENT ON COLUMN Supervisor.maternoSup IS 'Apellido Materno supervisor';
COMMENT ON COLUMN Supervisor.calleSup IS 'Calle donde vive el supervisor';
COMMENT ON COLUMN Supervisor.numeroSup IS 'Numero donde vive el supervisor';
COMMENT ON COLUMN Supervisor.estadoSup IS 'Estado donde vive el supervisor';
COMMENT ON COLUMN Supervisor.cpSup IS 'Codigo Postal donde vive el supervisor';
COMMENT ON COLUMN Supervisor.generoSup IS 'Genero del supervisor';
COMMENT ON COLUMN Supervisor.nacimientoSup IS 'Fecha de nacimiento del supervisor';
COMMENT ON COLUMN Supervisor.telefonoSup IS 'Número telefónico del supervisor';
COMMENT ON COLUMN Supervisor.salarioSup IS 'Salario del supervisor';
COMMENT ON COLUMN Supervisor.rfcSup IS 'RFC del supervisor';


--Clinica
CREATE TABLE Clinica(
	idClinica CHAR(5) NOT NULL CHECK(idClinica SIMILAR TO '[A-Z]{3}[0-9]{2}') UNIQUE,
	nombreCli VARCHAR(30) NOT NULL CHECK(nombreCli <> ''),
	numeroCli CHAR(4) NOT NULL CHECK(numeroCli SIMILAR TO '[0-9]{4}'),
	calleCli VARCHAR NOT NULL CHECK(calleCli <> ''),
	estadoCli VARCHAR NOT NULL CHECK(estadoCli <> ''),
	cpCli CHAR(5) NOT NULL CHECK (cpCli SIMILAR TO '[0-9]{5}'),
	telefonoCli CHAR(10) NOT NULL CHECK(telefonoCli SIMILAR TO '[0-9]{10}'),
	horarioCli TIME NOT NULL
);
COMMENT ON TABLE Clinica IS 'Tabla que contiene la información de las clinicas';
COMMENT ON COLUMN Clinica.idClinica IS 'ID de la Clinica';
COMMENT ON COLUMN Clinica.nombreCli IS 'Nombre de la Clinica';
COMMENT ON COLUMN Clinica.numeroCli IS 'Numero donde esta ubicada la Clinica';
COMMENT ON COLUMN Clinica.calleCli IS 'Calle donde esta ubicada la Clinica';
COMMENT ON COLUMN Clinica.estadoCli IS 'Estado donde esta ubicada la Clinica';
COMMENT ON COLUMN Clinica.cpCli IS 'Codigo Postal donde esta ubicada la Clinica';
COMMENT ON COLUMN Clinica.telefonoCli IS 'Número telefónico de la Clinica';
COMMENT ON COLUMN Clinica.horarioCli IS 'Horario de la Clinica';


--Juguete
CREATE TABLE Juguete(
	idProducto CHAR(10) NOT NULL CHECK(CHAR_LENGTH(idProducto) = 10) UNIQUE ,
	nombre VARCHAR(30) NOT NULL CHECK(nombre <> ''),
	precio FLOAT NOT NULL CHECK(precio>0),
	numUnidades INT NOT NULL CHECK(numUnidades>0),
	descripcion VARCHAR NOT NULL CHECK(descripcion <> ''),
	nombreArchivo VARCHAR NOT NULL CHECK(nombreArchivo <> '')
);
COMMENT ON TABLE Juguete IS 'Tabla que contiene la información de los juguetes que se venden en la clínica';
COMMENT ON COLUMN Juguete.idProducto IS 'ID del juguete';
COMMENT ON COLUMN Juguete.nombre IS 'Nombre del juguete';
COMMENT ON COLUMN Juguete.precio IS 'Precio del juguete';
COMMENT ON COLUMN Juguete.numUnidades IS 'Número de Unidades del juguete';
COMMENT ON COLUMN Juguete.descripcion IS 'Descripción del juguete';
COMMENT ON COLUMN Juguete.nombreArchivo IS 'Nombre de archivo del juguete';


--Accesorio
CREATE TABLE Accesorio(
	idProducto CHAR(10) NOT NULL CHECK(CHAR_LENGTH(idProducto) = 10) UNIQUE,
	nombre VARCHAR(30) NOT NULL CHECK(nombre <> ''),
	precio FLOAT NOT NULL CHECK(precio>0),
	numUnidades INT NOT NULL CHECK(numUnidades>0),
	descripcion VARCHAR NOT NULL CHECK(descripcion <> ''),
	nombreArchivo VARCHAR NOT NULL CHECK(nombreArchivo <> '')
);
COMMENT ON TABLE Accesorio IS 'Tabla que contiene la información de los accesorios que se venden en la clinica';
COMMENT ON COLUMN Accesorio.idProducto IS 'ID del accesorio';
COMMENT ON COLUMN Accesorio.nombre IS 'Nombre del accesorio';
COMMENT ON COLUMN Accesorio.precio IS 'Precio del accesorio';
COMMENT ON COLUMN Accesorio.numUnidades IS 'Número de Unidades del accesorio';
COMMENT ON COLUMN Accesorio.descripcion IS 'Descripción del accesorio';
COMMENT ON COLUMN Accesorio.nombreArchivo IS 'Nombre de archivo del accesorio';


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
COMMENT ON TABLE Medicamento IS 'Tabla que contiene la información de los medicamentos que se venden en la clínica';
COMMENT ON COLUMN Medicamento.idProducto IS 'ID del medicamento';
COMMENT ON COLUMN Medicamento.nombre IS 'Nombre del medicamento';
COMMENT ON COLUMN Medicamento.precio IS 'Precio del medicamento';
COMMENT ON COLUMN Medicamento.numUnidades IS 'Número de Unidades del medicamento';
COMMENT ON COLUMN Medicamento.descripcion IS 'Descripción del medicamento';
COMMENT ON COLUMN Medicamento.nombreArchivo IS 'Nombre de archivo del medicamento';
COMMENT ON COLUMN Medicamento.caducidad IS 'Fecha en la que el medicamento ya no es consumible';


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
COMMENT ON TABLE Comida IS 'Tabla que contiene la información de los alimentos para mascotas que se venden en la clinica';
COMMENT ON COLUMN Comida.idProducto IS 'ID de la comida';
COMMENT ON COLUMN Comida.nombre IS 'Nombre de la comida';
COMMENT ON COLUMN Comida.precio IS 'Precio de la comida';
COMMENT ON COLUMN Comida.numUnidades IS 'Número de Unidades de la comida';
COMMENT ON COLUMN Comida.descripcion IS 'Descripción de la comida';
COMMENT ON COLUMN Comida.nombreArchivo IS 'Nombre de archivo de la comida';
COMMENT ON COLUMN Comida.caducidad IS 'Fecha en la que la comida ya no es consumible';


/*********************************** Tablas Llave Primaria Compuesta ***********************************/


--Consultorio
CREATE TABLE Consultorio(
	idClinica CHAR(5) NOT NULL CHECK(idClinica SIMILAR TO '[A-Z]{3}[0-9]{2}') UNIQUE,
	idCuarto CHAR(2) NOT NULL CHECK(idCuarto SIMILAR TO '[0-9]{2}') UNIQUE
);
COMMENT ON TABLE Consultorio IS 'Tabla que contiene la información de los consultorios de la clinica';
COMMENT ON COLUMN Consultorio.idClinica IS 'ID de la clinica a la que pertenece el consultorio';
COMMENT ON COLUMN Consultorio.idCuarto IS 'ID del consultorio';


--Cuarto Cuidados
CREATE TABLE CuartoCuidados(
	idClinica CHAR(5) NOT NULL CHECK(idClinica SIMILAR TO '[A-Z]{3}[0-9]{2}') UNIQUE, 
	idCuarto CHAR(2) NOT NULL CHECK(idCuarto SIMILAR TO '[0-9]{2}') UNIQUE
);
COMMENT ON TABLE CuartoCuidados IS 'Tabla que contiene la información de los cuartos de cuidados de la clinica';
COMMENT ON COLUMN CuartoCuidados.idClinica IS 'ID de la clinica a la que pertenece el cuarto de cuidados';
COMMENT ON COLUMN CuartoCuidados.idCuarto IS 'ID del cuarto de cuidados';


--Caja
CREATE TABLE Caja(
	idClinica CHAR(5) NOT NULL CHECK(idClinica SIMILAR TO '[A-Z]{3}[0-9]{2}') UNIQUE, 
	idCaja CHAR(2) NOT NULL CHECK(idCaja SIMILAR TO '[0-9]{2}') UNIQUE
);
COMMENT ON TABLE Caja IS 'Tabla que contiene a las cajas de la veterinaria';
COMMENT ON COLUMN Caja.idClinica IS 'ID de la clinica a la que pertenece la caja';
COMMENT ON COLUMN Caja.idCaja IS 'ID de la caja';


/*********************************** Tablas Llave Mezclada (Primarias, Compuestas y Foraneas) ***********************************/


--Cliente Normal
CREATE TABLE ClienteNormal(
	curpClienteNormal CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curpClienteNormal) = 18) CHECK(curpClienteNormal SIMILAR TO '[A-Z]{4}[0-9]{6}[A-Z]{8}') UNIQUE,
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
COMMENT ON TABLE ClienteNormal IS 'Tabla que contiene la información de un Cliente Normal';
COMMENT ON COLUMN ClienteNormal.curpClienteNormal IS 'Identificador del Cliente Normal';
COMMENT ON COLUMN ClienteNormal.idCaja IS 'ID de la caja';
COMMENT ON COLUMN ClienteNormal.idClinica IS 'ID de la clinica a la que pertenece la caja';
COMMENT ON COLUMN ClienteNormal.nombre IS 'Nombre del cliente normal';
COMMENT ON COLUMN ClienteNormal.paterno IS 'Apellido Paterno del cliente normal';
COMMENT ON COLUMN ClienteNormal.materno IS 'Apellido Materno del cliente normal';
COMMENT ON COLUMN ClienteNormal.numero IS 'Numero donde vive el cliente normal';
COMMENT ON COLUMN ClienteNormal.calle IS 'Calle donde vive el cliente normal';
COMMENT ON COLUMN ClienteNormal.estado IS 'Estado donde vive el cliente normal';
COMMENT ON COLUMN ClienteNormal.cp IS 'Codigo Postal donde vive el cliente normal';
COMMENT ON COLUMN ClienteNormal.genero IS 'Genero del cliente normal';
COMMENT ON COLUMN ClienteNormal.nacimiento IS 'Fecha de nacimiento del cliente normal';
COMMENT ON COLUMN ClienteNormal.telefono IS 'Teléfono del cliente normal';


--Cliente Frecuente
CREATE TABLE ClienteFrecuente(
	curpClienteFrecuente CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curpClienteFrecuente) = 18) CHECK(curpClienteFrecuente SIMILAR TO '[A-Z]{4}[0-9]{6}[A-Z]{8}') UNIQUE,
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
	email VARCHAR(50) NOT NULL 
);
COMMENT ON TABLE ClienteFrecuente IS 'Tabla que contiene la información de un Cliente Frecuente';
COMMENT ON COLUMN ClienteFrecuente.curpClienteFrecuente IS 'Identificador del Cliente frecuente';
COMMENT ON COLUMN ClienteFrecuente.idCaja IS 'ID de la caja';
COMMENT ON COLUMN ClienteFrecuente.idClinica IS 'ID de la clinica a la que pertenece la caja';
COMMENT ON COLUMN ClienteFrecuente.nombre IS 'Nombre del cliente frecuente';
COMMENT ON COLUMN ClienteFrecuente.paterno IS 'Apellido Paterno del cliente frecuente';
COMMENT ON COLUMN ClienteFrecuente.materno IS 'Apellido Materno del cliente frecuente';
COMMENT ON COLUMN ClienteFrecuente.numero IS 'Numero donde vive el cliente frecuente';
COMMENT ON COLUMN ClienteFrecuente.calle IS 'Calle donde vive el cliente frecuente';
COMMENT ON COLUMN ClienteFrecuente.estado IS 'Estado donde vive el cliente frecuente';
COMMENT ON COLUMN ClienteFrecuente.cp IS 'Codigo Postal donde vive el cliente frecuente';
COMMENT ON COLUMN ClienteFrecuente.genero IS 'Genero del cliente frecuente';
COMMENT ON COLUMN ClienteFrecuente.nacimiento IS 'Fecha de nacimiento del cliente frecuente';
COMMENT ON COLUMN ClienteFrecuente.telefono IS 'Telefono del cliente frecuente';
COMMENT ON COLUMN ClienteFrecuente.email IS 'Email del cliente frecuente';


--Fisico
CREATE TABLE Fisico(
	idFisico CHAR(8) NOT NULL CHECK(idFisico <> '') CHECK(idFisico SIMILAR TO '[0-9]{4}[a-z]{4}') UNIQUE,
	curpClienteNormal CHAR(18) NOT NULL,
	curpClienteFrecuente CHAR(18) NOT NULL
);
COMMENT ON TABLE Fisico IS 'Tabla que contiene la información del método de pago fisico que puede efectuar un cliente';
COMMENT ON COLUMN Fisico.idFisico IS 'Id del metodo de pago fisico';
COMMENT ON COLUMN Fisico.curpClienteNormal IS 'Identificacion del cliente normal';
COMMENT ON COLUMN Fisico.curpClienteFrecuente IS 'Identificacion del cliente frecuente';


--Internet
CREATE TABLE Internet(
	numTarjeta CHAR(16) NOT NULL CHECK(numTarjeta SIMILAR TO '[0-9]{16}') UNIQUE,
	curpClienteNormal CHAR(18) NOT NULL,
	curpClienteFrecuente CHAR(18) NOT NULL,
	nombreTitular VARCHAR(50) NOT NULL CHECK(nombreTitular <> ''),
	vencimiento DATE NOT NULL,
	cvv CHAR(4) NOT NULL CHECK(cvv SIMILAR TO '[0-9]{4}')
);
COMMENT ON TABLE Internet IS 'Tabla que contiene la información del método de pago por internet que puede efectuar un cliente';
COMMENT ON COLUMN Internet.numTarjeta IS 'número de serie de la tarjeta con la que se realiza el pago';
COMMENT ON COLUMN Internet.curpClienteNormal IS 'Identificacion del cliente normal';
COMMENT ON COLUMN Internet.curpClienteFrecuente IS 'Identificacion del cliente frecuente';
COMMENT ON COLUMN Internet.nombreTitular IS 'Nombre del titular de la tarjeta';
COMMENT ON COLUMN Internet.vencimiento IS 'Fecha de vencimiento de la tarjeta';
COMMENT ON COLUMN Internet.cvv IS 'Código de seguridad de la tarjeta';


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
COMMENT ON TABLE Veterinario IS 'Tabla que contiene la información de los veterinarios';
COMMENT ON COLUMN Veterinario.curp IS 'Identificador del veterinario';
COMMENT ON COLUMN Veterinario.idClinica IS 'Identificador de la clinica donde trabaja el veterinario';
COMMENT ON COLUMN Veterinario.nombre IS 'Nombre del veterinario';
COMMENT ON COLUMN Veterinario.paterno IS 'Apellido Paterno del veterinario';
COMMENT ON COLUMN Veterinario.materno IS 'Apellido Materno del veterinario';
COMMENT ON COLUMN Veterinario.calle IS 'Calle donde vive el veterinario';
COMMENT ON COLUMN Veterinario.numero IS 'Numero donde vive el veterinario';
COMMENT ON COLUMN Veterinario.estado IS 'Estado donde vive el veterinario';
COMMENT ON COLUMN Veterinario.cp IS 'Código Postal donde vive el veterinario';
COMMENT ON COLUMN Veterinario.genero IS 'Genero del veterinario';
COMMENT ON COLUMN Veterinario.nacimiento IS 'Fecha de nacimiento del veterinario';
COMMENT ON COLUMN Veterinario.telefono IS 'Teléfono del veterinario';
COMMENT ON COLUMN Veterinario.salario IS 'Salario del veterinario';
COMMENT ON COLUMN Veterinario.rfc IS 'RFC del veterinario';
COMMENT ON COLUMN Veterinario.numPacientes IS 'Numero de pacientes atendidos por el veterinario';
COMMENT ON COLUMN Veterinario.horarioInicio IS 'Horario en el que inicia a trabajar el veterinario';
COMMENT ON COLUMN Veterinario.horarioFin IS 'Horario en el que finaliza de trabajar el veterinario';


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
COMMENT ON TABLE Estilista IS 'Tabla que contiene la información de los estilistas';
COMMENT ON COLUMN Estilista.curp IS 'Identificador del estilista';
COMMENT ON COLUMN Estilista.idClinica IS 'Identificador de la clinica donde trabaja el estilista';
COMMENT ON COLUMN Estilista.nombre IS 'Nombre del estilista';
COMMENT ON COLUMN Estilista.paterno IS 'Apellido Paterno del estilista';
COMMENT ON COLUMN Estilista.materno IS 'Apellido Materno del estilista';
COMMENT ON COLUMN Estilista.calle IS 'Calle donde vive el estilista';
COMMENT ON COLUMN Estilista.numero IS 'Numero donde vive el estilista';
COMMENT ON COLUMN Estilista.estado IS 'Estado donde vive el estilista';
COMMENT ON COLUMN Estilista.cp IS 'Codigo Postal donde vive el estilista';
COMMENT ON COLUMN Estilista.genero IS 'Genero del estilista';
COMMENT ON COLUMN Estilista.nacimiento IS 'Fecha de nacimiento del estilista';
COMMENT ON COLUMN Estilista.telefono IS 'Teléfono del estilista';
COMMENT ON COLUMN Estilista.salario IS 'Salario del estilista';
COMMENT ON COLUMN Estilista.numCertificado IS 'Numero de certificado del estilista';


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
COMMENT ON TABLE Recibo IS 'Tabla que contiene la información de los recibos';
COMMENT ON COLUMN Recibo.idRecibo IS 'ID del recibo';
COMMENT ON COLUMN Recibo.idCaja IS 'ID de la caja que genera los recibos'; 
COMMENT ON COLUMN Recibo.idClinica IS 'ID de la clinica a la que pertenece la caja que genera los recibos';
COMMENT ON COLUMN Recibo.servicioBrindado IS 'Servicio de consulta o tratamiento brindado';
COMMENT ON COLUMN Recibo.nombreTrabajador IS 'Nombre del trabajador que brindo el servicio';
COMMENT ON COLUMN Recibo.nombreMascota IS 'Nombre de la mascota a la que se le brindo el servicio';
COMMENT ON COLUMN Recibo.nombreDuenio IS 'Nombre del duenio de la mascota a la que se le brindo el servicio';


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
COMMENT ON TABLE Mascota IS 'Tabla que contiene la información de las mascotas';
COMMENT ON COLUMN Mascota.idMascota IS 'ID de la mascota';
COMMENT ON COLUMN Mascota.curpClienteNormal IS 'curp del cliente normal que es duenio de la mascota';
COMMENT ON COLUMN Mascota.curpClienteFrecuente IS 'curp del cliente frecuente que es duenio de la mascota';
COMMENT ON COLUMN Mascota.nombre IS 'Nombre de la mascota';
COMMENT ON COLUMN Mascota.nacimiento IS 'Fecha de nacimiento de la mascota';
COMMENT ON COLUMN Mascota.peso IS 'Peso de la mascota';
COMMENT ON COLUMN Mascota.especie IS 'Especie de la mascota';
COMMENT ON COLUMN Mascota.raza IS 'Raza de la mascota';
COMMENT ON COLUMN Mascota.nombreDeDuenio IS 'Nombre del duenio de la mascota';


--Normal
CREATE TABLE Normal(
	idConsulta CHAR(2) NOT NULL CHECK(idConsulta SIMILAR TO '[0-9]{2}') UNIQUE,
	idMascota CHAR(5) NOT NULL  CHECK(idMascota SIMILAR TO '[A-Z]{3}[0-9]{2}') UNIQUE,
	curp CHAR(18) NOT NULL,
	precio FLOAT NOT NULL CHECK(precio > 0),
	fechaProxCita DATE NOT NULL CHECK(fechaProxCita > '2022-01-01'),
	medicamento VARCHAR NOT NULL CHECK(medicamento <> ''),
	motivoConsulta VARCHAR NOT NULL CHECK(motivoConsulta <> ''),
	estadoMascota VARCHAR NOT NULL CHECK(estadoMascota <> '')
);
COMMENT ON TABLE Normal IS 'Tabla que contiene la informacion de una consulta normal';
COMMENT ON COLUMN Normal.idConsulta IS 'ID de la consulta normal';
COMMENT ON COLUMN Normal.idMascota IS 'ID de la mascota a atender';
COMMENT ON COLUMN Normal.curp IS 'Identificador del veterinario que atiende la consulta';
COMMENT ON COLUMN Normal.precio IS 'Precio de la consulta';
COMMENT ON COLUMN Normal.fechaProxCita IS 'Fecha de la proxima consulta';
COMMENT ON COLUMN Normal.medicamento IS 'El medicamento a dar a la mascota atendida';
COMMENT ON COLUMN Normal.motivoConsulta IS 'La razón de la consulta';
COMMENT ON COLUMN Normal.estadoMascota IS 'El estado de la mascota atendida';


--Emergencia
CREATE TABLE Emergencia(
	idConsulta CHAR(2) NOT NULL CHECK(idConsulta SIMILAR TO '[0-9]{2}') UNIQUE,
	idMascota CHAR(5) NOT NULL  CHECK(idMascota SIMILAR TO '[A-Z]{3}[0-9]{2}') UNIQUE,
	curp CHAR(18) NOT NULL,
	precio FLOAT NOT NULL CHECK(precio > 0),
	procedimientoEmitido VARCHAR NOT NULL CHECK(procedimientoEmitido <> ''),
	sintomasMascota VARCHAR NOT NULL CHECK(sintomasMascota <> ''),
	codigoEmergencia VARCHAR NOT NULL CHECK(codigoEmergencia = 'verde' OR codigoEmergencia = 'amarillo' OR codigoEmergencia = 'rojo')
);
COMMENT ON TABLE Emergencia IS 'Tabla que contiene la informacion de una consulta de emergencia';
COMMENT ON COLUMN Emergencia.idConsulta IS 'ID de la consulta de emergencia';
COMMENT ON COLUMN Emergencia.idMascota IS 'ID de la mascota a atender';
COMMENT ON COLUMN Emergencia.curp IS 'Identificador del veterinario que atiende la consulta';
COMMENT ON COLUMN Emergencia.precio IS 'Precio de la consulta';
COMMENT ON COLUMN Emergencia.procedimientoEmitido IS 'Procedimiento a seguir para la mascota atendida';
COMMENT ON COLUMN Emergencia.sintomasMascota IS 'Sintomas de la mascota atendida';
COMMENT ON COLUMN Emergencia.codigoEmergencia IS 'La gravedad de la emergencia';


--Tratamiento
CREATE TABLE Tratamiento(
	idConsulta CHAR(2) NOT NULL CHECK(idConsulta SIMILAR TO '[0-9]{2}') UNIQUE,
	idMascota CHAR(5) NOT NULL CHECK(idMascota SIMILAR TO '[A-Z]{3}[0-9]{2}') UNIQUE ,
	curp CHAR(18) NOT NULL,
	precio FLOAT NOT NULL CHECK(precio > 0),
	servicioDado VARCHAR NOT NULL CHECK(servicioDado <> '')
);
COMMENT ON TABLE Tratamiento IS 'Tabla que contiene la informacion de un tratamiento estético';
COMMENT ON COLUMN Tratamiento.idConsulta IS 'ID de la consulta de tratamiento estético';
COMMENT ON COLUMN Tratamiento.idMascota IS 'ID de la mascota a atender';
COMMENT ON COLUMN Tratamiento.curp IS 'Identificador del estilista que atiende la consulta';
COMMENT ON COLUMN Tratamiento.precio IS 'Precio de la consulta';
COMMENT ON COLUMN Tratamiento.servicioDado IS 'Servicio dado del conjunto de diferentes servicios que ofrece un tratamiento';


/*********************************** Tablas Llave Foranea ***********************************/


--Tener Juguete
CREATE TABLE TenerJuguete(
	idClinica CHAR(5) NOT NULL,
	idProducto CHAR(10) NOT NULL
);
COMMENT ON TABLE TenerJuguete IS 'Tabla que contiene la información de los juguetes que tiene una clinica';
COMMENT ON COLUMN TenerJuguete.idClinica IS 'ID de la clinica a la que pertenecen los juguetes';
COMMENT ON COLUMN TenerJuguete.idProducto IS 'ID del juguete perteneciente a la clinica';


--Tener Accesorio
CREATE TABLE TenerAccesorio(
	idClinica CHAR(5) NOT NULL,
	idProducto CHAR(10) NOT NULL
);
COMMENT ON TABLE TenerAccesorio IS 'Tabla que contiene la información de los accesorios que tiene una clinica';
COMMENT ON COLUMN TenerAccesorio.idClinica IS 'ID de la clinica a la que pertenecen los accesorios';
COMMENT ON COLUMN TenerAccesorio.idProducto IS 'ID del accesorio perteneciente a la clinica';


--Tener Medicamento
CREATE TABLE TenerMedicamento(
	idClinica CHAR(5) NOT NULL,
	idProducto CHAR(10) NOT NULL
);
COMMENT ON TABLE TenerMedicamento IS 'Tabla que contiene la información de los medicamentos que tiene una clinica';
COMMENT ON COLUMN TenerMedicamento.idClinica IS 'ID de la clinica a la que pertenecen los medicamentos';
COMMENT ON COLUMN TenerMedicamento.idProducto IS 'ID del medicamento perteneciente a la clinica';


--Tener Comida
CREATE TABLE TenerComida(
	idClinica CHAR(5) NOT NULL,
	idProducto CHAR(10) NOT NULL
);
COMMENT ON TABLE TenerComida IS 'Tabla que contiene la información de los alimentos que tiene una clinica';
COMMENT ON COLUMN TenerComida.idClinica IS 'ID de la clinica a la que pertenece el alimento';
COMMENT ON COLUMN TenerComida.idProducto IS 'ID del alimento perteneciente a la clinica';


--Vender Juguete
CREATE TABLE VenderJuguete(
	idProducto CHAR(10) NOT NULL,
	idCaja CHAR(2) NOT NULL,
	idClinica CHAR(5) NOT NULL
);
COMMENT ON TABLE VenderJuguete IS 'Tabla que contiene la información de los juguetes que se han vendido en la caja';
COMMENT ON COLUMN VenderJuguete.idProducto IS 'ID del juguete a vender';
COMMENT ON COLUMN VenderJuguete.idCaja IS 'ID de la caja donde se vende el juguete';
COMMENT ON COLUMN VenderJuguete.idClinica IS 'ID de la clinica a la que pertenece la caja que vende juguetes';


--Vender Accesorio
CREATE TABLE VenderAccesorio(
	idProducto CHAR(10) NOT NULL,
	idCaja CHAR(2) NOT NULL,
	idClinica CHAR(5) NOT NULL
);
COMMENT ON TABLE VenderAccesorio IS 'Tabla que contiene la información de los accesorios que se han vendido en la caja';
COMMENT ON COLUMN VenderAccesorio.idProducto IS 'ID del accesorio a vender';
COMMENT ON COLUMN VenderAccesorio.idCaja IS 'ID de la caja donde se vende el accesorio';
COMMENT ON COLUMN VenderAccesorio.idClinica IS 'ID de la clinica a la que pertenece la caja que vende accesorios';


--Vender Medicamento
CREATE TABLE VenderMedicamento(
	idProducto CHAR(10) NOT NULL,
	idCaja CHAR(2) NOT NULL,
	idClinica CHAR(5) NOT NULL
);
COMMENT ON TABLE VenderMedicamento IS 'Tabla que contiene la información de los medicamentos que se han vendido en la caja';
COMMENT ON COLUMN VenderMedicamento.idProducto IS 'ID del medicamento a vender';
COMMENT ON COLUMN VenderMedicamento.idCaja IS 'ID de la caja donde se vende el medicamento';
COMMENT ON COLUMN VenderMedicamento.idClinica IS 'ID de la clinica a la que pertenece la caja que vende medicamentos';


--Vender Comida
CREATE TABLE VenderComida(
	idProducto CHAR(10) NOT NULL,
	idCaja CHAR(2) NOT NULL,
	idClinica CHAR(5) NOT NULL
);
COMMENT ON TABLE VenderComida IS 'Tabla que contiene la información de los alimentos que se han vendido en la caja';
COMMENT ON COLUMN VenderComida.idProducto IS 'ID del alimento a vender';
COMMENT ON COLUMN VenderComida.idCaja IS 'ID de la caja donde se vende el alimento';
COMMENT ON COLUMN VenderComida.idClinica IS 'ID de la clinica a la que pertenece la caja que vende alimentos';


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
	inicioSupervicion DATE NOT NULL CHECK(inicioSupervicion > '1970-01-01' AND inicioSupervicion < '1999-11-02'),
	finSupervicion DATE NOT NULL CHECK(finSupervicion > '1999-11-01' AND finSupervicion < '2022-12-31')
);
COMMENT ON TABLE Supervisar IS 'Tabla que contiene la información de los supervisores que supervisan a una clínica';
COMMENT ON COLUMN Supervisar.curp IS 'Identificador del supervisor';
COMMENT ON COLUMN Supervisar.idClinica IS 'Identificador de la clinica';
COMMENT ON COLUMN Supervisar.nombreSup IS 'Nombre del supervisor';
COMMENT ON COLUMN Supervisar.paternoSup IS 'Apellido Paterno del supervisor';
COMMENT ON COLUMN Supervisar.maternoSup IS 'Apellido Materno supervisor';
COMMENT ON COLUMN Supervisar.calleSup IS 'Calle donde vive el supervisor';
COMMENT ON COLUMN Supervisar.numeroSup IS 'Numero donde vive el supervisor';
COMMENT ON COLUMN Supervisar.estadoSup IS 'Estado donde vive el supervisor';
COMMENT ON COLUMN Supervisar.cpSup IS 'Codigo Postal donde vive el supervisor';
COMMENT ON COLUMN Supervisar.generoSup IS 'Genero del supervisor';
COMMENT ON COLUMN Supervisar.nacimientoSup IS 'Fecha de nacimiento del supervisor';
COMMENT ON COLUMN Supervisar.telefonoSup IS 'Número telefónico del supervisor';
COMMENT ON COLUMN Supervisar.salarioSup IS 'Salario del supervisor';
COMMENT ON COLUMN Supervisar.rfcSup IS 'RFC del supervisor';
COMMENT ON COLUMN Supervisar.nombreCli IS 'Nombre de la Clinica';
COMMENT ON COLUMN Supervisar.numeroCli IS 'Número donde se ubica la Clinica';
COMMENT ON COLUMN Supervisar.calleCli IS 'Calle donde se ubica la Clinica';
COMMENT ON COLUMN Supervisar.estadoCli IS 'Estado donde se ubica la Clinica';
COMMENT ON COLUMN Supervisar.cpCli IS 'Codigo Postal donde se ubica la Clinica';
COMMENT ON COLUMN Supervisar.telefonoCli IS 'Número telefónico de la Clinica';
COMMENT ON COLUMN Supervisar.horarioCli IS 'Horario de la Clinica';
COMMENT ON COLUMN Supervisar.inicioSupervicion IS 'Fecha en la que inicia un supervisor a supervisar';
COMMENT ON COLUMN Supervisar.finSupervicion IS 'Fecha en la que finaliza un supervisor de supervisar';


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
COMMENT ON TABLE GenerarReciboNormal IS 'Tabla que contiene la información de un recibo que generó una consulta normal';
COMMENT ON COLUMN GenerarReciboNormal.idRecibo IS 'ID del recibo generado';
COMMENT ON COLUMN GenerarReciboNormal.idConsulta IS 'ID de la consulta normal';
COMMENT ON COLUMN GenerarReciboNormal.idMascota IS 'ID de la mascota que fue a una consulta normal';
COMMENT ON COLUMN GenerarReciboNormal.servicioBrindado IS 'Servicio Brindado por el veterinario';
COMMENT ON COLUMN GenerarReciboNormal.nombreTrabajador IS 'Nombre del veterinario que brindo el servicio';
COMMENT ON COLUMN GenerarReciboNormal.nombreMascota IS 'Nombre de la mascota a la que se le brindo el servicio';
COMMENT ON COLUMN GenerarReciboNormal.nombreDuenio IS 'Nombre del duenio de la mascota a la que se le brindo el servicio';
COMMENT ON COLUMN GenerarReciboNormal.precio IS 'Precio del servicio brindado';
COMMENT ON COLUMN GenerarReciboNormal.fechaProxCita IS 'Fecha de la proxima cita';
COMMENT ON COLUMN GenerarReciboNormal.medicamento IS 'Nombre del medicamento que se le recetó a la mascota atendida';
COMMENT ON COLUMN GenerarReciboNormal.motivoConsulta IS 'Motivo del por qué la mascota fue a una consulta normal';
COMMENT ON COLUMN GenerarReciboNormal.estadoMascota IS 'Estado de la mascota a la que se brindo el servicio';


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
COMMENT ON TABLE GenerarReciboEmergencia IS 'Tabla que contiene la información de un recibo que generó una consulta de emergencia';
COMMENT ON COLUMN GenerarReciboEmergencia.idRecibo IS 'ID del recibo generado';
COMMENT ON COLUMN GenerarReciboEmergencia.idConsulta IS 'ID de la consulta de emergencia';
COMMENT ON COLUMN GenerarReciboEmergencia.idMascota IS 'ID de la mascota que fue a una consulta de emergencia';
COMMENT ON COLUMN GenerarReciboEmergencia.servicioBrindado IS 'Servicio Brindado por el veterinario';
COMMENT ON COLUMN GenerarReciboEmergencia.nombreTrabajador IS 'Nombre del veterinario que brindo el servicio';
COMMENT ON COLUMN GenerarReciboEmergencia.nombreMascota IS 'Nombre de la mascota a la que se le brindo el servicio';
COMMENT ON COLUMN GenerarReciboEmergencia.nombreDuenio IS 'Nombre del duenio de la mascota a la que se le brindo el servicio';
COMMENT ON COLUMN GenerarReciboEmergencia.precio IS 'Precio del servicio brindado';
COMMENT ON COLUMN GenerarReciboEmergencia.procedimientoEmitido IS 'Procedimiento emitido a la mascota tratada';
COMMENT ON COLUMN GenerarReciboEmergencia.sintomasMascota IS 'Sintomas de la mascota tratada';
COMMENT ON COLUMN GenerarReciboEmergencia.codigoEmergencia IS 'Nivel de gravedad de la emergencia';


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
COMMENT ON TABLE GenerarReciboTratamiento IS 'Tabla que contiene la información de un recibo que generó una consulta de tratamiento estético';
COMMENT ON COLUMN GenerarReciboTratamiento.idRecibo IS 'ID del recibo generado';
COMMENT ON COLUMN GenerarReciboTratamiento.idConsulta IS 'ID de la consulta de tratamiento estético';
COMMENT ON COLUMN GenerarReciboTratamiento.idMascota IS 'ID de la mascota que fue a una consulta de tratamiento estético';
COMMENT ON COLUMN GenerarReciboTratamiento.servicioBrindado IS 'Servicio Brindado por el estilista';
COMMENT ON COLUMN GenerarReciboTratamiento.nombreTrabajador IS 'Nombre del estilista que brindo el servicio';
COMMENT ON COLUMN GenerarReciboTratamiento.nombreMascota IS 'Nombre de la mascota a la que se le brindo el servicio';
COMMENT ON COLUMN GenerarReciboTratamiento.nombreDuenio IS 'Nombre del duenio de la mascota a la que se le brindo el servicio';
COMMENT ON COLUMN GenerarReciboTratamiento.precio IS 'Precio del servicio estético brindado';
COMMENT ON COLUMN GenerarReciboTratamiento.servicioDado IS 'Servicio dado dentro del conjunto de servicios que provee un estilista';



/*------------------------------------------------  LLAVES  ------------------------------------------------------*/


/*********************************** Llaves Primarias Normales ***********************************/


--Llave Supervisor
ALTER TABLE Supervisor ADD CONSTRAINT supervisor_pkey PRIMARY KEY(curp);
COMMENT ON CONSTRAINT supervisor_pkey ON Supervisor IS 'La llave primaria de la tabla Supervisor';

--Llave Clinica
ALTER TABLE Clinica ADD CONSTRAINT clinica_pkey PRIMARY KEY(idClinica);
COMMENT ON CONSTRAINT clinica_pkey ON Clinica IS 'La llave primaria de la tabla Clinica';

--Llave Juguete
ALTER TABLE Juguete ADD CONSTRAINT juguete_pkey PRIMARY KEY(idProducto);
COMMENT ON CONSTRAINT juguete_pkey ON Juguete IS 'La llave primaria de la tabla Juguete';

--Llave Accesorio
ALTER TABLE Accesorio ADD CONSTRAINT accesorio_pkey PRIMARY KEY(idProducto);
COMMENT ON CONSTRAINT accesorio_pkey ON Accesorio IS 'La llave primaria de la tabla Accesorio';

--Llave Medicamento
ALTER TABLE Medicamento ADD CONSTRAINT medicamento_pkey PRIMARY KEY(idProducto);
COMMENT ON CONSTRAINT medicamento_pkey ON Medicamento IS 'La llave primaria de la tabla Medicamento';

--Llave Accesorio
ALTER TABLE Comida ADD CONSTRAINT comida_pkey PRIMARY KEY(idProducto);
COMMENT ON CONSTRAINT comida_pkey ON Comida IS 'La llave primaria de la tabla Comida';


/*********************************** Llaves Primarias Compuestas ***********************************/


--Llave Consultorio
ALTER TABLE Consultorio ADD CONSTRAINT consultorio_pkey PRIMARY KEY(idClinica, idCuarto);
COMMENT ON CONSTRAINT consultorio_pkey ON Consultorio IS 'La llave compuesta de la tabla Consultorio';
ALTER TABLE Consultorio ADD CONSTRAINT consultorio_fkey FOREIGN KEY(idClinica)
REFERENCES Clinica(idClinica) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT consultorio_fkey ON Consultorio IS 'La llave foránea en la tabla Consultorio que hace referencia al id de la clinica';


--Llave Cuarto Cuidados
ALTER TABLE CuartoCuidados ADD CONSTRAINT cuartoCuidados_pkey PRIMARY KEY(idClinica, idCuarto);
COMMENT ON CONSTRAINT cuartoCuidados_pkey ON CuartoCuidados IS 'La llave compuesta de la tabla CuartoCuidados';
ALTER TABLE CuartoCuidados ADD CONSTRAINT cuartoCuidados_fkey FOREIGN KEY(idClinica)
REFERENCES Clinica(idClinica) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT cuartoCuidados_fkey ON CuartoCuidados IS 'La llave foránea en la tabla CuartoCuidados que hace referencia al id de la clinica';


--Llave Caja
ALTER TABLE Caja ADD CONSTRAINT caja_pkey PRIMARY KEY(idClinica, idCaja);
COMMENT ON CONSTRAINT caja_pkey ON Caja IS 'La llave compuesta de la tabla Caja';
ALTER TABLE Caja ADD CONSTRAINT caja_fkey FOREIGN KEY(idClinica)
REFERENCES Clinica(idClinica) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT caja_fkey ON Caja IS 'La llave foránea en la tabla Caja que hace referencia al id de la clinica';


/*********************************** Llaves Mezcladas (Primarias, Compuestas y Foraneas) ***********************************/


--Llaves Cliente Normal
ALTER TABLE ClienteNormal ADD CONSTRAINT clienteNormal_pkey PRIMARY KEY(curpClienteNormal);
COMMENT ON CONSTRAINT clienteNormal_pkey ON ClienteNormal IS 'La llave primaria de la tabla ClienteNormal';
ALTER TABLE ClienteNormal ADD CONSTRAINT clienteNormal_fkeyCompuesta FOREIGN KEY(idCaja, idClinica)
REFERENCES Caja(idCaja, idClinica) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT clienteNormal_fkeyCompuesta ON ClienteNormal IS 'La llave foránea compuesta de la tabla ClienteNormal 
que hace referencia a la llave primaria de la tabla Caja';


--Llaves Cliente Frecuente
ALTER TABLE ClienteFrecuente ADD CONSTRAINT clienteFrecuente_pkey PRIMARY KEY(curpClienteFrecuente);
COMMENT ON CONSTRAINT clienteFrecuente_pkey ON clienteFrecuente IS 'La llave primaria de la tabla ClienteFrecuente';
ALTER TABLE ClienteFrecuente ADD CONSTRAINT clienteFrecuente_fkeyCompuesta FOREIGN KEY(idCaja, idClinica)
REFERENCES Caja(idCaja, idClinica) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT clienteFrecuente_fkeyCompuesta ON ClienteFrecuente IS 'La llave foránea compuesta de la tabla ClienteFrecuente 
que hace referencia a la llave primaria de la tabla Caja';


--Llaves Fisico
ALTER TABLE Fisico ADD CONSTRAINT fisico_pkey PRIMARY KEY(idFisico);
COMMENT ON CONSTRAINT fisico_pkey ON Fisico IS 'La llave primaria de la tabla Fisico';
ALTER TABLE Fisico ADD CONSTRAINT fisico_fkey1 FOREIGN KEY(curpClienteNormal)
REFERENCES ClienteNormal(curpClienteNormal) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT fisico_fkey1 ON Fisico IS 'La llave foránea de la tabla Fisico que hace
referencia al curp del cliente normal';
ALTER TABLE Fisico ADD CONSTRAINT fisico_fkey2 FOREIGN KEY(curpClienteFrecuente)
REFERENCES ClienteFrecuente(curpClienteFrecuente) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT fisico_fkey2 ON Fisico IS 'La llave foránea de la tabla Fisico que hace
referencia al curp del cliente frecuente';


--Llaves Internet
ALTER TABLE Internet ADD CONSTRAINT internet_pkey PRIMARY KEY(numTarjeta);
COMMENT ON CONSTRAINT internet_pkey ON Internet IS 'La llave primaria de la tabla Internet';
ALTER TABLE Internet ADD CONSTRAINT internet_fkey1 FOREIGN KEY(curpClienteNormal)
REFERENCES ClienteNormal(curpClienteNormal) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT internet_fkey1 ON Internet IS 'La llave foránea de la tabla Internet que 
hace referencia al curp del cliente normal';
ALTER TABLE Internet ADD CONSTRAINT internet_fkey2 FOREIGN KEY(curpClienteFrecuente)
REFERENCES ClienteFrecuente(curpClienteFrecuente) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT internet_fkey2 ON Internet IS 'La llave foránea de la tabla Internet que 
hace referencia al curp del cliente frecuente';


--Llaves Veterinario
ALTER TABLE Veterinario ADD CONSTRAINT veterinario_pkey PRIMARY KEY(curp);
COMMENT ON CONSTRAINT veterinario_pkey ON Veterinario IS 'La llave primaria de la tabla Veterinario';
ALTER TABLE Veterinario ADD CONSTRAINT veterinario_fkey1 FOREIGN KEY(idClinica)
REFERENCES Clinica(idClinica) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT veterinario_fkey1 ON Veterinario IS 'La llave foránea de la tabla Veterinario
que hace referencia a el id de la clinica';


--Llaves Estilista
ALTER TABLE Estilista ADD CONSTRAINT estilista_pkey PRIMARY KEY(curp);
COMMENT ON CONSTRAINT estilista_pkey ON Estilista IS 'La llave primaria de la tabla Estilista';
ALTER TABLE Estilista ADD CONSTRAINT estilista_fkey1 FOREIGN KEY(idClinica)
REFERENCES Clinica(idClinica) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT estilista_fkey1 ON Estilista IS 'La llave foránea de la tabla Estilista
que hace referencia a el id de la clinica';


--Llaves Recibo
ALTER TABLE Recibo ADD CONSTRAINT recibo_pkey PRIMARY KEY(idRecibo);
COMMENT ON CONSTRAINT recibo_pkey ON Recibo IS 'La llave primaria de la tabla Recibo';
ALTER TABLE Recibo ADD CONSTRAINT recibo_fkeyCompuesta FOREIGN KEY(idCaja, idClinica)
REFERENCES Caja(idCaja, idClinica) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT recibo_fkeyCompuesta ON Recibo IS 'La llave foránea compuesta de la tabla Recibo que 
hace referencia a la llave primaria de la tabla Caja';


--Llaves Mascota
ALTER TABLE Mascota ADD CONSTRAINT mascota_pkey PRIMARY KEY(idMascota);
COMMENT ON CONSTRAINT mascota_pkey ON Mascota IS 'La llave primaria de la tabla Mascota';
ALTER TABLE Mascota ADD CONSTRAINT mascota_fkey1 FOREIGN KEY(curpClienteNormal)
REFERENCES ClienteNormal(curpClienteNormal) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT mascota_fkey1 ON Mascota IS 'La llave foránea de la tabla Mascota que 
hace referencia al curp del cliente normal';
ALTER TABLE Mascota ADD CONSTRAINT mascota_fkey2 FOREIGN KEY(curpClienteFrecuente)
REFERENCES ClienteFrecuente(curpClienteFrecuente) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT mascota_fkey2 ON Mascota IS 'La llave foránea de la tabla Mascota que 
hace referencia al curp del cliente frecuente';


--Llaves Normal
ALTER TABLE Normal ADD CONSTRAINT normal_pkey PRIMARY KEY(idConsulta, idMascota);
COMMENT ON CONSTRAINT normal_pkey ON Normal IS 'La llave primaria de la tabla Normal';
ALTER TABLE Normal ADD CONSTRAINT normal_fkey1 FOREIGN KEY(idMascota)
REFERENCES Mascota(idMascota) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT normal_fkey1 ON Normal IS 'La llave foránea de la tabla Normal que 
hace referencia al id de la mascota';
ALTER TABLE Normal ADD CONSTRAINT normal_fkey2 FOREIGN KEY(curp)
REFERENCES Veterinario(curp) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT normal_fkey2 ON Normal IS 'La llave foránea de la tabla Normal que 
hace referencia al curp del veterinario';


--Llaves Emergencia
ALTER TABLE Emergencia ADD CONSTRAINT emergencia_pkey PRIMARY KEY(idConsulta, idMascota);
COMMENT ON CONSTRAINT emergencia_pkey ON Emergencia IS 'La llave compuesta de la tabla Emergencia';
ALTER TABLE Emergencia ADD CONSTRAINT emergencia_fkey1 FOREIGN KEY(idMascota)
REFERENCES Mascota(idMascota) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT emergencia_fkey1 ON Emergencia IS 'La llave foránea de la tabla Emergencia que 
hace referencia al id de la mascota';
ALTER TABLE Emergencia ADD CONSTRAINT emergencia_fkey2 FOREIGN KEY(curp)
REFERENCES Veterinario(curp) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT emergencia_fkey2 ON Emergencia IS 'La llave foránea de la tabla Emergencia que 
hace referencia al curp del veterinario';


--Llaves Tratamiento
ALTER TABLE Tratamiento ADD CONSTRAINT tratamiento_pkey PRIMARY KEY(idConsulta, idMascota);
COMMENT ON CONSTRAINT tratamiento_pkey ON Tratamiento IS 'La llave compuesta de la tabla Tratamiento';
ALTER TABLE Tratamiento ADD CONSTRAINT tratamiento_fkey1 FOREIGN KEY(idMascota)
REFERENCES Mascota(idMascota) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT tratamiento_fkey1 ON Tratamiento IS 'La llave foránea de la tabla Tratamiento que 
hace referencia al id de la mascota';
ALTER TABLE Tratamiento ADD CONSTRAINT tratamiento_fkey2 FOREIGN KEY(curp)
REFERENCES Estilista(curp) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT tratamiento_fkey2 ON Tratamiento IS 'La llave foránea de la tabla Tratamiento que 
hace referencia al curp del estilista';


/*********************************** Llaves Foraneas (Solo tienen este tipo de llaves) ***********************************/


--Llaves Tener Juguete
ALTER TABLE TenerJuguete ADD CONSTRAINT tenerJuguete_fkey1 FOREIGN KEY(idClinica)
REFERENCES Clinica(idClinica) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT tenerJuguete_fkey1 ON TenerJuguete IS 'La llave foránea de la tabla Caja que hace 
referencia al id de la clinica';
ALTER TABLE TenerJuguete ADD CONSTRAINT tenerJuguete_fkey2 FOREIGN KEY(idProducto)
REFERENCES Juguete(idProducto) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT tenerJuguete_fkey2 ON TenerJuguete IS 'La llave foránea de la tabla Caja que hace 
referencia al id del producto';


--Llaves Tener Accesorio
ALTER TABLE TenerAccesorio ADD CONSTRAINT tenerAccesorio_fkey1 FOREIGN KEY(idClinica)
REFERENCES Clinica(idClinica) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT tenerAccesorio_fkey1 ON TenerAccesorio IS 'La llave foránea de la tabla TenerAccesorio 
que hace referencia al id de la clinica';
ALTER TABLE TenerAccesorio ADD CONSTRAINT tenerAccesorio_fkey2 FOREIGN KEY(idProducto)
REFERENCES Accesorio(idProducto) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT tenerAccesorio_fkey2 ON TenerAccesorio IS 'La llave foránea de la tabla TenerAccesorio
que hace referencia al id del accesorio';


--Llaves Tener Medicamento
ALTER TABLE TenerMedicamento ADD CONSTRAINT tenerMedicamento_fkey1 FOREIGN KEY(idClinica)
REFERENCES clinica(idClinica) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT tenerMedicamento_fkey1 ON TenerMedicamento IS 'La llave foránea de la tabla TenerMedicamento que hace 
referencia al id de la clinica';
ALTER TABLE TenerMedicamento ADD CONSTRAINT tenerMedicamento_fkey2 FOREIGN KEY(idProducto)
REFERENCES medicamento(idProducto) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT tenerMedicamento_fkey2 ON TenerMedicamento IS 'La llave foránea de la tabla TenerMedicamento que hace 
referencia al id del medicamento';


--Llaves Tener Comida
ALTER TABLE TenerComida ADD CONSTRAINT tenerComida_fkey1 FOREIGN KEY(idClinica)
REFERENCES Clinica(idClinica) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT tenerComida_fkey1 ON TenerComida IS 'La llave foránea de la tabla TenerComida
que hace referencia al id de la clinica';
ALTER TABLE TenerComida ADD CONSTRAINT tenerComida_fkey2 FOREIGN KEY(idProducto)
REFERENCES comida(idProducto) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT tenerComida_fkey2 ON TenerComida IS 'La llave foránea de la tabla TenerComida
que hace referencia al id de la comida';


--Llaves Vender Juguete
ALTER TABLE VenderJuguete ADD CONSTRAINT venderJuguete_fkey1 FOREIGN KEY(idProducto)
REFERENCES Juguete(idProducto) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT venderJuguete_fkey1 ON VenderJuguete IS 'La llave foránea de la tabla VenderJuguete
que hace referencia al id del juguete';
ALTER TABLE VenderJuguete ADD CONSTRAINT venderJuguete_fkeyCompuesta FOREIGN KEY(idCaja, idClinica)
REFERENCES Caja(idCaja, idClinica) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT venderJuguete_fkeyCompuesta ON VenderJuguete IS 'La llave foránea compuesta de la tabla VenderJuguete
que hace referencia a la llave primaria de la tabla consulta Normal';


--Llaves Vender Accesorio
ALTER TABLE VenderAccesorio ADD CONSTRAINT venderAccesorio_fkey1 FOREIGN KEY(idProducto)
REFERENCES Accesorio(idProducto) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT venderAccesorio_fkey1 ON VenderAccesorio IS 'La llave foránea de la tabla VenderAccesorio
que hace referencia al id del accesorio';
ALTER TABLE VenderAccesorio ADD CONSTRAINT venderAccesorio_fkeyCompuesta FOREIGN KEY(idCaja, idClinica)
REFERENCES Caja(idCaja, idClinica) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT venderAccesorio_fkeyCompuesta ON VenderAccesorio IS 'La llave foránea compuesta de la tabla 
VenderAccesorio que hace referencia a la llave primaria de la tabla consulta Normal';


--Llaves Vender Medicamento
ALTER TABLE VenderMedicamento ADD CONSTRAINT venderMedicamento_fkey1 FOREIGN KEY(idProducto)
REFERENCES Medicamento(idProducto) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT venderMedicamento_fkey1 ON VenderMedicamento IS 'La llave foránea de la tabla VenderMedicamento
que hace referencia al id del medicamento';
ALTER TABLE VenderMedicamento ADD CONSTRAINT venderMedicamento_fkeyCompuesta FOREIGN KEY(idCaja, idClinica)
REFERENCES Caja(idCaja, idClinica) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT venderMedicamento_fkeyCompuesta ON venderMedicamento IS 'La llave foránea compuesta de la tabla 
VenderMedicamento que hace referencia a la llave primaria de la tabla consulta Normal';


--Llaves Vender Comida
ALTER TABLE VenderComida ADD CONSTRAINT venderComida_fkey1 FOREIGN KEY(idProducto)
REFERENCES Comida(idProducto) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT venderComida_fkey1 ON VenderComida IS 'La llave foránea de la tabla VenderComida
que hace referencia al id de la comida';
ALTER TABLE VenderComida ADD CONSTRAINT venderComida_fkeyCompuesta FOREIGN KEY(idCaja, idClinica)
REFERENCES Caja(idCaja, idClinica) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT venderComida_fkeyCompuesta ON VenderComida IS 'La llave foránea compuesta de la tabla VenderComida
que hace referencia a la llave primaria de la tabla consulta Normal';


--Llaves Supervisar
ALTER TABLE Supervisar ADD CONSTRAINT supervisar_fkey1 FOREIGN KEY(curp)
REFERENCES Supervisor(curp) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT supervisar_fkey1 ON Supervisar IS 'La llave foránea de la tabla Supervisar
que hace referencia al curp del supervisor';
ALTER TABLE Supervisar ADD CONSTRAINT supervisar_fkey2 FOREIGN KEY(idClinica)
REFERENCES Clinica(idClinica) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT supervisar_fkey2 ON Supervisar IS 'La llave foránea de la tabla supervisar
que hace referencia al id de la clinica';


--Llaves Generar Recibo Normal
ALTER TABLE GenerarReciboNormal ADD CONSTRAINT generarReciboNormal_fkey1 FOREIGN KEY(idRecibo)
REFERENCES recibo(idRecibo) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT generarReciboNormal_fkey1 ON GenerarReciboNormal IS 'La llave foránea de la tabla GenerarReciboNormal
que hace referencia al id del recibo';
ALTER TABLE GenerarReciboNormal ADD CONSTRAINT generarReciboNormal_fkeyCompuesta FOREIGN KEY(idConsulta, idMascota)
REFERENCES Normal(idConsulta, idMascota) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT generarReciboNormal_fkeyCompuesta ON GenerarReciboNormal IS 'La llave foránea compuesta de la tabla 
GenerarReciboNormal que hace referencia a la llave primaria de la tabla consulta Normal';


--Llaves Generar Recibo Emergencia
ALTER TABLE GenerarReciboEmergencia ADD CONSTRAINT generarReciboEmergencia_fkey1 FOREIGN KEY(idRecibo)
REFERENCES Recibo(idRecibo) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT generarReciboEmergencia_fkey1 ON GenerarReciboEmergencia IS 'La llave foránea de la tabla GenerarReciboEmergencia
que hace referencia al id del recibo';
ALTER TABLE GenerarReciboEmergencia ADD CONSTRAINT generarReciboEmergencia_fkeyCompuesta FOREIGN KEY(idConsulta, idMascota)
REFERENCES Emergencia(idConsulta, idMascota) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT generarReciboEmergencia_fkeyCompuesta ON GenerarReciboEmergencia IS 'La llave foránea compuesta de la tabla 
GenerarReciboEmergencia que hace referencia a la llave primaria de la tabla consulta de Emergencia';


-- Llaves Generar Recibo Tratamiento
ALTER TABLE GenerarReciboTratamiento ADD CONSTRAINT generarReciboTratamiento_fkey1 FOREIGN KEY(idRecibo)
REFERENCES Recibo(idRecibo) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT generarReciboTratamiento_fkey1 ON GenerarReciboTratamiento IS 'La llave foránea de la tabla GenerarReciboTratamiento
que hace referencia al id del recibo';
ALTER TABLE GenerarReciboTratamiento ADD CONSTRAINT generarReciboTratamiento_fkeyCompuesta FOREIGN KEY(idConsulta, idMascota)
REFERENCES Tratamiento(idConsulta, idMascota) ON UPDATE CASCADE ON DELETE CASCADE;
COMMENT ON CONSTRAINT generarReciboTratamiento_fkeyCompuesta ON GenerarReciboTratamiento IS 'La llave foránea compuesta de la tabla 
GenerarReciboTratamiento que hace referencia a la llave primaria de la tabla consulta Normal';
