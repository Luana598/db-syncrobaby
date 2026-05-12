USE db_syncrobaby;

-- 1. VIEW para Status de Vacinação

CREATE VIEW vw_vaccination_status AS
SELECT 
    v.vaccine_name AS vaccine,
    v.observation AS observation,
    v.prevented_diseases AS prevented_diseases,
    ag.id_age_group,
    ag.age_group_name,
    cv.application_status,
    cv.application_date,
    c.id_child
FROM tbl_vaccine v
INNER JOIN tbl_vaccine_in_age_group vag
    ON v.id_vaccine = vag.fk_id_vaccine
INNER JOIN tbl_age_group ag
    ON vag.fk_id_age_group = ag.id_age_group
INNER JOIN tbl_child_vaccine cv
    ON v.id_vaccine = cv.fk_id_vaccine
INNER JOIN tbl_child c
    ON cv.fk_id_child = c.id_child;
    
    SELECT * FROM vw_vaccination_status WHERE application_status = 1;

-- 2. SELECT Feeding Log for Daily Routine


CREATE VIEW vw_routine_timeline AS
SELECT
	f.fk_id_child AS child,
    TIME(f.date_time) AS time, 
	DATE(f.date_time) AS date, 
    '' AS duration,
    f.description, 
    pt.product_type_name AS title,
    f.log_type,
    f.id_feeding AS id
FROM tbl_feeding_log f
INNER JOIN tbl_product_type pt
    ON pt.id_product_type = f.fk_id_product_type

UNION ALL

 SELECT 
 s.fk_id_child AS child,
	TIME(s.start_time) AS time, 
	DATE(s.start_time) AS date,
    TIMEDIFF(s.end_time, s.start_time) AS duration,
    s.description,
    'soneca' AS title,
    s.log_type, 
    s.id_sleep
    FROM tbl_sleep_log s

UNION ALL
-- 4. SELECT Diaper Change Log for Daily Routine

SELECT 
	d.fk_id_child AS child,
    TIME(d.date_time) AS time, 
	DATE(d.date_time) AS date, 
    '' AS duration,
	d.description, 
    d.type AS title,
    d.log_type,
    d.id_diaper AS id
FROM tbl_diaper_log d

UNION ALL
-- 5. SELECT Medication Log for Daily Routine

SELECT 
	m.fk_id_child AS child,
    TIME(m.date_time) AS time, 
	DATE(m.date_time) AS date, 
    '' AS duration,
	m.description, 
     'medication' AS title,
    m.log_type,
    m.id_medication AS id
    FROM tbl_medication_log m

UNION ALL
-- 3. SELECT Bath Log for Daily Routine
SELECT 
	b.fk_id_child AS child,
    TIME(b.start_time) AS time, 
	DATE(b.start_time) AS date, 
   TIMEDIFF(b.end_time, b.start_time) AS duration,
	b.description, 
     'banho' AS title,
    b.log_type,
    b.id_bath AS id
 FROM tbl_bath_log b
 ORDER BY date ASC, time ASC;
 
SELECT * FROM vw_routine_timeline WHERE date = '2024-05-10' AND child = 1 ;

--  -- Exemplo de data

select * from tbl_child where fk_id_guardian =  1;

