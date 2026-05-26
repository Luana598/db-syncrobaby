USE db_syncrobaby;

-- 1. VIEW para Status de Vacinação

CREATE VIEW vw_vaccination_status AS
SELECT 
    v.id_vaccine,
    v.vaccine_name AS vaccine,
    v.observation,
    v.prevented_diseases,
    v.dose,
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

LEFT JOIN tbl_child_vaccine cv
    ON v.id_vaccine = cv.fk_id_vaccine

LEFT JOIN tbl_child c
    ON cv.fk_id_child = c.id_child;
    
    
    SELECT * FROM vw_vaccination_status where id_child = 1;
    

-- 2. VIEW para linha temporal do dia - rotinas


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
 
 -- VIEW de produto com tipo e grandeza
 CREATE VIEW  vw_product_info AS
 
 SELECT p.id_product as id, 
 p.product_name as name, 
 p.fk_id_product_type as id_type,
 pt.product_type_name as type, 
  p.fk_id_unit as id_unity,
 u.unit_initials as unit
 FROM tbl_product p
INNER JOIN tbl_product_type pt
    ON pt.id_product_type = p.fk_id_product_type
INNER JOIN tbl_unit u
    ON u.id_unit = p.fk_id_unit;
    
    select * from vw_product_info where id = 1;

-- VIEW de registro em estoque por tipo de produto
 CREATE VIEW vw_stock_type AS

SELECT sr.id_stock_registry as id,
p.product_name,
sr.description,
pt.product_type_name as type,
 u.unit_initials as measure,
sr.quantity,
sr.volume,
sr.fk_id_child as id_child,
sr.fk_id_product as id_product, 
p.fk_id_product_type
FROM tbl_stock_registry sr
INNER JOIN tbl_product p
ON sr.fk_id_product = p.id_product
INNER JOIN tbl_product_type pt
ON p.fk_id_product_type = pt.id_product_type
INNER JOIN tbl_unit u
ON u.id_unit = p.fk_id_unit;

select * from vw_stock_type;

-- VIEW de notificacao com tipo
 CREATE VIEW vw_notification_type AS

SELECT n.title, 
n.message,
n.date_time, 
n.fk_id_child, 
n.fk_id_guardian, 
n.fk_id_notification_type,
nt.notification_type_name
FROM tbl_notification n 
INNER JOIN tbl_notification_type nt
ON n.fk_id_notification_type = nt.id_notification_type;

SELECT * FROM vw_notification_type;

-- VIEW de artigo com faixa etária

CREATE VIEW vw_article_by_age_group AS

SELECT a.id_article, 
a.title,
a.content,
a.publication_date,
a.author,
a.media,
a.source_link,
a.description,
aag.fk_id_age_group,
ag.age_group_name
FROM tbl_article a
INNER JOIN tbl_article_in_age_group aag
ON a.id_article = aag.fk_id_article

INNER JOIN tbl_age_group ag
    ON aag.fk_id_age_group = ag.id_age_group;
    
    SELECT * FROM vw_article_by_age_group ORDER BY fk_id_age_group;
    
    select * from tbl_child_vaccine;
    