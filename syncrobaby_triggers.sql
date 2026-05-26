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

-- procedure de decremento da quantidade em estoque

DELIMITER $$

CREATE PROCEDURE sp_update_stock (
    IN p_id_stock_registry INT,
    IN p_quantity_used INT
)
BEGIN

    DECLARE current_quantity INT;

    SELECT quantity INTO current_quantity
    FROM tbl_stock_registry WHERE id_stock_registry = p_id_stock_registry;

    IF current_quantity > p_quantity_used THEN

        UPDATE tbl_stock_registry
        SET quantity = quantity - p_quantity_used
        WHERE id_stock_registry = p_id_stock_registry;

    ELSE

        UPDATE tbl_stock_registry
        SET quantity = 0
        WHERE id_stock_registry = p_id_stock_registry;

    END IF;

END $$

DELIMITER ;

-- triggers pra cada tbl

DELIMITER $$

CREATE TRIGGER trg_delete_stock_feeding
AFTER INSERT ON tbl_stock_feeding
FOR EACH ROW
BEGIN

   CALL sp_update_stock(
   NEW.fk_id_stock_registry,
   NEW.quantity
   );

END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_delete_stock_bath
AFTER INSERT ON tbl_stock_bath
FOR EACH ROW
BEGIN

   CALL sp_update_stock(
   NEW.fk_id_stock_registry,
   NEW.quantity
   );

END $$

DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_delete_stock_diaper
AFTER INSERT ON tbl_stock_diaper
FOR EACH ROW
BEGIN

   CALL sp_update_stock(
   NEW.fk_id_stock_registry,
   NEW.quantity
   );

END $$
DELIMITER ; 

DELIMITER $$
CREATE TRIGGER trg_delete_stock_medication
AFTER INSERT ON tbl_stock_medication
FOR EACH ROW
BEGIN

   CALL sp_update_stock(
   NEW.fk_id_stock_registry,
   NEW.dosage
   );

END $$
DELIMITER ;


-- relacionar vacinas com criança  
DELIMITER $$

CREATE TRIGGER trg_insert_vaccine_per_child
AFTER INSERT ON tbl_child
FOR EACH ROW
BEGIN

 INSERT INTO tbl_child_vaccine ( fk_id_child, fk_id_vaccine )
 SELECT NEW.id_child, id_vaccine 
 FROM tbl_vaccine;

END $$

DELIMITER ;

-- relacionar artigos com criança  
DELIMITER $$

CREATE TRIGGER trg_insert_article_per_child
AFTER INSERT ON tbl_child
FOR EACH ROW
BEGIN

 INSERT INTO tbl_child_article ( fk_id_child, fk_id_article)
 SELECT NEW.id_child, id_article
 FROM tbl_article;

END $$

DELIMITER ;



