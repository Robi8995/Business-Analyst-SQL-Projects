-- ================================================
-- CREATE DATABASE
-- Purpose: Creates a fresh database for the Healthcare Claims project
-- ================================================

CREATE DATABASE Healthcare_Claims_Project;

-- ================================================
-- USE DATABASE
-- Purpose: Switch to the newly created database
-- ================================================

USE `healthcare_claims_project`;

-- ================================================
-- CREATE CLAIMS TABLE
-- Purpose: Creates the Claims table matching the CSV columns
-- ================================================

CREATE TABLE Claims (
    Claim_ID VARCHAR(10) PRIMARY KEY,
    Patient_ID VARCHAR(10),
    Provider_ID VARCHAR(10),
    Diagnosis VARCHAR(50),
    Claim_Amount DECIMAL(10,2),
    Claim_Date DATE,
    Policy_Type VARCHAR(20),
    Age INT,
    Gender VARCHAR(10),
    Claim_Status VARCHAR(20),
    Payment_Method VARCHAR(20),
    Fraud_Flag TINYINT
);

-- ================================================
-- CHECK SAMPLE DATA
-- Purpose: View first 10 rows to confirm correct import
-- ================================================

SELECT * FROM Claims
LIMIT 10;

-- ================================================
-- EXPLORE BASIC DATA
-- Purpose: Overview of total claims, average amounts, and distribution
-- ================================================

-- Total number of claims
SELECT COUNT(*) AS Total_Claims FROM Claims;

-- Total and average claim amount
SELECT SUM(Claim_Amount) AS Total_Amount, AVG(Claim_Amount) AS Avg_Amount FROM Claims;

-- Claims by Policy Type
SELECT Policy_Type, COUNT(*) AS Num_Claims, AVG(Claim_Amount) AS Avg_Amount
FROM Claims
GROUP BY Policy_Type;

-- Claims by Diagnosis
SELECT Diagnosis, COUNT(*) AS Num_Claims, AVG(Claim_Amount) AS Avg_Amount
FROM Claims
GROUP BY Diagnosis;

-- ================================================
-- FRAUD DETECTION PATTERNS
-- Purpose: Identify potentially fraudulent claims and patients
-- ================================================

-- List claims that have been flagged as fraud
SELECT * 
FROM Claims
WHERE Fraud_Flag = 1;

-- Identify patients with unusually high number of claims or total claim amount
SELECT Patient_ID, COUNT(*) AS Claim_Count, SUM(Claim_Amount) AS Total_Claim_Amount
FROM Claims
GROUP BY Patient_ID
HAVING Claim_Count > 5 OR Total_Claim_Amount > 50000
ORDER BY Total_Claim_Amount DESC;

-- Top providers with most claims (could indicate provider-side fraud patterns)
SELECT Provider_ID, COUNT(*) AS Num_Claims, SUM(Claim_Amount) AS Total_Claim_Amount
FROM Claims
GROUP BY Provider_ID
ORDER BY Total_Claim_Amount DESC
LIMIT 10;

-- ================================================
-- CLAIM FREQUENCY ANALYSIS
-- Purpose: Analyze claims by month/year and top providers
-- ================================================

-- Monthly claim frequency
SELECT YEAR(Claim_Date) AS Year, MONTH(Claim_Date) AS Month, COUNT(*) AS Num_Claims
FROM Claims
GROUP BY YEAR(Claim_Date), MONTH(Claim_Date)
ORDER BY Year, Month;

-- Claims by Provider
SELECT Provider_ID, COUNT(*) AS Num_Claims, SUM(Claim_Amount) AS Total_Claim_Amount
FROM Claims
GROUP BY Provider_ID
ORDER BY Total_Claim_Amount DESC
LIMIT 10;

-- Claims by Age Group
SELECT 
    CASE 
        WHEN Age BETWEEN 0 AND 18 THEN '0-18'
        WHEN Age BETWEEN 19 AND 35 THEN '19-35'
        WHEN Age BETWEEN 36 AND 60 THEN '36-60'
        WHEN Age > 60 THEN '60+'
    END AS Age_Group,
    COUNT(*) AS Num_Claims,
    AVG(Claim_Amount) AS Avg_Claim
FROM Claims
GROUP BY Age_Group;

-- ================================================
-- COST OPTIMIZATION INSIGHTS
-- Purpose: Identify high-cost claims, diagnoses, and policies
-- ================================================

-- Average claim amount by Policy Type and Claim Status
SELECT Policy_Type, Claim_Status, AVG(Claim_Amount) AS Avg_Claim
FROM Claims
GROUP BY Policy_Type, Claim_Status
ORDER BY Avg_Claim DESC;

-- High-cost diagnoses (top 5 by average claim amount)
SELECT Diagnosis, AVG(Claim_Amount) AS Avg_Claim
FROM Claims
GROUP BY Diagnosis
ORDER BY Avg_Claim DESC
LIMIT 5;

-- Top 10 patients by total claim amount (to identify high spenders)
SELECT Patient_ID, SUM(Claim_Amount) AS Total_Claim_Amount
FROM Claims
GROUP BY Patient_ID
ORDER BY Total_Claim_Amount DESC
LIMIT 10;

-- Average claim amount by Payment Method
SELECT Payment_Method, AVG(Claim_Amount) AS Avg_Claim
FROM Claims
GROUP BY Payment_Method
ORDER BY Avg_Claim DESC;

-- ================================================
-- ADVANCED SQL (WINDOW FUNCTIONS)
-- Purpose: Rank patients and calculate rolling averages of claim amounts
-- ================================================

-- Rank patients by total claim amount--
SELECT Patient_ID, 
       SUM(Claim_Amount) AS Total_Claim_Amount,
       RANK() OVER (ORDER BY SUM(Claim_Amount) DESC) AS `Rank_Value`
FROM Claims
GROUP BY Patient_ID
ORDER BY `Rank_Value`
LIMIT 10;

-- Monthly rolling average of claim amounts 
-- Note: MySQL does not natively support ROWS BETWEEN for non-integer dates,
-- so here we calculate a simple cumulative average per day as an alternative
SELECT Claim_Date,
       AVG(Claim_Amount) OVER (ORDER BY Claim_Date) AS Rolling_Avg
FROM Claims
ORDER BY Claim_Date;

-- Cumulative total claim amount per patient
SELECT Patient_ID, Claim_Date, Claim_Amount,
       SUM(Claim_Amount) OVER (PARTITION BY Patient_ID ORDER BY Claim_Date) AS Cumulative_Amount
FROM Claims
ORDER BY Patient_ID, Claim_Date;




