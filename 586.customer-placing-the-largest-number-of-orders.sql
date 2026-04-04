--
-- @lc app=leetcode id=586 lang=mysql
--
-- [586] Customer Placing the Largest Number of Orders
--
-- https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/description/
--
-- database
-- Easy (64.31%)
-- Likes:    1223
-- Dislikes: 100
-- Total Accepted:    496.4K
-- Total Submissions: 771.5K
-- Testcase Example:  '{"headers":{"orders":["order_number","customer_number"]},"rows":{"orders":[[1,1],[2,2],[3,3],[4,3]]}}'
--
-- Table: Orders
-- 
-- 
-- +-----------------+----------+
-- | Column Name     | Type     |
-- +-----------------+----------+
-- | order_number    | int      |
-- | customer_number | int      |
-- +-----------------+----------+
-- order_number is the primary key (column with unique values) for this table.
-- This table contains information about the order ID and the customer ID.
-- 
-- 
-- 
-- 
-- Write a solution to find the customer_number for the customer who has placed
-- the largest number of orders.
-- 
-- The test cases are generated so that exactly one customer will have placed
-- more orders than any other customer.
-- 
-- The result format is in the following example.
-- 
-- 
-- Example 1:
-- 
-- 
-- Input: 
-- Orders table:
-- +--------------+-----------------+
-- | order_number | customer_number |
-- +--------------+-----------------+
-- | 1            | 1               |
-- | 2            | 2               |
-- | 3            | 3               |
-- | 4            | 3               |
-- +--------------+-----------------+
-- Output: 
-- +-----------------+
-- | customer_number |
-- +-----------------+
-- | 3               |
-- +-----------------+
-- Explanation: 
-- The customer with number 3 has two orders, which is greater than either
-- customer 1 or 2 because each of them only has one order. 
-- So the result is customer_number 3.
-- 
-- 
-- 
-- Follow up: What if more than one customer has the largest number of orders,
-- can you find all the customer_number in this case?
-- 
--

-- @lc code=start
# Write your MySQL query statement below

select customer_number from Orders
group by customer_number
order by count(*) desc
limit 1

-- @lc code=end

