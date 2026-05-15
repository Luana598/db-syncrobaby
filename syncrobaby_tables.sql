CREATE DATABASE db_syncrobaby;
  -- DROP DATABASE db_syncrobaby;
USE db_syncrobaby;


CREATE TABLE tbl_guardian (
    id_guardian INT AUTO_INCREMENT PRIMARY KEY,
    guardian_name VARCHAR(150) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    profile_picture VARCHAR(255),
    active BOOLEAN DEFAULT TRUE
);


CREATE TABLE tbl_child (
    id_child INT AUTO_INCREMENT PRIMARY KEY,
    child_name VARCHAR(150) NOT NULL,
    height DECIMAL(5,2),
    weight DECIMAL(5,2),
    birth_date DATE NOT NULL,
    BMI DECIMAL(4,2),
    blood_type VARCHAR(3),
    gender ENUM('male', 'female'),
    photo VARCHAR(255),
    active BOOLEAN DEFAULT TRUE,
    fk_id_guardian INT
);
 
ALTER TABLE tbl_child ADD CONSTRAINT FK_child_guardian
    FOREIGN KEY (fk_id_guardian)
    REFERENCES tbl_guardian (id_guardian)
    ON DELETE CASCADE;
    
CREATE TABLE tbl_notification_type (
    id_notification_type INT AUTO_INCREMENT PRIMARY KEY,
    notification_type_name VARCHAR(50) NOT NULL
);


CREATE TABLE tbl_notification (
    id_notification INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    message VARCHAR(255) NOT NULL,
    date_time DATETIME DEFAULT (CURDATE()),
    read_status BOOLEAN DEFAULT FALSE,
    fk_id_child INT,
    fk_id_guardian INT,
    fk_id_notification_type INT
);
 
ALTER TABLE tbl_notification ADD CONSTRAINT FK_notification_child
    FOREIGN KEY (fk_id_child)
    REFERENCES tbl_child (id_child)
    ON DELETE CASCADE;
 
ALTER TABLE tbl_notification ADD CONSTRAINT FK_notification_guardian
    FOREIGN KEY (fk_id_guardian)
    REFERENCES tbl_guardian (id_guardian)
    ON DELETE CASCADE;
 
ALTER TABLE tbl_notification ADD CONSTRAINT FK_notification_type
    FOREIGN KEY (fk_id_notification_type)
    REFERENCES tbl_notification_type (id_notification_type)
    ON DELETE CASCADE;

CREATE TABLE tbl_specialization (
    id_specialization INT AUTO_INCREMENT PRIMARY KEY,
    specialization_name VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_professional (
    id_professional INT AUTO_INCREMENT PRIMARY KEY,
    professional_name VARCHAR(150) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    last_consultation DATE,
    address VARCHAR(500) NOT NULL,
    fk_id_child INT,
    fk_id_specialization INT
);
 
ALTER TABLE tbl_professional ADD CONSTRAINT FK_professional_child
    FOREIGN KEY (fk_id_child)
    REFERENCES tbl_child (id_child)
    ON DELETE CASCADE;
 
ALTER TABLE tbl_professional ADD CONSTRAINT FK_professional_specialization
    FOREIGN KEY (fk_id_specialization)
    REFERENCES tbl_specialization (id_specialization)
    ON DELETE CASCADE;

CREATE TABLE tbl_measurement_history (
    id_history INT AUTO_INCREMENT PRIMARY KEY,
    weight DECIMAL(5,2),
    height DECIMAL(5,2),
    bmi DECIMAL(4,2),
    head_circumference DECIMAL(5,2),
    description VARCHAR(255),
    update_date DATE NOT NULL DEFAULT (CURDATE()),
    fk_id_child INT
);
 
ALTER TABLE tbl_measurement_history ADD CONSTRAINT FK_measurement_history_child
    FOREIGN KEY (fk_id_child)
    REFERENCES tbl_child (id_child)
    ON DELETE CASCADE;

CREATE TABLE tbl_illness (
    id_illness INT AUTO_INCREMENT PRIMARY KEY,
    illness_name VARCHAR(150) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    description VARCHAR(255),
    illness_type ENUM('acute', 'chronic') NOT NULL,
    medication VARCHAR(150),
    fk_id_child INT
);
 
ALTER TABLE tbl_illness ADD CONSTRAINT FK_illness_child
    FOREIGN KEY (fk_id_child)
    REFERENCES tbl_child (id_child)
    ON DELETE CASCADE;

CREATE TABLE tbl_vaccine (
    id_vaccine INT AUTO_INCREMENT PRIMARY KEY,
    vaccine_name VARCHAR(150) NOT NULL,
    observation VARCHAR(500),
    prevented_diseases VARCHAR(300),
    dose VARCHAR(20)
);

CREATE TABLE tbl_age_group (
    id_age_group INT AUTO_INCREMENT PRIMARY KEY,
    age_group_name VARCHAR(50) NOT NULL,
    min_months INT NOT NULL,
    max_months INT NOT NULL
);

CREATE TABLE tbl_article (
    id_article INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    content TEXT NOT NULL,
    publication_date DATE,
    author VARCHAR(150) NOT NULL,
    media VARCHAR(255),
    source_link VARCHAR(255) NOT NULL, 
    description VARCHAR(300)
);

CREATE TABLE tbl_unit (
    id_unit INT  AUTO_INCREMENT PRIMARY KEY,
    unit_initials VARCHAR(5) NOT NULL
);

CREATE TABLE tbl_product_type (
    id_product_type INT AUTO_INCREMENT PRIMARY KEY,
    product_type_name VARCHAR(150)
);

CREATE TABLE tbl_product (
    id_product INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    fk_id_unit INT ,
    fk_id_product_type INT
);
 
ALTER TABLE tbl_product ADD CONSTRAINT FK_product_unit
    FOREIGN KEY (fk_id_unit)
    REFERENCES tbl_unit (id_unit)
    ON DELETE CASCADE;
 
ALTER TABLE tbl_product ADD CONSTRAINT FK_product_product_type
    FOREIGN KEY (fk_id_product_type)
    REFERENCES tbl_product_type (id_product_type)
    ON DELETE CASCADE;

CREATE TABLE tbl_stock_registry (
    id_stock_registry INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(500),
    quantity INT NOT NULL,
    volume INT NOT NULL,
    fk_id_child INT,
    fk_id_product INT
);
 
ALTER TABLE tbl_stock_registry ADD CONSTRAINT FK_stock_registry_child
    FOREIGN KEY (fk_id_child)
    REFERENCES tbl_child (id_child)
    ON DELETE CASCADE;
 
ALTER TABLE tbl_stock_registry ADD CONSTRAINT FK_stock_registry_product
    FOREIGN KEY (fk_id_product)
    REFERENCES tbl_product (id_product)
    ON DELETE CASCADE;
 
CREATE TABLE tbl_diary_note (
    id_diary_note INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    content VARCHAR(2000) NOT NULL,
    media VARCHAR(255),
    date DATE NOT NULL,
    color VARCHAR(30),
    fk_id_child INT
);
 
ALTER TABLE tbl_diary_note ADD CONSTRAINT FK_diary_note_child
    FOREIGN KEY (fk_id_child)
    REFERENCES tbl_child (id_child)
    ON DELETE CASCADE;

CREATE TABLE tbl_sleep_log (
    id_sleep INT AUTO_INCREMENT PRIMARY KEY,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    log_date DATE NOT NULL DEFAULT (CURDATE()),
    log_type VARCHAR(15) DEFAULT 'sono',
    description VARCHAR(255),
    fk_id_child INT
);
 
ALTER TABLE tbl_sleep_log ADD CONSTRAINT FK_sleep_log_child
    FOREIGN KEY (fk_id_child)
    REFERENCES tbl_child (id_child)
    ON DELETE CASCADE;

CREATE TABLE tbl_diaper_log (
    id_diaper INT AUTO_INCREMENT PRIMARY KEY,
    date_time DATETIME NOT NULL,
    description VARCHAR(255),
    type ENUM('urine', 'stool') NOT NULL,
	log_type VARCHAR(15) DEFAULT 'fralda',
    fk_id_child INT
);
 
ALTER TABLE tbl_diaper_log ADD CONSTRAINT FK_diaper_log_child
    FOREIGN KEY (fk_id_child)
    REFERENCES tbl_child (id_child)
    ON DELETE CASCADE; 

CREATE TABLE tbl_medication_log (
    id_medication INT AUTO_INCREMENT PRIMARY KEY,
    date_time DATETIME NOT NULL,
    description VARCHAR(255),
	log_type VARCHAR(15) DEFAULT 'medicacao',
    fk_id_child INT
);
 
ALTER TABLE tbl_medication_log ADD CONSTRAINT FK_medication_log_child
    FOREIGN KEY (fk_id_child)
    REFERENCES tbl_child (id_child)
    ON DELETE CASCADE;
    
CREATE TABLE tbl_feeding_log (
    id_feeding INT AUTO_INCREMENT PRIMARY KEY,
    date_time DATETIME NOT NULL,
    description VARCHAR(255),
     log_type VARCHAR(15) DEFAULT 'alimentacao',
    fk_id_child INT,
    fk_id_product_type INT
);
 
ALTER TABLE tbl_feeding_log ADD CONSTRAINT FK_feeding_log_child
    FOREIGN KEY (fk_id_child)
    REFERENCES tbl_child (id_child)
    ON DELETE CASCADE;
 
ALTER TABLE tbl_feeding_log ADD CONSTRAINT FK_feeding_log_type
    FOREIGN KEY (fk_id_product_type)
    REFERENCES tbl_product_type (id_product_type)
    ON DELETE CASCADE;
    
CREATE TABLE tbl_bath_log (
    id_bath INT AUTO_INCREMENT PRIMARY KEY,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    description VARCHAR(255),
    log_date DATE NOT NULL DEFAULT (CURDATE()),
	log_type VARCHAR(10) DEFAULT 'banho',
    fk_id_child INT
);
 
ALTER TABLE tbl_bath_log ADD CONSTRAINT FK_bath_log_child
    FOREIGN KEY (fk_id_child)
    REFERENCES tbl_child (id_child)
    ON DELETE CASCADE;
    
-- RELATIONSHIP TABLES --

CREATE TABLE tbl_stock_feeding (
    fk_id_feeding INT,
    fk_id_stock_registry INT,
    quantity INT NOT NULL
);
 
ALTER TABLE tbl_stock_feeding ADD CONSTRAINT FK_stock_feeding_1
    FOREIGN KEY (fk_id_feeding)
    REFERENCES tbl_feeding_log (id_feeding)
    ON DELETE CASCADE;
 
ALTER TABLE tbl_stock_feeding ADD CONSTRAINT FK_stock_feeding_2
    FOREIGN KEY (fk_id_stock_registry)
    REFERENCES tbl_stock_registry (id_stock_registry)
    ON DELETE CASCADE;
    
-- RELATION -> STOCK PRODUCTS IN BATH LOG --

CREATE TABLE tbl_stock_bath (
    fk_id_bath INT,
    fk_id_stock_registry INT,
    quantity INT NOT NULL
);
 
ALTER TABLE tbl_stock_bath ADD CONSTRAINT FK_stock_bath_1
    FOREIGN KEY (fk_id_bath)
    REFERENCES tbl_bath_log (id_bath)
    ON DELETE CASCADE;
 
ALTER TABLE tbl_stock_bath ADD CONSTRAINT FK_stock_bath_2
    FOREIGN KEY (fk_id_stock_registry)
    REFERENCES tbl_stock_registry (id_stock_registry)
    ON DELETE CASCADE;
    
-- RELATION -> STOCK PRODUCTS IN MEDICATION --

CREATE TABLE tbl_stock_medication (
    fk_id_medication INT,
    fk_id_stock_registry INT,
    dosage INT NOT NULL
);
 
ALTER TABLE tbl_stock_medication ADD CONSTRAINT FK_stock_medication_1
    FOREIGN KEY (fk_id_medication)
    REFERENCES tbl_medication_log (id_medication)
    ON DELETE CASCADE;
 
ALTER TABLE tbl_stock_medication ADD CONSTRAINT FK_stock_medication_2
    FOREIGN KEY (fk_id_stock_registry)
    REFERENCES tbl_stock_registry (id_stock_registry)
    ON DELETE CASCADE;
    
-- RELATION -> STOCK PRODUCTS IN DIAPER CHANGE --

CREATE TABLE tbl_stock_diaper (
    fk_id_diaper INT,
    fk_id_stock_registry INT,
    quantity INT NOT NULL
);
 
ALTER TABLE tbl_stock_diaper ADD CONSTRAINT FK_stock_diaper_1
    FOREIGN KEY (fk_id_diaper)
    REFERENCES tbl_diaper_log (id_diaper)
    ON DELETE CASCADE;
 
ALTER TABLE tbl_stock_diaper ADD CONSTRAINT FK_stock_diaper_2
    FOREIGN KEY (fk_id_stock_registry)
    REFERENCES tbl_stock_registry (id_stock_registry)
    ON DELETE CASCADE;

-- RELATION -> VACCINE IN AGE GROUP --

CREATE TABLE tbl_vaccine_in_age_group (
    fk_id_age_group INT,
    fk_id_vaccine INT
);
 
ALTER TABLE tbl_vaccine_in_age_group ADD CONSTRAINT FK_vaccine_in_age_group_1
    FOREIGN KEY (fk_id_age_group)
    REFERENCES tbl_age_group (id_age_group)
    ON DELETE RESTRICT;
 
ALTER TABLE tbl_vaccine_in_age_group ADD CONSTRAINT FK_vaccine_in_age_group_2
    FOREIGN KEY (fk_id_vaccine)
    REFERENCES tbl_vaccine (id_vaccine)
    ON DELETE SET NULL;
    
-- RELATION -> ARTICLE IN AGE GROUP --

CREATE TABLE tbl_article_in_age_group (
    fk_id_age_group INT,
    fk_id_article INT
);
 
ALTER TABLE tbl_article_in_age_group ADD CONSTRAINT FK_article_in_age_group_1
    FOREIGN KEY (fk_id_age_group)
    REFERENCES tbl_age_group (id_age_group)
    ON DELETE RESTRICT;
 
ALTER TABLE tbl_article_in_age_group ADD CONSTRAINT FK_article_in_age_group_2
    FOREIGN KEY (fk_id_article)
    REFERENCES tbl_article (id_article)
    ON DELETE SET NULL;
    
-- RELATION -> VACCINES PER CHILD --

CREATE TABLE tbl_child_vaccine (
    fk_id_child INT,
    fk_id_vaccine INT,
    application_status BOOLEAN DEFAULT FALSE,
    application_date DATE
);
 
ALTER TABLE tbl_child_vaccine ADD CONSTRAINT FK_child_vaccine_1
    FOREIGN KEY (fk_id_child)
    REFERENCES tbl_child (id_child)
    ON DELETE RESTRICT;
 
ALTER TABLE tbl_child_vaccine ADD CONSTRAINT FK_child_vaccine_2
    FOREIGN KEY (fk_id_vaccine)
    REFERENCES tbl_vaccine (id_vaccine)
    ON DELETE SET NULL;
    
-- RELATION -> ARTICLE PER CHILD --

CREATE TABLE tbl_child_article (
    fk_id_article INT,
    fk_id_child INT
);
 
ALTER TABLE tbl_child_article ADD CONSTRAINT FK_child_article_1
    FOREIGN KEY (fk_id_article)
    REFERENCES tbl_article (id_article)
    ON DELETE SET NULL;
 
ALTER TABLE tbl_child_article ADD CONSTRAINT FK_child_article_2
    FOREIGN KEY (fk_id_child)
    REFERENCES tbl_child (id_child)
    ON DELETE SET NULL;