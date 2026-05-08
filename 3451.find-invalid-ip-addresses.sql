--
-- @lc app=leetcode id=3451 lang=mysql
--
-- [3451] Find Invalid IP Addresses
--
-- https://leetcode.com/problems/find-invalid-ip-addresses/description/
--
-- database
-- Hard (51.93%)
-- Likes:    39
-- Dislikes: 8
-- Total Accepted:    12.3K
-- Total Submissions: 23.6K
-- Testcase Example:  '{"headers":{"logs":["log_id","ip","status_code"]},"rows":{"logs":[[1,"192.168.1.1",200],[2,"256.1.2.3",404],[3,"192.168.001.1",200],[4,"192.168.1.1",200],[5,"192.168.1",500],[6,"256.1.2.3",404],[7,"192.168.001.1",200]]}}'
--
-- Table:  logs
-- 
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | log_id      | int     |
-- | ip          | varchar |
-- | status_code | int     |
-- +-------------+---------+
-- log_id is the unique key for this table.
-- Each row contains server access log information including IP address and
-- HTTP status code.
-- 
-- 
-- Write a solution to find invalid IP addresses. An IPv4 address is invalid if
-- it meets any of these conditions:
-- 
-- 
-- Contains numbers greater than 255 in any octet
-- Has leading zeros in any octet (like 01.02.03.04)
-- Has less or more than 4 octets
-- 
-- 
-- Return the result table ordered by invalid_count, ip in descending order
-- respectively. 
-- 
-- The result format is in the following example.
-- 
-- 
-- Example:
-- 
-- 
-- Input:
-- 
-- logs table:
-- 
-- 
-- +--------+---------------+-------------+
-- | log_id | ip            | status_code | 
-- +--------+---------------+-------------+
-- | 1      | 192.168.1.1   | 200         | 
-- | 2      | 256.1.2.3     | 404         | 
-- | 3      | 192.168.001.1 | 200         | 
-- | 4      | 192.168.1.1   | 200         | 
-- | 5      | 192.168.1     | 500         | 
-- | 6      | 256.1.2.3     | 404         | 
-- | 7      | 192.168.001.1 | 200         | 
-- +--------+---------------+-------------+
-- 
-- 
-- Output:
-- 
-- 
-- +---------------+--------------+
-- | ip            | invalid_count|
-- +---------------+--------------+
-- | 256.1.2.3     | 2            |
-- | 192.168.001.1 | 2            |
-- | 192.168.1     | 1            |
-- +---------------+--------------+
-- 
-- 
-- Explanation:
-- 
-- 
-- 256.1.2.3 is invalid because 256 > 255
-- 192.168.001.1 is invalid because of leading zeros
-- 192.168.1 is invalid because it has only 3 octets
-- 
-- 
-- The output table is ordered by invalid_count, ip in descending order
-- respectively.
-- 
-- 
--

-- @lc code=start
-- Write your MySQL query statement below

SELECT ip, COUNT(*) AS invalid_count
FROM logs
WHERE
    -- not exactly 4 octets
    LENGTH(ip) - LENGTH(REPLACE(ip, '.', '')) != 3

    OR

    -- any octet > 255
    SUBSTRING_INDEX(ip, '.', 1) > 255
    OR SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 2), '.', -1) > 255
    OR SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 3), '.', -1) > 255
    OR SUBSTRING_INDEX(ip, '.', -1) > 255

    OR

    -- leading zeros
    (
        SUBSTRING_INDEX(ip, '.', 1) REGEXP '^0[0-9]+'
        OR SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 2), '.', -1) REGEXP '^0[0-9]+'
        OR SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 3), '.', -1) REGEXP '^0[0-9]+'
        OR SUBSTRING_INDEX(ip, '.', -1) REGEXP '^0[0-9]+'
    )

GROUP BY ip
ORDER BY invalid_count DESC, ip DESC;

-- @lc code=end

