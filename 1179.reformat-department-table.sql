--
-- @lc app=leetcode id=1179 lang=mysql
--
-- [1179] Reformat Department Table
--
-- https://leetcode.com/problems/reformat-department-table/description/
--
-- database
-- Easy (76.31%)
-- Likes:    860
-- Dislikes: 645
-- Total Accepted:    184.2K
-- Total Submissions: 241.3K
-- Testcase Example:  '{"headers":{"Department":["id","revenue","month"]},"rows":{"Department":[[1,8000,"Jan"],[2,9000,"Jan"],[3,10000,"Feb"],[1,7000,"Feb"],[1,6000,"Mar"]]}}'
--
-- Table: Department
-- 
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | revenue     | int     |
-- | month       | varchar |
-- +-------------+---------+
-- In SQL,(id, month) is the primary key of this table.
-- The table has information about the revenue of each department per month.
-- The month has values in
-- ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"].
-- 
-- 
-- 
-- 
-- Reformat the table such that there is a department id column and a revenue
-- column for each month.
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
-- Department table:
-- +------+---------+-------+
-- | id   | revenue | month |
-- +------+---------+-------+
-- | 1    | 8000    | Jan   |
-- | 2    | 9000    | Jan   |
-- | 3    | 10000   | Feb   |
-- | 1    | 7000    | Feb   |
-- | 1    | 6000    | Mar   |
-- +------+---------+-------+
-- Output: 
-- +------+-------------+-------------+-------------+-----+-------------+
-- | id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
-- +------+-------------+-------------+-------------+-----+-------------+
-- | 1    | 8000        | 7000        | 6000        | ... | null        |
-- | 2    | 9000        | null        | null        | ... | null        |
-- | 3    | null        | 10000       | null        | ... | null        |
-- +------+-------------+-------------+-------------+-----+-------------+
-- Explanation: The revenue from Apr to Dec is null.
-- Note that the result table has 13 columns (1 for the department id + 12 for
-- the months).
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below

select id,
sum(CASE WHEN month='Jan' then revenue else null end) as Jan_Revenue,
sum(CASE WHEN month='Feb' then revenue else null end) as Feb_Revenue,
sum(CASE WHEN month='Mar' then revenue else null end) as Mar_Revenue,
sum(CASE WHEN month='Apr' then revenue else null end) as Apr_Revenue,
sum(CASE WHEN month='May' then revenue else null end) as May_Revenue,
sum(CASE WHEN month='Jun' then revenue else null end) as Jun_Revenue,
sum(CASE WHEN month='Jul' then revenue else null end) as Jul_Revenue,
sum(CASE WHEN month='Aug' then revenue else null end) as Aug_Revenue,
sum(CASE WHEN month='Sep' then revenue else null end) as Sep_Revenue,
sum(CASE WHEN month='Oct' then revenue else null end) as Oct_Revenue,
sum(CASE WHEN month='Nov' then revenue else null end) as Nov_Revenue,
sum(CASE WHEN month='Dec' then revenue else null end) as Dec_Revenue
from Department
group by id

-- @lc code=end

