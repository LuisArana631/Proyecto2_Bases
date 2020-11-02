DROP DATABASE IF EXISTS proyecto2;
CREATE DATABASE proyecto2;
USE proyecto2;

CREATE TABLE encuesta(
	id_encuesta INTEGER AUTO_INCREMENT,
    nombre_encuesta VARCHAR(100) NOT NULL,
    CONSTRAINT pk_encuesta PRIMARY KEY (id_encuesta)
);

CREATE TABLE region(
	id_region INTEGER AUTO_INCREMENT,
    nombre_region VARCHAR(75) NOT NULL,
    region_padre INTEGER,
    CONSTRAINT pk_region PRIMARY KEY (id_region),
    CONSTRAINT fk_region_padre FOREIGN KEY(region_padre) REFERENCES region(id_region)
);

CREATE TABLE pais(
	id_pais INTEGER AUTO_INCREMENT,
    nombre_pais VARCHAR(100) NOT NULL,
    capital VARCHAR(100) NOT NULL,
    poblacion INTEGER NOT NULL,
    area NUMERIC NOT NULL,
	region_id INTEGER NOT NULL,
    CONSTRAINT pk_pais PRIMARY KEY(id_pais),
    CONSTRAINT fk_region_pais FOREIGN KEY(region_id) REFERENCES region(id_region)
);

CREATE TABLE pregunta(
	id_pregunta INTEGER AUTO_INCREMENT,
    pregunta_ VARCHAR(300) NOT NULL,
    encuesta_id INTEGER NOT NULL,
    CONSTRAINT pk_pregunta PRIMARY KEY(id_pregunta),
    CONSTRAINT fk_encuesta_pregunta FOREIGN KEY(encuesta_id) REFERENCES encuesta(id_encuesta)
);

CREATE TABLE respuesta(
	id_opcion INTEGER AUTO_INCREMENT,
    opcion_ VARCHAR(100) NOT NULL,
    pregunta_id INTEGER NOT NULL,
    letra VARCHAR(5) NOT NULL,
    CONSTRAINT pk_respuesta PRIMARY KEY(id_opcion),
    CONSTRAINT fk_pregunta_respuesta FOREIGN KEY(pregunta_id) REFERENCES pregunta(id_pregunta)
);

CREATE TABLE correcta(
	pregunta_id INTEGER NOT NULL,
    respuesta_id INTEGER NOT NULL,
    CONSTRAINT pk_correcta PRIMARY KEY(pregunta_id, respuesta_id),
    CONSTRAINT fk_pregunta_correcta FOREIGN KEY(pregunta_id) REFERENCES pregunta(id_pregunta),
    CONSTRAINT fk_respuesta_correcta FOREIGN KEY(respuesta_id) REFERENCES respuesta(id_opcion)
);

CREATE TABLE pais_respuesta(
	pais_id INTEGER NOT NULL,
    respuesta_id INTEGER NOT NULL,
    CONSTRAINT pk_pais_respuesta PRIMARY KEY(pais_id, respuesta_id),
    CONSTRAINT fk_pais_pais_respuesta FOREIGN KEY(pais_id) REFERENCES pais(id_pais),
    CONSTRAINT fk_respuesta_pais_respuesta FOREIGN KEY(respuesta_id) REFERENCES respuesta(id_opcion)
);

CREATE TABLE frontera(
    id_frontera INTEGER AUTO_INCREMENT,
	pais_id INTEGER NOT NULL,
    limite_pais INTEGER NOT NULL,
    norte VARCHAR(10),
    sur VARCHAR(10),
    este VARCHAR(10),
    oeste VARCHAR(10),
    CONSTRAINT pk_frontera PRIMARY KEY (id_frontera),
    CONSTRAINT fk_pais_frontera FOREIGN KEY(pais_id) REFERENCES pais(id_pais),
    CONSTRAINT fk_limite_frontera FOREIGN KEY(limite_pais) REFERENCES pais(id_pais)
);

CREATE TABLE inventor(
	id_inventor INTEGER AUTO_INCREMENT,
    nombre_inventor VARCHAR(100) NOT NULL,
    pais_id INTEGER NOT NULL,
    CONSTRAINT pk_inventor PRIMARY KEY(id_inventor),
    CONSTRAINT fk_pais_inventor FOREIGN KEY(pais_id) REFERENCES pais(id_pais)
);

CREATE TABLE profesional(
	id_profesional INTEGER AUTO_INCREMENT,
	nombre_profesional VARCHAR(100) NOT NULL,
    salario NUMERIC NOT NULL,
    comision NUMERIC,
    CONSTRAINT pk_profesional PRIMARY KEY(id_profesional)    
);

CREATE TABLE area_(
	id_area INTEGER AUTO_INCREMENT,
    nombre_area VARCHAR(100) NOT NULL,
    jefe_area INTEGER,
    ranking INTEGER,
    CONSTRAINT pk_area PRIMARY KEY(id_area),
    CONSTRAINT fk_jefe_area FOREIGN KEY(jefe_area) REFERENCES profesional(id_profesional)
);

CREATE TABLE profesional_area(
	profesional_id INTEGER NOT NULL,
    area_id INTEGER NOT NULL,
    CONSTRAINT pk_profesional_area PRIMARY KEY(profesional_id, area_id),
    CONSTRAINT fk_profesional_area_profesional FOREIGN KEY(profesional_id) REFERENCES profesional(id_profesional),
    CONSTRAINT fk_area_area_profesional FOREIGN KEY(area_id) REFERENCES area_(id_area)
);

CREATE TABLE invento(
	id_invento INTEGER AUTO_INCREMENT,
    nombre_invento VARCHAR(100) NOT NULL,
    anio_invento INTEGER NOT NULL,
    fecha_invento DATE,
    pais_id INTEGER NOT NULL,
    CONSTRAINT pk_invento PRIMARY KEY(id_invento),
    CONSTRAINT fk_pais_invento FOREIGN KEY(pais_id) REFERENCES pais(id_pais)
);

CREATE TABLE inventor_invento(
	inventor_id INTEGER NOT NULL,
    invento_id INTEGER NOT NULL,
    CONSTRAINT pk_inventor_invento PRIMARY KEY(inventor_id, invento_id),
    CONSTRAINT fk_inventor_invento FOREIGN KEY(inventor_id) REFERENCES inventor(id_inventor),
    CONSTRAINT fk_invento_inventor FOREIGN KEY(invento_id) REFERENCES invento(id_invento)
);

CREATE TABLE invento_profesional(
	invento_id INTEGER NOT NULL,
    profesional_id INTEGER NOT NULL,
    CONSTRAINT pk_ingento_profesional PRIMARY KEY(invento_id, profesional_id),
    CONSTRAINT pk_invento_invento_profesional FOREIGN KEY(invento_id) REFERENCES invento(id_invento),
    CONSTRAINT pk_profesional_invento_profesional FOREIGN KEY(profesional_id) REFERENCES profesional(id_profesional)
);