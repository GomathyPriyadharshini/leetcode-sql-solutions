--
-- @lc app=leetcode id=176 lang=mysql
--
-- [176] Second Highest Salary
--
-- https://leetcode.com/problems/second-highest-salary/description/
--
-- database
-- Medium (46.56%)
-- Likes:    4230
-- Dislikes: 1013
-- Total Accepted:    1.5M
-- Total Submissions: 3.2M
-- Testcase Example:  '{"headers":{"Employee":["id","salary"]},"rows":{"Employee":[[1,100],[2,200],[3,300]]}}'
--
-- Table: Employee
-- 
-- 
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | salary      | int  |
-- +-------------+------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table contains information about the salary of an
-- employee.
-- 
-- 
-- 
-- 
-- Write a solution to find the second highest distinct salary from the
-- Employee table. If there is no second highest salary, return null (return
-- None in Pandas).
-- 
-- The result format is in the following example.
-- 
-- 
-- Example 1:
-- 
-- 
-- Input: 
-- Employee table:
-- +----+--------+
-- | id | salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- Output: 
-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | 200                 |
-- +---------------------+
-- 
-- 
-- Example 2:
-- 
-- 
-- Input: 
-- Employee table:
-- +----+--------+
-- | id | salary |
-- +----+--------+
-- | 1  | 100    |
-- +----+--------+
-- Output: 
-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | null                |
-- +---------------------+
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below
select max(salary) as  SecondHighestSalary from 
(
    select salary, dense_rank() over(order by salary desc) as rn from employee
)t1
where rn=2


-- @lc code=end

