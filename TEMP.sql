CREATE TEMPORARY TABLE archivo1(
	invento NVARCHAR(100),
	inventor NVARCHAR(100),
    profesional_asignado_al_invento NVARCHAR(100),
    el_profesional_es_jefe_del_area NVARCHAR(100),
    fecha_contrato_profesional NVARCHAR(100),
    salario NVARCHAR(100),
    comision NVARCHAR(100),
    area_invest_del_prof NVARCHAR(100),
    ranking NVARCHAR(100),
	anio_del_invento NVARCHAR(100),
    pais_del_invento NVARCHAR(100),
    pais_del_inventor NVARCHAR(100),
    region_del_pais NVARCHAR(100),
    capital NVARCHAR(100),
    poblacion_del_pais NVARCHAR(100),
    area_en_km2 NVARCHAR(100),
    frontera_con NVARCHAR(100),
    norte NVARCHAR(1),
    sur NVARCHAR(1),
    este NVARCHAR(1),
    oeste NVARCHAR(1)
) CHARACTER SET utf8 COLLATE utf8_unicode_ci;

/*DROP TABLE archivo1;*/

CREATE TEMPORARY TABLE archivo2(
	nombre_encuesta NVARCHAR(100),
    pregunta NVARCHAR(200),
    respuestas_posibles NVARCHAR(100),
    respuesta_correcta NVARCHAR(100),
    pais NVARCHAR(100),
    respuesta_pais NVARCHAR(5)
);

CREATE TEMPORARY TABLE archivo3(
	nombre_region NVARCHAR(100),
    region_padre NVARCHAR(100)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CargaP-I.csv'
INTO TABLE archivo1
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
