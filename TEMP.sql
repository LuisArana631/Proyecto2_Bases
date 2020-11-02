USE proyecto2;
DROP TABLE IF EXISTS archivo1;
CREATE TABLE archivo1(
	invento VARCHAR(100),
	inventor VARCHAR(100),
    profesional_asignado_al_invento VARCHAR(100),
    el_profesional_es_jefe_del_area VARCHAR(100),
    fecha_contrato_profesional VARCHAR(100),
    salario VARCHAR(100),
    comision VARCHAR(100),
    area_invest_del_prof VARCHAR(100),
    ranking VARCHAR(100),
	anio_del_invento VARCHAR(100),
    pais_del_invento VARCHAR(100),
    pais_del_inventor VARCHAR(100),
    region_del_pais VARCHAR(100),
    capital VARCHAR(100),
    poblacion_del_pais VARCHAR(100),
    area_en_km2 VARCHAR(100),
    frontera_con VARCHAR(100),
    norte VARCHAR(10),
    sur VARCHAR(10),
    este VARCHAR(10),
    oeste VARCHAR(10)
);

DROP TABLE IF EXISTS archivo2;
CREATE TABLE archivo2(
	nombre_encuesta VARCHAR(100),
    pregunta VARCHAR(300),
    respuestas_posibles VARCHAR(100),
    respuesta_correcta VARCHAR(100),
    pais VARCHAR(100),
    respuesta_pais VARCHAR(5)
);

DROP TABLE IF EXISTS archivo3;
CREATE TABLE archivo3(
	nombre_region VARCHAR(100),
    region_padre VARCHAR(100)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CargaP-I.csv'
IGNORE INTO TABLE archivo1
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CargaP-II.csv'
IGNORE INTO TABLE archivo2
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CargaP-III.csv'
IGNORE INTO TABLE archivo3
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM archivo1;
SELECT COUNT(*) FROM archivo2;
SELECT COUNT(*) FROM archivo3;