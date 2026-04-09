create database employee_management_system;
use employee_management_system;

CREATE TABLE JobDepartment (
    Job_ID INT PRIMARY KEY,
    jobdept VARCHAR(50),
    name VARCHAR(100),
    description TEXT,
    salaryrange VARCHAR(50)
);

CREATE TABLE SalaryBonus (
    salary_ID INT PRIMARY KEY,
    Job_ID INT,
    amount DECIMAL(10,2),
    annual DECIMAL(10,2),
    bonus DECIMAL(10,2),
    CONSTRAINT fk_salary_job FOREIGN KEY (job_ID) REFERENCES JobDepartment(Job_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Employee (
    emp_ID INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    contact_add VARCHAR(100),
    emp_email VARCHAR(100) UNIQUE,
    emp_pass VARCHAR(50),
    Job_ID INT,
    CONSTRAINT fk_employee_job FOREIGN KEY (Job_ID)
        REFERENCES JobDepartment(Job_ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);


CREATE TABLE Qualification (
    QualID INT PRIMARY KEY,
    Emp_ID INT,
    Position VARCHAR(50),
    Requirements VARCHAR(255),
    Date_In DATE,
    CONSTRAINT fk_qualification_emp FOREIGN KEY (Emp_ID)
        REFERENCES Employee(emp_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


CREATE TABLE Leaves (
    leave_ID INT PRIMARY KEY,
    emp_ID INT,
    date DATE,
    reason TEXT,
    CONSTRAINT fk_leave_emp FOREIGN KEY (emp_ID) REFERENCES Employee(emp_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE Payroll (
    payroll_ID INT PRIMARY KEY,
    emp_ID INT,
    job_ID INT,
    salary_ID INT,
    leave_ID INT,
    date DATE,
    report TEXT,
    total_amount DECIMAL(10,2),
    CONSTRAINT fk_payroll_emp FOREIGN KEY (emp_ID) REFERENCES Employee(emp_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_payroll_job FOREIGN KEY (job_ID) REFERENCES JobDepartment(job_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_payroll_salary FOREIGN KEY (salary_ID) REFERENCES SalaryBonus(salary_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_payroll_leave FOREIGN KEY (leave_ID) REFERENCES Leaves(leave_ID)
        ON DELETE SET NULL ON UPDATE CASCADE
);

select * from jobdepartment;
select * from employee;
select * from leaves;
select * from payroll;
select * from qualification;
select * from salarybonus;

show tables;

-- 1. EMPLOYEE INSIGHTS
-- How many unique employees are currently in the system?
select distinct * from employee;

-- Which departments have the highest number of employees?
select * from jobdepartment;
select jobdept,count(Job_id) as No_of_Employees
from jobdepartment
group by jobdept
order by No_of_Employees desc
limit 1;

-- What is the average salary per department?
SELECT jd.jobdept, AVG(sb.amount) AS avg_salary
FROM JobDepartment jd
JOIN SalaryBonus sb 
    ON jd.Job_ID = sb.Job_ID
GROUP BY jd.jobdept;

-- Who are the top 5 highest-paid employees?
SELECT 
    e.emp_ID,
    e.firstname,
    e.lastname,
    sb.amount AS salary
FROM Employee e
JOIN SalaryBonus sb 
    ON e.Job_ID = sb.Job_ID
ORDER BY sb.amount DESC
LIMIT 5;

-- What is the total salary expenditure across the company?
SELECT SUM(total_amount) AS total_salary_expenditure
FROM Payroll;

-- 2. JOB ROLE AND DEPARTMENT ANALYSIS
-- How many different job roles exist in each department?
SELECT jobdept, COUNT(DISTINCT Job_ID) AS total_roles
FROM JobDepartment
GROUP BY jobdept;

-- What is the average salary range per department?
SELECT jd.jobdept, AVG(sb.amount) AS avg_salary
FROM JobDepartment jd
JOIN SalaryBonus sb 
    ON jd.Job_ID = sb.Job_ID
GROUP BY jd.jobdept;

-- Which job roles offer the highest salary?
SELECT jd.Job_ID, jd.jobdept, MAX(sb.amount) AS highest_salary
FROM JobDepartment jd
JOIN SalaryBonus sb 
    ON jd.Job_ID = sb.Job_ID
GROUP BY jd.Job_ID, jd.jobdept
ORDER BY highest_salary DESC
LIMIT 1;

-- Which departments have the highest total salary allocation?

SELECT jd.jobdept, SUM(sb.amount) AS total_salary
FROM Employee e
JOIN JobDepartment jd 
    ON e.Job_ID = jd.Job_ID
JOIN SalaryBonus sb 
    ON jd.Job_ID = sb.Job_ID
GROUP BY jd.jobdept
ORDER BY total_salary DESC
limit 3;

-- 3. QUALIFICATION AND SKILLS ANALYSIS
-- How many employees have at least one qualification listed?
SELECT COUNT(DISTINCT Emp_ID) AS employees_with_qualification
FROM Qualification;

-- Which positions require the most qualifications?
SELECT Position, COUNT(*) AS total_qualifications
FROM Qualification
GROUP BY Position
ORDER BY total_qualifications DESC
LIMIT 3;

-- Which employees have the highest number of qualifications?
SELECT e.emp_ID, e.firstname, e.lastname, COUNT(q.QualID) AS total_qualifications
FROM Employee e
JOIN Qualification q 
    ON e.emp_ID = q.Emp_ID
GROUP BY e.emp_ID, e.firstname, e.lastname
ORDER BY total_qualifications DESC;


-- 4. LEAVE AND ABSENCE PATTERNS
-- Which year had the most employees taking leaves?
SELECT YEAR(date) AS year, COUNT(DISTINCT emp_ID) AS employees_on_leave
FROM Leaves
GROUP BY YEAR(date)
ORDER BY employees_on_leave DESC;

-- What is the average number of leave days taken by its employees per department?
SELECT jd.jobdept, AVG(emp_leave_count) AS avg_leaves
FROM (
    SELECT emp_ID, COUNT(*) AS emp_leave_count
    FROM Leaves
    GROUP BY emp_ID
) AS sub
JOIN Employee e ON sub.emp_ID = e.emp_ID
JOIN JobDepartment jd ON e.Job_ID = jd.Job_ID
GROUP BY jd.jobdept;

-- Which employees have taken the most leaves?
SELECT e.emp_ID, e.firstname, e.lastname, COUNT(l.leave_ID) AS total_leaves
FROM Employee e
JOIN Leaves l 
    ON e.emp_ID = l.emp_ID
GROUP BY e.emp_ID, e.firstname, e.lastname
ORDER BY total_leaves DESC;

-- What is the total number of leave days taken company-wide?
SELECT COUNT(*) AS total_leave_days
FROM Leaves;

-- How do leave days correlate with payroll amounts?
SELECT 
    e.emp_ID,
    COUNT(l.leave_ID) AS total_leaves,
    SUM(p.total_amount) AS total_salary
FROM Employee e
LEFT JOIN Leaves l 
    ON e.emp_ID = l.emp_ID
LEFT JOIN Payroll p 
    ON e.emp_ID = p.emp_ID
GROUP BY e.emp_ID;

-- 5. PAYROLL AND COMPENSATION ANALYSIS
-- What is the total monthly payroll processed?
SELECT 
    YEAR(date) AS year,
    MONTH(date) AS month,
    SUM(total_amount) AS total_monthly_payroll
FROM Payroll
GROUP BY YEAR(date), MONTH(date)
ORDER BY year, month;

-- What is the average bonus given per department?
SELECT jd.jobdept, AVG(sb.bonus) AS avg_bonus
FROM SalaryBonus sb
JOIN JobDepartment jd 
    ON sb.Job_ID = jd.Job_ID
GROUP BY jd.jobdept;

-- Which department receives the highest total bonuses?
SELECT jd.jobdept, SUM(sb.bonus) AS total_bonus
FROM SalaryBonus sb
JOIN JobDepartment jd 
    ON sb.Job_ID = jd.Job_ID
GROUP BY jd.jobdept
ORDER BY total_bonus DESC
limit 1;

-- What is the average value of total_amount after considering leave deductions?
SELECT AVG(total_amount) AS avg_adjusted_salary
FROM Payroll;
