--
-- @lc app=leetcode id=1280 lang=mysql
--
-- [1280] Students and Examinations
--
-- https://leetcode.com/problems/students-and-examinations/description/
--
-- database
-- Easy (61.04%)
-- Likes:    3011
-- Dislikes: 363
-- Total Accepted:    734K
-- Total Submissions: 1.2M
-- Testcase Example:  '{"headers":{"Students":["student_id","student_name"],"Subjects":["subject_name"],"Examinations":["student_id","subject_name"]},"rows":{"Students":[[1,"Alice"],[2,"Bob"],[13,"John"],[6,"Alex"]],"Subjects":[["Math"],["Physics"],["Programming"]],"Examinations":[[1,"Math"],[1,"Physics"],[1,"Programming"],[2,"Programming"],[1,"Physics"],[1,"Math"],[13,"Math"],[13,"Programming"],[13,"Physics"],[2,"Math"],[1,"Math"]]}}'
--
-- Table: Students
-- 
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | student_id    | int     |
-- | student_name  | varchar |
-- +---------------+---------+
-- student_id is the primary key (column with unique values) for this table.
-- Each row of this table contains the ID and the name of one student in the
-- school.
-- 
-- 
-- 
-- 
-- Table: Subjects
-- 
-- 
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | subject_name | varchar |
-- +--------------+---------+
-- subject_name is the primary key (column with unique values) for this table.
-- Each row of this table contains the name of one subject in the school.
-- 
-- 
-- 
-- 
-- Table: Examinations
-- 
-- 
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | student_id   | int     |
-- | subject_name | varchar |
-- +--------------+---------+
-- There is no primary key (column with unique values) for this table. It may
-- contain duplicates.
-- Each student from the Students table takes every course from the Subjects
-- table.
-- Each row of this table indicates that a student with ID student_id attended
-- the exam of subject_name.
-- 
-- 
-- 
-- 
-- Write a solution to find the number of times each student attended each
-- exam.
-- 
-- Return the result table ordered by student_id and subject_name.
-- 
-- The result format is in the following example.
-- 
-- 
-- Example 1:
-- 
-- 
-- Input: 
-- Students table:
-- +------------+--------------+
-- | student_id | student_name |
-- +------------+--------------+
-- | 1          | Alice        |
-- | 2          | Bob          |
-- | 13         | John         |
-- | 6          | Alex         |
-- +------------+--------------+
-- Subjects table:
-- +--------------+
-- | subject_name |
-- +--------------+
-- | Math         |
-- | Physics      |
-- | Programming  |
-- +--------------+
-- Examinations table:
-- +------------+--------------+
-- | student_id | subject_name |
-- +------------+--------------+
-- | 1          | Math         |
-- | 1          | Physics      |
-- | 1          | Programming  |
-- | 2          | Programming  |
-- | 1          | Physics      |
-- | 1          | Math         |
-- | 13         | Math         |
-- | 13         | Programming  |
-- | 13         | Physics      |
-- | 2          | Math         |
-- | 1          | Math         |
-- +------------+--------------+
-- Output: 
-- +------------+--------------+--------------+----------------+
-- | student_id | student_name | subject_name | attended_exams |
-- +------------+--------------+--------------+----------------+
-- | 1          | Alice        | Math         | 3              |
-- | 1          | Alice        | Physics      | 2              |
-- | 1          | Alice        | Programming  | 1              |
-- | 2          | Bob          | Math         | 1              |
-- | 2          | Bob          | Physics      | 0              |
-- | 2          | Bob          | Programming  | 1              |
-- | 6          | Alex         | Math         | 0              |
-- | 6          | Alex         | Physics      | 0              |
-- | 6          | Alex         | Programming  | 0              |
-- | 13         | John         | Math         | 1              |
-- | 13         | John         | Physics      | 1              |
-- | 13         | John         | Programming  | 1              |
-- +------------+--------------+--------------+----------------+
-- Explanation: 
-- The result table should contain all students and all subjects.
-- Alice attended the Math exam 3 times, the Physics exam 2 times, and the
-- Programming exam 1 time.
-- Bob attended the Math exam 1 time, the Programming exam 1 time, and did not
-- attend the Physics exam.
-- Alex did not attend any exams.
-- John attended the Math exam 1 time, the Physics exam 1 time, and the
-- Programming exam 1 time.
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below
select tbl3.student_id,student_name,tbl3.subject_name,ifNull(attended_exams,0) as attended_exams from 
(select student_id,student_name,subject_name 
from students tbl1
left join subjects tbl2
on subject_name is not null)tbl3
left join 
(select student_id,subject_name,count(*) as attended_exams from examinations group by student_id,subject_name )tbl4
on tbl3.student_id=tbl4.student_id
and tbl3.subject_name=tbl4.subject_name
where tbl3.subject_name is not null
order by student_id,subject_name




-- @lc code=end

