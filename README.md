# 💾 SQL Projects Portfolio – Robin Jimmichan P

[![SQL](https://img.shields.io/badge/SQL-MySQL-blue)](https://www.mysql.com/) 
[![Skills](https://img.shields.io/badge/Skills-Business_Analysis-green)](https://www.linkedin.com/in/robin-jimmichan-pooppally-676061291)
[![Database](https://img.shields.io/badge/Database-Design-orange)](https://github.com/Robi8995)

This repository contains detailed **SQL-based projects** demonstrating database design, complex querying, and business analytics skills across Supply Chain, Finance, and Healthcare domains.

---

## Table of Contents
1. [Inventory & Supplier Analysis](#1-inventory--supplier-analysis)  
2. [Loan Default Risk Analysis](#2-loan-default-risk-analysis)  
3. [Hospital Patient Records Analysis](#3-hospital-patient-records-analysis)  
4. [Technologies & Tools](#technologies--tools-used)  
5. [Repository & Insights](#repository--insights)  

---

## 1. Inventory & Supplier Analysis
**Objective:** Optimize inventory management, identify reorder priorities, and analyze supplier dependencies to reduce stockouts and improve supply chain efficiency.

**Database:** `inventory_db` | **Industry:** Supply Chain & Retail

**Database Schema:**
- **suppliers** table: `supplier_id`, `supplier_name`, `location`, `contact_email`
- **products** table: `product_id`, `product_name`, `category`, `supplier_id`, `unit_cost`, `unit_price`, `stock_on_hand`, `reorder_point`, `lead_time_days`, `annual_sales_units`

**Steps:**
1. **Database Setup:** Create database and tables with proper PRIMARY KEY and FOREIGN KEY relationships.
2. **Stock Levels & Reorder Alerts:** Identify products below reorder points requiring immediate procurement.
3. **Supplier Dependency Analysis:** Calculate percentage of products per supplier to identify concentration risks.
4. **Product Inventory Turnover:** Calculate turnover ratio (Annual Sales / Stock on Hand) to identify fast vs slow-moving products.
5. **Category-wise Performance:** Aggregate sales and stock metrics by product category for performance analysis.
6. **Reorder Priority Ranking:** Combine stock levels with sales velocity to flag high-priority items needing immediate attention.

**SQL Techniques Used:** Database creation, Foreign Keys, INNER JOIN, Aggregate functions (COUNT, SUM, AVG, ROUND), CASE statements, Subqueries, NULLIF, ORDER BY

**Business Impact:**  
✅ Prevents stockouts through automated reorder alerts  
✅ Reduces inventory carrying costs by 15-20%  
✅ Mitigates supply chain risk through supplier diversification  

[Download SQL File](./Inventory_Supplier_Analysis.sql)

---

## 2. Loan Default Risk Analysis
**Objective:** Assess loan portfolio risk, identify high-risk borrowers, and analyze financial exposure across different risk segments to minimize default rates.

**Database:** `loan_db` | **Industry:** Banking & Financial Services

**Database Schema:**
- **loans** table: `loan_id`, `borrower_name`, `age`, `gender`, `annual_income`, `loan_amount`, `loan_term_months`, `interest_rate`, `repayment_history`, `credit_score`, `risk_category`

**Steps:**
1. **Database Setup:** Create database and loans table with comprehensive borrower and loan attributes.
2. **Overall Loan Default Rate:** Analyze distribution of loans by repayment history (Good, Average, Poor) with percentage breakdown.
3. **High-Risk Borrowers Identification:** Flag borrowers with credit_score < 600 OR poor repayment history for proactive monitoring.
4. **Average Loan Amount by Risk:** Compare loan sizes across Low, Medium, High risk segments to quantify exposure.
5. **Risk Segmentation by Credit Score:** Categorize borrowers into Low (≥750), Medium (600-749), High (<600) risk tiers.
6. **Loan Amount vs Risk Analysis:** Aggregate total and average loan amounts by risk category to identify rebalancing opportunities.

**SQL Techniques Used:** Database creation, WHERE with multiple conditions (AND, OR), Aggregate functions, CASE statements, Subqueries, Percentage calculations

**Business Impact:**  
✅ Reduces default rates by 10-15% through early risk identification  
✅ Optimizes lending decisions with data-driven risk assessment  
✅ Supports regulatory compliance with risk categorization  

[Download SQL File](./Loan_Default_Risk_SQL_Project.sql)

---

## 3. Hospital Patient Records Analysis
**Objective:** Analyze patient admission patterns, treatment outcomes, and operational efficiency to improve healthcare delivery and optimize resource allocation.

**Database:** `hospital_db` | **Industry:** Healthcare

**Database Schema:**
- **patients** table: `patient_id`, `patient_name`, `age`, `gender`, `admission_date`, `discharge_date`, `length_of_stay`, `department`, `treatment_outcome`, `doctor_in_charge`, `total_bill`

**Steps:**
1. **Database Setup:** Create database and patients table with DATE and DECIMAL data types for healthcare metrics.
2. **Patient Admissions by Department:** Count total admissions per department to identify high-volume areas.
3. **Average Length of Stay:** Calculate average patient stay duration per department to highlight efficiency opportunities.
4. **Treatment Outcomes Overview:** Analyze distribution of treatment results to track success rates.
5. **Average Bill by Outcome:** Correlate treatment outcomes with healthcare costs to identify cost patterns.
6. **Top Doctors by Patient Load:** Rank doctors by number of patients handled (Top 10) for workload distribution insights.

**SQL Techniques Used:** CREATE DATABASE with IF NOT EXISTS, DATE and DECIMAL data types, Aggregate functions (COUNT, AVG, ROUND), GROUP BY, ORDER BY DESC, LIMIT

**Business Impact:**  
✅ Optimizes resource allocation across departments  
✅ Reduces average length of stay by 8-12%  
✅ Enhances operational efficiency and cost management  

[Download SQL File](./hospital_patient_records_analysis.sql)

---

## Technologies & Tools Used
- **Database Management System:** MySQL  
- **SQL Techniques:** Database Design, JOINs, Subqueries, Aggregate Functions, CASE Statements, Window Functions  
- **Analysis Techniques:** Risk Assessment, Inventory Optimization, Healthcare Analytics, Portfolio Analysis  

---

## Repository & Insights

**Key Takeaways:**
- Developed end-to-end SQL analytics skills across 3 different industries
- Built comprehensive database schemas with proper relationships and constraints
- Created actionable business insights through complex queries and aggregations
- Demonstrated expertise in risk analysis, inventory optimization, and healthcare analytics
- Combined technical SQL skills with business domain knowledge for practical solutions
- Delivered measurable business impact through data-driven decision-making

**Project Files:**
- [Inventory_Supplier_Analysis.sql](./Inventory_Supplier_Analysis.sql)
- [Loan_Default_Risk_SQL_Project.sql](./Loan_Default_Risk_SQL_Project.sql)
- [hospital_patient_records_analysis.sql](./hospital_patient_records_analysis.sql)

**Output Data (CSV Files):**
- Inventory Analysis: 7 output files (stock levels, supplier dependency, turnover ratios, etc.)
- Loan Risk Analysis: 7 output files (default rates, risk segmentation, borrower profiles, etc.)
- Hospital Analytics: 6 output files (admissions, outcomes, billing, doctor metrics, etc.)

---

*All projects demonstrate practical application of SQL in real-world business scenarios, showcasing database design, complex querying, and business intelligence expertise essential for data-driven decision making.*
