DELIMITER $$

CREATE TRIGGER trg_calculate_bmi_before_insert
BEFORE INSERT ON tbl_measurement_history
FOR EACH ROW
BEGIN

    DECLARE last_weight DECIMAL(5,2);
    DECLARE last_height DECIMAL(5,2);


    SELECT weight
    INTO last_weight
    FROM tbl_measurement_history
    WHERE fk_id_child = NEW.fk_id_child
      AND weight IS NOT NULL
    ORDER BY update_date DESC, id_history DESC
    LIMIT 1;

    SELECT height
    INTO last_height
    FROM tbl_measurement_history
    WHERE fk_id_child = NEW.fk_id_child
      AND height IS NOT NULL
    ORDER BY update_date DESC, id_history DESC
    LIMIT 1;

    IF NEW.weight IS NULL THEN
        SET NEW.weight = last_weight;
    END IF;

    IF NEW.height IS NULL THEN
        SET NEW.height = last_height;
    END IF;

    IF NEW.weight IS NOT NULL
       AND NEW.height IS NOT NULL
       AND NEW.height > 0 THEN

        SET NEW.bmi = ROUND(
            NEW.weight / ((NEW.height / 100) * (NEW.height / 100)),
            2
        );

    ELSE

        SET NEW.bmi = NULL;

    END IF;

END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_update_child_measurements
AFTER INSERT ON tbl_measurement_history
FOR EACH ROW
BEGIN

    UPDATE tbl_child
    SET
        weight = NEW.weight,
        height = NEW.height,
        bmi = NEW.bmi
    WHERE id_child = NEW.fk_id_child;

END $$

DELIMITER ;
