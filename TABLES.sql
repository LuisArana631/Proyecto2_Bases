/* CREACION DE LA BASE DE DATOS */
DROP DATABASE IF EXISTS proyecto2;
CREATE DATABASE proyecto2;
USE proyecto2;

/* CREACION DE LAS TABLAS */
CREATE TABLE pais(
	id_pais INTEGER AUTO_INCREMENT,
    nombre_pais NVARCHAR(75) NOT NULL,
    capital NVARCHAR(75) NOT NULL,
    poblacion INTEGER NOT NULL,
    area_pais NUMERIC NOT NULL,
    CONSTRAINT pk_pais PRIMARY KEY (id_pais)
);

CREATE TABLE region(
	id_region INTEGER AUTO_INCREMENT,
    nombre_region NVARCHAR(100) NOT NULL,
    id_region_padre INTEGER,
    CONSTRAINT pk_region PRIMARY KEY (id_region),
    CONSTRAINT fk_region FOREIGN KEY (id_region_padre) REFERENCES region(id_region)
);

CREATE TABLE area_(
	id_area INTEGER AUTO_INCREMENT,
    nombre_area NVARCHAR(75) NOT NULL,
    CONSTRAINT pk_area PRIMARY KEY (id_area)
);



