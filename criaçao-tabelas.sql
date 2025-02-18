CREATE DATABASE pacientes_psiquiatra;

CREATE TABLE pacientes(
patient_id INT NOT NULL,
age INT,
gender VARCHAR(10),
education_level VARCHAR(50),
marital_status VARCHAR(50),
occupation VARCHAR(50),
income_level VARCHAR(10),
living_area VARCHAR(10),
diagnosis VARCHAR(50),
disease_duration INT,
hospitalizations INT,
family_history VARCHAR(10),
substance_use VARCHAR(10),
suicide_attempts VARCHAR(10),
positive_symptom_score INT,
negative_symptom_score INT,
gaf_score INT,
social_suport VARCHAR(10),
stress_factors VARCHAR(10),
medication_adherence VARCHAR(20)
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/tabela_pacientes_esquizofrenia.csv"
INTO TABLE pacientes
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
