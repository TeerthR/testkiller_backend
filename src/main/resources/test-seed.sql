-- ============================================================
-- TestKiller Backend — Test Seed Data
-- ============================================================
-- Plain-text password for ALL users: Test@123
-- BCrypt hash below corresponds to "Test@123"
-- Run this AFTER Hibernate has created/updated the schema.
-- ============================================================

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE password_reset_tokens;
TRUNCATE TABLE exam_questions;
TRUNCATE TABLE exam_sections;
TRUNCATE TABLE exams;
TRUNCATE TABLE match_pairs;
TRUNCATE TABLE question_options;
TRUNCATE TABLE questions;
TRUNCATE TABLE batch_enrollments;
TRUNCATE TABLE batches;
TRUNCATE TABLE topics;
TRUNCATE TABLE subjects;
TRUNCATE TABLE courses;
TRUNCATE TABLE users;

SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================
-- 1. USERS  (1 super admin + 3 admins + 50 students = 54)
-- ============================================================

INSERT INTO users (id, role, first_name, last_name, email, password, mobile, gender, date_of_birth, profile_photo_url, is_active, email_verified, created_at, updated_at) VALUES
-- Super Admin
(1, 'SUPER_ADMIN', 'Teerth', 'Raj', 'superadmin@testkiller.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9000000001', 'MALE', '1995-01-15', NULL, true, true, NOW(), NULL),

-- Admins
(2, 'ADMIN', 'Priya', 'Sharma', 'priya.admin@testkiller.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9000000002', 'FEMALE', '1990-06-20', NULL, true, true, NOW(), NULL),
(3, 'ADMIN', 'Rahul', 'Verma', 'rahul.admin@testkiller.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9000000003', 'MALE', '1988-11-05', NULL, true, true, NOW(), NULL),
(4, 'ADMIN', 'Anjali', 'Gupta', 'anjali.admin@testkiller.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9000000004', 'FEMALE', '1992-03-10', NULL, true, true, NOW(), NULL),

-- Students (5–54)
(5, 'STUDENT', 'Aarav', 'Patel', 'aarav.patel@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000001', 'MALE', '2003-02-14', NULL, true, true, NOW(), NULL),
(6, 'STUDENT', 'Diya', 'Singh', 'diya.singh@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000002', 'FEMALE', '2002-07-22', NULL, true, true, NOW(), NULL),
(7, 'STUDENT', 'Vihaan', 'Kumar', 'vihaan.kumar@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000003', 'MALE', '2003-09-30', NULL, true, true, NOW(), NULL),
(8, 'STUDENT', 'Ananya', 'Reddy', 'ananya.reddy@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000004', 'FEMALE', '2001-12-05', NULL, true, true, NOW(), NULL),
(9, 'STUDENT', 'Arjun', 'Nair', 'arjun.nair@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000005', 'MALE', '2002-04-18', NULL, true, true, NOW(), NULL),
(10, 'STUDENT', 'Isha', 'Joshi', 'isha.joshi@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000006', 'FEMALE', '2003-01-25', NULL, true, true, NOW(), NULL),
(11, 'STUDENT', 'Kabir', 'Mehta', 'kabir.mehta@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000007', 'MALE', '2002-08-11', NULL, true, true, NOW(), NULL),
(12, 'STUDENT', 'Saanvi', 'Chopra', 'saanvi.chopra@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000008', 'FEMALE', '2003-05-03', NULL, true, true, NOW(), NULL),
(13, 'STUDENT', 'Reyansh', 'Saxena', 'reyansh.saxena@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000009', 'MALE', '2001-11-17', NULL, true, true, NOW(), NULL),
(14, 'STUDENT', 'Myra', 'Agarwal', 'myra.agarwal@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000010', 'FEMALE', '2002-06-29', NULL, true, true, NOW(), NULL),
(15, 'STUDENT', 'Advait', 'Desai', 'advait.desai@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000011', 'MALE', '2003-03-08', NULL, true, true, NOW(), NULL),
(16, 'STUDENT', 'Anika', 'Bhat', 'anika.bhat@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000012', 'FEMALE', '2002-10-14', NULL, true, true, NOW(), NULL),
(17, 'STUDENT', 'Vivaan', 'Malhotra', 'vivaan.malhotra@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000013', 'MALE', '2001-07-02', NULL, true, true, NOW(), NULL),
(18, 'STUDENT', 'Kiara', 'Thakur', 'kiara.thakur@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000014', 'FEMALE', '2003-08-19', NULL, true, true, NOW(), NULL),
(19, 'STUDENT', 'Dhruv', 'Rao', 'dhruv.rao@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000015', 'MALE', '2002-01-06', NULL, true, true, NOW(), NULL),
(20, 'STUDENT', 'Riya', 'Kapoor', 'riya.kapoor@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000016', 'FEMALE', '2003-04-27', NULL, true, true, NOW(), NULL),
(21, 'STUDENT', 'Arnav', 'Pandey', 'arnav.pandey@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000017', 'MALE', '2002-12-15', NULL, true, true, NOW(), NULL),
(22, 'STUDENT', 'Navya', 'Iyer', 'navya.iyer@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000018', 'FEMALE', '2001-09-08', NULL, true, true, NOW(), NULL),
(23, 'STUDENT', 'Shaurya', 'Bansal', 'shaurya.bansal@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000019', 'MALE', '2003-06-13', NULL, true, true, NOW(), NULL),
(24, 'STUDENT', 'Avni', 'Tiwari', 'avni.tiwari@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000020', 'FEMALE', '2002-02-28', NULL, true, true, NOW(), NULL),
(25, 'STUDENT', 'Krish', 'Dubey', 'krish.dubey@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000021', 'MALE', '2003-10-22', NULL, true, true, NOW(), NULL),
(26, 'STUDENT', 'Zara', 'Khan', 'zara.khan@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000022', 'FEMALE', '2001-05-16', NULL, true, true, NOW(), NULL),
(27, 'STUDENT', 'Atharv', 'Sinha', 'atharv.sinha@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000023', 'MALE', '2002-11-09', NULL, true, true, NOW(), NULL),
(28, 'STUDENT', 'Pari', 'Mishra', 'pari.mishra@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000024', 'FEMALE', '2003-07-04', NULL, true, true, NOW(), NULL),
(29, 'STUDENT', 'Rudra', 'Chauhan', 'rudra.chauhan@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000025', 'MALE', '2002-03-21', NULL, true, true, NOW(), NULL),
(30, 'STUDENT', 'Amaira', 'Rastogi', 'amaira.rastogi@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000026', 'FEMALE', '2001-08-30', NULL, true, true, NOW(), NULL),
(31, 'STUDENT', 'Yash', 'Bhatt', 'yash.bhatt@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000027', 'MALE', '2003-12-01', NULL, true, true, NOW(), NULL),
(32, 'STUDENT', 'Sia', 'Pillai', 'sia.pillai@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000028', 'FEMALE', '2002-05-19', NULL, true, true, NOW(), NULL),
(33, 'STUDENT', 'Agastya', 'Hegde', 'agastya.hegde@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000029', 'MALE', '2001-10-07', NULL, true, true, NOW(), NULL),
(34, 'STUDENT', 'Inaya', 'Das', 'inaya.das@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000030', 'FEMALE', '2003-04-11', NULL, true, true, NOW(), NULL),
(35, 'STUDENT', 'Ishaan', 'Menon', 'ishaan.menon@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000031', 'MALE', '2002-09-25', NULL, true, true, NOW(), NULL),
(36, 'STUDENT', 'Tara', 'Kulkarni', 'tara.kulkarni@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000032', 'FEMALE', '2001-06-14', NULL, true, true, NOW(), NULL),
(37, 'STUDENT', 'Neil', 'Bose', 'neil.bose@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000033', 'MALE', '2003-01-30', NULL, true, true, NOW(), NULL),
(38, 'STUDENT', 'Mira', 'Shetty', 'mira.shetty@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000034', 'FEMALE', '2002-08-03', NULL, true, true, NOW(), NULL),
(39, 'STUDENT', 'Rohan', 'Trivedi', 'rohan.trivedi@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000035', 'MALE', '2001-03-17', NULL, true, true, NOW(), NULL),
(40, 'STUDENT', 'Aadya', 'Deshpande', 'aadya.deshpande@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000036', 'FEMALE', '2003-11-28', NULL, true, true, NOW(), NULL),
(41, 'STUDENT', 'Lakshya', 'Sen', 'lakshya.sen@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000037', 'MALE', '2002-07-09', NULL, true, true, NOW(), NULL),
(42, 'STUDENT', 'Naina', 'Ghosh', 'naina.ghosh@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000038', 'FEMALE', '2001-04-23', NULL, true, true, NOW(), NULL),
(43, 'STUDENT', 'Parth', 'Choudhury', 'parth.choudhury@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000039', 'MALE', '2003-09-15', NULL, true, true, NOW(), NULL),
(44, 'STUDENT', 'Siya', 'Mukherjee', 'siya.mukherjee@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000040', 'FEMALE', '2002-12-06', NULL, true, true, NOW(), NULL),
(45, 'STUDENT', 'Om', 'Bajaj', 'om.bajaj@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000041', 'MALE', '2001-02-19', NULL, true, true, NOW(), NULL),
(46, 'STUDENT', 'Aadhya', 'Goyal', 'aadhya.goyal@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000042', 'FEMALE', '2003-06-07', NULL, true, true, NOW(), NULL),
(47, 'STUDENT', 'Darsh', 'Ahuja', 'darsh.ahuja@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000043', 'MALE', '2002-04-01', NULL, true, true, NOW(), NULL),
(48, 'STUDENT', 'Pihu', 'Srivastava', 'pihu.srivastava@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000044', 'FEMALE', '2001-10-30', NULL, true, true, NOW(), NULL),
(49, 'STUDENT', 'Ayaan', 'Rawat', 'ayaan.rawat@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000045', 'MALE', '2003-08-24', NULL, true, true, NOW(), NULL),
(50, 'STUDENT', 'Kyra', 'Arora', 'kyra.arora@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000046', 'FEMALE', '2002-01-12', NULL, true, true, NOW(), NULL),
(51, 'STUDENT', 'Aditya', 'Mahajan', 'aditya.mahajan@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000047', 'MALE', '2001-05-28', NULL, true, true, NOW(), NULL),
(52, 'STUDENT', 'Ahana', 'Sethi', 'ahana.sethi@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000048', 'FEMALE', '2003-02-09', NULL, true, true, NOW(), NULL),
(53, 'STUDENT', 'Ritvik', 'Bhardwaj', 'ritvik.bhardwaj@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000049', 'MALE', '2002-11-21', NULL, true, true, NOW(), NULL),
(54, 'STUDENT', 'Trisha', 'Garg', 'trisha.garg@gmail.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '9100000050', 'FEMALE', '2001-07-16', NULL, true, true, NOW(), NULL);


-- ============================================================
-- 2. COURSES (5)
-- ============================================================

INSERT INTO courses (id, name, description, duration_months, is_active, created_by, created_at, updated_at) VALUES
(1, 'JEE Main + Advanced', 'Complete preparation for JEE Main and Advanced covering Physics, Chemistry, and Mathematics', 24, true, 1, NOW(), NULL),
(2, 'NEET UG', 'Comprehensive NEET UG preparation for Biology, Physics, and Chemistry', 24, true, 1, NOW(), NULL),
(3, 'GATE Computer Science', 'GATE CS/IT exam preparation covering Data Structures, Algorithms, OS, DBMS, and more', 12, true, 2, NOW(), NULL),
(4, 'CAT MBA Entrance', 'CAT preparation covering Quantitative Aptitude, Verbal Ability, DILR, and Reading Comprehension', 12, true, 3, NOW(), NULL),
(5, 'UPSC Prelims', 'UPSC Civil Services Preliminary examination preparation', 18, true, 4, NOW(), NULL);


-- ============================================================
-- 3. SUBJECTS (15 — 3 per course)
-- ============================================================

INSERT INTO subjects (id, name, description, course_id, is_active, created_by, created_at, updated_at) VALUES
-- JEE
(1, 'Physics', 'Mechanics, Electrodynamics, Optics, Thermodynamics, Modern Physics', 1, true, 2, NOW(), NULL),
(2, 'Chemistry', 'Physical, Organic, and Inorganic Chemistry', 1, true, 2, NOW(), NULL),
(3, 'Mathematics', 'Algebra, Calculus, Coordinate Geometry, Trigonometry', 1, true, 2, NOW(), NULL),
-- NEET
(4, 'Biology', 'Botany and Zoology for NEET', 2, true, 3, NOW(), NULL),
(5, 'Physics (NEET)', 'Physics syllabus as per NEET pattern', 2, true, 3, NOW(), NULL),
(6, 'Chemistry (NEET)', 'Chemistry syllabus as per NEET pattern', 2, true, 3, NOW(), NULL),
-- GATE CS
(7, 'Data Structures & Algorithms', 'Arrays, Linked Lists, Trees, Graphs, Sorting, Searching, DP', 3, true, 2, NOW(), NULL),
(8, 'Operating Systems', 'Process management, Memory management, File systems, Scheduling', 3, true, 2, NOW(), NULL),
(9, 'Database Management Systems', 'ER Model, Normalization, SQL, Transactions, Indexing', 3, true, 2, NOW(), NULL),
-- CAT
(10, 'Quantitative Aptitude', 'Number Systems, Algebra, Geometry, Arithmetic, Combinatorics', 4, true, 3, NOW(), NULL),
(11, 'Verbal Ability & RC', 'Reading Comprehension, Grammar, Vocabulary, Para Jumbles', 4, true, 3, NOW(), NULL),
(12, 'DILR', 'Data Interpretation and Logical Reasoning', 4, true, 3, NOW(), NULL),
-- UPSC
(13, 'Indian Polity', 'Constitution, Governance, Panchayati Raj, Public Policy', 5, true, 4, NOW(), NULL),
(14, 'Geography', 'Physical, Human, Indian and World Geography', 5, true, 4, NOW(), NULL),
(15, 'Indian History', 'Ancient, Medieval, Modern India, Art and Culture', 5, true, 4, NOW(), NULL);


-- ============================================================
-- 4. TOPICS (30 — 2 per subject)
-- ============================================================

INSERT INTO topics (id, name, subject_id, created_at) VALUES
-- Physics (JEE)
(1, 'Newtonian Mechanics', 1, NOW()),
(2, 'Electromagnetism', 1, NOW()),
-- Chemistry (JEE)
(3, 'Chemical Bonding', 2, NOW()),
(4, 'Organic Reactions', 2, NOW()),
-- Mathematics (JEE)
(5, 'Differential Calculus', 3, NOW()),
(6, 'Coordinate Geometry', 3, NOW()),
-- Biology (NEET)
(7, 'Cell Biology', 4, NOW()),
(8, 'Genetics & Evolution', 4, NOW()),
-- Physics NEET
(9, 'Optics', 5, NOW()),
(10, 'Thermodynamics', 5, NOW()),
-- Chemistry NEET
(11, 'Chemical Equilibrium', 6, NOW()),
(12, 'Periodic Table', 6, NOW()),
-- DSA
(13, 'Trees & Graphs', 7, NOW()),
(14, 'Dynamic Programming', 7, NOW()),
-- OS
(15, 'Process Scheduling', 8, NOW()),
(16, 'Memory Management', 8, NOW()),
-- DBMS
(17, 'SQL & Normalization', 9, NOW()),
(18, 'Transaction Management', 9, NOW()),
-- QA
(19, 'Number Systems', 10, NOW()),
(20, 'Probability & Combinatorics', 10, NOW()),
-- Verbal
(21, 'Reading Comprehension', 11, NOW()),
(22, 'Para Jumbles & Completion', 11, NOW()),
-- DILR
(23, 'Data Interpretation', 12, NOW()),
(24, 'Logical Reasoning Puzzles', 12, NOW()),
-- Polity
(25, 'Fundamental Rights & DPSP', 13, NOW()),
(26, 'Union & State Legislature', 13, NOW()),
-- Geography
(27, 'Climatology', 14, NOW()),
(28, 'Indian Rivers & Drainage', 14, NOW()),
-- History
(29, 'Indian National Movement', 15, NOW()),
(30, 'Mughal Empire', 15, NOW());


-- ============================================================
-- 5. BATCHES (10)
-- ============================================================

INSERT INTO batches (id, name, start_date, end_date, capacity, is_active, course_id, faculty_id, created_by, created_at, updated_at) VALUES
(1, 'JEE 2026 Batch A', '2025-04-01', '2027-03-31', 60, true, 1, 2, 1, NOW(), NULL),
(2, 'JEE 2026 Batch B', '2025-07-01', '2027-06-30', 60, true, 1, 3, 1, NOW(), NULL),
(3, 'NEET 2026 Morning', '2025-05-01', '2027-04-30', 50, true, 2, 3, 1, NOW(), NULL),
(4, 'NEET 2026 Evening', '2025-05-01', '2027-04-30', 50, true, 2, 4, 1, NOW(), NULL),
(5, 'GATE CS 2026', '2025-06-01', '2026-05-31', 40, true, 3, 2, 1, NOW(), NULL),
(6, 'GATE CS 2027', '2026-06-01', '2027-05-31', 40, true, 3, 2, 1, NOW(), NULL),
(7, 'CAT 2026 Intensive', '2026-01-01', '2026-11-30', 35, true, 4, 3, 1, NOW(), NULL),
(8, 'CAT 2026 Weekend', '2026-01-15', '2026-11-30', 30, true, 4, 4, 1, NOW(), NULL),
(9, 'UPSC 2027 Foundation', '2025-08-01', '2027-05-31', 45, true, 5, 4, 1, NOW(), NULL),
(10, 'UPSC 2027 Crash Course', '2026-10-01', '2027-05-31', 25, true, 5, 4, 1, NOW(), NULL);


-- ============================================================
-- 6. BATCH ENROLLMENTS (100 — students spread across batches)
-- ============================================================

INSERT INTO batch_enrollments (id, batch_id, student_id, enrolled_at) VALUES
-- Batch 1: JEE A (10 students)
(1, 1, 5, NOW()), (2, 1, 6, NOW()), (3, 1, 7, NOW()), (4, 1, 8, NOW()), (5, 1, 9, NOW()),
(6, 1, 10, NOW()), (7, 1, 11, NOW()), (8, 1, 12, NOW()), (9, 1, 13, NOW()), (10, 1, 14, NOW()),
-- Batch 2: JEE B (10 students)
(11, 2, 15, NOW()), (12, 2, 16, NOW()), (13, 2, 17, NOW()), (14, 2, 18, NOW()), (15, 2, 19, NOW()),
(16, 2, 20, NOW()), (17, 2, 21, NOW()), (18, 2, 22, NOW()), (19, 2, 23, NOW()), (20, 2, 24, NOW()),
-- Batch 3: NEET Morning (10 students)
(21, 3, 25, NOW()), (22, 3, 26, NOW()), (23, 3, 27, NOW()), (24, 3, 28, NOW()), (25, 3, 29, NOW()),
(26, 3, 30, NOW()), (27, 3, 31, NOW()), (28, 3, 32, NOW()), (29, 3, 33, NOW()), (30, 3, 34, NOW()),
-- Batch 4: NEET Evening (10 students)
(31, 4, 35, NOW()), (32, 4, 36, NOW()), (33, 4, 37, NOW()), (34, 4, 38, NOW()), (35, 4, 39, NOW()),
(36, 4, 40, NOW()), (37, 4, 41, NOW()), (38, 4, 42, NOW()), (39, 4, 43, NOW()), (40, 4, 44, NOW()),
-- Batch 5: GATE CS 2026 (10 students)
(41, 5, 5, NOW()), (42, 5, 11, NOW()), (43, 5, 17, NOW()), (44, 5, 23, NOW()), (45, 5, 29, NOW()),
(46, 5, 35, NOW()), (47, 5, 41, NOW()), (48, 5, 45, NOW()), (49, 5, 46, NOW()), (50, 5, 47, NOW()),
-- Batch 6: GATE CS 2027 (10 students)
(51, 6, 48, NOW()), (52, 6, 49, NOW()), (53, 6, 50, NOW()), (54, 6, 51, NOW()), (55, 6, 52, NOW()),
(56, 6, 53, NOW()), (57, 6, 54, NOW()), (58, 6, 6, NOW()), (59, 6, 12, NOW()), (60, 6, 18, NOW()),
-- Batch 7: CAT Intensive (10 students)
(61, 7, 7, NOW()), (62, 7, 13, NOW()), (63, 7, 19, NOW()), (64, 7, 25, NOW()), (65, 7, 31, NOW()),
(66, 7, 37, NOW()), (67, 7, 43, NOW()), (68, 7, 49, NOW()), (69, 7, 8, NOW()), (70, 7, 14, NOW()),
-- Batch 8: CAT Weekend (10 students)
(71, 8, 20, NOW()), (72, 8, 26, NOW()), (73, 8, 32, NOW()), (74, 8, 38, NOW()), (75, 8, 44, NOW()),
(76, 8, 50, NOW()), (77, 8, 9, NOW()), (78, 8, 15, NOW()), (79, 8, 21, NOW()), (80, 8, 27, NOW()),
-- Batch 9: UPSC Foundation (10 students)
(81, 9, 10, NOW()), (82, 9, 16, NOW()), (83, 9, 22, NOW()), (84, 9, 28, NOW()), (85, 9, 34, NOW()),
(86, 9, 40, NOW()), (87, 9, 46, NOW()), (88, 9, 52, NOW()), (89, 9, 33, NOW()), (90, 9, 39, NOW()),
-- Batch 10: UPSC Crash (10 students)
(91, 10, 45, NOW()), (92, 10, 51, NOW()), (93, 10, 36, NOW()), (94, 10, 42, NOW()), (95, 10, 48, NOW()),
(96, 10, 54, NOW()), (97, 10, 30, NOW()), (98, 10, 24, NOW()), (99, 10, 47, NOW()), (100, 10, 53, NOW());


-- ============================================================
-- 7. QUESTIONS (200 — mix of types across subjects)
-- ============================================================
-- Using subjects 1-15 and topics 1-30
-- Types: SINGLE_CHOICE, MULTIPLE_CHOICE, TRUE_FALSE, FILL_IN_BLANK, NUMERICAL, MATCH_FOLLOWING

-- ---- Physics JEE (Q1-Q30) ----
INSERT INTO questions (id, type, question_text, question_image, audio_url, difficulty, marks, negative_marks, time_limit_sec, explanation, tags, is_active, created_by, subject_id, topic_id, created_at, updated_at) VALUES
(1, 'SINGLE_CHOICE', 'A body of mass 5 kg is moving with a velocity of 10 m/s. What is the kinetic energy?', NULL, NULL, 'EASY', 4.00, 1.00, 60, 'KE = 0.5 × m × v² = 0.5 × 5 × 100 = 250 J', 'mechanics,energy', true, 2, 1, 1, NOW(), NULL),
(2, 'SINGLE_CHOICE', 'Which of Newton''s laws defines inertia?', NULL, NULL, 'EASY', 4.00, 1.00, 45, 'Newton''s First Law is the law of inertia.', 'newton,laws', true, 2, 1, 1, NOW(), NULL),
(3, 'MULTIPLE_CHOICE', 'Which of the following are vector quantities?', NULL, NULL, 'MEDIUM', 4.00, 1.00, 60, 'Force, Velocity, and Acceleration are vectors. Speed is a scalar.', 'vectors,basics', true, 2, 1, 1, NOW(), NULL),
(4, 'NUMERICAL', 'A ball is thrown vertically upward with velocity 20 m/s. What is the maximum height reached? (g=10 m/s²)', NULL, NULL, 'MEDIUM', 4.00, 0.00, 90, 'h = v²/(2g) = 400/20 = 20 m', 'kinematics,projectile', true, 2, 1, 1, NOW(), NULL),
(5, 'TRUE_FALSE', 'The SI unit of force is Joule.', NULL, NULL, 'EASY', 2.00, 0.50, 30, 'The SI unit of force is Newton (N), not Joule.', 'units,basics', true, 2, 1, 1, NOW(), NULL),
(6, 'SINGLE_CHOICE', 'What is the electric field due to a point charge Q at distance r?', NULL, NULL, 'MEDIUM', 4.00, 1.00, 60, 'E = kQ/r² (Coulomb''s Law)', 'coulomb,electrostatics', true, 2, 1, 2, NOW(), NULL),
(7, 'SINGLE_CHOICE', 'Faraday''s law of electromagnetic induction relates to:', NULL, NULL, 'MEDIUM', 4.00, 1.00, 60, 'Faraday''s law states that a change in magnetic flux induces an EMF.', 'faraday,induction', true, 2, 1, 2, NOW(), NULL),
(8, 'MULTIPLE_CHOICE', 'Which of the following are units of magnetic field?', NULL, NULL, 'HARD', 4.00, 1.00, 60, 'Tesla and Gauss are both units of magnetic field.', 'magnetism,units', true, 2, 1, 2, NOW(), NULL),
(9, 'NUMERICAL', 'Calculate the capacitance of a parallel plate capacitor with plate area 0.01 m², separation 0.001 m, and vacuum between plates. (ε₀ = 8.85×10⁻¹² F/m) Give answer in pF.', NULL, NULL, 'HARD', 4.00, 0.00, 120, 'C = ε₀A/d = 8.85×10⁻¹² × 0.01 / 0.001 = 88.5 pF', 'capacitor,electrostatics', true, 2, 1, 2, NOW(), NULL),
(10, 'TRUE_FALSE', 'Electric field lines can form closed loops.', NULL, NULL, 'EASY', 2.00, 0.50, 30, 'Electric field lines never form closed loops; they start at positive charges and end at negative charges.', 'field-lines,electrostatics', true, 2, 1, 2, NOW(), NULL),

-- ---- Chemistry JEE (Q11-Q30) ----
(11, 'SINGLE_CHOICE', 'Which type of bond is formed between Na and Cl in NaCl?', NULL, NULL, 'EASY', 4.00, 1.00, 45, 'NaCl is formed by ionic bonding (transfer of electrons).', 'bonding,ionic', true, 2, 2, 3, NOW(), NULL),
(12, 'SINGLE_CHOICE', 'What is the hybridization of carbon in methane (CH₄)?', NULL, NULL, 'EASY', 4.00, 1.00, 45, 'Carbon in CH₄ is sp³ hybridized.', 'hybridization,organic', true, 2, 2, 3, NOW(), NULL),
(13, 'MULTIPLE_CHOICE', 'Which of the following molecules have a linear geometry?', NULL, NULL, 'MEDIUM', 4.00, 1.00, 60, 'CO₂ and BeCl₂ are linear. H₂O is bent.', 'geometry,vsepr', true, 2, 2, 3, NOW(), NULL),
(14, 'TRUE_FALSE', 'Sigma bonds are weaker than pi bonds.', NULL, NULL, 'EASY', 2.00, 0.50, 30, 'Sigma bonds are stronger than pi bonds due to head-on overlap.', 'bonding,sigma-pi', true, 2, 2, 3, NOW(), NULL),
(15, 'FILL_IN_BLANK', 'The IUPAC name of CH₃CH₂OH is _______.', NULL, NULL, 'EASY', 4.00, 0.00, 60, 'Ethanol', 'nomenclature,organic', true, 2, 2, 4, NOW(), NULL),
(16, 'SINGLE_CHOICE', 'Markownikoff''s rule is applicable to:', NULL, NULL, 'MEDIUM', 4.00, 1.00, 60, 'Markownikoff''s rule applies to addition of HX to unsymmetrical alkenes.', 'reactions,alkenes', true, 2, 2, 4, NOW(), NULL),
(17, 'SINGLE_CHOICE', 'Which reagent is used for the Grignard reaction?', NULL, NULL, 'MEDIUM', 4.00, 1.00, 60, 'RMgX (alkyl/aryl magnesium halide) in dry ether.', 'grignard,organometallic', true, 2, 2, 4, NOW(), NULL),
(18, 'MULTIPLE_CHOICE', 'Which of the following are electrophilic addition reactions?', NULL, NULL, 'HARD', 4.00, 1.00, 90, 'Addition of HBr and H₂O (acid-catalyzed) to alkenes are electrophilic additions.', 'reactions,mechanism', true, 2, 2, 4, NOW(), NULL),
(19, 'NUMERICAL', 'What is the molecular weight of H₂SO₄? (H=1, S=32, O=16)', NULL, NULL, 'EASY', 2.00, 0.00, 45, '2(1) + 32 + 4(16) = 98 g/mol', 'molecular-weight,basics', true, 2, 2, 3, NOW(), NULL),
(20, 'MATCH_FOLLOWING', 'Match the functional group with its class:', NULL, NULL, 'MEDIUM', 4.00, 0.00, 90, 'Matching functional groups to compound classes.', 'functional-groups,organic', true, 2, 2, 4, NOW(), NULL),

-- ---- Mathematics JEE (Q21-Q30) ----
(21, 'SINGLE_CHOICE', 'What is the derivative of sin(x)?', NULL, NULL, 'EASY', 4.00, 1.00, 30, 'd/dx [sin(x)] = cos(x)', 'derivatives,trigonometry', true, 2, 3, 5, NOW(), NULL),
(22, 'SINGLE_CHOICE', 'The integral of 1/x dx is:', NULL, NULL, 'EASY', 4.00, 1.00, 30, '∫(1/x)dx = ln|x| + C', 'integration,basics', true, 2, 3, 5, NOW(), NULL),
(23, 'NUMERICAL', 'Find the value of lim(x→0) sin(x)/x.', NULL, NULL, 'EASY', 4.00, 0.00, 45, 'This is a standard limit = 1', 'limits,standard', true, 2, 3, 5, NOW(), NULL),
(24, 'MULTIPLE_CHOICE', 'Which of the following functions are continuous at x=0?', NULL, NULL, 'MEDIUM', 4.00, 1.00, 60, 'Polynomials and sin(x) are continuous everywhere. |x|/x is discontinuous at 0.', 'continuity,functions', true, 2, 3, 5, NOW(), NULL),
(25, 'SINGLE_CHOICE', 'What is the equation of a circle with center (2,3) and radius 5?', NULL, NULL, 'EASY', 4.00, 1.00, 60, '(x-2)² + (y-3)² = 25', 'circle,conic', true, 2, 3, 6, NOW(), NULL),
(26, 'SINGLE_CHOICE', 'The eccentricity of a parabola is:', NULL, NULL, 'EASY', 4.00, 1.00, 30, 'The eccentricity of a parabola is always 1.', 'parabola,conic', true, 2, 3, 6, NOW(), NULL),
(27, 'NUMERICAL', 'Find the distance between points (1,2) and (4,6).', NULL, NULL, 'EASY', 2.00, 0.00, 45, 'd = √[(4-1)² + (6-2)²] = √[9+16] = √25 = 5', 'distance,coordinate', true, 2, 3, 6, NOW(), NULL),
(28, 'TRUE_FALSE', 'The slope of two perpendicular lines multiply to give -1.', NULL, NULL, 'EASY', 2.00, 0.50, 30, 'If m₁ × m₂ = -1, then the lines are perpendicular.', 'slope,lines', true, 2, 3, 6, NOW(), NULL),
(29, 'FILL_IN_BLANK', 'The area under the curve y = x² from x=0 to x=3 is _______.', NULL, NULL, 'MEDIUM', 4.00, 0.00, 90, '∫₀³ x² dx = [x³/3]₀³ = 27/3 = 9', 'integration,area', true, 2, 3, 5, NOW(), NULL),
(30, 'MATCH_FOLLOWING', 'Match the conic section with its eccentricity:', NULL, NULL, 'MEDIUM', 4.00, 0.00, 90, 'Circle=0, Parabola=1, Ellipse<1, Hyperbola>1', 'conics,eccentricity', true, 2, 3, 6, NOW(), NULL),

-- ---- Biology NEET (Q31-Q50) ----
(31, 'SINGLE_CHOICE', 'Which organelle is known as the powerhouse of the cell?', NULL, NULL, 'EASY', 4.00, 1.00, 30, 'Mitochondria is called the powerhouse of the cell.', 'cell,organelles', true, 3, 4, 7, NOW(), NULL),
(32, 'SINGLE_CHOICE', 'The cell membrane is primarily composed of:', NULL, NULL, 'EASY', 4.00, 1.00, 45, 'The cell membrane is primarily a phospholipid bilayer.', 'cell-membrane,structure', true, 3, 4, 7, NOW(), NULL),
(33, 'MULTIPLE_CHOICE', 'Which of the following are found in prokaryotic cells?', NULL, NULL, 'MEDIUM', 4.00, 1.00, 60, 'Ribosomes and cell wall are found in prokaryotes. Mitochondria and nucleus are absent.', 'prokaryote,cell', true, 3, 4, 7, NOW(), NULL),
(34, 'TRUE_FALSE', 'Lysosomes are involved in intracellular digestion.', NULL, NULL, 'EASY', 2.00, 0.50, 30, 'Lysosomes contain hydrolytic enzymes for intracellular digestion.', 'lysosomes,cell', true, 3, 4, 7, NOW(), NULL),
(35, 'SINGLE_CHOICE', 'Who is known as the father of genetics?', NULL, NULL, 'EASY', 4.00, 1.00, 30, 'Gregor Mendel is the father of genetics.', 'genetics,history', true, 3, 4, 8, NOW(), NULL),
(36, 'SINGLE_CHOICE', 'A cross between Tt and tt produces what ratio of tall to short plants?', NULL, NULL, 'MEDIUM', 4.00, 1.00, 60, 'Tt × tt = Tt, Tt, tt, tt → 1:1 ratio', 'mendelian,cross', true, 3, 4, 8, NOW(), NULL),
(37, 'NUMERICAL', 'In a dihybrid cross (RrYy × RrYy), how many phenotypic classes are expected in F2?', NULL, NULL, 'EASY', 2.00, 0.00, 45, '4 phenotypic classes in a 9:3:3:1 ratio', 'dihybrid,genetics', true, 3, 4, 8, NOW(), NULL),
(38, 'MULTIPLE_CHOICE', 'Which of the following are examples of co-dominance?', NULL, NULL, 'HARD', 4.00, 1.00, 60, 'AB blood group and sickle cell trait in heterozygotes are examples of co-dominance.', 'codominance,blood-group', true, 3, 4, 8, NOW(), NULL),
(39, 'FILL_IN_BLANK', 'The full form of DNA is _______.', NULL, NULL, 'EASY', 2.00, 0.00, 30, 'Deoxyribonucleic Acid', 'dna,basics', true, 3, 4, 8, NOW(), NULL),
(40, 'MATCH_FOLLOWING', 'Match the organelle with its function:', NULL, NULL, 'MEDIUM', 4.00, 0.00, 90, 'Matching organelles to their primary functions.', 'organelles,cell', true, 3, 4, 7, NOW(), NULL),

-- ---- Physics NEET (Q41-Q50) ----
(41, 'SINGLE_CHOICE', 'Which mirror is used by dentists to examine teeth?', NULL, NULL, 'EASY', 4.00, 1.00, 30, 'Concave mirrors are used by dentists as they produce magnified images.', 'mirrors,optics', true, 3, 5, 9, NOW(), NULL),
(42, 'SINGLE_CHOICE', 'Total internal reflection occurs when light travels from:', NULL, NULL, 'MEDIUM', 4.00, 1.00, 60, 'TIR occurs when light travels from a denser to a rarer medium.', 'refraction,tir', true, 3, 5, 9, NOW(), NULL),
(43, 'TRUE_FALSE', 'The speed of light is maximum in vacuum.', NULL, NULL, 'EASY', 2.00, 0.50, 30, 'Light travels fastest in vacuum (3×10⁸ m/s).', 'light,speed', true, 3, 5, 9, NOW(), NULL),
(44, 'NUMERICAL', 'A convex lens has focal length 20 cm. Find the power of the lens in diopters.', NULL, NULL, 'EASY', 4.00, 0.00, 45, 'P = 1/f = 1/0.20 = +5 D', 'lens,power', true, 3, 5, 9, NOW(), NULL),
(45, 'SINGLE_CHOICE', 'The first law of thermodynamics is a statement of:', NULL, NULL, 'EASY', 4.00, 1.00, 45, 'The first law of thermodynamics is conservation of energy.', 'thermo,first-law', true, 3, 5, 10, NOW(), NULL),
(46, 'SINGLE_CHOICE', 'In an adiabatic process:', NULL, NULL, 'MEDIUM', 4.00, 1.00, 60, 'In an adiabatic process, no heat is exchanged with the surroundings (Q=0).', 'adiabatic,thermo', true, 3, 5, 10, NOW(), NULL),
(47, 'MULTIPLE_CHOICE', 'Which of the following are state functions?', NULL, NULL, 'MEDIUM', 4.00, 1.00, 60, 'Internal energy, entropy, and enthalpy are state functions. Heat and work are path functions.', 'state-function,thermo', true, 3, 5, 10, NOW(), NULL),
(48, 'NUMERICAL', 'A Carnot engine operates between 500K and 300K. What is its efficiency in percentage?', NULL, NULL, 'MEDIUM', 4.00, 0.00, 60, 'η = 1 - T₂/T₁ = 1 - 300/500 = 0.4 = 40%', 'carnot,efficiency', true, 3, 5, 10, NOW(), NULL),
(49, 'TRUE_FALSE', 'Entropy of the universe always increases.', NULL, NULL, 'EASY', 2.00, 0.50, 30, 'Second law of thermodynamics — entropy of an isolated system never decreases.', 'entropy,second-law', true, 3, 5, 10, NOW(), NULL),
(50, 'FILL_IN_BLANK', 'The SI unit of entropy is _______.', NULL, NULL, 'EASY', 2.00, 0.00, 30, 'J/K (Joules per Kelvin)', 'entropy,units', true, 3, 5, 10, NOW(), NULL),

-- ---- Chemistry NEET (Q51-Q60) ----
(51, 'SINGLE_CHOICE', 'Le Chatelier''s principle is applicable to which type of reactions?', NULL, NULL, 'EASY', 4.00, 1.00, 45, 'Reversible reactions at equilibrium.', 'equilibrium,le-chatelier', true, 3, 6, 11, NOW(), NULL),
(52, 'SINGLE_CHOICE', 'The pH of a neutral solution at 25°C is:', NULL, NULL, 'EASY', 4.00, 1.00, 30, 'pH of neutral solution = 7 at 25°C', 'ph,basics', true, 3, 6, 11, NOW(), NULL),
(53, 'NUMERICAL', 'Calculate the pH of a 0.001 M HCl solution.', NULL, NULL, 'EASY', 4.00, 0.00, 45, 'pH = -log[H⁺] = -log(10⁻³) = 3', 'ph,calculation', true, 3, 6, 11, NOW(), NULL),
(54, 'MULTIPLE_CHOICE', 'Which factors affect the rate of a chemical reaction?', NULL, NULL, 'MEDIUM', 4.00, 1.00, 60, 'Temperature, concentration, catalyst, and surface area all affect reaction rate.', 'kinetics,factors', true, 3, 6, 11, NOW(), NULL),
(55, 'TRUE_FALSE', 'A catalyst changes the equilibrium constant of a reaction.', NULL, NULL, 'MEDIUM', 2.00, 0.50, 30, 'False. A catalyst speeds up attainment of equilibrium but does not change Keq.', 'catalyst,equilibrium', true, 3, 6, 11, NOW(), NULL),
(56, 'SINGLE_CHOICE', 'Which element has the highest electronegativity?', NULL, NULL, 'EASY', 4.00, 1.00, 30, 'Fluorine has the highest electronegativity (3.98 on Pauling scale).', 'electronegativity,periodic', true, 3, 6, 12, NOW(), NULL),
(57, 'SINGLE_CHOICE', 'Across a period in the periodic table, atomic radius generally:', NULL, NULL, 'EASY', 4.00, 1.00, 45, 'Atomic radius decreases across a period due to increasing nuclear charge.', 'periodic-trends,radius', true, 3, 6, 12, NOW(), NULL),
(58, 'MULTIPLE_CHOICE', 'Which of the following are noble gases?', NULL, NULL, 'EASY', 4.00, 1.00, 45, 'Helium, Neon, and Argon are noble gases.', 'noble-gas,periodic', true, 3, 6, 12, NOW(), NULL),
(59, 'MATCH_FOLLOWING', 'Match the element with its group in the periodic table:', NULL, NULL, 'MEDIUM', 4.00, 0.00, 90, 'Matching elements to their respective groups.', 'periodic,groups', true, 3, 6, 12, NOW(), NULL),
(60, 'FILL_IN_BLANK', 'The lightest element in the periodic table is _______.', NULL, NULL, 'EASY', 2.00, 0.00, 30, 'Hydrogen', 'periodic,basics', true, 3, 6, 12, NOW(), NULL),

-- ---- DSA / GATE (Q61-Q80) ----
(61, 'SINGLE_CHOICE', 'What is the time complexity of binary search?', NULL, NULL, 'EASY', 2.00, 0.67, 45, 'Binary search has O(log n) time complexity.', 'searching,complexity', true, 2, 7, 13, NOW(), NULL),
(62, 'SINGLE_CHOICE', 'Which data structure uses FIFO ordering?', NULL, NULL, 'EASY', 2.00, 0.67, 30, 'Queue uses First-In-First-Out ordering.', 'queue,basics', true, 2, 7, 13, NOW(), NULL),
(63, 'SINGLE_CHOICE', 'The worst-case time complexity of quicksort is:', NULL, NULL, 'MEDIUM', 2.00, 0.67, 45, 'Quicksort has O(n²) worst case (already sorted input with bad pivot).', 'sorting,quicksort', true, 2, 7, 13, NOW(), NULL),
(64, 'MULTIPLE_CHOICE', 'Which of the following are self-balancing BSTs?', NULL, NULL, 'MEDIUM', 2.00, 0.67, 60, 'AVL tree and Red-Black tree are self-balancing. Simple BST is not.', 'trees,balanced', true, 2, 7, 13, NOW(), NULL),
(65, 'NUMERICAL', 'What is the maximum number of nodes in a binary tree of height 4? (Root is at height 0)', NULL, NULL, 'EASY', 2.00, 0.00, 45, '2^(h+1) - 1 = 2^5 - 1 = 31', 'trees,properties', true, 2, 7, 13, NOW(), NULL),
(66, 'TRUE_FALSE', 'BFS uses a stack data structure.', NULL, NULL, 'EASY', 1.00, 0.33, 30, 'BFS uses a queue. DFS uses a stack.', 'graph,traversal', true, 2, 7, 13, NOW(), NULL),
(67, 'SINGLE_CHOICE', 'Dijkstra''s algorithm does NOT work with:', NULL, NULL, 'MEDIUM', 2.00, 0.67, 60, 'Dijkstra''s algorithm does not work with negative edge weights.', 'graph,shortest-path', true, 2, 7, 13, NOW(), NULL),
(68, 'FILL_IN_BLANK', 'The in-order traversal of a BST gives elements in _______ order.', NULL, NULL, 'EASY', 2.00, 0.00, 30, 'sorted (ascending)', 'bst,traversal', true, 2, 7, 13, NOW(), NULL),
(69, 'SINGLE_CHOICE', 'Which technique is used to solve the 0/1 Knapsack problem optimally?', NULL, NULL, 'MEDIUM', 2.00, 0.67, 60, 'Dynamic Programming is used for the 0/1 Knapsack problem.', 'dp,knapsack', true, 2, 7, 14, NOW(), NULL),
(70, 'SINGLE_CHOICE', 'The time complexity of the dynamic programming solution for the Fibonacci sequence is:', NULL, NULL, 'EASY', 2.00, 0.67, 45, 'DP Fibonacci is O(n) with memoization.', 'dp,fibonacci', true, 2, 7, 14, NOW(), NULL),
(71, 'NUMERICAL', 'What is the minimum number of coins needed to make change for 11 using coins {1, 5, 6}?', NULL, NULL, 'MEDIUM', 2.00, 0.00, 90, '11 = 6 + 5, so minimum is 2 coins.', 'dp,coin-change', true, 2, 7, 14, NOW(), NULL),
(72, 'MULTIPLE_CHOICE', 'Which of the following problems can be solved using dynamic programming?', NULL, NULL, 'MEDIUM', 2.00, 0.67, 60, 'LCS, Matrix Chain Multiplication, and Edit Distance all use DP.', 'dp,applications', true, 2, 7, 14, NOW(), NULL),
(73, 'TRUE_FALSE', 'Greedy algorithms always give the optimal solution for any problem.', NULL, NULL, 'EASY', 1.00, 0.33, 30, 'False. Greedy works only for problems with greedy-choice property.', 'greedy,theory', true, 2, 7, 14, NOW(), NULL),
(74, 'MATCH_FOLLOWING', 'Match the algorithm with its paradigm:', NULL, NULL, 'MEDIUM', 2.00, 0.00, 90, 'Matching algorithms to their design paradigm.', 'algorithms,paradigm', true, 2, 7, 14, NOW(), NULL),

-- ---- OS (Q75-Q80) ----
(75, 'SINGLE_CHOICE', 'Which scheduling algorithm may cause starvation?', NULL, NULL, 'MEDIUM', 2.00, 0.67, 60, 'Shortest Job First (SJF) can cause starvation of longer jobs.', 'scheduling,starvation', true, 2, 8, 15, NOW(), NULL),
(76, 'SINGLE_CHOICE', 'Round Robin scheduling is an example of:', NULL, NULL, 'EASY', 2.00, 0.67, 45, 'Round Robin is a preemptive scheduling algorithm.', 'scheduling,rr', true, 2, 8, 15, NOW(), NULL),
(77, 'TRUE_FALSE', 'A deadlock can occur if all four Coffman conditions are satisfied simultaneously.', NULL, NULL, 'EASY', 1.00, 0.33, 30, 'Yes, deadlock requires mutual exclusion, hold & wait, no preemption, and circular wait.', 'deadlock,coffman', true, 2, 8, 15, NOW(), NULL),
(78, 'SINGLE_CHOICE', 'Which page replacement algorithm is known as Belady''s optimal algorithm?', NULL, NULL, 'MEDIUM', 2.00, 0.67, 60, 'Optimal Page Replacement (OPT) replaces the page that will not be used for the longest time.', 'memory,paging', true, 2, 8, 16, NOW(), NULL),
(79, 'NUMERICAL', 'If a system has 3 frames and uses FIFO, how many page faults occur for the reference string: 1, 2, 3, 4, 1, 2, 5, 1, 2, 3?', NULL, NULL, 'HARD', 2.00, 0.00, 120, '9 page faults (this also demonstrates Belady''s anomaly).', 'paging,fifo', true, 2, 8, 16, NOW(), NULL),
(80, 'MULTIPLE_CHOICE', 'Which of the following are valid page replacement algorithms?', NULL, NULL, 'EASY', 2.00, 0.67, 45, 'FIFO, LRU, and Optimal are all valid page replacement algorithms.', 'paging,algorithms', true, 2, 8, 16, NOW(), NULL),

-- ---- DBMS (Q81-Q90) ----
(81, 'SINGLE_CHOICE', 'Which normal form eliminates transitive dependencies?', NULL, NULL, 'MEDIUM', 2.00, 0.67, 60, 'Third Normal Form (3NF) eliminates transitive dependencies.', 'normalization,3nf', true, 2, 9, 17, NOW(), NULL),
(82, 'SINGLE_CHOICE', 'Which SQL clause is used to filter groups?', NULL, NULL, 'EASY', 2.00, 0.67, 30, 'HAVING clause filters groups. WHERE filters rows.', 'sql,having', true, 2, 9, 17, NOW(), NULL),
(83, 'FILL_IN_BLANK', 'The full form of ACID in database transactions is _______.', NULL, NULL, 'EASY', 2.00, 0.00, 45, 'Atomicity, Consistency, Isolation, Durability', 'transactions,acid', true, 2, 9, 18, NOW(), NULL),
(84, 'TRUE_FALSE', 'A foreign key can have NULL values.', NULL, NULL, 'MEDIUM', 1.00, 0.33, 30, 'Yes, a foreign key can be NULL unless explicitly constrained with NOT NULL.', 'keys,foreign', true, 2, 9, 17, NOW(), NULL),
(85, 'SINGLE_CHOICE', 'Which isolation level prevents dirty reads but allows non-repeatable reads?', NULL, NULL, 'HARD', 2.00, 0.67, 60, 'READ COMMITTED prevents dirty reads but allows non-repeatable reads.', 'isolation,transactions', true, 2, 9, 18, NOW(), NULL),
(86, 'MULTIPLE_CHOICE', 'Which of the following are types of SQL joins?', NULL, NULL, 'EASY', 2.00, 0.67, 45, 'INNER, LEFT, RIGHT, and FULL OUTER are all types of SQL joins.', 'sql,joins', true, 2, 9, 17, NOW(), NULL),
(87, 'NUMERICAL', 'In a relation with attributes {A, B, C, D} and FDs {A→B, B→C, C→D}, what is the minimum number of candidate keys?', NULL, NULL, 'MEDIUM', 2.00, 0.00, 90, 'Only {A} is a candidate key since A→B→C→D (closure of A = ABCD).', 'normalization,keys', true, 2, 9, 17, NOW(), NULL),
(88, 'SINGLE_CHOICE', 'Two-phase locking ensures:', NULL, NULL, 'HARD', 2.00, 0.67, 60, 'Two-phase locking ensures serializability of transactions.', 'concurrency,2pl', true, 2, 9, 18, NOW(), NULL),
(89, 'TRUE_FALSE', 'A view in SQL stores data physically on disk.', NULL, NULL, 'EASY', 1.00, 0.33, 30, 'False. A view is a virtual table; it does not store data physically.', 'sql,views', true, 2, 9, 17, NOW(), NULL),
(90, 'MATCH_FOLLOWING', 'Match the normal form with what it eliminates:', NULL, NULL, 'MEDIUM', 2.00, 0.00, 90, 'Matching normal forms to the types of anomalies they resolve.', 'normalization,forms', true, 2, 9, 17, NOW(), NULL),

-- ---- CAT QA (Q91-Q110) ----
(91, 'SINGLE_CHOICE', 'What is the remainder when 2^100 is divided by 3?', NULL, NULL, 'MEDIUM', 3.00, 1.00, 60, '2^1=2, 2^2=1(mod3), pattern repeats: 2,1,2,1... 2^100 → remainder = 1', 'number-theory,remainder', true, 3, 10, 19, NOW(), NULL),
(92, 'SINGLE_CHOICE', 'HCF of 36 and 48 is:', NULL, NULL, 'EASY', 3.00, 1.00, 45, 'HCF(36,48) = 12', 'hcf-lcm,basics', true, 3, 10, 19, NOW(), NULL),
(93, 'NUMERICAL', 'If 15% of a number is 45, what is the number?', NULL, NULL, 'EASY', 3.00, 0.00, 30, '0.15 × x = 45, x = 300', 'percentage,basics', true, 3, 10, 19, NOW(), NULL),
(94, 'SINGLE_CHOICE', 'In how many ways can 5 people be seated around a circular table?', NULL, NULL, 'MEDIUM', 3.00, 1.00, 60, '(n-1)! = 4! = 24', 'pnc,circular', true, 3, 10, 20, NOW(), NULL),
(95, 'NUMERICAL', 'A bag has 3 red and 5 blue balls. What is the probability of drawing a red ball? (Give answer as a decimal)', NULL, NULL, 'EASY', 3.00, 0.00, 45, 'P(red) = 3/8 = 0.375', 'probability,basics', true, 3, 10, 20, NOW(), NULL),
(96, 'MULTIPLE_CHOICE', 'Which of the following numbers are prime?', NULL, NULL, 'EASY', 3.00, 1.00, 45, '17, 23, 29 are prime. 51 = 3×17.', 'number-theory,prime', true, 3, 10, 19, NOW(), NULL),
(97, 'TRUE_FALSE', 'The sum of first n natural numbers is n(n+1)/2.', NULL, NULL, 'EASY', 1.50, 0.50, 30, 'This is the standard formula for arithmetic series.', 'series,formula', true, 3, 10, 19, NOW(), NULL),
(98, 'FILL_IN_BLANK', 'The number of diagonals in a polygon with 8 sides is _______.', NULL, NULL, 'MEDIUM', 3.00, 0.00, 60, 'n(n-3)/2 = 8(5)/2 = 20', 'geometry,polygon', true, 3, 10, 20, NOW(), NULL),
(99, 'SINGLE_CHOICE', 'If a coin is tossed 3 times, what is the probability of getting exactly 2 heads?', NULL, NULL, 'MEDIUM', 3.00, 1.00, 60, 'P = C(3,2) × (1/2)³ = 3/8', 'probability,binomial', true, 3, 10, 20, NOW(), NULL),
(100, 'SINGLE_CHOICE', 'The LCM of 12, 15, and 20 is:', NULL, NULL, 'EASY', 3.00, 1.00, 45, 'LCM(12,15,20) = 60', 'hcf-lcm,basics', true, 3, 10, 19, NOW(), NULL),

-- ---- CAT Verbal (Q101-Q110) ----
(101, 'SINGLE_CHOICE', 'Choose the correct synonym of "Ubiquitous":', NULL, NULL, 'MEDIUM', 3.00, 1.00, 45, 'Ubiquitous means omnipresent or found everywhere.', 'vocabulary,synonyms', true, 3, 11, 21, NOW(), NULL),
(102, 'SINGLE_CHOICE', 'Identify the grammatically correct sentence:', NULL, NULL, 'MEDIUM', 3.00, 1.00, 60, 'Subject-verb agreement and proper tense usage check.', 'grammar,sentence', true, 3, 11, 21, NOW(), NULL),
(103, 'FILL_IN_BLANK', 'The antonym of "benevolent" is _______.', NULL, NULL, 'EASY', 3.00, 0.00, 30, 'Malevolent', 'vocabulary,antonyms', true, 3, 11, 21, NOW(), NULL),
(104, 'SINGLE_CHOICE', 'Which sentence uses the word "affect" correctly?', NULL, NULL, 'MEDIUM', 3.00, 1.00, 60, 'Affect is a verb meaning to influence.', 'grammar,usage', true, 3, 11, 21, NOW(), NULL),
(105, 'SINGLE_CHOICE', 'Choose the word that best fills the blank: "The professor''s explanation was so _____ that even beginners understood."', NULL, NULL, 'EASY', 3.00, 1.00, 45, 'Lucid means clear and easy to understand.', 'vocabulary,context', true, 3, 11, 21, NOW(), NULL),
(106, 'SINGLE_CHOICE', 'Arrange the following sentences in a logical order to form a coherent paragraph:', NULL, NULL, 'HARD', 3.00, 1.00, 120, 'Para jumbles require identifying the logical flow.', 'para-jumble,verbal', true, 3, 11, 22, NOW(), NULL),
(107, 'MULTIPLE_CHOICE', 'Which of the following are correctly punctuated?', NULL, NULL, 'MEDIUM', 3.00, 1.00, 60, 'Testing knowledge of comma, semicolon, and apostrophe usage.', 'grammar,punctuation', true, 3, 11, 22, NOW(), NULL),
(108, 'TRUE_FALSE', '"Their", "There", and "They''re" are all homophones.', NULL, NULL, 'EASY', 1.50, 0.50, 30, 'True. They sound the same but have different meanings and spellings.', 'grammar,homophones', true, 3, 11, 22, NOW(), NULL),
(109, 'SINGLE_CHOICE', 'What is the tone of the passage? (Assume a given passage with optimistic outlook)', NULL, NULL, 'MEDIUM', 3.00, 1.00, 90, 'Optimistic tone conveys hope and positivity.', 'rc,tone', true, 3, 11, 21, NOW(), NULL),
(110, 'FILL_IN_BLANK', 'A paragraph that starts with a topic sentence and provides supporting details uses _______ organization.', NULL, NULL, 'MEDIUM', 3.00, 0.00, 60, 'Deductive', 'writing,structure', true, 3, 11, 22, NOW(), NULL),

-- ---- CAT DILR (Q111-Q120) ----
(111, 'SINGLE_CHOICE', 'If the total revenue is ₹500 crore and the pie chart shows Segment A at 72°, what is Segment A''s revenue?', NULL, NULL, 'EASY', 3.00, 1.00, 60, '72/360 × 500 = ₹100 crore', 'di,pie-chart', true, 3, 12, 23, NOW(), NULL),
(112, 'NUMERICAL', 'A bar chart shows sales in Q1=150, Q2=200, Q3=180, Q4=270. What is the average quarterly sales?', NULL, NULL, 'EASY', 3.00, 0.00, 45, '(150+200+180+270)/4 = 200', 'di,bar-chart', true, 3, 12, 23, NOW(), NULL),
(113, 'SINGLE_CHOICE', 'If revenue grew by 20% from Year 1 to Year 2, and by 25% from Year 2 to Year 3, what is the overall growth from Year 1 to Year 3?', NULL, NULL, 'MEDIUM', 3.00, 1.00, 90, '1.20 × 1.25 = 1.50, so 50% growth', 'di,growth', true, 3, 12, 23, NOW(), NULL),
(114, 'SINGLE_CHOICE', 'In a group of 100 people, 60 like tea, 50 like coffee, and 30 like both. How many like neither?', NULL, NULL, 'MEDIUM', 3.00, 1.00, 60, 'n(A∪B) = 60+50-30 = 80. Neither = 100-80 = 20.', 'lr,sets', true, 3, 12, 24, NOW(), NULL),
(115, 'SINGLE_CHOICE', 'Five people A, B, C, D, E sit in a row. If A cannot sit next to B, how many arrangements are possible?', NULL, NULL, 'HARD', 3.00, 1.00, 120, 'Total = 5! = 120. A next to B = 2×4! = 48. Answer = 120-48 = 72.', 'lr,arrangement', true, 3, 12, 24, NOW(), NULL),
(116, 'NUMERICAL', 'If the ratio of boys to girls in a class is 3:2 and there are 30 boys, how many girls are there?', NULL, NULL, 'EASY', 3.00, 0.00, 30, '30/3 × 2 = 20 girls', 'di,ratio', true, 3, 12, 23, NOW(), NULL),
(117, 'TRUE_FALSE', 'If all roses are flowers and some flowers are red, then some roses are definitely red.', NULL, NULL, 'MEDIUM', 1.50, 0.50, 45, 'False. This is a syllogism fallacy. We cannot conclude this.', 'lr,syllogism', true, 3, 12, 24, NOW(), NULL),
(118, 'SINGLE_CHOICE', 'Which of the following conclusions can be drawn from: All cats are animals. Some animals are wild.', NULL, NULL, 'MEDIUM', 3.00, 1.00, 60, 'No definite conclusion about cats being wild can be drawn.', 'lr,syllogism', true, 3, 12, 24, NOW(), NULL),
(119, 'MULTIPLE_CHOICE', 'From a table showing 5-year sales data, which years showed year-on-year growth greater than 15%?', NULL, NULL, 'MEDIUM', 3.00, 1.00, 90, 'Calculate percentage change for each consecutive year pair.', 'di,table-analysis', true, 3, 12, 23, NOW(), NULL),
(120, 'FILL_IN_BLANK', 'In a line graph, the steepest slope between two data points indicates the _______ rate of change.', NULL, NULL, 'EASY', 3.00, 0.00, 30, 'highest (or greatest)', 'di,line-graph', true, 3, 12, 23, NOW(), NULL),

-- ---- UPSC Polity (Q121-Q140) ----
(121, 'SINGLE_CHOICE', 'Which Article of the Indian Constitution deals with the Right to Equality?', NULL, NULL, 'EASY', 2.00, 0.67, 45, 'Articles 14-18 deal with the Right to Equality.', 'fundamental-rights,equality', true, 4, 13, 25, NOW(), NULL),
(122, 'SINGLE_CHOICE', 'Right to Education was added as a fundamental right under which Article?', NULL, NULL, 'MEDIUM', 2.00, 0.67, 45, 'Article 21A (added by 86th Amendment, 2002)', 'fundamental-rights,education', true, 4, 13, 25, NOW(), NULL),
(123, 'MULTIPLE_CHOICE', 'Which of the following are Directive Principles of State Policy?', NULL, NULL, 'MEDIUM', 2.00, 0.67, 60, 'Uniform Civil Code, Free Legal Aid, Protection of Monuments are DPSPs.', 'dpsp,principles', true, 4, 13, 25, NOW(), NULL),
(124, 'TRUE_FALSE', 'Fundamental Rights can be suspended during a National Emergency.', NULL, NULL, 'EASY', 1.00, 0.33, 30, 'True. Under Article 358/359, certain FRs can be suspended during emergency.', 'emergency,fr', true, 4, 13, 25, NOW(), NULL),
(125, 'FILL_IN_BLANK', 'Article 21 guarantees the Right to _______.', NULL, NULL, 'EASY', 2.00, 0.00, 30, 'Life and Personal Liberty', 'fundamental-rights,article-21', true, 4, 13, 25, NOW(), NULL),
(126, 'SINGLE_CHOICE', 'The Rajya Sabha can have a maximum of how many members?', NULL, NULL, 'EASY', 2.00, 0.67, 30, '250 members (238 elected + 12 nominated)', 'parliament,rajya-sabha', true, 4, 13, 26, NOW(), NULL),
(127, 'SINGLE_CHOICE', 'A Money Bill can be introduced in:', NULL, NULL, 'EASY', 2.00, 0.67, 30, 'A Money Bill can only be introduced in the Lok Sabha.', 'parliament,money-bill', true, 4, 13, 26, NOW(), NULL),
(128, 'NUMERICAL', 'The minimum age to become a member of the Lok Sabha is:', NULL, NULL, 'EASY', 2.00, 0.00, 30, '25 years', 'parliament,eligibility', true, 4, 13, 26, NOW(), NULL),
(129, 'MULTIPLE_CHOICE', 'Which of the following are functions of the Lok Sabha Speaker?', NULL, NULL, 'MEDIUM', 2.00, 0.67, 60, 'Maintaining order, deciding on questions, casting vote in case of tie.', 'parliament,speaker', true, 4, 13, 26, NOW(), NULL),
(130, 'MATCH_FOLLOWING', 'Match the constitutional body with its article:', NULL, NULL, 'HARD', 2.00, 0.00, 120, 'Matching bodies like CAG, ECI, UPSC to their constitutional articles.', 'constitution,bodies', true, 4, 13, 26, NOW(), NULL),

-- ---- UPSC Geography (Q131-Q145) ----
(131, 'SINGLE_CHOICE', 'The Coriolis effect causes winds to deflect to the _____ in the Northern Hemisphere.', NULL, NULL, 'EASY', 2.00, 0.67, 45, 'Winds deflect to the right in the Northern Hemisphere.', 'winds,coriolis', true, 4, 14, 27, NOW(), NULL),
(132, 'SINGLE_CHOICE', 'Which layer of the atmosphere contains the ozone layer?', NULL, NULL, 'EASY', 2.00, 0.67, 30, 'The stratosphere contains the ozone layer.', 'atmosphere,ozone', true, 4, 14, 27, NOW(), NULL),
(133, 'MULTIPLE_CHOICE', 'Which of the following are warm ocean currents?', NULL, NULL, 'MEDIUM', 2.00, 0.67, 60, 'Gulf Stream and Kuroshio are warm currents. Labrador is cold.', 'currents,ocean', true, 4, 14, 27, NOW(), NULL),
(134, 'TRUE_FALSE', 'The Indian monsoon is caused by the differential heating of land and sea.', NULL, NULL, 'EASY', 1.00, 0.33, 30, 'True. Differential heating creates pressure differences driving the monsoon.', 'monsoon,india', true, 4, 14, 27, NOW(), NULL),
(135, 'NUMERICAL', 'The Tropic of Cancer passes through how many Indian states?', NULL, NULL, 'MEDIUM', 2.00, 0.00, 60, '8 states: Gujarat, Rajasthan, MP, Chhattisgarh, Jharkhand, WB, Tripura, Mizoram', 'india,geography', true, 4, 14, 27, NOW(), NULL),
(136, 'SINGLE_CHOICE', 'Which river is known as the "Sorrow of Bihar"?', NULL, NULL, 'EASY', 2.00, 0.67, 30, 'Kosi river is called the Sorrow of Bihar due to frequent floods.', 'rivers,india', true, 4, 14, 28, NOW(), NULL),
(137, 'SINGLE_CHOICE', 'The Brahmaputra river is known as _____ in Tibet.', NULL, NULL, 'MEDIUM', 2.00, 0.67, 45, 'Tsangpo', 'rivers,brahmaputra', true, 4, 14, 28, NOW(), NULL),
(138, 'MULTIPLE_CHOICE', 'Which of the following rivers originate in the Western Ghats?', NULL, NULL, 'MEDIUM', 2.00, 0.67, 60, 'Godavari, Krishna, and Kaveri originate in the Western Ghats.', 'rivers,western-ghats', true, 4, 14, 28, NOW(), NULL),
(139, 'FILL_IN_BLANK', 'The longest river in India is the _______.', NULL, NULL, 'EASY', 2.00, 0.00, 30, 'Ganga', 'rivers,india', true, 4, 14, 28, NOW(), NULL),
(140, 'MATCH_FOLLOWING', 'Match the river with its origin:', NULL, NULL, 'MEDIUM', 2.00, 0.00, 90, 'Matching major Indian rivers to their source locations.', 'rivers,origin', true, 4, 14, 28, NOW(), NULL),

-- ---- UPSC History (Q141-Q160) ----
(141, 'SINGLE_CHOICE', 'The Indian National Congress was founded in which year?', NULL, NULL, 'EASY', 2.00, 0.67, 30, 'INC was founded in 1885 by A.O. Hume.', 'inc,founding', true, 4, 15, 29, NOW(), NULL),
(142, 'SINGLE_CHOICE', 'Who gave the slogan "Do or Die"?', NULL, NULL, 'EASY', 2.00, 0.67, 30, 'Mahatma Gandhi during the Quit India Movement (1942).', 'gandhi,quit-india', true, 4, 15, 29, NOW(), NULL),
(143, 'SINGLE_CHOICE', 'The Jallianwala Bagh massacre took place in:', NULL, NULL, 'EASY', 2.00, 0.67, 30, 'April 13, 1919 in Amritsar.', 'massacre,amritsar', true, 4, 15, 29, NOW(), NULL),
(144, 'MULTIPLE_CHOICE', 'Which of the following movements were led by Mahatma Gandhi?', NULL, NULL, 'MEDIUM', 2.00, 0.67, 60, 'Non-Cooperation, Civil Disobedience, and Quit India were led by Gandhi.', 'gandhi,movements', true, 4, 15, 29, NOW(), NULL),
(145, 'TRUE_FALSE', 'The Partition of Bengal in 1905 was done by Lord Curzon.', NULL, NULL, 'EASY', 1.00, 0.33, 30, 'True. Lord Curzon partitioned Bengal in 1905.', 'partition,bengal', true, 4, 15, 29, NOW(), NULL),
(146, 'FILL_IN_BLANK', 'The first battle of Panipat was fought in the year _______.', NULL, NULL, 'EASY', 2.00, 0.00, 30, '1526', 'battles,panipat', true, 4, 15, 30, NOW(), NULL),
(147, 'SINGLE_CHOICE', 'Akbar founded a new religion called:', NULL, NULL, 'MEDIUM', 2.00, 0.67, 45, 'Din-i-Ilahi', 'akbar,religion', true, 4, 15, 30, NOW(), NULL),
(148, 'SINGLE_CHOICE', 'The Taj Mahal was built by which Mughal emperor?', NULL, NULL, 'EASY', 2.00, 0.67, 30, 'Shah Jahan built the Taj Mahal in memory of Mumtaz Mahal.', 'mughal,architecture', true, 4, 15, 30, NOW(), NULL),
(149, 'NUMERICAL', 'The Battle of Plassey was fought in which year?', NULL, NULL, 'EASY', 2.00, 0.00, 30, '1757', 'battles,plassey', true, 4, 15, 30, NOW(), NULL),
(150, 'MULTIPLE_CHOICE', 'Which of the following Mughal emperors are correctly paired with their contributions?', NULL, NULL, 'HARD', 2.00, 0.67, 90, 'Akbar-Mansabdari, Shah Jahan-Taj Mahal, Aurangzeb-Jizya reimposition.', 'mughal,contributions', true, 4, 15, 30, NOW(), NULL),

-- ---- Scalability Padding (Q151-Q200): Extra questions across subjects ----
(151, 'SINGLE_CHOICE', 'What is the SI unit of electric current?', NULL, NULL, 'EASY', 4.00, 1.00, 30, 'Ampere (A)', 'units,current', true, 2, 1, 2, NOW(), NULL),
(152, 'SINGLE_CHOICE', 'Ohm''s law states that V = ?', NULL, NULL, 'EASY', 4.00, 1.00, 30, 'V = IR', 'ohms-law,basics', true, 2, 1, 2, NOW(), NULL),
(153, 'NUMERICAL', 'If R = 10Ω and I = 3A, what is V?', NULL, NULL, 'EASY', 4.00, 0.00, 30, 'V = IR = 30V', 'ohms-law,numerical', true, 2, 1, 2, NOW(), NULL),
(154, 'TRUE_FALSE', 'In a series circuit, the current remains the same throughout.', NULL, NULL, 'EASY', 2.00, 0.50, 30, 'True. Current is constant in a series circuit.', 'circuits,series', true, 2, 1, 2, NOW(), NULL),
(155, 'SINGLE_CHOICE', 'What is the angle of incidence equal to?', NULL, NULL, 'EASY', 4.00, 1.00, 30, 'Angle of reflection (Law of Reflection)', 'optics,reflection', true, 3, 5, 9, NOW(), NULL),
(156, 'SINGLE_CHOICE', 'Which phenomenon explains the twinkling of stars?', NULL, NULL, 'EASY', 4.00, 1.00, 45, 'Atmospheric refraction', 'optics,refraction', true, 3, 5, 9, NOW(), NULL),
(157, 'SINGLE_CHOICE', 'The chemical formula of common salt is:', NULL, NULL, 'EASY', 4.00, 1.00, 30, 'NaCl', 'chemistry,basics', true, 2, 2, 3, NOW(), NULL),
(158, 'SINGLE_CHOICE', 'Which gas is most abundant in the Earth''s atmosphere?', NULL, NULL, 'EASY', 2.00, 0.67, 30, 'Nitrogen (78%)', 'atmosphere,composition', true, 4, 14, 27, NOW(), NULL),
(159, 'NUMERICAL', 'How many fundamental rights are guaranteed by the Indian Constitution?', NULL, NULL, 'EASY', 2.00, 0.00, 30, '6 (originally 7, Right to Property was removed)', 'polity,fr', true, 4, 13, 25, NOW(), NULL),
(160, 'SINGLE_CHOICE', 'The process by which plants make food using sunlight is called:', NULL, NULL, 'EASY', 4.00, 1.00, 30, 'Photosynthesis', 'biology,basics', true, 3, 4, 7, NOW(), NULL),
(161, 'SINGLE_CHOICE', 'Which vitamin is produced when skin is exposed to sunlight?', NULL, NULL, 'EASY', 4.00, 1.00, 30, 'Vitamin D', 'biology,vitamins', true, 3, 4, 7, NOW(), NULL),
(162, 'TRUE_FALSE', 'Red blood cells contain a nucleus in humans.', NULL, NULL, 'EASY', 2.00, 0.50, 30, 'False. Mature RBCs in humans are anucleate.', 'biology,rbc', true, 3, 4, 7, NOW(), NULL),
(163, 'SINGLE_CHOICE', 'The unit of frequency is:', NULL, NULL, 'EASY', 4.00, 1.00, 30, 'Hertz (Hz)', 'waves,units', true, 2, 1, 2, NOW(), NULL),
(164, 'NUMERICAL', 'If wavelength = 2m and speed = 340 m/s, what is the frequency?', NULL, NULL, 'EASY', 4.00, 0.00, 45, 'f = v/λ = 340/2 = 170 Hz', 'waves,numerical', true, 2, 1, 2, NOW(), NULL),
(165, 'SINGLE_CHOICE', 'Which data structure is used for recursion?', NULL, NULL, 'EASY', 2.00, 0.67, 30, 'Stack (call stack)', 'stack,recursion', true, 2, 7, 13, NOW(), NULL),
(166, 'SINGLE_CHOICE', 'The worst case time complexity of merge sort is:', NULL, NULL, 'EASY', 2.00, 0.67, 45, 'O(n log n)', 'sorting,mergesort', true, 2, 7, 13, NOW(), NULL),
(167, 'TRUE_FALSE', 'A complete binary tree with n nodes has a height of O(log n).', NULL, NULL, 'EASY', 1.00, 0.33, 30, 'True.', 'trees,height', true, 2, 7, 13, NOW(), NULL),
(168, 'SINGLE_CHOICE', 'Which traversal of a graph visits all vertices at the same depth before going deeper?', NULL, NULL, 'EASY', 2.00, 0.67, 30, 'BFS (Breadth-First Search)', 'graph,bfs', true, 2, 7, 13, NOW(), NULL),
(169, 'SINGLE_CHOICE', 'In SQL, which command is used to remove all rows from a table without logging individual row deletions?', NULL, NULL, 'EASY', 2.00, 0.67, 30, 'TRUNCATE', 'sql,commands', true, 2, 9, 17, NOW(), NULL),
(170, 'SINGLE_CHOICE', 'Which type of index is created by default on a primary key?', NULL, NULL, 'EASY', 2.00, 0.67, 45, 'Clustered index', 'indexing,primary-key', true, 2, 9, 17, NOW(), NULL),
(171, 'SINGLE_CHOICE', 'The Preamble of the Indian Constitution begins with:', NULL, NULL, 'EASY', 2.00, 0.67, 30, '"We, the People of India"', 'constitution,preamble', true, 4, 13, 25, NOW(), NULL),
(172, 'SINGLE_CHOICE', 'Who is known as the Father of the Indian Constitution?', NULL, NULL, 'EASY', 2.00, 0.67, 30, 'Dr. B.R. Ambedkar', 'constitution,history', true, 4, 13, 25, NOW(), NULL),
(173, 'NUMERICAL', 'The Indian Constitution was adopted on which date? (Give day of month only)', NULL, NULL, 'EASY', 2.00, 0.00, 30, '26 (November 26, 1949)', 'constitution,date', true, 4, 13, 25, NOW(), NULL),
(174, 'SINGLE_CHOICE', 'Which amendment is known as the Mini Constitution?', NULL, NULL, 'HARD', 2.00, 0.67, 60, '42nd Amendment (1976)', 'amendment,42nd', true, 4, 13, 26, NOW(), NULL),
(175, 'SINGLE_CHOICE', 'The Swadeshi Movement was associated with:', NULL, NULL, 'EASY', 2.00, 0.67, 45, 'Partition of Bengal (1905)', 'movement,swadeshi', true, 4, 15, 29, NOW(), NULL),
(176, 'SINGLE_CHOICE', 'Who was the first Governor-General of independent India?', NULL, NULL, 'EASY', 2.00, 0.67, 30, 'Lord Mountbatten', 'independence,governor', true, 4, 15, 29, NOW(), NULL),
(177, 'FILL_IN_BLANK', 'The Rowlatt Act was passed in the year _______.', NULL, NULL, 'MEDIUM', 2.00, 0.00, 45, '1919', 'act,rowlatt', true, 4, 15, 29, NOW(), NULL),
(178, 'SINGLE_CHOICE', 'Which protocol ensures reliable data transfer in the transport layer?', NULL, NULL, 'EASY', 2.00, 0.67, 30, 'TCP (Transmission Control Protocol)', 'networking,tcp', true, 2, 8, 15, NOW(), NULL),
(179, 'TRUE_FALSE', 'Context switching is the process of saving and restoring the state of a process.', NULL, NULL, 'EASY', 1.00, 0.33, 30, 'True.', 'os,context-switch', true, 2, 8, 15, NOW(), NULL),
(180, 'SINGLE_CHOICE', 'Thrashing occurs when:', NULL, NULL, 'MEDIUM', 2.00, 0.67, 60, 'A system spends more time paging than executing processes.', 'memory,thrashing', true, 2, 8, 16, NOW(), NULL),
(181, 'SINGLE_CHOICE', 'What is the conjugate base of H₂O?', NULL, NULL, 'MEDIUM', 4.00, 1.00, 45, 'OH⁻', 'acid-base,conjugate', true, 2, 2, 3, NOW(), NULL),
(182, 'SINGLE_CHOICE', 'Which type of isomerism is shown by CH₃CH₂OH and CH₃OCH₃?', NULL, NULL, 'MEDIUM', 4.00, 1.00, 60, 'Functional group isomerism', 'isomerism,organic', true, 2, 2, 4, NOW(), NULL),
(183, 'NUMERICAL', 'How many sigma bonds are present in ethane (C₂H₆)?', NULL, NULL, 'EASY', 4.00, 0.00, 30, '7 (1 C-C + 6 C-H)', 'bonding,sigma', true, 2, 2, 3, NOW(), NULL),
(184, 'SINGLE_CHOICE', 'The Krebs cycle takes place in:', NULL, NULL, 'EASY', 4.00, 1.00, 30, 'Mitochondrial matrix', 'metabolism,krebs', true, 3, 4, 7, NOW(), NULL),
(185, 'SINGLE_CHOICE', 'Which blood group is known as the universal donor?', NULL, NULL, 'EASY', 4.00, 1.00, 30, 'O negative', 'blood,transfusion', true, 3, 4, 8, NOW(), NULL),
(186, 'TRUE_FALSE', 'DNA replication is semi-conservative.', NULL, NULL, 'EASY', 2.00, 0.50, 30, 'True. Meselson-Stahl experiment proved this.', 'dna,replication', true, 3, 4, 8, NOW(), NULL),
(187, 'SINGLE_CHOICE', 'In Young''s double slit experiment, increasing the slit separation will:', NULL, NULL, 'MEDIUM', 4.00, 1.00, 60, 'Decrease the fringe width (β = λD/d)', 'optics,interference', true, 2, 1, 2, NOW(), NULL),
(188, 'SINGLE_CHOICE', 'The moment of inertia of a solid sphere about its diameter is:', NULL, NULL, 'MEDIUM', 4.00, 1.00, 60, '(2/5)MR²', 'rotational,moi', true, 2, 1, 1, NOW(), NULL),
(189, 'NUMERICAL', 'A pendulum has length 1m. What is its time period on Earth? (g=10, π²=10)', NULL, NULL, 'EASY', 4.00, 0.00, 60, 'T = 2π√(l/g) = 2π√(1/10) = 2π/√10 ≈ 2 seconds', 'shm,pendulum', true, 2, 1, 1, NOW(), NULL),
(190, 'SINGLE_CHOICE', 'The number of edges in a complete graph with n vertices is:', NULL, NULL, 'EASY', 2.00, 0.67, 45, 'n(n-1)/2', 'graph,complete', true, 2, 7, 13, NOW(), NULL),
(191, 'SINGLE_CHOICE', 'Which of the following sorting algorithms is NOT comparison-based?', NULL, NULL, 'MEDIUM', 2.00, 0.67, 60, 'Counting Sort', 'sorting,non-comparison', true, 2, 7, 13, NOW(), NULL),
(192, 'SINGLE_CHOICE', 'The amortized time complexity of insertion in a dynamic array is:', NULL, NULL, 'MEDIUM', 2.00, 0.67, 60, 'O(1)', 'array,amortized', true, 2, 7, 13, NOW(), NULL),
(193, 'FILL_IN_BLANK', 'The _______ property of transactions ensures that either all operations succeed or none do.', NULL, NULL, 'EASY', 2.00, 0.00, 30, 'Atomicity', 'transactions,atomicity', true, 2, 9, 18, NOW(), NULL),
(194, 'SINGLE_CHOICE', 'BCNF is stricter than:', NULL, NULL, 'EASY', 2.00, 0.67, 30, '3NF', 'normalization,bcnf', true, 2, 9, 17, NOW(), NULL),
(195, 'SINGLE_CHOICE', 'A simple interest of ₹200 is earned on ₹1000 in 2 years. What is the rate?', NULL, NULL, 'EASY', 3.00, 1.00, 45, 'SI = PRT/100, 200 = 1000×R×2/100, R = 10%', 'interest,simple', true, 3, 10, 19, NOW(), NULL),
(196, 'NUMERICAL', 'If a train 200m long crosses a pole in 10 seconds, what is its speed in km/h?', NULL, NULL, 'EASY', 3.00, 0.00, 45, 'Speed = 200/10 = 20 m/s = 72 km/h', 'speed,trains', true, 3, 10, 19, NOW(), NULL),
(197, 'SINGLE_CHOICE', 'The Simon Commission visited India in:', NULL, NULL, 'EASY', 2.00, 0.67, 30, '1928', 'commission,simon', true, 4, 15, 29, NOW(), NULL),
(198, 'SINGLE_CHOICE', 'Mansabdari system was introduced by:', NULL, NULL, 'EASY', 2.00, 0.67, 30, 'Akbar', 'mughal,mansabdari', true, 4, 15, 30, NOW(), NULL),
(199, 'TRUE_FALSE', 'The Quit India Movement was launched in 1942.', NULL, NULL, 'EASY', 1.00, 0.33, 30, 'True. Launched on August 8, 1942.', 'quit-india,movement', true, 4, 15, 29, NOW(), NULL),
(200, 'SINGLE_CHOICE', 'The Indian Constitution came into effect on:', NULL, NULL, 'EASY', 2.00, 0.67, 30, 'January 26, 1950', 'constitution,republic-day', true, 4, 13, 25, NOW(), NULL);


-- ============================================================
-- 8. QUESTION OPTIONS (for SINGLE_CHOICE, MULTIPLE_CHOICE, TRUE_FALSE)
-- ============================================================
-- Only creating options for a representative set of questions.

INSERT INTO question_options (id, question_id, option_label, option_text, option_image, is_correct, display_order) VALUES
-- Q1: Kinetic Energy (SINGLE_CHOICE)
(1, 1, 'A', '250 J', NULL, true, 0),
(2, 1, 'B', '500 J', NULL, false, 1),
(3, 1, 'C', '100 J', NULL, false, 2),
(4, 1, 'D', '50 J', NULL, false, 3),

-- Q2: Newton's Law of Inertia (SINGLE_CHOICE)
(5, 2, 'A', 'First Law', NULL, true, 0),
(6, 2, 'B', 'Second Law', NULL, false, 1),
(7, 2, 'C', 'Third Law', NULL, false, 2),
(8, 2, 'D', 'Law of Gravitation', NULL, false, 3),

-- Q3: Vector Quantities (MULTIPLE_CHOICE)
(9, 3, 'A', 'Force', NULL, true, 0),
(10, 3, 'B', 'Speed', NULL, false, 1),
(11, 3, 'C', 'Velocity', NULL, true, 2),
(12, 3, 'D', 'Acceleration', NULL, true, 3),

-- Q5: SI unit of force (TRUE_FALSE)
(13, 5, 'A', 'True', NULL, false, 0),
(14, 5, 'B', 'False', NULL, true, 1),

-- Q6: Electric field (SINGLE_CHOICE)
(15, 6, 'A', 'E = kQ/r²', NULL, true, 0),
(16, 6, 'B', 'E = kQ/r', NULL, false, 1),
(17, 6, 'C', 'E = kQ²/r', NULL, false, 2),
(18, 6, 'D', 'E = kQ²/r²', NULL, false, 3),

-- Q7: Faraday's Law (SINGLE_CHOICE)
(19, 7, 'A', 'Electromagnetic induction', NULL, true, 0),
(20, 7, 'B', 'Electrostatics', NULL, false, 1),
(21, 7, 'C', 'Magnetostatics', NULL, false, 2),
(22, 7, 'D', 'Thermodynamics', NULL, false, 3),

-- Q8: Magnetic field units (MULTIPLE_CHOICE)
(23, 8, 'A', 'Tesla', NULL, true, 0),
(24, 8, 'B', 'Gauss', NULL, true, 1),
(25, 8, 'C', 'Newton', NULL, false, 2),
(26, 8, 'D', 'Pascal', NULL, false, 3),

-- Q10: Electric field lines (TRUE_FALSE)
(27, 10, 'A', 'True', NULL, false, 0),
(28, 10, 'B', 'False', NULL, true, 1),

-- Q11: NaCl bond (SINGLE_CHOICE)
(29, 11, 'A', 'Ionic', NULL, true, 0),
(30, 11, 'B', 'Covalent', NULL, false, 1),
(31, 11, 'C', 'Metallic', NULL, false, 2),
(32, 11, 'D', 'Hydrogen', NULL, false, 3),

-- Q12: CH4 hybridization (SINGLE_CHOICE)
(33, 12, 'A', 'sp³', NULL, true, 0),
(34, 12, 'B', 'sp²', NULL, false, 1),
(35, 12, 'C', 'sp', NULL, false, 2),
(36, 12, 'D', 'sp³d', NULL, false, 3),

-- Q13: Linear geometry (MULTIPLE_CHOICE)
(37, 13, 'A', 'CO₂', NULL, true, 0),
(38, 13, 'B', 'H₂O', NULL, false, 1),
(39, 13, 'C', 'BeCl₂', NULL, true, 2),
(40, 13, 'D', 'NH₃', NULL, false, 3),

-- Q14: Sigma vs Pi (TRUE_FALSE)
(41, 14, 'A', 'True', NULL, false, 0),
(42, 14, 'B', 'False', NULL, true, 1),

-- Q16: Markownikoff (SINGLE_CHOICE)
(43, 16, 'A', 'Addition of HX to unsymmetrical alkenes', NULL, true, 0),
(44, 16, 'B', 'Elimination reactions', NULL, false, 1),
(45, 16, 'C', 'Substitution in benzene', NULL, false, 2),
(46, 16, 'D', 'Polymerization', NULL, false, 3),

-- Q17: Grignard Reagent (SINGLE_CHOICE)
(47, 17, 'A', 'RMgX in dry ether', NULL, true, 0),
(48, 17, 'B', 'RLi in THF', NULL, false, 1),
(49, 17, 'C', 'RCuLi', NULL, false, 2),
(50, 17, 'D', 'RZnX', NULL, false, 3),

-- Q18: Electrophilic addition (MULTIPLE_CHOICE)
(51, 18, 'A', 'Addition of HBr to propene', NULL, true, 0),
(52, 18, 'B', 'Ozonolysis', NULL, false, 1),
(53, 18, 'C', 'Acid-catalyzed hydration of alkene', NULL, true, 2),
(54, 18, 'D', 'Free radical polymerization', NULL, false, 3),

-- Q21: Derivative of sin(x) (SINGLE_CHOICE)
(55, 21, 'A', 'cos(x)', NULL, true, 0),
(56, 21, 'B', '-cos(x)', NULL, false, 1),
(57, 21, 'C', 'sin(x)', NULL, false, 2),
(58, 21, 'D', '-sin(x)', NULL, false, 3),

-- Q22: Integral of 1/x (SINGLE_CHOICE)
(59, 22, 'A', 'ln|x| + C', NULL, true, 0),
(60, 22, 'B', 'x + C', NULL, false, 1),
(61, 22, 'C', '1/x² + C', NULL, false, 2),
(62, 22, 'D', 'e^x + C', NULL, false, 3),

-- Q24: Continuity (MULTIPLE_CHOICE)
(63, 24, 'A', 'x² + 3x + 1', NULL, true, 0),
(64, 24, 'B', 'sin(x)', NULL, true, 1),
(65, 24, 'C', '|x|/x', NULL, false, 2),
(66, 24, 'D', '1/x', NULL, false, 3),

-- Q25: Circle equation (SINGLE_CHOICE)
(67, 25, 'A', '(x-2)² + (y-3)² = 25', NULL, true, 0),
(68, 25, 'B', '(x+2)² + (y+3)² = 25', NULL, false, 1),
(69, 25, 'C', '(x-2)² + (y-3)² = 5', NULL, false, 2),
(70, 25, 'D', 'x² + y² = 25', NULL, false, 3),

-- Q26: Parabola eccentricity (SINGLE_CHOICE)
(71, 26, 'A', '1', NULL, true, 0),
(72, 26, 'B', '0', NULL, false, 1),
(73, 26, 'C', '0.5', NULL, false, 2),
(74, 26, 'D', '2', NULL, false, 3),

-- Q28: Perpendicular slopes (TRUE_FALSE)
(75, 28, 'A', 'True', NULL, true, 0),
(76, 28, 'B', 'False', NULL, false, 1),

-- Q31: Powerhouse (SINGLE_CHOICE)
(77, 31, 'A', 'Mitochondria', NULL, true, 0),
(78, 31, 'B', 'Nucleus', NULL, false, 1),
(79, 31, 'C', 'Golgi apparatus', NULL, false, 2),
(80, 31, 'D', 'Ribosome', NULL, false, 3),

-- Q32: Cell membrane (SINGLE_CHOICE)
(81, 32, 'A', 'Phospholipid bilayer', NULL, true, 0),
(82, 32, 'B', 'Cellulose', NULL, false, 1),
(83, 32, 'C', 'Chitin', NULL, false, 2),
(84, 32, 'D', 'Peptidoglycan', NULL, false, 3),

-- Q33: Prokaryotes (MULTIPLE_CHOICE)
(85, 33, 'A', 'Ribosomes', NULL, true, 0),
(86, 33, 'B', 'Mitochondria', NULL, false, 1),
(87, 33, 'C', 'Cell wall', NULL, true, 2),
(88, 33, 'D', 'Nucleus', NULL, false, 3),

-- Q34: Lysosomes (TRUE_FALSE)
(89, 34, 'A', 'True', NULL, true, 0),
(90, 34, 'B', 'False', NULL, false, 1),

-- Q35: Father of genetics (SINGLE_CHOICE)
(91, 35, 'A', 'Gregor Mendel', NULL, true, 0),
(92, 35, 'B', 'Charles Darwin', NULL, false, 1),
(93, 35, 'C', 'Watson & Crick', NULL, false, 2),
(94, 35, 'D', 'Louis Pasteur', NULL, false, 3),

-- Q36: Tt x tt cross (SINGLE_CHOICE)
(95, 36, 'A', '1:1', NULL, true, 0),
(96, 36, 'B', '3:1', NULL, false, 1),
(97, 36, 'C', '1:3', NULL, false, 2),
(98, 36, 'D', '1:2:1', NULL, false, 3),

-- Q38: Co-dominance (MULTIPLE_CHOICE)
(99, 38, 'A', 'AB blood group', NULL, true, 0),
(100, 38, 'B', 'Sickle cell trait in heterozygotes', NULL, true, 1),
(101, 38, 'C', 'Flower color in snapdragons', NULL, false, 2),
(102, 38, 'D', 'Tall vs dwarf pea plants', NULL, false, 3),

-- Q41-Q49 (NEET Physics — representative options)
(103, 41, 'A', 'Concave mirror', NULL, true, 0),
(104, 41, 'B', 'Convex mirror', NULL, false, 1),
(105, 41, 'C', 'Plane mirror', NULL, false, 2),
(106, 41, 'D', 'Convex lens', NULL, false, 3),

(107, 42, 'A', 'Denser to rarer medium', NULL, true, 0),
(108, 42, 'B', 'Rarer to denser medium', NULL, false, 1),
(109, 42, 'C', 'Same medium', NULL, false, 2),
(110, 42, 'D', 'Vacuum only', NULL, false, 3),

(111, 43, 'A', 'True', NULL, true, 0),
(112, 43, 'B', 'False', NULL, false, 1),

(113, 45, 'A', 'Conservation of energy', NULL, true, 0),
(114, 45, 'B', 'Conservation of momentum', NULL, false, 1),
(115, 45, 'C', 'Conservation of mass', NULL, false, 2),
(116, 45, 'D', 'Conservation of charge', NULL, false, 3),

(117, 46, 'A', 'No heat is exchanged', NULL, true, 0),
(118, 46, 'B', 'Temperature remains constant', NULL, false, 1),
(119, 46, 'C', 'Volume remains constant', NULL, false, 2),
(120, 46, 'D', 'Pressure remains constant', NULL, false, 3),

(121, 47, 'A', 'Internal energy', NULL, true, 0),
(122, 47, 'B', 'Heat', NULL, false, 1),
(123, 47, 'C', 'Entropy', NULL, true, 2),
(124, 47, 'D', 'Work', NULL, false, 3),

(125, 49, 'A', 'True', NULL, true, 0),
(126, 49, 'B', 'False', NULL, false, 1),

-- Q51-Q58 (Chemistry NEET — representative options)
(127, 51, 'A', 'Reversible reactions at equilibrium', NULL, true, 0),
(128, 51, 'B', 'Irreversible reactions only', NULL, false, 1),
(129, 51, 'C', 'Nuclear reactions', NULL, false, 2),
(130, 51, 'D', 'Photochemical reactions', NULL, false, 3),

(131, 52, 'A', '7', NULL, true, 0),
(132, 52, 'B', '0', NULL, false, 1),
(133, 52, 'C', '14', NULL, false, 2),
(134, 52, 'D', '1', NULL, false, 3),

(135, 54, 'A', 'Temperature', NULL, true, 0),
(136, 54, 'B', 'Concentration', NULL, true, 1),
(137, 54, 'C', 'Catalyst', NULL, true, 2),
(138, 54, 'D', 'Color of reactants', NULL, false, 3),

(139, 55, 'A', 'True', NULL, false, 0),
(140, 55, 'B', 'False', NULL, true, 1),

(141, 56, 'A', 'Fluorine', NULL, true, 0),
(142, 56, 'B', 'Oxygen', NULL, false, 1),
(143, 56, 'C', 'Chlorine', NULL, false, 2),
(144, 56, 'D', 'Nitrogen', NULL, false, 3),

(145, 57, 'A', 'Decreases', NULL, true, 0),
(146, 57, 'B', 'Increases', NULL, false, 1),
(147, 57, 'C', 'Remains same', NULL, false, 2),
(148, 57, 'D', 'First increases then decreases', NULL, false, 3),

(149, 58, 'A', 'Helium', NULL, true, 0),
(150, 58, 'B', 'Neon', NULL, true, 1),
(151, 58, 'C', 'Argon', NULL, true, 2),
(152, 58, 'D', 'Hydrogen', NULL, false, 3),

-- Q61-Q67 (DSA — representative options)
(153, 61, 'A', 'O(log n)', NULL, true, 0),
(154, 61, 'B', 'O(n)', NULL, false, 1),
(155, 61, 'C', 'O(n log n)', NULL, false, 2),
(156, 61, 'D', 'O(1)', NULL, false, 3),

(157, 62, 'A', 'Queue', NULL, true, 0),
(158, 62, 'B', 'Stack', NULL, false, 1),
(159, 62, 'C', 'Tree', NULL, false, 2),
(160, 62, 'D', 'Graph', NULL, false, 3),

(161, 63, 'A', 'O(n²)', NULL, true, 0),
(162, 63, 'B', 'O(n log n)', NULL, false, 1),
(163, 63, 'C', 'O(n)', NULL, false, 2),
(164, 63, 'D', 'O(log n)', NULL, false, 3),

(165, 64, 'A', 'AVL tree', NULL, true, 0),
(166, 64, 'B', 'Red-Black tree', NULL, true, 1),
(167, 64, 'C', 'Simple BST', NULL, false, 2),
(168, 64, 'D', 'Heap', NULL, false, 3),

(169, 66, 'A', 'True', NULL, false, 0),
(170, 66, 'B', 'False', NULL, true, 1),

(171, 67, 'A', 'Negative edge weights', NULL, true, 0),
(172, 67, 'B', 'Directed graphs', NULL, false, 1),
(173, 67, 'C', 'Weighted graphs', NULL, false, 2),
(174, 67, 'D', 'Sparse graphs', NULL, false, 3),

-- Q73: Greedy (TRUE_FALSE)
(175, 73, 'A', 'True', NULL, false, 0),
(176, 73, 'B', 'False', NULL, true, 1),

-- Q75-Q76 (OS — representative options)
(177, 75, 'A', 'Shortest Job First', NULL, true, 0),
(178, 75, 'B', 'Round Robin', NULL, false, 1),
(179, 75, 'C', 'FCFS', NULL, false, 2),
(180, 75, 'D', 'Priority (with aging)', NULL, false, 3),

(181, 76, 'A', 'Preemptive scheduling', NULL, true, 0),
(182, 76, 'B', 'Non-preemptive scheduling', NULL, false, 1),
(183, 76, 'C', 'Batch scheduling', NULL, false, 2),
(184, 76, 'D', 'Real-time scheduling', NULL, false, 3),

(185, 77, 'A', 'True', NULL, true, 0),
(186, 77, 'B', 'False', NULL, false, 1),

(187, 78, 'A', 'Optimal Page Replacement', NULL, true, 0),
(188, 78, 'B', 'FIFO', NULL, false, 1),
(189, 78, 'C', 'LRU', NULL, false, 2),
(190, 78, 'D', 'Clock', NULL, false, 3),

(191, 80, 'A', 'FIFO', NULL, true, 0),
(192, 80, 'B', 'LRU', NULL, true, 1),
(193, 80, 'C', 'Optimal', NULL, true, 2),
(194, 80, 'D', 'Bubble Sort', NULL, false, 3),

-- Q81-Q82, Q84-Q86, Q88-Q89 (DBMS — representative)
(195, 81, 'A', '3NF', NULL, true, 0),
(196, 81, 'B', '1NF', NULL, false, 1),
(197, 81, 'C', '2NF', NULL, false, 2),
(198, 81, 'D', 'BCNF', NULL, false, 3),

(199, 82, 'A', 'HAVING', NULL, true, 0),
(200, 82, 'B', 'WHERE', NULL, false, 1),
(201, 82, 'C', 'GROUP BY', NULL, false, 2),
(202, 82, 'D', 'ORDER BY', NULL, false, 3),

(203, 84, 'A', 'True', NULL, true, 0),
(204, 84, 'B', 'False', NULL, false, 1),

(205, 85, 'A', 'READ COMMITTED', NULL, true, 0),
(206, 85, 'B', 'READ UNCOMMITTED', NULL, false, 1),
(207, 85, 'C', 'REPEATABLE READ', NULL, false, 2),
(208, 85, 'D', 'SERIALIZABLE', NULL, false, 3),

(209, 86, 'A', 'INNER JOIN', NULL, true, 0),
(210, 86, 'B', 'LEFT JOIN', NULL, true, 1),
(211, 86, 'C', 'RIGHT JOIN', NULL, true, 2),
(212, 86, 'D', 'MERGE JOIN', NULL, false, 3),

(213, 88, 'A', 'Serializability', NULL, true, 0),
(214, 88, 'B', 'Deadlock freedom', NULL, false, 1),
(215, 88, 'C', 'Starvation freedom', NULL, false, 2),
(216, 88, 'D', 'Cascadeless schedules', NULL, false, 3),

(217, 89, 'A', 'True', NULL, false, 0),
(218, 89, 'B', 'False', NULL, true, 1);


-- ============================================================
-- 9. MATCH PAIRS (for MATCH_FOLLOWING type questions)
-- ============================================================

INSERT INTO match_pairs (id, question_id, left_text, right_text, pair_order) VALUES
-- Q20: Functional groups → Classes
(1, 20, '-OH', 'Alcohol', 0),
(2, 20, '-CHO', 'Aldehyde', 1),
(3, 20, '-COOH', 'Carboxylic Acid', 2),
(4, 20, '-NH₂', 'Amine', 3),

-- Q30: Conics → Eccentricity
(5, 30, 'Circle', 'e = 0', 0),
(6, 30, 'Parabola', 'e = 1', 1),
(7, 30, 'Ellipse', '0 < e < 1', 2),
(8, 30, 'Hyperbola', 'e > 1', 3),

-- Q40: Organelles → Functions
(9, 40, 'Mitochondria', 'ATP production', 0),
(10, 40, 'Ribosome', 'Protein synthesis', 1),
(11, 40, 'Golgi apparatus', 'Packaging and secretion', 2),
(12, 40, 'Lysosome', 'Intracellular digestion', 3),

-- Q59: Elements → Groups
(13, 59, 'Sodium', 'Group 1', 0),
(14, 59, 'Calcium', 'Group 2', 1),
(15, 59, 'Chlorine', 'Group 17', 2),
(16, 59, 'Neon', 'Group 18', 3),

-- Q74: Algorithms → Paradigms
(17, 74, 'Merge Sort', 'Divide and Conquer', 0),
(18, 74, 'Dijkstra''s Algorithm', 'Greedy', 1),
(19, 74, '0/1 Knapsack', 'Dynamic Programming', 2),
(20, 74, 'Bubble Sort', 'Brute Force', 3),

-- Q90: Normal Forms → Eliminated issues
(21, 90, '1NF', 'Repeating groups', 0),
(22, 90, '2NF', 'Partial dependencies', 1),
(23, 90, '3NF', 'Transitive dependencies', 2),
(24, 90, 'BCNF', 'All FD anomalies', 3),

-- Q130: Constitutional bodies → Articles
(25, 130, 'CAG', 'Article 148', 0),
(26, 130, 'Election Commission', 'Article 324', 1),
(27, 130, 'UPSC', 'Article 315', 2),
(28, 130, 'Finance Commission', 'Article 280', 3),

-- Q140: Rivers → Origin
(29, 140, 'Ganga', 'Gangotri Glacier', 0),
(30, 140, 'Yamuna', 'Yamunotri Glacier', 1),
(31, 140, 'Godavari', 'Trimbakeshwar, Nashik', 2),
(32, 140, 'Kaveri', 'Talakaveri, Coorg', 3);


-- ============================================================
-- 10. EXAMS (10)
-- ============================================================

INSERT INTO exams (id, title, description, instructions, total_marks, passing_marks, duration_minutes, start_datetime, end_datetime, max_attempts, shuffle_questions, shuffle_options, negative_marking, status, created_by, subject_id, course_id, created_at, updated_at) VALUES
(1, 'JEE Physics Mock Test 1', 'Full-length physics mock test covering Mechanics and Electromagnetism', 'Attempt all questions. Negative marking applies for MCQs.', 80.00, 32.00, 60, '2026-07-01 09:00:00', '2026-07-01 10:00:00', 1, true, true, true, 'PUBLISHED', 2, 1, 1, NOW(), NULL),
(2, 'JEE Chemistry Mid-Term', 'Mid-term exam covering Chemical Bonding and Organic Chemistry', 'Time management is key. Read instructions for each question type.', 80.00, 32.00, 60, '2026-07-05 09:00:00', '2026-07-05 10:00:00', 1, false, true, true, 'PUBLISHED', 2, 2, 1, NOW(), NULL),
(3, 'JEE Mathematics Weekly Quiz', 'Quick quiz on Calculus and Coordinate Geometry', NULL, 40.00, 16.00, 30, '2026-07-03 14:00:00', '2026-07-03 14:30:00', 2, true, false, false, 'PUBLISHED', 2, 3, 1, NOW(), NULL),
(4, 'NEET Biology Full Test', 'Comprehensive biology test covering Cell Biology and Genetics', 'All questions are mandatory. Mark your best answer.', 80.00, 32.00, 60, '2026-07-10 09:00:00', '2026-07-10 10:00:00', 1, true, true, true, 'PUBLISHED', 3, 4, 2, NOW(), NULL),
(5, 'NEET Physics + Chemistry Combined', 'Combined physics and chemistry test for NEET aspirants', 'Section A: Physics, Section B: Chemistry', 120.00, 48.00, 90, '2026-07-15 09:00:00', '2026-07-15 10:30:00', 1, false, true, true, 'DRAFT', 3, 5, 2, NOW(), NULL),
(6, 'GATE DSA Practice Set', 'Practice set covering Trees, Graphs, and Dynamic Programming', 'NAT questions have no negative marking.', 30.00, 12.00, 45, '2026-08-01 10:00:00', '2026-08-01 10:45:00', 3, true, true, true, 'PUBLISHED', 2, 7, 3, NOW(), NULL),
(7, 'GATE OS + DBMS Test', 'Combined test on Operating Systems and Database concepts', 'Attempt section-wise. Each section is timed separately.', 40.00, 16.00, 60, '2026-08-10 10:00:00', '2026-08-10 11:00:00', 2, false, true, true, 'PUBLISHED', 2, 8, 3, NOW(), NULL),
(8, 'CAT QA Sectional Test', 'Quantitative Aptitude sectional test', 'Use of calculator is NOT allowed.', 60.00, 24.00, 40, '2026-09-01 15:00:00', '2026-09-01 15:40:00', 2, true, false, true, 'PUBLISHED', 3, 10, 4, NOW(), NULL),
(9, 'UPSC Polity Grand Test', 'Comprehensive polity test covering Fundamental Rights and Legislature', 'Mark the most appropriate answer.', 40.00, 16.00, 45, '2026-09-15 09:00:00', '2026-09-15 09:45:00', 1, true, true, true, 'PUBLISHED', 4, 13, 5, NOW(), NULL),
(10, 'UPSC Geography + History Combo', 'Combined geography and history test', NULL, 60.00, 24.00, 60, '2026-10-01 09:00:00', '2026-10-01 10:00:00', 1, true, true, true, 'DRAFT', 4, 14, 5, NOW(), NULL);


-- ============================================================
-- 11. EXAM SECTIONS (20 — 2 per exam)
-- ============================================================

INSERT INTO exam_sections (id, name, section_order, duration_minutes, exam_id) VALUES
-- Exam 1
(1, 'Mechanics', 0, 30, 1),
(2, 'Electromagnetism', 1, 30, 1),
-- Exam 2
(3, 'Chemical Bonding', 0, 30, 2),
(4, 'Organic Chemistry', 1, 30, 2),
-- Exam 3
(5, 'Calculus', 0, 15, 3),
(6, 'Coordinate Geometry', 1, 15, 3),
-- Exam 4
(7, 'Cell Biology', 0, 30, 4),
(8, 'Genetics', 1, 30, 4),
-- Exam 5
(9, 'Physics Section', 0, 45, 5),
(10, 'Chemistry Section', 1, 45, 5),
-- Exam 6
(11, 'Trees & Graphs', 0, 20, 6),
(12, 'Dynamic Programming', 1, 25, 6),
-- Exam 7
(13, 'Operating Systems', 0, 30, 7),
(14, 'DBMS', 1, 30, 7),
-- Exam 8
(15, 'Number Systems & Arithmetic', 0, 20, 8),
(16, 'Probability & Combinatorics', 1, 20, 8),
-- Exam 9
(17, 'Fundamental Rights', 0, 20, 9),
(18, 'Legislature', 1, 25, 9),
-- Exam 10
(19, 'Geography', 0, 30, 10),
(20, 'History', 1, 30, 10);


-- ============================================================
-- 12. EXAM QUESTIONS (mapping questions to exams and sections)
-- ============================================================

INSERT INTO exam_questions (id, exam_id, question_id, section_id, display_order, marks_override) VALUES
-- Exam 1: JEE Physics (Q1-Q10)
(1, 1, 1, 1, 0, NULL), (2, 1, 2, 1, 1, NULL), (3, 1, 3, 1, 2, NULL),
(4, 1, 4, 1, 3, NULL), (5, 1, 5, 1, 4, NULL),
(6, 1, 6, 2, 5, NULL), (7, 1, 7, 2, 6, NULL), (8, 1, 8, 2, 7, NULL),
(9, 1, 9, 2, 8, NULL), (10, 1, 10, 2, 9, NULL),

-- Exam 2: JEE Chemistry (Q11-Q20)
(11, 2, 11, 3, 0, NULL), (12, 2, 12, 3, 1, NULL), (13, 2, 13, 3, 2, NULL),
(14, 2, 14, 3, 3, NULL), (15, 2, 19, 3, 4, NULL),
(16, 2, 15, 4, 5, NULL), (17, 2, 16, 4, 6, NULL), (18, 2, 17, 4, 7, NULL),
(19, 2, 18, 4, 8, NULL), (20, 2, 20, 4, 9, NULL),

-- Exam 3: JEE Maths (Q21-Q30)
(21, 3, 21, 5, 0, NULL), (22, 3, 22, 5, 1, NULL), (23, 3, 23, 5, 2, NULL),
(24, 3, 24, 5, 3, NULL), (25, 3, 29, 5, 4, NULL),
(26, 3, 25, 6, 5, NULL), (27, 3, 26, 6, 6, NULL), (28, 3, 27, 6, 7, NULL),
(29, 3, 28, 6, 8, NULL), (30, 3, 30, 6, 9, NULL),

-- Exam 4: NEET Biology (Q31-Q40)
(31, 4, 31, 7, 0, NULL), (32, 4, 32, 7, 1, NULL), (33, 4, 33, 7, 2, NULL),
(34, 4, 34, 7, 3, NULL), (35, 4, 40, 7, 4, NULL),
(36, 4, 35, 8, 5, NULL), (37, 4, 36, 8, 6, NULL), (38, 4, 37, 8, 7, NULL),
(39, 4, 38, 8, 8, NULL), (40, 4, 39, 8, 9, NULL),

-- Exam 5: NEET Physics+Chem (Q41-Q60)
(41, 5, 41, 9, 0, NULL), (42, 5, 42, 9, 1, NULL), (43, 5, 43, 9, 2, NULL),
(44, 5, 44, 9, 3, NULL), (45, 5, 45, 9, 4, NULL), (46, 5, 46, 9, 5, NULL),
(47, 5, 47, 9, 6, NULL), (48, 5, 48, 9, 7, NULL), (49, 5, 49, 9, 8, NULL),
(50, 5, 50, 9, 9, NULL),
(51, 5, 51, 10, 10, NULL), (52, 5, 52, 10, 11, NULL), (53, 5, 53, 10, 12, NULL),
(54, 5, 54, 10, 13, NULL), (55, 5, 55, 10, 14, NULL), (56, 5, 56, 10, 15, NULL),
(57, 5, 57, 10, 16, NULL), (58, 5, 58, 10, 17, NULL), (59, 5, 59, 10, 18, NULL),
(60, 5, 60, 10, 19, NULL),

-- Exam 6: GATE DSA (Q61-Q74)
(61, 6, 61, 11, 0, NULL), (62, 6, 62, 11, 1, NULL), (63, 6, 63, 11, 2, NULL),
(64, 6, 64, 11, 3, NULL), (65, 6, 65, 11, 4, NULL), (66, 6, 66, 11, 5, NULL),
(67, 6, 67, 11, 6, NULL), (68, 6, 68, 11, 7, NULL),
(69, 6, 69, 12, 8, NULL), (70, 6, 70, 12, 9, NULL), (71, 6, 71, 12, 10, NULL),
(72, 6, 72, 12, 11, NULL), (73, 6, 73, 12, 12, NULL), (74, 6, 74, 12, 13, NULL),

-- Exam 7: GATE OS+DBMS (Q75-Q90)
(75, 7, 75, 13, 0, NULL), (76, 7, 76, 13, 1, NULL), (77, 7, 77, 13, 2, NULL),
(78, 7, 78, 13, 3, NULL), (79, 7, 79, 13, 4, NULL), (80, 7, 80, 13, 5, NULL),
(81, 7, 81, 14, 6, NULL), (82, 7, 82, 14, 7, NULL), (83, 7, 83, 14, 8, NULL),
(84, 7, 84, 14, 9, NULL), (85, 7, 85, 14, 10, NULL), (86, 7, 86, 14, 11, NULL),
(87, 7, 87, 14, 12, NULL), (88, 7, 88, 14, 13, NULL), (89, 7, 89, 14, 14, NULL),
(90, 7, 90, 14, 15, NULL),

-- Exam 8: CAT QA (Q91-Q100)
(91, 8, 91, 15, 0, NULL), (92, 8, 92, 15, 1, NULL), (93, 8, 93, 15, 2, NULL),
(94, 8, 96, 15, 3, NULL), (95, 8, 97, 15, 4, NULL), (96, 8, 100, 15, 5, NULL),
(97, 8, 94, 16, 6, NULL), (98, 8, 95, 16, 7, NULL), (99, 8, 98, 16, 8, NULL),
(100, 8, 99, 16, 9, NULL),

-- Exam 9: UPSC Polity (Q121-Q130)
(101, 9, 121, 17, 0, NULL), (102, 9, 122, 17, 1, NULL), (103, 9, 123, 17, 2, NULL),
(104, 9, 124, 17, 3, NULL), (105, 9, 125, 17, 4, NULL),
(106, 9, 126, 18, 5, NULL), (107, 9, 127, 18, 6, NULL), (108, 9, 128, 18, 7, NULL),
(109, 9, 129, 18, 8, NULL), (110, 9, 130, 18, 9, NULL),

-- Exam 10: UPSC Geo+History (Q131-Q150)
(111, 10, 131, 19, 0, NULL), (112, 10, 132, 19, 1, NULL), (113, 10, 133, 19, 2, NULL),
(114, 10, 134, 19, 3, NULL), (115, 10, 135, 19, 4, NULL), (116, 10, 136, 19, 5, NULL),
(117, 10, 137, 19, 6, NULL), (118, 10, 138, 19, 7, NULL), (119, 10, 139, 19, 8, NULL),
(120, 10, 140, 19, 9, NULL),
(121, 10, 141, 20, 10, NULL), (122, 10, 142, 20, 11, NULL), (123, 10, 143, 20, 12, NULL),
(124, 10, 144, 20, 13, NULL), (125, 10, 145, 20, 14, NULL), (126, 10, 146, 20, 15, NULL),
(127, 10, 147, 20, 16, NULL), (128, 10, 148, 20, 17, NULL), (129, 10, 149, 20, 18, NULL),
(130, 10, 150, 20, 19, NULL);


-- ============================================================
-- 13. PASSWORD RESET TOKENS (5 — for testing token flows)
-- ============================================================

INSERT INTO password_reset_tokens (id, user_id, token_hash, channel, is_used, created_at, expires_at) VALUES
(1, 5, 'a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0', 'EMAIL', false, NOW(), DATE_ADD(NOW(), INTERVAL 1 HOUR)),
(2, 10, 'b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1', 'EMAIL', false, NOW(), DATE_ADD(NOW(), INTERVAL 1 HOUR)),
(3, 15, 'c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2', 'EMAIL', true, DATE_SUB(NOW(), INTERVAL 2 HOUR), DATE_SUB(NOW(), INTERVAL 1 HOUR)),
(4, 20, 'd4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3', 'EMAIL', false, NOW(), DATE_ADD(NOW(), INTERVAL 30 MINUTE)),
(5, 25, 'e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3x4', 'EMAIL', true, DATE_SUB(NOW(), INTERVAL 3 HOUR), DATE_SUB(NOW(), INTERVAL 2 HOUR));


-- ============================================================
-- SEED COMPLETE
-- ============================================================
-- Summary:
--   users:               54  (1 super admin + 3 admins + 50 students)
--   courses:              5
--   subjects:            15
--   topics:              30
--   batches:             10
--   batch_enrollments:  100
--   questions:          200  (mix of all 6 question types)
--   question_options:   218
--   match_pairs:         32
--   exams:               10  (8 PUBLISHED + 2 DRAFT)
--   exam_sections:       20
--   exam_questions:     130
--   password_reset_tokens: 5
-- ============================================================
-- All user passwords: Test@123
-- ============================================================
