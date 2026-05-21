USE db_syncrobaby;

INSERT INTO tbl_guardian (guardian_name, email, password, profile_picture) VALUES 
('Ana Souza', 'ana.souza@email.com', 'senha123', 'perfil_ana.jpg'),
('Carlos Lima', 'carlos.lima@email.com', 'carlos456', 'perfil_carlos.jpg'),
('Mariana Silva', 'mari.silva@email.com', 'mari789', NULL);

INSERT INTO tbl_child (child_name, height, weight, birth_date, BMI, blood_type, gender, fk_id_guardian) VALUES 
('Alice Souza', 52.0, 3.50, '2023-05-10', 12.9, 'O+', 'female', 1),
('Bento Lima', 60.0, 5.80, '2023-01-15', 16.1, 'A-', 'male', 2),
('Clara Silva', 48.0, 2.90, '2024-02-01', 12.5, 'AB+', 'female', 3);

INSERT INTO tbl_measurement_history (weight, height, head_circumference, update_date, fk_id_child) VALUES 
(3.50, 52.0, 34.5, '2023-05-10', 1),
(4.20, null, 35.2, '2023-06-10', 1),
(5.80, 60.0, 38.0, '2023-01-15', 2);

INSERT INTO tbl_illness (illness_name, start_date, end_date, illness_type, medication, fk_id_child) VALUES 
('Resfriado Comum', '2024-03-10', '2024-03-15', 'acute', 'Paracetamol', 1),
('Refluxo', '2023-02-01', NULL, 'chronic', 'Domperidona', 2),
('Gripe', '2024-04-20', '2024-04-25', 'acute', 'Ibuprofeno', 3);


INSERT INTO tbl_specialization (specialization_name) VALUES 
('pediatria'),
('nutrição infantil'),
('psicologia infantil'),
('enfermagem'),
('fisioterapia neuropediátrica'),
('fonoaudiologia'),
('neuropediatria'),
('terapia ocupacional (TO)'),
('oftalmopediatria'),
('odontopediatria');


INSERT INTO tbl_professional (professional_name, phone, last_consultation, address, fk_id_child, fk_id_specialization) VALUES 
('Dr. Marcos Pollo', '11988887777', '2024-04-01', 'Rua das Flores, 123', 1, 1),
('Dra. Helena Rio', '11977776666', '2024-03-15', 'Av. Central, 456', 2, 2),
('Dr. Fábio Silva', '11966665555', '2024-04-20', 'Rua Azul, 789', 3, 3);

INSERT INTO tbl_notification_type (notification_type_name) VALUES 
('vacinacao'),
('estoque'),
('aniversario');

INSERT INTO tbl_notification (title, message, date_time, fk_id_child, fk_id_guardian, fk_id_notification_type) VALUES 
('Hora da Vacina', 'Levar Alice para tomar a BCG', '2024-05-10 09:00:00', 1, 1, 1),
('Alerta de estoque', 'As fraldas do Bento estão esgotando', '2024-05-10 10:30:00', 2, 2, 2),
('Feliz aniversário!', 'Clara faz aniversário hoje!', '2024-05-10 12:00:00', 3, 3, 3);

INSERT INTO tbl_unit (unit_initials) VALUES     
('l'), 
('ml'),
('g'),    
('mg'),    
('un');

INSERT INTO tbl_product_type (product_type_name) VALUES 
('Alimentação (Alimento sólido)'),
('Alimentação (Leite e derivados)'),
('Alimentação (Papinha ou purê)'),
('Higiene'),
('Acessórios'),
('Saúde');

INSERT INTO tbl_product (product_name, fk_id_unit, fk_id_product_type) VALUES

-- HIGIENE E CUIDADOS
-- Tipo: Higiene (4)

('Fralda descartável', 5, 4), -- un
('Lenço umedecido', 5, 4), -- un
('Pomada para assadura', 4, 4), -- mg
('Sabonete líquido', 2, 4), -- ml
('Shampoo infantil', 2, 4), -- ml
('Condicionador infantil', 2, 4), -- ml
('Colônia infantil', 2, 4), -- ml
('Protetor solar', 2, 4), -- ml
('Talco', 3, 4), -- g
('Óleo corporal infantil', 2, 4), -- ml
('Hidratante infantil', 2, 4), -- ml
('Algodão', 3, 4), -- g
('Hastes flexíveis', 5, 4), -- un
('Gaze estéril', 5, 4), -- un
('Soro fisiológico', 2, 4), -- ml
('Álcool 70%', 2, 4), -- ml
('Sabonete em barra', 3, 4), -- g
('Detergente para mamadeiras', 2, 4), -- ml

-- SAÚDE
-- Tipo: Saúde (6)

('Paracetamol infantil', 2, 6), -- ml
('Ibuprofeno infantil', 2, 6), -- ml
('Antitérmico infantil', 2, 6), -- ml
('Xarope infantil', 2, 6), -- ml
('Descongestionante nasal infantil', 2, 6), -- ml
('Soro fisiológico medicinal', 2, 6), -- ml
('Solução nasal', 2, 6), -- ml
('Vitamina infantil', 2, 6), -- ml
('Polivitamínico infantil', 2, 6), -- ml
('Suplemento de ferro infantil', 4, 6), -- mg
('Probiótico infantil', 3, 6), -- g
('Regulador intestinal infantil', 3, 6), -- g
('Pomada dermatológica infantil', 4, 6), -- mg
('Gel para alívio de coceira', 4, 6), -- mg
('Gel para dor muscular leve', 4, 6), -- mg
('Repelente infantil', 2, 6), -- ml
('Protetor solar infantil', 2, 6), -- ml
('Solução antisséptica', 2, 6), -- ml
('Curativo', 5, 6), -- un
('Esparadrapo', 5, 6), -- un
('Termômetro digital', 5, 6), -- un

-- ACESSÓRIOS
-- Tipo: Acessórios (5)

('Chupeta', 5, 5), -- un
('Mamadeira', 5, 5), -- un
('Bico de mamadeira', 5, 5), -- un
('Copo infantil', 5, 5), -- un
('Copo de treinamento', 5, 5), -- un
('Prato infantil', 5, 5), -- un
('Kit talher infantil', 5, 5), -- un
('Mordedor', 5, 5), -- un
('Escova de dente infantil', 5, 5), -- un
('Massageador de gengiva', 5, 5), -- un
('Aspirador nasal', 5, 5), -- un
('Tesoura de unha infantil', 5, 5), -- un
('Escova de cabelo infantil', 5, 5), -- un

-- ALIMENTAÇÃO (ALIMENTO SÓLIDO)
-- Tipo: Alimentação (Alimento sólido) (1)

('Abacate', 3, 1), -- g
('Banana', 3, 1),
('Maçã', 3, 1),
('Pera', 3, 1),
('Mamão', 3, 1),
('Manga', 3, 1),
('Melancia', 3, 1),
('Melão', 3, 1),
('Abacaxi', 3, 1),
('Ameixa', 3, 1),
('Goiaba', 3, 1),
('Uva', 3, 1),
('Laranja', 3, 1),
('Tomate', 3, 1),
('Caqui', 3, 1),
('Kiwi', 3, 1),
('Morango', 3, 1),
('Pêssego', 3, 1),

('Pimentão', 3, 1),
('Abóbora', 3, 1),
('Batata-doce', 3, 1),
('Batata', 3, 1),
('Mandioquinha', 3, 1),
('Mandioca', 3, 1),
('Cenoura', 3, 1),
('Chuchu', 3, 1),
('Abobrinha', 3, 1),
('Beterraba', 3, 1),
('Berinjela', 3, 1),
('Quiabo', 3, 1),

('Couve', 3, 1),
('Espinafre', 3, 1),
('Brócolis', 3, 1),
('Couve-flor', 3, 1),
('Alface', 3, 1),
('Repolho', 3, 1),
('Coentro', 3, 1),
('Manjericão', 3, 1),
('Salsa', 3, 1),
('Cebolinha', 3, 1),
('Rúcula', 3, 1),

('Feijão carioca', 3, 1),
('Feijão preto', 3, 1),
('Feijão branco', 3, 1),
('Feijão fradinho', 3, 1),
('Lentilha', 3, 1),
('Grão-de-bico', 3, 1),
('Ovo', 5, 1), -- un
('Frango', 3, 1),
('Carne suína', 3, 1),
('Carne bovina', 3, 1),
('Peixe', 3, 1),

('Arroz branco', 3, 1),
('Arroz integral', 3, 1),
('Macarrão', 3, 1),
('Aveia em flocos', 3, 1),
('Farinha de milho', 3, 1),
('Quinoa', 3, 1),
('Cuscuz', 3, 1),
('Farinha de mandioca', 3, 1),
('Fubá', 3, 1),
('Amido de milho', 3, 1),

('Pão', 3, 1),
('Biscoito', 3, 1),
('Mel', 3, 1),

-- ALIMENTAÇÃO (LEITE E DERIVADOS)
-- Tipo: Alimentação (Leite e derivados) (2)

('Fórmula infantil etapa 1', 3, 2), -- g
('Fórmula infantil etapa 2', 3, 2),
('Fórmula infantil etapa 3', 3, 2),
('Leite integral', 1, 2), -- l
('Iogurte', 2, 2), -- ml
('Queijo', 3, 2), -- g

-- ALIMENTAÇÃO (Papinha ou purê)
-- Tipo: Papinha ou purê (3)

('Papinha infantil', 3, 3), -- g
('Purê infantil', 3, 3); -- g

select * from tbl_product;

INSERT INTO tbl_stock_registry (description, quantity, volume, fk_id_child, fk_id_product) VALUES 
('Pacote Fechado', 1, 40, 1, 1),
('Lata de Leite', 1, 1, 2, 121),
('Sabonete hipoalergênico', 2, 100, 3, 17),
('Shampoo uso diário', 1, 200, 1, 5),
('Medicamento para febre', 1, 100, 2, 19),
('Bananas maduras para alimentação', 6, 1200, 1, 53),
('Mamadeira reserva', 2, 250, 3, 40),
('Lata aberta em uso', 1, 800, 2, 94);

INSERT INTO tbl_diary_note (title, content, date, color, fk_id_child) VALUES 
('Primeiro Sorriso', 'Hoje a Alice sorriu pela primeira vez!', '2023-06-15', '#FFC0CB', 1),
('Engatinhou', 'Bento percorreu a sala inteira', '2023-09-10', '#ADD8E6', 2),
('Primeiro Banho', 'Clara adorou a água morna', '2024-02-02', '#FFFFE0', 3);

INSERT INTO tbl_sleep_log (start_time, end_time, fk_id_child) VALUES
('2024-05-09 20:00:00', '2024-05-10 06:00:00', 1),
('2024-05-10 13:00:00', '2024-05-10 15:00:00', 2),
('2024-05-09 21:30:00', '2024-05-10 07:30:00', 3);

INSERT INTO tbl_bath_log (start_time, end_time, fk_id_child) VALUES 
('2024-05-10 18:00:00', '2024-05-10 18:15:00', 1),
('2024-05-10 10:00:00', '2024-05-10 10:10:00', 2),
('2024-05-10 19:30:00', '2024-05-10 19:50:00', 3);

INSERT INTO tbl_diaper_log (date_time, type, fk_id_child) VALUES 
('2024-05-10 08:00:00', 'urine', 1),
('2024-05-10 09:30:00', 'stool', 2),
('2024-05-10 11:00:00', 'urine', 3);

INSERT INTO tbl_medication_log (date_time, description, fk_id_child) VALUES 
('2024-05-10 08:00:00', 'Administração de Paracetamol para febre leve.', 1),
('2024-05-10 12:00:00', 'Vitamina D (suplementação diária).', 2),
('2024-05-10 20:00:00', 'Antibiótico conforme prescrição médica.', 3);

INSERT INTO tbl_feeding_log (date_time, description, fk_id_child, fk_id_product_type) VALUES 
('2024-05-10 07:00:00', 'Amamentação no peito (lado esquerdo).', 1, 2),
('2024-05-10 12:30:00', 'Papinha de legumes com frango.', 2, 3),
('2024-05-10 15:00:00', 'Fórmula infantil - 150ml.', 3, 2);


INSERT INTO tbl_stock_feeding 
(fk_id_feeding, fk_id_stock_registry, quantity) 
VALUES 
(3, 8, 1);

INSERT INTO tbl_stock_bath 
(fk_id_bath, fk_id_stock_registry, quantity) 
VALUES 
(1, 4, 1);

INSERT INTO tbl_stock_medication 
(fk_id_medication, fk_id_stock_registry, dosage) 
VALUES 
(1, 5, 1);

INSERT INTO tbl_stock_diaper 
(fk_id_diaper, fk_id_stock_registry, quantity) 
VALUES 
(1, 1, 1);

INSERT INTO tbl_vaccine (vaccine_name, observation, prevented_diseases, dose) VALUES
-- Ao nascer
('Vacina BCG', NULL, 'Formas graves e disseminadas da tuberculose e, também, com efeito protetor contra a hanseníase', 'dose única'),
('Vacina Hepatite B', NULL, 'Hepatite B e hepatite D', '1 dose'),

-- 2 meses
('Vacina penta (DTP+Hib+HB)', NULL, 'Difteria, tétano, coqueluche, infecções causadas por Haemophilus influenzae B e hepatite B', '1ª dose'),
('Vacina poliomielite inativada VIP', NULL, 'Poliomielite (paralisia infantil)', '1ª dose'),
('Vacina pneumocócica 10-valente', NULL, 'Doenças pneumocócicas invasivas pelos sorotipos contidos na vacina', '1ª dose'),
('Vacina rotavírus humano', 'Atenção aos prazos para esta vacinação, a 1ª dose deve ser aplicada entre 1 mês e 15 dias e 11 meses e 29 dias. A 2ª dose, entre 3 meses e 15 dias e 23 meses e 29 dias. Se a 1ª dose não for feita no período indicado, a criança perderá a oportunidade da 2ª dose.', 'Gastrenterite viral (diarreia e vômitos)', '1ª dose'),

-- 3 meses
('Vacina meningocócica C', NULL, 'Doenças meningocócicas (meningite, encefalite, meningoencefalite) pelo meningococo tipo C', '1ª dose'),

-- 4 meses
('Vacina penta (DTP+Hib+HB)', NULL, 'Difteria, tétano, coqueluche, infecções causadas por Haemophilus influenzae B e hepatite B', '2ª dose'),
('Vacina poliomielite inativada VIP', NULL, 'Poliomielite (paralisia infantil)', '2ª dose'),
('Vacina pneumocócica 10-valente', NULL, 'Doenças pneumocócicas invasivas pelos sorotipos contidos na vacina', '2ª dose'),
('Vacina rotavírus humano', 'Obs.: Atenção aos prazos para esta vacinação, a 1ª dose deve ser aplicada entre 1 mês e 15 dias e 11 meses e 29 dias. A 2ª dose, entre 3 meses e 15 dias e 23 meses e 29 dias. Se a 1ª dose não for feita no período indicado, a criança perderá a oportunidade da 2ª dose.', 'Gastrenterite viral (diarreia e vômitos)', '2ª dose'),

-- 5 meses
('Vacina meningocócica C', NULL, 'Doenças meningocócicas (meningite, encefalite, meningoencefalite) pelo meningococo tipo C', '2ª dose'),

-- 6 meses
('Vacina penta (DTP+Hib+HB)', NULL, 'Difteria, tétano, coqueluche, infecções causadas por Haemophilus influenzae B e hepatite B', '3ª dose'),
('Vacina poliomielite inativada VIP', NULL, 'Poliomielite (paralisia infantil)', '3ª dose'),
('Vacina influenza trivalente', 'Obs.: Crianças de 6 meses a menores de 6 anos devem ser vacinadas todo ano. Quem vai receber a vacina pela primeira vez deve tomar 2 doses com 30 dias de intervalo. As que já tomaram em anos anteriores recebem apenas 1 dose por ano.', 'Gripe (influenza)', '1ª dose'),
('Vacina covid-19', 'Obs.: O esquema pode ser de 2 doses (6 e 7 meses, vacina Spikevax) ou 3 doses (6, 7 e 9 meses, vacina Comirnaty). Para crianças imunocomprometidas, 3 doses, com reforço a cada 6 meses até os 4 anos.', 'Formas graves e óbitos causados pelo vírus SARS-CoV-2', '1ª dose'),

-- 6 a 8 meses
('Vacina febre amarela', 'Obs.: A vacina contra febre amarela pode ser recomendada para esta idade quando há alto risco de contrair a doença e não é possível adiar a vacinação. Isso vale para quem vive ou vai viajar para áreas com transmissão ativa, sempre após avaliação do serviço de saúde. Para viajantes, a vacina deve ser tomada pelo menos 10 dias antes da viagem', 'Febre amarela e suas complicações', '1 dose'),

-- 7 meses
('Vacina covid-19', 'Obs.: O esquema pode ser de 2 doses (6 e 7 meses, vacina Spikevax) ou 3 doses (6, 7 e 9 meses, vacina Comirnaty). Para crianças imunocomprometidas, 3 doses, com reforço a cada 6 meses até os 4 anos.', 'Formas graves e óbitos causados pelo vírus SARS-CoV-2', '2ª dose'),

-- 9 meses
('Vacina covid-19', 'Obs.: O esquema pode ser de 2 doses (6 e 7 meses, vacina Spikevax) ou 3 doses (6, 7 e 9 meses, vacina Comirnaty). Para crianças imunocomprometidas, 3 doses, com reforço a cada 6 meses até os 4 anos.', 'Formas graves e óbitos causados pelo vírus SARS-CoV-2', '3ª dose'),
('Vacina febre amarela', 'Obs.: Manter a situação vacinal atualizada, principalmente para os residentes e viajantes para área com transmissão ativa da doença. Para os viajantes, a vacina deve ser tomada pelo menos 10 dias antes da viagem.', 'Febre amarela e suas complicações', '1ª dose'),

-- 12 meses
('Vacina pneumocócica 10-valente', NULL, 'Doenças pneumocócicas invasivas pelos sorogrupos contidos na vacina', '1 dose reforço'),
('Vacina meningocócica ACWY', NULL, 'Doenças meningocócicas (meningite, encefalite, meningoencefalite) por meningococos do tipo A, C, W e Y', '1 dose'),
('Vacina tríplice viral SCR', NULL, 'Sarampo, caxumba, rubéola e síndrome da rubéola congênita (futuramente, na gravidez)', '1 dose'),

-- 15 meses
('Vacina DTP', NULL, 'Difteria, tétano e coqueluche', '1ª dose reforço'),
('Vacina poliomielite inativada VIP', NULL, 'Poliomielite (paralisia infantil)', '1ª dose reforço'),
('Vacina tríplice viral SCR', 'Obs.: Em casos de indisponibilidade da vacina varicela monovalente, a vacina tetraviral poderá ser utilizada.', 'Sarampo, caxumba, rubéola, síndrome da rubéola congênita (futuramente, na gravidez)', '2ª dose'),
('Vacina Varicela', 'Obs.: Em casos de indisponibilidade da vacina varicela monovalente, a vacina tetraviral poderá ser utilizada.', 'Varicela (catapora)', '1ª dose'),
('Vacina hepatite A', NULL, 'Hepatite A', '1ª dose'),

-- 4 anos
('Vacina DTP', 'Obs.: Recomenda-se, em sequência, manter 1 dose de reforço com dT a cada 10 anos após a última dose DTP, antecipando para 5 anos em caso de exposição ao risco de tétano ou difteria.', 'Difteria, tétano, coqueluche', '2º reforço'),
('Vacina febre amarela', 'Obs.: Manter a situação vacinal atualizada, principalmente para os residentes e viajantes para área com transmissão ativa da doença. Para os viajantes, a vacina deve ser tomada pelo menos 10 dias antes da viagem.', 'Febre amarela', '1 dose reforço'),
('Vacina varicela', NULL, 'Varicela (catapora)', '1 dose'),

-- 5 anos
('Vacina pneumocócica 23-valente', 'Obs.: Sem histórico vacinal com pneumo conjugada. Uma segunda dose deve ser administrada com intervalo de 5 anos após a 1ª dose.', 'Doenças pneumocócicas invasivas pelos sorogrupos contidos na vacina', '1 dose');


INSERT INTO tbl_age_group (age_group_name, min_months, max_months) VALUES 
('Recém nascido', 0, 1), 
('Bebê - 1º Semestre', 2, 6),
('Bebê - 2º Semestre', 7, 12),
('Primeira Infância - Fase 1', 13, 24),
('Primeira Infância - Fase 2', 25, 36),
('Pré-Escolar', 37, 72);

INSERT INTO tbl_age_group (age_group_name, min_months, max_months) VALUES 
('2 meses', 2, 3),
('3 meses', 3, 4),
('4 meses', 4, 5),
('5 meses', 5, 6),
('6 meses', 6, 7),
('6 a 8 meses', 6, 8),
('7 meses', 7, 8),
('9 meses', 9, 10), 
('12 meses', 12, 14),
('15 meses', 15, 16),
('4 anos - 48 meses', 48, 49),
('5 anos - 60 meses', 60, 61);

-- VACCINE IN AGE GROUP
INSERT INTO tbl_vaccine_in_age_group (fk_id_age_group, fk_id_vaccine) VALUES
	-- 1. Recém-nascido (Imediato) | 0-1 mês

(1, 1), -- Vacina BCG
(1, 2), -- Vacina Hepatite B

	-- 2. Bebê - 1º Semestre | 2-6 meses

(2, 3),  -- Vacina penta (1ª dose)
(2, 4),  -- VIP (1ª dose)
(2, 5),  -- Pneumocócica (1ª dose)
(2, 6),  -- Rotavírus (1ª dose)
(2, 7),  -- Meningocócica C (1ª dose)

(2, 8),  -- Vacina penta (2ª dose)
(2, 9),  -- VIP (2ª dose)
(2, 10), -- Pneumocócica (2ª dose)
(2, 11), -- Rotavírus (2ª dose)

(2, 12), -- Meningocócica C (2ª dose)

(2, 13), -- Vacina penta (3ª dose)
(2, 14), -- VIP (3ª dose)
(2, 15), -- Influenza
(2, 16), -- Covid-19 (1ª dose)

(2, 17), -- Febre amarela excepcional (6-8 meses)

	-- 3. Bebê - 2º Semestre | 7-12 meses

(3, 18), -- Covid-19 (2ª dose)
(3, 19), -- Covid-19 (3ª dose)
(3, 20), -- Febre amarela (9 meses)

(3, 21), -- Pneumocócica reforço
(3, 22), -- Meningocócica ACWY
(3, 23), -- Tríplice viral SCR

	-- 4. Primeira Infância - Fase 1 | 13-24 meses

(4, 24), -- DTP reforço
(4, 25), 
(4, 26),
(4, 27), 
(4, 28), 

	-- 6. Pré-Escolar | 37-72 meses

(6, 29), -- DTP 2º reforço
(6, 30), -- Febre amarela reforço
(6, 31), -- Varicela reforço
(6, 32); -- Pneumocócica 23-valente

