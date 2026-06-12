USE db_syncrobaby;

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

INSERT INTO tbl_notification_type (notification_type_name) VALUES 
('vacinacao'),
('estoque'),
('aniversario');

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
('Escova de cabelo infantil', 5, 5); -- un

-- ALIMENTAÇÃO (ALIMENTO SÓLIDO)
-- Tipo: Alimentação (Alimento sólido) (1)
INSERT INTO tbl_product (product_name, fk_id_unit, fk_id_product_type) VALUES

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

INSERT INTO tbl_age_group (age_group_name, min_months, max_months) VALUES 
('0 a 1 mês', 0, 1), 
('2 a 6 meses', 2, 6),
('7 a 12 meses', 7, 12),
('1 a 2 anos', 13, 24),
('2 a 3 anos', 25, 36),
('3 a 6 anos', 37, 72);

INSERT INTO tbl_age_group ( age_group_name, min_months, max_months) VALUES
('2 meses', 2, 2),
('3 meses', 3, 3),
('4 meses', 4, 4),
('5 meses', 5, 5),
('6 meses', 6, 6),
('7 meses', 7, 7),
('9 meses', 9, 9),
('12 meses', 12, 12),
('15 meses', 15, 15),
('4 anos', 48, 48),
('5 anos', 60, 60);

-- VACCINE IN AGE GROUP
INSERT INTO tbl_vaccine_in_age_group (fk_id_age_group, fk_id_vaccine) VALUES
-- 0-1 mês

(1, 1), 
(1, 2), 

-- 2 meses
(7, 3),
(7, 4),
(7, 5),
(7, 6),

-- 3 meses
(8, 7),

-- 4 meses
(9, 8),
(9, 9),
(9, 10),
(9, 11),

-- 5 meses
(10, 12),

-- 6 meses
(11, 13),
(11, 14),
(11, 15),
(11, 16),
(11, 17),

-- 7 meses
(12, 18),

-- 9 meses
(13, 19),
(13, 20),

-- 12 meses
(14, 21),
(14, 22),
(14, 23),

-- 15 meses
(15, 24),
(15, 25),
(15, 26),
(15, 27),
(15, 28),

-- 4 anos
(16, 29),
(16, 30),
(16, 31),

-- 5 anos
(17, 32);
