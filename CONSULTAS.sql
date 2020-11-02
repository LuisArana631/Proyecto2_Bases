/* Desplegar cada profesional, y el número de inventos que tiene asignados ordenados de
mayor a menor. */

SELECT p.id_profesional, p.nombre_profesional, COUNT(ip.profesional_id) AS inventos
FROM invento_profesional ip, profesional p
WHERE p.id_profesional = ip.profesional_id
GROUP BY p.id_profesional, p.nombre_profesional
ORDER BY inventos DESC;

/*  Desplegar los países de cada continente y el número de preguntas que han contestado de
cualquier encuesta. Si hay países que no han contestado ninguna encuesta, igual debe
aparecer su nombre el la lista */



/* Desplegar todos los países que no tengan ningún inventor y que no tengan ninguna frontera
con otro país ordenados por su área. */
/*
SELECT DISTINCT p.id_pais, p.nombre_pais, reg.nombre_region, p.area, COUNT(i.pais_id) AS inventores_
FROM pais p
INNER JOIN inventor i ON p.id_pais = i.pais_id
INNER JOIN region reg ON reg.id_region = p.region_id
GROUP BY p.id_pais, p.nombre_pais, p.area, reg.nombre_region
HAVING COUNT(i.pais_id) = 1
ORDER BY p.area DESC;
*/
/* Desplegar el nombre de cada jefe seguido de todos sus subalternos, para todos los
profesionales ordenados por el jefe alfabéticamente. */

SELECT p1.id_profesional AS id_jefe, p1.nombre_profesional AS nombre_jefe, a.nombre_area, p2.id_profesional, p2.nombre_profesional
FROM profesional p1, profesional p2, profesional_area pa, area_ a
WHERE p1.id_profesional = a.jefe_area
AND p2.id_profesional = pa.profesional_id
AND pa.area_id = a.id_area
ORDER BY p1.nombre_profesional;

/* Desplegar todos los profesionales, y su salario cuyo salario es mayor al promedio del
salario de los profesionales en su misma área. */



/* Desplegar los nombres de los países que han contestado encuestas, ordenados del país que
más aciertos ha tenido hasta el que menos aciertos ha tenido. */



/* Desplegar los inventos documentados por todos los profesionales expertos en Óptica */

SELECT i.id_invento, i.nombre_invento, i.anio_invento
FROM profesional p, invento_profesional ip, invento i, area_ a, profesional_area pa
WHERE ip.invento_id = i.id_invento
AND ip.profesional_id = p.id_profesional
AND p.id_profesional = pa.profesional_id
AND pa.area_id = a.id_area
AND a.nombre_area = 'Ã“ptica';

/* Desplegar la suma del área de todos los países agrupados por la inicial de su nombre. */

SELECT SUM(p.area) AS area_total, LEFT(p.nombre_pais, 1) AS inicial
FROM pais p
GROUP BY inicial
ORDER BY inicial;

/* Desplegar todos los inventores y sus inventos cuyo nombre del inventor inicie con las
letras BE. */

SELECT ir.id_inventor, ir.nombre_inventor, COUNT(ii.inventor_id)
FROM inventor ir, inventor_invento ii
WHERE ir.nombre_inventor LIKE 'BE%'
AND ii.inventor_id = ir.id_inventor
GROUP BY ir.id_inventor, ir.nombre_inventor;

SELECT ir.id_inventor, ir.nombre_inventor, i.nombre_invento
FROM inventor_invento ii
INNER JOIN inventor ir ON ir.id_inventor = ii.inventor_id
INNER JOIN invento i ON i.id_invento = ii.invento_id
WHERE ir.nombre_inventor LIKE 'BE%';

/* Desplegar el nombre de todos los inventores que Inicien con B y terminen con r o con n que
tengan inventos del siglo 19. */

SELECT DISTINCT i.id_inventor, i.nombre_inventor
FROM inventor i, inventor_invento ii, invento inv
WHERE i.nombre_inventor LIKE 'B%r'
OR i.nombre_inventor LIKE 'B%n'
AND i.id_inventor = ii.inventor_id
AND ii.invento_id = inv.id_invento
AND inv.anio_invento LIKE '18__';

/* Desplegar el nombre del país y el área de todos los países que tienen mas de siete
fronteras ordenarlos por el de mayor área. */

SELECT p.id_pais, p.nombre_pais, p.area, COUNT(f.pais_id) AS fronteras
FROM pais p, frontera f
WHERE f.pais_id = p.id_pais
GROUP BY p.id_pais, p.nombre_pais, p.area
HAVING fronteras > 7
ORDER BY p.area;

/* Desplegar todos los inventos de cuatro letras que inicien con L. */

SELECT i.id_invento, i.nombre_invento, i.anio_invento
FROM invento i
WHERE i.nombre_invento LIKE 'L___';

/* Desplegar el nombre del profesional, su salario, su comisión y el total de salario (sueldo
mas comisión) de todos los profesionales con comisión mayor que el 25% de su salario. */


SELECT p.id_profesional, p.nombre_profesional, p.salario, p.comision, SUM(p.salario + p.comision) AS total_salario
FROM profesional p
WHERE p.comision > p.salario * 0.25
GROUP BY p.id_profesional, p.nombre_profesional;

/* Desplegar cada encuesta y el número de países que las han contestado, ordenadas de mayor
a menor. */



/* Desplegar los países cuya población sea mayor a la población de los países
centroamericanos juntos. */

SELECT p.id_pais, p.nombre_pais, p.poblacion
FROM pais p
HAVING p.poblacion > (SELECT SUM(p2.poblacion) poblacion_centroamerica
FROM pais p2, region r
WHERE r.id_region = p2.region_id
AND r.nombre_region = 'Centro America')
ORDER BY p.poblacion;

/* Desplegar todos los Jefes de cada profesional que no este en el mismo departamento que el
del profesional que atiende al inventor Pasteur. */



/* Desplegar el nombre de todos los inventos inventados el mismo año que BENZ invento
algún invento. */



/*  Desplegar los nombres y el número de habitantes de todas las islas que tiene un área
mayor o igual al área de Japón. */



/* Desplegar todos los países con el nombre de cada país con el cual tiene una frontera. */



/* Desplegar el nombre del profesional su salario y su comisión de los empleados cuyo salario
es mayor que el doble de su comisión. */

SELECT p.id_profesional, p.nombre_profesional, p.salario, p.comision
FROM profesional p
WHERE p.salario > p.comision * 2;

SELECT p.id_profesional, p.nombre_profesional, p.salario, p.comision
FROM profesional p
WHERE p.salario > p.comision * 2
AND p.comision > 0;
