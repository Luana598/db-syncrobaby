-- evento de inserção de notificação de vacinação 

SET GLOBAL event_scheduler = ON;
  
SHOW VARIABLES LIKE 'event_scheduler';

drop event ev_notify_birthday;

DELIMITER $$

CREATE EVENT ev_notify_vaccine
ON SCHEDULE EVERY 5 minute
DO
BEGIN

    INSERT INTO tbl_notification (
        title,
        message,
        fk_id_child,
        fk_id_guardian,
        fk_id_notification_type
    )

    SELECT
        'Vacina disponível',

        CONCAT(
            c.child_name,
            ' entrou na faixa etária da ',
            v.vaccine_name,
            ' - ',
            v.dose,
            '.'
        ),

        c.id_child,
        c.fk_id_guardian,
        1

    FROM tbl_child c

    INNER JOIN tbl_child_vaccine cv
        ON cv.fk_id_child = c.id_child

    INNER JOIN tbl_vaccine v
        ON v.id_vaccine = cv.fk_id_vaccine

    INNER JOIN tbl_vaccine_in_age_group vag
        ON vag.fk_id_vaccine = v.id_vaccine

    INNER JOIN tbl_age_group ag
        ON ag.id_age_group = vag.fk_id_age_group

    WHERE TIMESTAMPDIFF(
        MONTH,
        c.birth_date,
        CURDATE()
    )
    BETWEEN ag.min_months AND ag.max_months

    AND NOT EXISTS (

        SELECT 1
        FROM tbl_notification n

        WHERE n.fk_id_child = c.id_child
        AND n.fk_id_notification_type = 1

        AND n.message = CONCAT(
            c.child_name,
            ' entrou na faixa etária da ',
            v.vaccine_name,
            ' - ',
            v.dose,
            '.'
        )
    );

END $$

DELIMITER ;

DELIMITER $$

CREATE EVENT ev_notify_birthday
ON SCHEDULE EVERY 5 minute
DO
BEGIN

    INSERT INTO tbl_notification (
        title,
        message,
        fk_id_child,
        fk_id_guardian,
        fk_id_notification_type
    )

    SELECT
        'Feliz aniversário!',

        CONCAT(
            c.child_name,
            ' está fazendo ',
            TIMESTAMPDIFF(
                YEAR,
                c.birth_date,
                CURDATE()
            ),
            ' anos hoje!'
        ),

        c.id_child,
        c.fk_id_guardian,
        3

    FROM tbl_child c

    WHERE MONTH(c.birth_date) = MONTH(CURDATE())
    AND DAY(c.birth_date) = DAY(CURDATE())

    AND NOT EXISTS (
        SELECT 1
        FROM tbl_notification n

        WHERE n.fk_id_child = c.id_child
        AND n.fk_id_notification_type = 3
        AND DATE(n.date_time) = CURDATE()
    );

END $$

DELIMITER ;

