CREATE DATABASE Banking_DB;
USE Banking_DB;
CREATE TABLE Banking_Customers (
    Customer_ID VARCHAR(20),
    Age INT,
    Gender VARCHAR(10),
    Region VARCHAR(20),
    Income DECIMAL(12,2),
    Account_Type VARCHAR(20),
    Credit_Cards INT,
    Loans INT,
    Transaction_Frequency INT,
    Balance DECIMAL(15,2)
);

-- Total rows
SELECT COUNT(*) AS Total_Rows FROM Banking_Customers;

-- Sample rows
SELECT * FROM Banking_Customers LIMIT 10;

-- Count customers by region
SELECT Region, COUNT(*) AS Customer_Count
FROM Banking_Customers
GROUP BY Region;

-- Average income and balance by account type
SELECT Account_Type,
       ROUND(AVG(Income),2) AS Avg_Income,
       ROUND(AVG(Balance),2) AS Avg_Balance
FROM Banking_Customers
GROUP BY Account_Type;

-- Distribution of loan holders
SELECT Loans, COUNT(*) AS Count
FROM Banking_Customers
GROUP BY Loans
ORDER BY Loans;

SELECT 
    Customer_ID,
    CASE 
        WHEN Income >= 1000000 AND Balance >= 800000 THEN 'High Value'
        WHEN Income BETWEEN 500000 AND 999999 THEN 'Mid Tier'
        ELSE 'Mass Market'
    END AS Segment,
    Income,
    Balance,
    Account_Type
FROM Banking_Customers;

SELECT Region, COUNT(*) AS HighValue_Count
FROM (
  SELECT Region,
         CASE 
            WHEN Income >= 1000000 AND Balance >= 800000 THEN 'High Value'
         END AS Segment
  FROM Banking_Customers
) AS Seg
WHERE Segment = 'High Value'
GROUP BY Region
ORDER BY HighValue_Count DESC;

SELECT Loans, Credit_Cards, COUNT(*) AS Count
FROM Banking_Customers
GROUP BY Loans, Credit_Cards
ORDER BY Loans, Credit_Cards;

SELECT Segment, COUNT(*) AS Customer_Count
FROM (
    SELECT Customer_ID,
           CASE 
               WHEN Income >= 1000000 AND Balance >= 800000 THEN 'High Value'
               WHEN Income >= 500000 THEN 'Mid Tier'
               ELSE 'Mass Market'
           END AS Segment
    FROM Banking_Customers
) AS Seg
GROUP BY Segment
ORDER BY Customer_Count DESC;

SELECT Region,
       Segment,
       COUNT(*) AS Count
FROM (
    SELECT Customer_ID,
           Region,
           CASE 
               WHEN Income >= 1000000 AND Balance >= 800000 THEN 'High Value'
               WHEN Income >= 500000 THEN 'Mid Tier'
               ELSE 'Mass Market'
           END AS Segment
    FROM Banking_Customers
) AS T
GROUP BY Region, Segment
ORDER BY Region, Segment;

SELECT 
    CASE
        WHEN Transaction_Frequency < 10 THEN 'Low Engagement'
        WHEN Transaction_Frequency BETWEEN 10 AND 30 THEN 'Moderate Engagement'
        ELSE 'High Engagement'
    END AS Engagement_Level,
    CASE
        WHEN Balance < 500000 THEN 'Low Balance'
        WHEN Balance BETWEEN 500000 AND 1000000 THEN 'Medium Balance'
        ELSE 'High Balance'
    END AS Balance_Bucket,
    COUNT(*) AS Customer_Count
FROM Banking_Customers
GROUP BY Engagement_Level, Balance_Bucket
ORDER BY Engagement_Level, Balance_Bucket;





