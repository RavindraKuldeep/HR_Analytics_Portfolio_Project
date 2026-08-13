CREATE DATABASE HR_Analytics

USE HR_Analytics;
SELECT * FROM HR_Data
-- ==========================================================
-- PART 1: DATA CLEANING & VALIDATION 
-- ==========================================================

-- 1. Total records check (Should be 1470)
SELECT COUNT(*) AS Total_Records FROM HR_Data;

-- 2. Duplicate Checking (EmployeeNumber unique hona chahiye)
SELECT EmployeeNumber, COUNT(*) AS Occurrence_Count
FROM HR_Data
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

-- 3. NULL Handling (Check for missing values)
SELECT COUNT(*) AS Missing_Values
FROM HR_Data
WHERE Age IS NULL OR MonthlyIncome IS NULL OR Department IS NULL;

-- 4. Drop Useless Columns (Inki value sabke liye same hoti hai)
ALTER TABLE HR_Data
DROP COLUMN EmployeeCount, Over18, StandardHours;

-- 5. Data Type Conversion (Attrition Yes/No ko 1/0 mein convert karna for aggregation)

ALTER TABLE HR_Data ADD AttritionFlag INT;
GO  -- Yeh line add karein

UPDATE HR_Data
SET AttritionFlag = CAST(Attrition AS INT);

SELECT TOP 5 Attrition, AttritionFlag FROM HR_Data;

SELECT * FROM HR_Data
-- ==========================================================
-- PART 2: CORE KPIs 
-- ==========================================================

-- 6. Total Employees & Total Attrition Count
SELECT 
    COUNT(*) AS Total_Employees,
    SUM(AttritionFlag) AS Total_Leavers
FROM HR_Data;

-- 7. Overall Attrition Rate (%)
SELECT 
    (SUM(AttritionFlag) * 100.0 / COUNT(*)) AS Attrition_Rate_Percentage
FROM HR_Data;

-- 8. Average Salary, Age, aur Years at Company
SELECT 
    AVG(MonthlyIncome) AS Avg_Salary,
    AVG(Age) AS Avg_Age,
    AVG(YearsAtCompany) AS Avg_Years_At_Company
FROM HR_Data;

-- 9. Average Job Satisfaction & Work-Life Balance
SELECT 
    AVG(CAST(JobSatisfaction AS FLOAT)) AS Avg_Job_Satisfaction,
    AVG(CAST(WorkLifeBalance AS FLOAT)) AS Avg_Work_Life_Balance
FROM HR_Data;

-- 10. Average Performance Rating
SELECT AVG(CAST(PerformanceRating AS FLOAT)) AS Avg_Performance_Rating 
FROM HR_Data;


-- ==========================================================
-- PART 3: DEPARTMENT & JOB ROLE ANALYSIS 
-- ==========================================================

-- 11. Department Analysis: Attrition Rate by Department
SELECT 
    Department, 
    COUNT(*) AS Total_Employees,
    SUM(AttritionFlag) AS Leavers,
    (SUM(AttritionFlag) * 100.0 / COUNT(*)) AS Attrition_Rate
FROM HR_Data
GROUP BY Department
ORDER BY Attrition_Rate DESC;

-- 12. Job Role Analysis: Attrition by Job Role
SELECT 
    JobRole, 
    COUNT(*) AS Employees,
    (SUM(AttritionFlag) * 100.0 / COUNT(*)) AS Attrition_Rate
FROM HR_Data
GROUP BY JobRole
ORDER BY Attrition_Rate DESC;

-- 13. Monthly Income Analysis: Average Salary by Department
SELECT Department, AVG(MonthlyIncome) AS Avg_Salary
FROM HR_Data
GROUP BY Department;

-- 14. Monthly Income Analysis: Average Salary by Job Role
SELECT JobRole, AVG(MonthlyIncome) AS Avg_Salary
FROM HR_Data
GROUP BY JobRole
ORDER BY Avg_Salary DESC;

-- 15. Top Employees: Top 5 Highest Paid Employees
SELECT TOP 5 EmployeeNumber, Department, JobRole, MonthlyIncome
FROM HR_Data
ORDER BY MonthlyIncome DESC;


-- ==========================================================
-- PART 4: DEMOGRAPHICS (AGE & GENDER ANALYSIS) 
-- ==========================================================

-- 16. Gender Analysis: Attrition by Gender
SELECT 
    Gender,
    COUNT(*) AS Total,
    (SUM(AttritionFlag) * 100.0 / COUNT(*)) AS Attrition_Rate
FROM HR_Data
GROUP BY Gender;

-- 17. Age Analysis: Attrition by Age Groups (CASE WHEN)
SELECT 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        ELSE '46+' 
    END AS Age_Group,
    COUNT(*) AS Total,
    (SUM(AttritionFlag) * 100.0 / COUNT(*)) AS Attrition_Rate
FROM HR_Data
GROUP BY 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        ELSE '46+' 
    END
ORDER BY Age_Group;

-- 18. Gender Analysis: Average Salary by Gender
SELECT Gender, AVG(MonthlyIncome) AS Avg_Salary
FROM HR_Data
GROUP BY Gender;

-- 19. Marital Status Impact on Attrition
SELECT MaritalStatus, (SUM(AttritionFlag) * 100.0 / COUNT(*)) AS Attrition_Rate
FROM HR_Data
GROUP BY MaritalStatus;

-- 20. Distance From Home (Commute) vs Attrition
SELECT Attrition, AVG(DistanceFromHome) AS Avg_Commute_Distance
FROM HR_Data
GROUP BY Attrition;


-- ==========================================================
-- PART 5: SATISFACTION, WORK-LIFE & OVERTIME ANALYSIS 
-- ==========================================================

-- 21. Overtime Analysis: Impact of Overtime on Attrition
SELECT 
    OverTime,
    COUNT(*) AS Total_Employees,
    (SUM(AttritionFlag) * 100.0 / COUNT(*)) AS Attrition_Rate
FROM HR_Data
GROUP BY OverTime;

-- 22. Work-Life Balance Analysis (1=Bad, 4=Best)
SELECT 
    WorkLifeBalance,
    (SUM(AttritionFlag) * 100.0 / COUNT(*)) AS Attrition_Rate
FROM HR_Data
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

-- 23. Job Satisfaction Analysis
SELECT 
    JobSatisfaction,
    (SUM(AttritionFlag) * 100.0 / COUNT(*)) AS Attrition_Rate
FROM HR_Data
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- 24. Environment Satisfaction Analysis
SELECT EnvironmentSatisfaction, (SUM(AttritionFlag) * 100.0 / COUNT(*)) AS Attrition_Rate
FROM HR_Data
GROUP BY EnvironmentSatisfaction
ORDER BY EnvironmentSatisfaction;

-- 25. Business Travel Impact
SELECT BusinessTravel, (SUM(AttritionFlag) * 100.0 / COUNT(*)) AS Attrition_Rate
FROM HR_Data
GROUP BY BusinessTravel;


-- ==========================================================
-- PART 6: EXPERIENCE, PROMOTION & PERFORMANCE ANALYSIS 
-- ==========================================================

-- 26. Experience Analysis: Number of Companies Worked vs Attrition
SELECT NumCompaniesWorked, (SUM(AttritionFlag) * 100.0 / COUNT(*)) AS Attrition_Rate
FROM HR_Data
GROUP BY NumCompaniesWorked
ORDER BY NumCompaniesWorked;

-- 27. Promotion Analysis: Years Since Last Promotion for Leavers vs Stayers
SELECT Attrition, AVG(YearsSinceLastPromotion) AS Avg_Years_Since_Promotion
FROM HR_Data
GROUP BY Attrition;

-- 28. Experience Analysis: Average Years in Current Role
SELECT Attrition, AVG(YearsInCurrentRole) AS Avg_Years_In_Role
FROM HR_Data
GROUP BY Attrition;

-- 29. High Flight Risk: Employees with 0 years with current manager
SELECT COUNT(*) AS High_Risk_Employees 
FROM HR_Data 
WHERE YearsWithCurrManager = 0 AND Attrition = 1;

-- 30. Performance Analysis: Salary Hike vs Performance Rating
SELECT PerformanceRating, AVG(PercentSalaryHike) AS Avg_Salary_Hike
FROM HR_Data
GROUP BY PerformanceRating;


-- ==========================================================
-- PART 7: ADVANCED QUERIES (CTE & WINDOW FUNCTIONS) 
-- ==========================================================

-- 31. Window Function: Rank Employees by Salary within their Department
SELECT 
    EmployeeNumber, 
    Department, 
    MonthlyIncome, 
    RANK() OVER(PARTITION BY Department ORDER BY MonthlyIncome DESC) AS Salary_Rank 
FROM HR_Data;

-- 32. CTE (Basic): Find Departments with Attrition Rate Higher Than Company Average
WITH DeptAttrition AS (
    SELECT 
        Department, 
        (SUM(AttritionFlag) * 100.0 / COUNT(*)) AS Dept_Rate 
    FROM HR_Data 
    GROUP BY Department
)
SELECT * FROM DeptAttrition 
WHERE Dept_Rate > (SELECT SUM(AttritionFlag) * 100.0 / COUNT(*) FROM HR_Data);

-- 33. Window Function: Compare Employee Salary to their Department's Average Salary
SELECT 
    EmployeeNumber,
    Department,
    MonthlyIncome,
    AVG(MonthlyIncome) OVER(PARTITION BY Department) AS Dept_Avg_Salary
FROM HR_Data;

-- 34. CTE: Find the Top Earner in each Job Role
WITH RankedRoles AS (
    SELECT 
        JobRole, 
        MonthlyIncome, 
        EmployeeNumber,
        ROW_NUMBER() OVER(PARTITION BY JobRole ORDER BY MonthlyIncome DESC) AS Role_Rank
    FROM HR_Data
)
SELECT JobRole, EmployeeNumber, MonthlyIncome 
FROM RankedRoles 
WHERE Role_Rank = 1;

-- 35. Window Function: Find out if Seniority (TotalWorkingYears) affects Salary by
--      calculating a running total (Basic Example)
SELECT 
    EmployeeNumber, 
    TotalWorkingYears, 
    MonthlyIncome,
    SUM(MonthlyIncome) OVER(ORDER BY TotalWorkingYears) AS Running_Total_Income
FROM HR_Data;