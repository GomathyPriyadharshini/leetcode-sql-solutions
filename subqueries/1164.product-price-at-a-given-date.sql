--
-- @lc app=leetcode id=1164 lang=mysql
--
-- [1164] Product Price at a Given Date
--
-- https://leetcode.com/problems/product-price-at-a-given-date/description/
--
-- database
-- Medium (57.77%)
-- Likes:    1410
-- Dislikes: 336
-- Total Accepted:    339.4K
-- Total Submissions: 587.2K
-- Testcase Example:  '{"headers":{"Products":["product_id","new_price","change_date"]},"rows":{"Products":[[1,20,"2019-08-14"],[2,50,"2019-08-14"],[1,30,"2019-08-15"],[1,35,"2019-08-16"],[2,65,"2019-08-17"],[3,20,"2019-08-18"]]}}'
--
-- Table: Products
-- 
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | new_price     | int     |
-- | change_date   | date    |
-- +---------------+---------+
-- (product_id, change_date) is the primary key (combination of columns with
-- unique values) of this table.
-- Each row of this table indicates that the price of some product was changed
-- to a new price at some date.
-- 
-- Initially, all products have price 10.
-- 
-- Write a solution to find the prices of all products on the date 2019-08-16.
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
-- Products table:
-- +------------+-----------+-------------+
-- | product_id | new_price | change_date |
-- +------------+-----------+-------------+
-- | 1          | 20        | 2019-08-14  |
-- | 2          | 50        | 2019-08-14  |
-- | 1          | 30        | 2019-08-15  |
-- | 1          | 35        | 2019-08-16  |
-- | 2          | 65        | 2019-08-17  |
-- | 3          | 20        | 2019-08-18  |
-- +------------+-----------+-------------+
-- Output: 
-- +------------+-------+
-- | product_id | price |
-- +------------+-------+
-- | 2          | 50    |
-- | 1          | 35    |
-- | 3          | 10    |
-- +------------+-------+
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below

SELECT p.product_id,
       COALESCE(
           (SELECT new_price
            FROM Products p2
            WHERE p2.product_id = p.product_id
              AND p2.change_date <= '2019-08-16'
            ORDER BY p2.change_date DESC
            LIMIT 1),
           10
       ) AS price
FROM (SELECT DISTINCT product_id FROM Products) p;

-- @lc code=end

