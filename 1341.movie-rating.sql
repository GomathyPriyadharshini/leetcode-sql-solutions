--
-- @lc app=leetcode id=1341 lang=mysql
--
-- [1341] Movie Rating
--
-- https://leetcode.com/problems/movie-rating/description/
--
-- database
-- Medium (43.08%)
-- Likes:    1002
-- Dislikes: 242
-- Total Accepted:    290.1K
-- Total Submissions: 672.8K
-- Testcase Example:  '{"headers": {"Movies": ["movie_id", "title"], "Users": ["user_id", "name"], "MovieRating": ["movie_id", "user_id", "rating", "created_at"]}, "rows": {"Movies": [[1, "Avengers"], [2, "Frozen 2"], [3, "Joker"]], "Users": [[1, "Daniel"], [2, "Monica"], [3, "Maria"], [4, "James"]], "MovieRating": [[1, 1, 3, "2020-01-12"], [1, 2, 4, "2020-02-11"], [1, 3, 2, "2020-02-12"], [1, 4, 1, "2020-01-01"], [2, 1, 5, "2020-02-17"], [2, 2, 2, "2020-02-01"], [2, 3, 2, "2020-03-01"], [3, 1, 3, "2020-02-22"], [3, 2, 4, "2020-02-25"]]}}'
--
-- Table: Movies
-- 
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | title         | varchar |
-- +---------------+---------+
-- movie_id is the primary key (column with unique values) for this table.
-- title is the name of the movie.
-- Each movie has a unique title.
-- 
-- Table: Users
-- 
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user_id       | int     |
-- | name          | varchar |
-- +---------------+---------+
-- user_id is the primary key (column with unique values) for this table.
-- The column 'name' has unique values.
-- 
-- 
-- Table: MovieRating
-- 
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | user_id       | int     |
-- | rating        | int     |
-- | created_at    | date    |
-- +---------------+---------+
-- (movie_id, user_id) is the primary key (column with unique values) for this
-- table.
-- This table contains the rating of a movie by a user in their review.
-- created_at is the user's review date. 
-- 
-- 
-- 
-- 
-- Write a solution to:
-- 
-- 
-- Find the name of the user who has rated the greatest number of movies. In
-- case of a tie, return the lexicographically smaller user name.
-- Find the movie name with the highest average rating in February 2020. In
-- case of a tie, return the lexicographically smaller movie name.
-- 
-- 
-- The result format is in the following example.
-- 
-- 
-- Example 1:
-- 
-- 
-- Input: 
-- Movies table:
-- +-------------+--------------+
-- | movie_id    |  title       |
-- +-------------+--------------+
-- | 1           | Avengers     |
-- | 2           | Frozen 2     |
-- | 3           | Joker        |
-- +-------------+--------------+
-- Users table:
-- +-------------+--------------+
-- | user_id     |  name        |
-- +-------------+--------------+
-- | 1           | Daniel       |
-- | 2           | Monica       |
-- | 3           | Maria        |
-- | 4           | James        |
-- +-------------+--------------+
-- MovieRating table:
-- +-------------+--------------+--------------+-------------+
-- | movie_id    | user_id      | rating       | created_at  |
-- +-------------+--------------+--------------+-------------+
-- | 1           | 1            | 3            | 2020-01-12  |
-- | 1           | 2            | 4            | 2020-02-11  |
-- | 1           | 3            | 2            | 2020-02-12  |
-- | 1           | 4            | 1            | 2020-01-01  |
-- | 2           | 1            | 5            | 2020-02-17  | 
-- | 2           | 2            | 2            | 2020-02-01  | 
-- | 2           | 3            | 2            | 2020-03-01  |
-- | 3           | 1            | 3            | 2020-02-22  | 
-- | 3           | 2            | 4            | 2020-02-25  | 
-- +-------------+--------------+--------------+-------------+
-- Output: 
-- +--------------+
-- | results      |
-- +--------------+
-- | Daniel       |
-- | Frozen 2     |
-- +--------------+
-- Explanation: 
-- Daniel and Monica have rated 3 movies ("Avengers", "Frozen 2" and "Joker")
-- but Daniel is smaller lexicographically.
-- Frozen 2 and Joker have a rating average of 3.5 in February but Frozen 2 is
-- smaller lexicographically.
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below

with t1 as 
(
select user_id,count(distinct movie_id) as movieCt from movieRating R
group by user_id
),

t2 as 

(
    select movie_id,avg(rating) as avg_rt from movieRating 
    where substring(created_at,1,7)='2020-02'
    group by movie_id
)

select min(name) as results from users u
where user_id in
(
select user_id from  t1
where movieCt=(select max(movieCt) from t1)
)


union all

select min(title) as results from movies m
where movie_id in
(
select movie_id from  t2
where avg_rt=(select max(avg_rt) from t2)
)

-- @lc code=end

