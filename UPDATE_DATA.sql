INSERT INTO encuesta(nombre_encuesta)
SELECT DISTINCT nombre_encuesta
FROM archivo2;
SELECT COUNT(*) FROM encuesta;

INSERT INTO pregunta(pregunta_, encuesta_id)
SELECT DISTINCT archivo2.pregunta, encuesta.id_encuesta
FROM archivo2, encuesta
WHERE encuesta.nombre_encuesta = archivo2.nombre_encuesta;
SELECT COUNT(*) FROM pregunta;

INSERT INTO respuesta(opcion_, pregunta_id, letra)
SELECT DISTINCT archivo2.respuestas_posibles, pregunta.id_pregunta, LEFT(archivo2.respuestas_posibles, 1)
FROM archivo2, pregunta
WHERE archivo2.pregunta = pregunta.pregunta_;
SELECT COUNT(*) FROM respuesta;

INSERT INTO correcta(pregunta_id, respuesta_id)
SELECT DISTINCT pregunta.id_pregunta, respuesta.id_opcion
FROM pregunta, respuesta, archivo2
WHERE pregunta.pregunta_ = archivo2.pregunta
AND respuesta.opcion_ = archivo2.respuesta_correcta;
SELECT COUNT(*) FROM correcta;

INSERT INTO region(nombre_region)
SELECT DISTINCT archivo3.nombre_region
FROM archivo3;
UPDATE region r1 INNER JOIN(
SELECT archivo3.nombre_region,
CASE WHEN archivo3.region_padre IS NULL THEN NULL
    ELSE(
		SELECT r2.id_region
        FROM region r2
        WHERE r2.nombre_region = archivo3.region_padre
    )END index_region
FROM archivo3) aux_
ON r1.nombre_region = aux_.nombre_region
SET r1.region_padre = aux_.index_region;
SELECT COUNT(*) FROM region;

INSERT INTO pais(nombre_pais, capital, poblacion, area, region_id)
SELECT DISTINCT archivo1.pais_del_inventor, archivo1.capital, archivo1.poblacion_del_pais, archivo1.area_en_km2, region.id_region
FROM archivo1, region
WHERE archivo1.region_del_pais = region.nombre_region;
SELECT COUNT(*) FROM pais;

INSERT INTO frontera(pais_id, limite_pais, norte, sur, este, oeste)
SELECT DISTINCT p1.id_pais, p2.id_pais, archivo1.norte, archivo1.sur, archivo1.este, archivo1.oeste
FROM pais p1, pais p2, archivo1
WHERE archivo1.pais_del_inventor = p1.nombre_pais
AND archivo1.frontera_con = p2.nombre_pais;
SELECT COUNT(*) FROM frontera;

INSERT INTO profesional(comision, nombre_profesional, salario)
SELECT DISTINCT archivo1.comision, archivo1.profesional_asignado_al_invento, archivo1.salario
FROM  archivo1;
SELECT COUNT(*) FROM profesional;

INSERT INTO inventor(nombre_inventor, pais_id)
SELECT DISTINCT archivo1.inventor, pais.id_pais
FROM archivo1, pais
WHERE archivo1.pais_del_inventor = pais.nombre_pais;
SELECT COUNT(*) FROM inventor;

INSERT INTO invento(anio_invento, fecha_invento, nombre_invento, pais_id)
SELECT DISTINCT archivo1.anio_del_invento, str_to_date(archivo1.fecha_contrato_profesional, "%d-%b-%y"), archivo1.invento, pais.id_pais
FROM archivo1, pais
WHERE archivo1.pais_del_invento = pais.nombre_pais;
SELECT COUNT(*) FROM invento;

INSERT INTO area_(nombre_area, ranking)
SELECT DISTINCT archivo1.area_invest_del_prof, archivo1.ranking
FROM archivo1;
UPDATE area_ a1 INNER JOIN (
SELECT profesional.id_profesional, area_.nombre_area
FROM profesional, archivo1, area_
WHERE profesional.nombre_profesional = archivo1.profesional_asignado_al_invento
AND archivo1.el_profesional_es_jefe_del_area = area_.nombre_area) prof
ON a1.nombre_area = prof.nombre_area
SET a1.jefe_area = prof.id_profesoinal;
SELECT COUNT(*) FROM area_;

INSERT INTO profesional_area(area_id, profesional_id)
SELECT DISTINCT area_.id_area, profesional.id_profesional
FROM area_, profesional, archivo1
WHERE archivo1.area_invest_del_prof = area_.nombre_area
AND archivo1.profesional_asignado_al_invento = profesional.nombre_profesional;
SELECT COUNT(*) FROM profesional_area;

INSERT INTO inventor_invento(inventor_id, invento_id)
SELECT DISTINCT inventor.id_inventor, invento.id_invento
FROM inventor, invento, archivo1
WHERE archivo1.inventor = inventor.nombre_inventor
AND archivo1.invento = invento.nombre_invento;
SELECT COUNT(*) FROM inventor_invento;

INSERT INTO invento_profesional(invento_id, profesional_id)
SELECT DISTINCT invento.id_invento, profesional.id_profesional
FROM invento, profesional, archivo1
WHERE archivo1.invento = invento.nombre_invento
AND archivo1.profesional_asignado_al_invento = profesional.nombre_profesional;
SELECT COUNT(*) FROM invento_profesional;
