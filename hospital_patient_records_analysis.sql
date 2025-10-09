CREATE DATABASE IF NOT EXISTS hospital_db;
USE hospital_db;

CREATE TABLE IF NOT EXISTS patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    admission_date DATE,
    discharge_date DATE,
    length_of_stay INT,
    department VARCHAR(50),
    treatment_outcome VARCHAR(20),
    doctor_in_charge VARCHAR(100),
    total_bill DECIMAL(12,2)
);

-- 1️⃣ Patient Admissions by Department
SELECT department, COUNT(*) AS total_admissions
FROM patients
GROUP BY department
ORDER BY total_admissions DESC;

-- 2️⃣ Average Length of Stay by Department
SELECT department, ROUND(AVG(length_of_stay),2) AS avg_stay_days
FROM patients
GROUP BY department
ORDER BY avg_stay_days DESC;

-- 3️⃣ Treatment Outcomes Overview
SELECT treatment_outcome, COUNT(*) AS total_patients
FROM patients
GROUP BY treatment_outcome
ORDER BY total_patients DESC;

-- 4️⃣ Average Bill by Treatment Outcome
SELECT treatment_outcome, ROUND(AVG(total_bill),2) AS avg_bill
FROM patients
GROUP BY treatment_outcome
ORDER BY avg_bill DESC;

-- 5️⃣ Top Doctors by Patient Load
SELECT doctor_in_charge, COUNT(*) AS patients_handled
FROM patients
GROUP BY doctor_in_charge
ORDER BY patients_handled DESC
LIMIT 10;

