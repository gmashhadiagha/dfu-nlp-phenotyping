SELECT
  CASE
    WHEN icd_version = 9 AND icd_code LIKE '250%' THEN 'ICD-9 250.xx Diabetes mellitus'
    WHEN icd_version = 10 AND icd_code LIKE 'E08%' THEN 'ICD-10 E08 Diabetes due to underlying condition'
    WHEN icd_version = 10 AND icd_code LIKE 'E09%' THEN 'ICD-10 E09 Drug/chemical-induced diabetes'
    WHEN icd_version = 10 AND icd_code LIKE 'E10%' THEN 'ICD-10 E10 Type 1 diabetes'
    WHEN icd_version = 10 AND icd_code LIKE 'E11%' THEN 'ICD-10 E11 Type 2 diabetes'
    WHEN icd_version = 10 AND icd_code LIKE 'E13%' THEN 'ICD-10 E13 Other specified diabetes'
  END AS diabetes_category,
  COUNT(DISTINCT subject_id) AS patients,
  COUNT(DISTINCT hadm_id) AS admissions
FROM `candidacy.dfu_project.diabetes_cohort`
GROUP BY diabetes_category
ORDER BY admissions DESC;
