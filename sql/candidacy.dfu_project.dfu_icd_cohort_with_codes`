CREATE OR REPLACE TABLE `candidacy.dfu_project.dfu_icd_cohort_with_codes` AS

SELECT DISTINCT
  dc.subject_id,
  dc.hadm_id,
  dc.admittime,
  dc.dischtime,
  dc.insurance,
  d.icd_version,
  d.icd_code,
  dd.long_title
FROM `candidacy.dfu_project.diabetes_cohort` dc
JOIN `physionet-data.mimiciv_3_1_hosp.diagnoses_icd` d
  ON dc.hadm_id = d.hadm_id
JOIN `physionet-data.mimiciv_3_1_hosp.d_icd_diagnoses` dd
  ON d.icd_code = dd.icd_code
 AND d.icd_version = dd.icd_version
WHERE
  d.icd_version = 9
  AND d.icd_code IN (

    -- PAD with ulcer/gangrene
    '44023',
    '44024',

    -- Peripheral angiopathy / PVD
    '44381',
    '4439',

    -- Foot infection
    '68110',
    '6827',

    -- Foot ulcer
    '70714',
    '70715',

    -- Charcot / neuropathic arthropathy
    '7135',

    -- Foot osteomyelitis
    '73007',
    '73017',
    '73027',
    '73097',

    -- Gangrene
    '7854'
  );
