CREATE DATABASE MentalHealthSupport;
USE MentalHealthSupport;

-- Patients Table
CREATE TABLE Patients (
patient_id INT AUTO_INCREMENT PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
phone VARCHAR(20) NOT NULL,
date_of_birth DATE,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert into Patients
INSERT INTO Patients (full_name, email, phone, date_of_birth) VALUES
('Danny Williams', 'danny@hotmail.com', '555-736251', '1987-02-12'),
('Chin Ho', 'chin@yahoo.com', '555-514256', '1988-04-06'),
('Grace Park', 'gracepark@gmail.com', '555-251514', '1989-02-09');

SELECT * FROM Patients;

-- Therapist Table
CREATE TABLE Therapists (
therapist_id INT AUTO_INCREMENT PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
specialization VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
phone VARCHAR(20) NOT NULL
);

-- Insert into Therapists
INSERT INTO Therapists (full_name, specialization, email, phone) VALUES
('Dr. Max Berg', 'Cognitive Behavioral Therapy', 'maxberg@gmail.com', '555-986754'),
('Dr. Karina Trish', 'Family Therapy', 'karinatrish@yahoo.com', '555-714356'),
('Dr. Lana Eliane', 'Occupational Therapy', 'lanaeli@hotmail.com', '555-514736');

SELECT * FROM Therapists;

-- Session Table
CREATE TABLE Sessions (
session_id INT AUTO_INCREMENT PRIMARY KEY,
patient_id INT NOT NULL,
therapist_id INT NOT NULL,
session_date DATETIME NOT NULL,
status ENUM('Scheduled','Completed','Cancelled') DEFAULT 'Scheduled',
FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
FOREIGN KEY (therapist_id) REFERENCES Therapists(therapist_id)
);

-- Insert into sessions
INSERT INTO Sessions (patient_id, therapist_id, session_date, status) VALUES
(1, 1, '2025-09-25 10:00:00', 'Scheduled'),
(2, 2, '2025-09-26 14:30:00', 'Completed'),
(3, 1, '2025-09-27 09:45:00', 'Cancelled');

SELECT * FROM Sessions;

-- Resources Table
CREATE TABLE Resources (
resource_id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(200) NOT NULL,
resource_type ENUM('Article','Video','Exercise') NOT NULL,
link VARCHAR(255) NOT NULL,
uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert into Resources
INSERT INTO Resources (title, resource_type, link) VALUES
('Managing Anxiety: A simple Guide', 'Article', 'https://anxietyguide.com'),
('Mindfulness Meditation', 'Video', 'https://mindfulnessmeditation.com'),
('Daily Gratitude Journal Exercise', 'Exercise', 'https://gratitudeexercise.com');

SELECT * FROM Resources;

-- Many to many
CREATE TABLE PatientsResources (
patient_id INT NOT NULL,
resource_id INT NOT NULL,
PRIMARY KEY (patient_id, resource_id),
FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
FOREIGN KEY (resource_id) REFERENCES Resources(resource_id)
);

-- Insert into PatientsResources
INSERT INTO PatientsResources (patient_id, resource_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1);

SELECT * FROM PatientsResources;
