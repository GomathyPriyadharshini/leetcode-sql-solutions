--
-- @lc app=leetcode id=196 lang=mysql
--
-- [196] Delete Duplicate Emails
--
-- https://leetcode.com/problems/delete-duplicate-emails/description/
--
-- database
-- Easy (65.81%)
-- Likes:    2099
-- Dislikes: 429
-- Total Accepted:    960.3K
-- Total Submissions: 1.5M
-- Testcase Example:  '{"headers": {"Person": ["id", "email"]}, "rows": {"Person": [[1, "john@example.com"], [2, "bob@example.com"], [3, "john@example.com"]]}}'
--
-- Table: Person
-- 
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | email       | varchar |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table contains an email. The emails will not contain
-- uppercase letters.
-- 
-- 
-- 
-- 
-- Write a solution to delete all duplicate emails, keeping only one unique
-- email with the smallest id.
-- 
-- For SQL users, please note that you are supposed to write a DELETE statement
-- and not a SELECT one.
-- 
-- For Pandas users, please note that you are supposed to modify Person in
-- place.
-- 
-- After running your script, the answer shown is the Person table. The driver
-- will first compile and run your piece of code and then show the Person
-- table. The final order of the Person table does not matter.
-- 
-- The result format is in the following example.
-- 
-- 
-- Example 1:
-- 
-- 
-- Input: 
-- Person table:
-- +----+------------------+
-- | id | email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- | 3  | john@example.com |
-- +----+------------------+
-- Output: 
-- +----+------------------+
-- | id | email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- +----+------------------+
-- Explanation: john@example.com is repeated two times. We keep the row with
-- the smallest Id = 1.
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below
delete from Person P
where id in 
(
    select id from 
    (
    select id,row_number() over (partition by email order by id) as rn 
    from person
    )t1
    where rn>1 and P.id=t1.id
)

-- @lc code=end

