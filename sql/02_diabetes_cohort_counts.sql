WITH total AS (
  SELECT
    COUNT(DISTINCT subject_id) AS total_hospitalized_patients,
    COUNT(DISTINCT hadm_id) AS total_admissions
  FROM `physionet-data.mimiciv_3_1_hosp.admissions`
),

diabetes AS (
  SELECT
    COUNT(DISTINCT subject_id) AS diabetes_patients,
    COUNT(DISTINCT hadm_id) AS diabetes_admissions
  FROM `candidacy.dfu_project.diabetes_cohort`
)

SELECT
  diabetes_patients,
  diabetes_admissions,
  total_hospitalized_patients,
  total_admissions,
  ROUND(100 * diabetes_patients / total_hospitalized_patients, 2) AS patient_prevalence_percent,
  ROUND(100 * diabetes_admissions / total_admissions, 2) AS admission_prevalence_percent
FROM diabetes, total;
