--
-- @lc app=leetcode id=183 lang=mysql
--
-- [183] Customers Who Never Order
--
-- https://leetcode.com/problems/customers-who-never-order/description/
--
-- database
-- Easy (71.63%)
-- Likes:    3088
-- Dislikes: 160
-- Total Accepted:    1.3M
-- Total Submissions: 1.8M
-- Testcase Example:  '{"headers": {"Customers": ["id", "name"], "Orders": ["id", "customerId"]}, "rows": {"Customers": [[1, "Joe"], [2, "Henry"], [3, "Sam"], [4, "Max"]], "Orders": [[1, 3], [2, 1]]}}'
--
-- Table: Customers
-- 
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the ID and name of a customer.
-- 
-- 
-- 
-- 
-- Table: Orders
-- 
-- 
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | customerId  | int  |
-- +-------------+------+
-- id is the primary key (column with unique values) for this table.
-- customerId is a foreign key (reference columns) of the ID from the Customers
-- table.
-- Each row of this table indicates the ID of an order and the ID of the
-- customer who ordered it.
-- 
-- 
-- 
-- 
-- Write a solution to find all customers who never order anything.
-- 
-- Return the result table in any order.
-- 
-- The result format is in the following example.
-- 
-- 
-- Example 1:
-- 
-- 
-- Input: 
-- Customers table:
-- +----+-------+
-- | id | name  |
-- +----+-------+
-- | 1  | Joe   |
-- | 2  | Henry |
-- | 3  | Sam   |
-- | 4  | Max   |
-- +----+-------+
-- Orders table:
-- +----+------------+
-- | id | customerId |
-- +----+------------+
-- | 1  | 3          |
-- | 2  | 1          |
-- +----+------------+
-- Output: 
-- +-----------+
-- | Customers |
-- +-----------+
-- | Henry     |
-- | Max       |
-- +-----------+
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below
select name as customers from
customers t1
where not exists 
(
    select 1 from orders t2
    where t2.customerid=t1.id
)

-- @lc code=end

