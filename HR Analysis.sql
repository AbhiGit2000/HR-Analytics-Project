
--Creating Table 'employees'
CREATE TABLE employees(Employee_Number INT PRIMARY KEY,	Age INT,Gender VARCHAR(20),Marital_Status VARCHAR(20),Education_Field VARCHAR(50)
);

--Importing data from csv
COPY
employees(Employee_Number,Age,Gender,Marital_Status,Education_Field)
FROM 'C:\Users\DELL\Downloads\Employees Table.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM employees;

--Creating Table 'jobs'
CREATE TABLE jobs(Employee_Number INT,Job_Role VARCHAR(50),Department VARCHAR(50),Job_Level INT,
Job_Satisfaction INT,Performance_Rating INT,Years_At_Company INT,
Years_In_CurrentRole INT,Environment_Satisfaction INT,
CONSTRAINT foreignkey_jobs FOREIGN KEY (Employee_Number) REFERENCES employees(Employee_Number));

--Importing data from csv
COPY
jobs(Employee_Number,Job_Role,Department,Job_Level,Job_Satisfaction,Performance_Rating,Years_At_Company,
Years_In_CurrentRole,Environment_Satisfaction
)
FROM 'C:\Users\DELL\Downloads\Jobs Table.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM jobs;

--Creating Table 'compensation'
CREATE TABLE compensation(Employee_Number INT,Monthly_Income INT,Percent_Salary_Hike NUMERIC(5,2),
Stock_Option_Level INT,Over_Time VARCHAR(10),
CONSTRAINT foreignkey_compensation FOREIGN KEY (Employee_Number) REFERENCES employees(Employee_Number));

--Importing data from csv
COPY
compensation(Employee_Number,Monthly_Income,Percent_Salary_Hike,Stock_Option_Level,Over_Time)
FROM 'C:\Users\DELL\Downloads\Compensation Table.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM compensation;

--Creating Table 'attrition'
CREATE TABLE attrition(Employee_Number INT,Attrition VARCHAR(10),Years_Since_LastPromotion INT,
Years_With_CurrentManager INT,Training_Times_LastYear INT,
CONSTRAINT foreignkey_attrition FOREIGN KEY (Employee_Number) REFERENCES employees(Employee_Number));

--Importing data from csv
COPY
attrition(Employee_Number,Attrition,Years_Since_LastPromotion,Years_With_CurrentManager,Training_Times_LastYear
)
FROM 'C:\Users\DELL\Downloads\Attrition Table.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM attrition;

--Attrition Rate
SELECT COUNT(*) AS total_employees,
COUNT(*) FILTER(WHERE attrition='Yes') AS total_leavers,
ROUND (COUNT(*) FILTER(WHERE attrition='Yes')*100/COUNT(*),2)AS attrition_rate
FROM attrition;

--Categorizing Age
SELECT Age, CASE
WHEN Age<30 THEN 'Young'
WHEN Age BETWEEN 30 AND 45 THEN 'Mid-Age'
ELSE 'Senior'
END AS Age_group
FROM employees;

--Top Ranked departments based on attrition
SELECT j.department,
RANK() OVER(ORDER BY COUNT(*) FILTER(WHERE a.attrition='Yes')DESC) AS rank_attrition
FROM jobs j
JOIN attrition a ON j.employee_number=a.employee_number
GROUP BY j.department;

--Replace NULL values
SELECT employee_number, 
COALESCE(marital_status,'Unknown') cleaned_Maritalstatus
FROM employees;

--Highest Total Sales
SELECT *
FROM(SELECT e.employee_number, AVG(c.monthly_income) AS avg_income
FROM employees e
JOIN compensation c ON e.employee_number=c.employee_number
GROUP BY e.employee_number) AS sub
WHERE avg_income=(SELECT MAX(avg_income) FROM(
SELECT AVG(c.monthly_income) AS avg_income
FROM employees e 
JOIN compensation c  ON e.employee_number=c.employee_number
GROUP BY e.employee_number
));

--Average Monthly Income 
SELECT j.job_role,ROUND(AVG(c.monthly_income),2)AS avg_income
FROM jobs j
JOIN compensation c ON j.employee_number=c.employee_number
GROUP BY j.job_role;

--Average Length of servicebefore leaving
SELECT ROUND(AVG(j.Years_At_Company),2) AS avg_years_before_leaving
FROM jobs j
JOIN attrition a ON j.employee_number=a.employee_number
WHERE a.attrition='Yes';

--Overtime Percentage
SELECT job_role,COUNT(*) FILTER(WHERE Over_time='Yes')*100/COUNT(*)AS overtime_percentage
FROM jobs j
JOIN compensation c ON j.employee_number=c.employee_number
GROUP BY job_role;

--Promotion Gap Detection
SELECT e.employee_number,j.job_level,j.years_at_company
FROM employees e
JOIN jobs j ON e.employee_number=j.employee_number
WHERE j.job_level<=2 AND j.years_at_company>5;



