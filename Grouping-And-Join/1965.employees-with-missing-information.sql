--
-- @lc app=leetcode id=1965 lang=mysql
--
-- [1965] Employees With Missing Information
--
-- https://leetcode.com/problems/employees-with-missing-information/description/
--
-- database
-- Easy (73.10%)
-- Likes:    799
-- Dislikes: 41
-- Total Accepted:    181.4K
-- Total Submissions: 247.9K
-- Testcase Example:  '{"headers":{"Employees":["employee_id","name"],"Salaries":["employee_id","salary"]},"rows":{"Employees":[[2,"Crew"],[4,"Haven"],[5,"Kristian"]],"Salaries":[[5,76071],[1,22517],[4,63539]]}}'
--
-- Table: Employees
-- 
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | employee_id | int     |
-- | name        | varchar |
-- +-------------+---------+
-- employee_id is the column with unique values for this table.
-- Each row of this table indicates the name of the employee whose ID is
-- employee_id.
-- 
-- 
-- 
-- 
-- Table: Salaries
-- 
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | employee_id | int     |
-- | salary      | int     |
-- +-------------+---------+
-- employee_id is the column with unique values for this table.
-- Each row of this table indicates the salary of the employee whose ID is
-- employee_id.
-- 
-- 
-- 
-- 
-- Write a solution to report the IDs of all the employees with missing
-- information. The information of an employee is missing if:
-- 
-- 
-- The employee's name is missing, or
-- The employee's salary is missing.
-- 
-- 
-- Return the result table ordered by employee_id in ascending order.
-- 
-- The result format is in the following example.
-- 
-- 
-- Example 1:
-- 
-- 
-- Input: 
-- Employees table:
-- +-------------+----------+
-- | employee_id | name     |
-- +-------------+----------+
-- | 2           | Crew     |
-- | 4           | Haven    |
-- | 5           | Kristian |
-- +-------------+----------+
-- Salaries table:
-- +-------------+--------+
-- | employee_id | salary |
-- +-------------+--------+
-- | 5           | 76071  |
-- | 1           | 22517  |
-- | 4           | 63539  |
-- +-------------+--------+
-- Output: 
-- +-------------+
-- | employee_id |
-- +-------------+
-- | 1           |
-- | 2           |
-- +-------------+
-- Explanation: 
-- Employees 1, 2, 4, and 5 are working at this company.
-- The name of employee 1 is missing.
-- The salary of employee 2 is missing.
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below

select a.employee_id from employees a
Left join
salaries b
on a.employee_id=b.employee_id
where salary is  null or name is  null

union 
select b.employee_id from employees a
Right join
salaries b
on a.employee_id=b.employee_id
where salary is  null or name is  null
order by employee_id

-- @lc code=end

