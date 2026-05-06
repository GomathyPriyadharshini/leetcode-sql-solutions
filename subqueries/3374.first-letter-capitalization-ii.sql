--
-- @lc app=leetcode id=3374 lang=mysql
--
-- [3374] First Letter Capitalization II
--
-- https://leetcode.com/problems/first-letter-capitalization-ii/description/
--
-- database
-- Hard (52.06%)
-- Likes:    33
-- Dislikes: 18
-- Total Accepted:    10K
-- Total Submissions: 20.9K
-- Testcase Example:  '{"headers":{"user_content":["content_id","content_text"]},"rows":{"user_content":[[1,"hello world of SQL"],[2,"the QUICK-brown fox"],[3,"modern-day DATA science"],[4,"web-based FRONT-end development"]]}}'
--
-- Table: user_content
-- 
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | content_id  | int     |
-- | content_text| varchar |
-- +-------------+---------+
-- content_id is the unique key for this table.
-- Each row contains a unique ID and the corresponding text content.
-- 
-- 
-- Write a solution to transform the text in the content_text column by
-- applying the following rules:
-- 
-- 
-- Convert the first letter of each word to uppercase and the remaining letters
-- to lowercase
-- Special handling for words containing special characters:
-- 
-- For words connected with a hyphen -, both parts should be capitalized (e.g.,
-- top-rated → Top-Rated)
-- 
-- 
-- All other formatting and spacing should remain unchanged
-- 
-- 
-- Return the result table that includes both the original content_text and the
-- modified text following the above rules.
-- 
-- The result format is in the following example.
-- 
-- 
-- Example:
-- 
-- 
-- Input:
-- 
-- user_content table:
-- 
-- 
-- +------------+---------------------------------+
-- | content_id | content_text                    |
-- +------------+---------------------------------+
-- | 1          | hello world of SQL              |
-- | 2          | the QUICK-brown fox             |
-- | 3          | modern-day DATA science         |
-- | 4          | web-based FRONT-end development |
-- +------------+---------------------------------+
-- 
-- 
-- Output:
-- 
-- 
-- 
-- +------------+---------------------------------+---------------------------------+
-- | content_id | original_text                   |
-- converted_text                  |
-- 
-- +------------+---------------------------------+---------------------------------+
-- | 1          | hello world of SQL              | Hello World Of
-- Sql              |
-- | 2          | the QUICK-brown fox             | The Quick-Brown
-- Fox             |
-- | 3          | modern-day DATA science         | Modern-Day Data
-- Science         |
-- | 4          | web-based FRONT-end development | Web-Based Front-End
-- Development |
-- 
-- +------------+---------------------------------+---------------------------------+
-- 
-- 
-- Explanation:
-- 
-- 
-- For content_id = 1:
-- 
-- Each word's first letter is capitalized: "Hello World Of Sql"
-- 
-- 
-- For content_id = 2:
-- 
-- Contains the hyphenated word "QUICK-brown" which becomes
-- "Quick-Brown"
-- Other words follow normal capitalization rules
-- 
-- 
-- For content_id = 3:
-- 
-- Hyphenated word "modern-day" becomes "Modern-Day"
-- "DATA" is converted to "Data"
-- 
-- 
-- For content_id = 4:
-- 
-- Contains two hyphenated words: "web-based" → "Web-Based"
-- And "FRONT-end" → "Front-End"
-- 
-- 
-- 
-- 
-- 
-- 
-- Constraints:
-- 
-- 
-- context_text contains only English letters, and the characters in the list
-- ['\', ' ', '@', '-', '/', '^', ',']
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below



WITH RECURSIVE cte AS (
    SELECT
        1 AS n,
        content_id,
        content_text AS original_text,
        LOWER(content_text) AS txt,
        CONCAT(
            UPPER(LEFT(LOWER(content_text),1)),
            SUBSTRING(LOWER(content_text),2)
        ) AS result
    FROM user_content

    UNION ALL

    SELECT
        n + 1,
        content_id,
        original_text,
        txt,
        CASE
            WHEN SUBSTRING(txt,n,1)= " "
            THEN CONCAT(
                SUBSTRING(result,1,n),
                UPPER(SUBSTRING(txt,n+1,1)),
                SUBSTRING(result,n+2)
            )
            WHEN SUBSTRING(txt,n,1) REGEXP '[^a-z0-9]' and SUBSTRING(txt,n-1,1) REGEXP '[a-z0-9]' and SUBSTRING(txt,n+1,1) REGEXP '[a-z0-9]'  and txt NOT LIKE '%@%'

            THEN CONCAT(
                SUBSTRING(result,1,n),
                UPPER(SUBSTRING(txt,n+1,1)),
                SUBSTRING(result,n+2)
            )
            ELSE result
        END
    FROM cte
    WHERE n < LENGTH(txt)
)

SELECT
    content_id,
    original_text,
    result AS converted_text
FROM cte
WHERE (content_id, n) IN (
    SELECT content_id, MAX(n)
    FROM cte
    GROUP BY content_id
)
ORDER BY content_id;

-- @lc code=end

