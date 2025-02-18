-- 1. Qual a faixa etária dos pacientes com maior taxa de internação?

SELECT
CASE WHEN
	age < 20 THEN "20-"
    WHEN age BETWEEN 20 AND 29 THEN "20-29"
    WHEN age BETWEEN 30 AND 39 THEN "30-39"
    WHEN age BETWEEN 40 AND 49 THEN "40-49"
    WHEN age BETWEEN 50 AND 59 THEN "50-59"
    WHEN age BETWEEN 60 AND 69 THEN "60-69"
    WHEN age BETWEEN 70 AND 79 THEN "70-79"
    ELSE "80+"
END AS 'age_group',
COUNT(diagnosis) AS "number_diagnosis",
SUM(hospitalizations) AS "hospitalizations"
FROM pacientes
WHERE diagnosis = "Schizophrenic"
GROUP BY age_group
ORDER BY age_group;
    
-- 2. O suporte social e familiar reduz as tentativas de suicídio?
SELECT
social_suport,
COUNT(patient_id) AS "total_patients",
	SUM(CASE WHEN suicide_attempts = "Yes" THEN 1 ELSE 0 END) AS "suicide_attempts",
	(SUM(CASE WHEN suicide_attempts = "Yes" THEN 1 ELSE 0 END) * 100.0 / COUNT(patient_id)) AS '%'
FROM pacientes
WHERE diagnosis = "Schizophrenic"
GROUP BY social_suport
ORDER BY '%' DESC;


-- 3. Há relação entre uso de substâncias e número de internações hospitalares?
SELECT
substance_use,
COUNT(patient_id) AS 'total_patients',
SUM(hospitalizations) AS 'sum_hospitalizations'
FROM pacientes
WHERE diagnosis = "Schizophrenic"
GROUP BY substance_use;

-- 4. Pacientes com esquizofrenia e com histórico familiar de esquizofrenia têm maior tempo de doença?
SELECT
family_history,
AVG(disease_duration) AS 'avg_disease_duration'
FROM pacientes
WHERE diagnosis = "Schizophrenic"
GROUP BY family_history;

-- 5. A ocupação do paciente influencia na adesão médica?
SELECT
occupation,
COUNT(CASE WHEN medication_adherence = "Poor" THEN 1 END) AS "count_poor_adherence",
COUNT(CASE WHEN medication_adherence = "Moderate" THEN 1 END) AS "count_moderate_adherence",
COUNT(CASE WHEN medication_adherence = "Good" THEN 1 END) AS "count_good_adherence"
FROM pacientes
WHERE diagnosis = "Schizophrenic"
GROUP BY occupation;

-- 6. Qual área de moradia há mais pacientes com diagnóstico de esquizofrenia?
SELECT
living_area,
COUNT(diagnosis) AS 'count_diagnosis'
FROM pacientes
WHERE diagnosis = "Schizophrenic"
GROUP BY living_area;

-- 7. E qual genêro tem mais histórico de esquizofrenia?
SELECT
gender,
COUNT(patient_id) AS 'total_patients',
SUM(CASE WHEN diagnosis = "Schizophrenic" THEN 1 ELSE 0 END) AS 'schizophrenic_cases',
(SUM(CASE WHEN diagnosis = "Schizophrenic" THEN 1 ELSE 0 END) * 100.0 / COUNT(patient_id)) AS '%'
FROM pacientes
GROUP BY gender
ORDER BY schizophrenic_cases DESC;