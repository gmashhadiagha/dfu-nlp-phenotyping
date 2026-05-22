
CREATE OR REPLACE TABLE `candidacy.dfu_project.dfu_cohort` AS
SELECT DISTINCT
  a.subject_id,
  a.hadm_id,
  a.admittime,
  a.dischtime,
  a.insurance,
  d.icd_code
FROM `physionet-data.mimiciv_3_1_hosp.admissions` a
JOIN `physionet-data.mimiciv_3_1_hosp.diagnoses_icd` d
  ON a.hadm_id = d.hadm_id
WHERE
  (
    d.icd_code LIKE '250%' OR
    d.icd_code LIKE 'E10%' OR
    d.icd_code LIKE 'E11%'
  );
