# dfu-nlp-phenotyping
# DFU NLP Phenotyping Pipeline

This repository contains SQL code for identifying diabetic foot ulcer cases using ICD codes and discharge-note NLP from MIMIC-IV.

## Workflow

1. Identify diabetes ICD cohort
2. Identify DFU ICD cohort
3. Select diabetes admissions without DFU ICD codes
4. Extract candidate DFU mentions from discharge notes
5. Apply rule-based dictionary
6. Classify candidates as HIGH, MODERATE, or LOW evidence
7. Perform manual chart review
8. Generate final ICD + NLP DFU cohort

## Folder Structure

- `sql/`: BigQuery SQL scripts
- `figures/`: workflow diagrams
- `results/`: aggregate output tables
- `docs/`: notes and documentation
