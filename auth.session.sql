use auth;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique ID for each user
    username VARCHAR(50) NOT NULL UNIQUE,  -- Username (must be unique)
    password VARCHAR(255) NOT NULL       -- Password (hashed for security)
);

INSERT INTO users (username, password)
VALUES 
    ('admin', 'admin123'),
    ('ayush', 'ayush123'),
    ('norden', 'norden123');

SELECT * FROM users;

CREATE TABLE EmployeeAvailability (
    EmployeeName VARCHAR(50),
    DayOfWeek VARCHAR(10),
    TimeSlot TIME,
    Availability BOOLEAN DEFAULT FALSE
);

CREATE TABLE TimeSlotEmployees (
    DayOfWeek VARCHAR(10),
    TimeSlot TIME,
    Employee1 VARCHAR(50) DEFAULT NULL,
    Employee2 VARCHAR(50) DEFAULT NULL
);

INSERT INTO EmployeeAvailability (EmployeeName, DayOfWeek, TimeSlot)
VALUES
('Alice', 'Monday', '08:30:00'), ('Alice', 'Monday', '09:30:00'), ('Alice', 'Monday', '10:30:00'),
('Alice', 'Monday', '11:30:00'), ('Alice', 'Monday', '12:30:00'), ('Alice', 'Monday', '13:30:00'),
('Alice', 'Monday', '14:30:00'), ('Alice', 'Monday', '15:30:00'),

('Alice', 'Tuesday', '08:30:00'), ('Alice', 'Tuesday', '09:30:00'), ('Alice', 'Tuesday', '10:30:00'),
('Alice', 'Tuesday', '11:30:00'), ('Alice', 'Tuesday', '12:30:00'), ('Alice', 'Tuesday', '13:30:00'),
('Alice', 'Tuesday', '14:30:00'), ('Alice', 'Tuesday', '15:30:00'),

('Alice', 'Wednesday', '08:30:00'), ('Alice', 'Wednesday', '09:30:00'), ('Alice', 'Wednesday', '10:30:00'),
('Alice', 'Wednesday', '11:30:00'), ('Alice', 'Wednesday', '12:30:00'), ('Alice', 'Wednesday', '13:30:00'),
('Alice', 'Wednesday', '14:30:00'), ('Alice', 'Wednesday', '15:30:00'),

('Alice', 'Thursday', '08:30:00'), ('Alice', 'Thursday', '09:30:00'), ('Alice', 'Thursday', '10:30:00'),
('Alice', 'Thursday', '11:30:00'), ('Alice', 'Thursday', '12:30:00'), ('Alice', 'Thursday', '13:30:00'),
('Alice', 'Thursday', '14:30:00'), ('Alice', 'Thursday', '15:30:00'),

('Alice', 'Friday', '08:30:00'), ('Alice', 'Friday', '09:30:00'), ('Alice', 'Friday', '10:30:00'),
('Alice', 'Friday', '11:30:00'), ('Alice', 'Friday', '12:30:00'), ('Alice', 'Friday', '13:30:00'),
('Alice', 'Friday', '14:30:00'), ('Alice', 'Friday', '15:30:00'),

('Alice', 'Saturday', '08:30:00'), ('Alice', 'Saturday', '09:30:00'), ('Alice', 'Saturday', '10:30:00'),
('Alice', 'Saturday', '11:30:00'), ('Alice', 'Saturday', '12:30:00'), ('Alice', 'Saturday', '13:30:00'),
('Alice', 'Saturday', '14:30:00'), ('Alice', 'Saturday', '15:30:00'),

('Alice', 'Sunday', '08:30:00'), ('Alice', 'Sunday', '09:30:00'), ('Alice', 'Sunday', '10:30:00'),
('Alice', 'Sunday', '11:30:00'), ('Alice', 'Sunday', '12:30:00'), ('Alice', 'Sunday', '13:30:00'),
('Alice', 'Sunday', '14:30:00'), ('Alice', 'Sunday', '15:30:00');


INSERT INTO EmployeeAvailability (EmployeeName, DayOfWeek, TimeSlot)
VALUES
('Bob', 'Monday', '08:30:00'), ('Bob', 'Monday', '09:30:00'), ('Bob', 'Monday', '10:30:00'),
('Bob', 'Monday', '11:30:00'), ('Bob', 'Monday', '12:30:00'), ('Bob', 'Monday', '13:30:00'),
('Bob', 'Monday', '14:30:00'), ('Bob', 'Monday', '15:30:00'),

('Bob', 'Tuesday', '08:30:00'), ('Bob', 'Tuesday', '09:30:00'), ('Bob', 'Tuesday', '10:30:00'),
('Bob', 'Tuesday', '11:30:00'), ('Bob', 'Tuesday', '12:30:00'), ('Bob', 'Tuesday', '13:30:00'),
('Bob', 'Tuesday', '14:30:00'), ('Bob', 'Tuesday', '15:30:00'),

('Bob', 'Wednesday', '08:30:00'), ('Bob', 'Wednesday', '09:30:00'), ('Bob', 'Wednesday', '10:30:00'),
('Bob', 'Wednesday', '11:30:00'), ('Bob', 'Wednesday', '12:30:00'), ('Bob', 'Wednesday', '13:30:00'),
('Bob', 'Wednesday', '14:30:00'), ('Bob', 'Wednesday', '15:30:00'),

('Bob', 'Thursday', '08:30:00'), ('Bob', 'Thursday', '09:30:00'), ('Bob', 'Thursday', '10:30:00'),
('Bob', 'Thursday', '11:30:00'), ('Bob', 'Thursday', '12:30:00'), ('Bob', 'Thursday', '13:30:00'),
('Bob', 'Thursday', '14:30:00'), ('Bob', 'Thursday', '15:30:00'),

('Bob', 'Friday', '08:30:00'), ('Bob', 'Friday', '09:30:00'), ('Bob', 'Friday', '10:30:00'),
('Bob', 'Friday', '11:30:00'), ('Bob', 'Friday', '12:30:00'), ('Bob', 'Friday', '13:30:00'),
('Bob', 'Friday', '14:30:00'), ('Bob', 'Friday', '15:30:00'),

('Bob', 'Saturday', '08:30:00'), ('Bob', 'Saturday', '09:30:00'), ('Bob', 'Saturday', '10:30:00'),
('Bob', 'Saturday', '11:30:00'), ('Bob', 'Saturday', '12:30:00'), ('Bob', 'Saturday', '13:30:00'),
('Bob', 'Saturday', '14:30:00'), ('Bob', 'Saturday', '15:30:00'),

('Bob', 'Sunday', '08:30:00'), ('Bob', 'Sunday', '09:30:00'), ('Bob', 'Sunday', '10:30:00'),
('Bob', 'Sunday', '11:30:00'), ('Bob', 'Sunday', '12:30:00'), ('Bob', 'Sunday', '13:30:00'),
('Bob', 'Sunday', '14:30:00'), ('Bob', 'Sunday', '15:30:00');


INSERT INTO EmployeeAvailability (EmployeeName, DayOfWeek, TimeSlot)
VALUES
('Charlie', 'Monday', '08:30:00'), ('Charlie', 'Monday', '09:30:00'), ('Charlie', 'Monday', '10:30:00'),
('Charlie', 'Monday', '11:30:00'), ('Charlie', 'Monday', '12:30:00'), ('Charlie', 'Monday', '13:30:00'),
('Charlie', 'Monday', '14:30:00'), ('Charlie', 'Monday', '15:30:00'),

('Charlie', 'Tuesday', '08:30:00'), ('Charlie', 'Tuesday', '09:30:00'), ('Charlie', 'Tuesday', '10:30:00'),
('Charlie', 'Tuesday', '11:30:00'), ('Charlie', 'Tuesday', '12:30:00'), ('Charlie', 'Tuesday', '13:30:00'),
('Charlie', 'Tuesday', '14:30:00'), ('Charlie', 'Tuesday', '15:30:00'),

('Charlie', 'Wednesday', '08:30:00'), ('Charlie', 'Wednesday', '09:30:00'), ('Charlie', 'Wednesday', '10:30:00'),
('Charlie', 'Wednesday', '11:30:00'), ('Charlie', 'Wednesday', '12:30:00'), ('Charlie', 'Wednesday', '13:30:00'),
('Charlie', 'Wednesday', '14:30:00'), ('Charlie', 'Wednesday', '15:30:00'),

('Charlie', 'Thursday', '08:30:00'), ('Charlie', 'Thursday', '09:30:00'), ('Charlie', 'Thursday', '10:30:00'),
('Charlie', 'Thursday', '11:30:00'), ('Charlie', 'Thursday', '12:30:00'), ('Charlie', 'Thursday', '13:30:00'),
('Charlie', 'Thursday', '14:30:00'), ('Charlie', 'Thursday', '15:30:00'),

('Charlie', 'Friday', '08:30:00'), ('Charlie', 'Friday', '09:30:00'), ('Charlie', 'Friday', '10:30:00'),
('Charlie', 'Friday', '11:30:00'), ('Charlie', 'Friday', '12:30:00'), ('Charlie', 'Friday', '13:30:00'),
('Charlie', 'Friday', '14:30:00'), ('Charlie', 'Friday', '15:30:00'),

('Charlie', 'Saturday', '08:30:00'), ('Charlie', 'Saturday', '09:30:00'), ('Charlie', 'Saturday', '10:30:00'),
('Charlie', 'Saturday', '11:30:00'), ('Charlie', 'Saturday', '12:30:00'), ('Charlie', 'Saturday', '13:30:00'),
('Charlie', 'Saturday', '14:30:00'), ('Charlie', 'Saturday', '15:30:00'),

('Charlie', 'Sunday', '08:30:00'), ('Charlie', 'Sunday', '09:30:00'), ('Charlie', 'Sunday', '10:30:00'),
('Charlie', 'Sunday', '11:30:00'), ('Charlie', 'Sunday', '12:30:00'), ('Charlie', 'Sunday', '13:30:00'),
('Charlie', 'Sunday', '14:30:00'), ('Charlie', 'Sunday', '15:30:00');


INSERT INTO EmployeeAvailability (EmployeeName, DayOfWeek, TimeSlot)
VALUES
('Diana', 'Monday', '08:30:00'), ('Diana', 'Monday', '09:30:00'), ('Diana', 'Monday', '10:30:00'),
('Diana', 'Monday', '11:30:00'), ('Diana', 'Monday', '12:30:00'), ('Diana', 'Monday', '13:30:00'),
('Diana', 'Monday', '14:30:00'), ('Diana', 'Monday', '15:30:00'),

('Diana', 'Tuesday', '08:30:00'), ('Diana', 'Tuesday', '09:30:00'), ('Diana', 'Tuesday', '10:30:00'),
('Diana', 'Tuesday', '11:30:00'), ('Diana', 'Tuesday', '12:30:00'), ('Diana', 'Tuesday', '13:30:00'),
('Diana', 'Tuesday', '14:30:00'), ('Diana', 'Tuesday', '15:30:00'),

('Diana', 'Wednesday', '08:30:00'), ('Diana', 'Wednesday', '09:30:00'), ('Diana', 'Wednesday', '10:30:00'),
('Diana', 'Wednesday', '11:30:00'), ('Diana', 'Wednesday', '12:30:00'), ('Diana', 'Wednesday', '13:30:00'),
('Diana', 'Wednesday', '14:30:00'), ('Diana', 'Wednesday', '15:30:00'),

('Diana', 'Thursday', '08:30:00'), ('Diana', 'Thursday', '09:30:00'), ('Diana', 'Thursday', '10:30:00'),
('Diana', 'Thursday', '11:30:00'), ('Diana', 'Thursday', '12:30:00'), ('Diana', 'Thursday', '13:30:00'),
('Diana', 'Thursday', '14:30:00'), ('Diana', 'Thursday', '15:30:00'),

('Diana', 'Friday', '08:30:00'), ('Diana', 'Friday', '09:30:00'), ('Diana', 'Friday', '10:30:00'),
('Diana', 'Friday', '11:30:00'), ('Diana', 'Friday', '12:30:00'), ('Diana', 'Friday', '13:30:00'),
('Diana', 'Friday', '14:30:00'), ('Diana', 'Friday', '15:30:00'),

('Diana', 'Saturday', '08:30:00'), ('Diana', 'Saturday', '09:30:00'), ('Diana', 'Saturday', '10:30:00'),
('Diana', 'Saturday', '11:30:00'), ('Diana', 'Saturday', '12:30:00'), ('Diana', 'Saturday', '13:30:00'),
('Diana', 'Saturday', '14:30:00'), ('Diana', 'Saturday', '15:30:00'),

('Diana', 'Sunday', '08:30:00'), ('Diana', 'Sunday', '09:30:00'), ('Diana', 'Sunday', '10:30:00'),
('Diana', 'Sunday', '11:30:00'), ('Diana', 'Sunday', '12:30:00'), ('Diana', 'Sunday', '13:30:00'),
('Diana', 'Sunday', '14:30:00'), ('Diana', 'Sunday', '15:30:00');


INSERT INTO EmployeeAvailability (EmployeeName, DayOfWeek, TimeSlot)
VALUES
('Eve', 'Monday', '08:30:00'), ('Eve', 'Monday', '09:30:00'), ('Eve', 'Monday', '10:30:00'),
('Eve', 'Monday', '11:30:00'), ('Eve', 'Monday', '12:30:00'), ('Eve', 'Monday', '13:30:00'),
('Eve', 'Monday', '14:30:00'), ('Eve', 'Monday', '15:30:00'),

('Eve', 'Tuesday', '08:30:00'), ('Eve', 'Tuesday', '09:30:00'), ('Eve', 'Tuesday', '10:30:00'),
('Eve', 'Tuesday', '11:30:00'), ('Eve', 'Tuesday', '12:30:00'), ('Eve', 'Tuesday', '13:30:00'),
('Eve', 'Tuesday', '14:30:00'), ('Eve', 'Tuesday', '15:30:00'),

('Eve', 'Wednesday', '08:30:00'), ('Eve', 'Wednesday', '09:30:00'), ('Eve', 'Wednesday', '10:30:00'),
('Eve', 'Wednesday', '11:30:00'), ('Eve', 'Wednesday', '12:30:00'), ('Eve', 'Wednesday', '13:30:00'),
('Eve', 'Wednesday', '14:30:00'), ('Eve', 'Wednesday', '15:30:00'),

('Eve', 'Thursday', '08:30:00'), ('Eve', 'Thursday', '09:30:00'), ('Eve', 'Thursday', '10:30:00'),
('Eve', 'Thursday', '11:30:00'), ('Eve', 'Thursday', '12:30:00'), ('Eve', 'Thursday', '13:30:00'),
('Eve', 'Thursday', '14:30:00'), ('Eve', 'Thursday', '15:30:00'),

('Eve', 'Friday', '08:30:00'), ('Eve', 'Friday', '09:30:00'), ('Eve', 'Friday', '10:30:00'),
('Eve', 'Friday', '11:30:00'), ('Eve', 'Friday', '12:30:00'), ('Eve', 'Friday', '13:30:00'),
('Eve', 'Friday', '14:30:00'), ('Eve', 'Friday', '15:30:00'),

('Eve', 'Saturday', '08:30:00'), ('Eve', 'Saturday', '09:30:00'), ('Eve', 'Saturday', '10:30:00'),
('Eve', 'Saturday', '11:30:00'), ('Eve', 'Saturday', '12:30:00'), ('Eve', 'Saturday', '13:30:00'),
('Eve', 'Saturday', '14:30:00'), ('Eve', 'Saturday', '15:30:00'),

('Eve', 'Sunday', '08:30:00'), ('Eve', 'Sunday', '09:30:00'), ('Eve', 'Sunday', '10:30:00'),
('Eve', 'Sunday', '11:30:00'), ('Eve', 'Sunday', '12:30:00'), ('Eve', 'Sunday', '13:30:00'),
('Eve', 'Sunday', '14:30:00'), ('Eve', 'Sunday', '15:30:00');


INSERT INTO EmployeeAvailability (EmployeeName, DayOfWeek, TimeSlot)
VALUES
('Frank', 'Monday', '08:30:00'), ('Frank', 'Monday', '09:30:00'), ('Frank', 'Monday', '10:30:00'),
('Frank', 'Monday', '11:30:00'), ('Frank', 'Monday', '12:30:00'), ('Frank', 'Monday', '13:30:00'),
('Frank', 'Monday', '14:30:00'), ('Frank', 'Monday', '15:30:00'),

('Frank', 'Tuesday', '08:30:00'), ('Frank', 'Tuesday', '09:30:00'), ('Frank', 'Tuesday', '10:30:00'),
('Frank', 'Tuesday', '11:30:00'), ('Frank', 'Tuesday', '12:30:00'), ('Frank', 'Tuesday', '13:30:00'),
('Frank', 'Tuesday', '14:30:00'), ('Frank', 'Tuesday', '15:30:00'),

('Frank', 'Wednesday', '08:30:00'), ('Frank', 'Wednesday', '09:30:00'), ('Frank', 'Wednesday', '10:30:00'),
('Frank', 'Wednesday', '11:30:00'), ('Frank', 'Wednesday', '12:30:00'), ('Frank', 'Wednesday', '13:30:00'),
('Frank', 'Wednesday', '14:30:00'), ('Frank', 'Wednesday', '15:30:00'),

('Frank', 'Thursday', '08:30:00'), ('Frank', 'Thursday', '09:30:00'), ('Frank', 'Thursday', '10:30:00'),
('Frank', 'Thursday', '11:30:00'), ('Frank', 'Thursday', '12:30:00'), ('Frank', 'Thursday', '13:30:00'),
('Frank', 'Thursday', '14:30:00'), ('Frank', 'Thursday', '15:30:00'),

('Frank', 'Friday', '08:30:00'), ('Frank', 'Friday', '09:30:00'), ('Frank', 'Friday', '10:30:00'),
('Frank', 'Friday', '11:30:00'), ('Frank', 'Friday', '12:30:00'), ('Frank', 'Friday', '13:30:00'),
('Frank', 'Friday', '14:30:00'), ('Frank', 'Friday', '15:30:00'),

('Frank', 'Saturday', '08:30:00'), ('Frank', 'Saturday', '09:30:00'), ('Frank', 'Saturday', '10:30:00'),
('Frank', 'Saturday', '11:30:00'), ('Frank', 'Saturday', '12:30:00'), ('Frank', 'Saturday', '13:30:00'),
('Frank', 'Saturday', '14:30:00'), ('Frank', 'Saturday', '15:30:00'),

('Frank', 'Sunday', '08:30:00'), ('Frank', 'Sunday', '09:30:00'), ('Frank', 'Sunday', '10:30:00'),
('Frank', 'Sunday', '11:30:00'), ('Frank', 'Sunday', '12:30:00'), ('Frank', 'Sunday', '13:30:00'),
('Frank', 'Sunday', '14:30:00'), ('Frank', 'Sunday', '15:30:00');


INSERT INTO EmployeeAvailability (EmployeeName, DayOfWeek, TimeSlot)
VALUES
('Grace', 'Monday', '08:30:00'), ('Grace', 'Monday', '09:30:00'), ('Grace', 'Monday', '10:30:00'),
('Grace', 'Monday', '11:30:00'), ('Grace', 'Monday', '12:30:00'), ('Grace', 'Monday', '13:30:00'),
('Grace', 'Monday', '14:30:00'), ('Grace', 'Monday', '15:30:00'),

('Grace', 'Tuesday', '08:30:00'), ('Grace', 'Tuesday', '09:30:00'), ('Grace', 'Tuesday', '10:30:00'),
('Grace', 'Tuesday', '11:30:00'), ('Grace', 'Tuesday', '12:30:00'), ('Grace', 'Tuesday', '13:30:00'),
('Grace', 'Tuesday', '14:30:00'), ('Grace', 'Tuesday', '15:30:00'),

('Grace', 'Wednesday', '08:30:00'), ('Grace', 'Wednesday', '09:30:00'), ('Grace', 'Wednesday', '10:30:00'),
('Grace', 'Wednesday', '11:30:00'), ('Grace', 'Wednesday', '12:30:00'), ('Grace', 'Wednesday', '13:30:00'),
('Grace', 'Wednesday', '14:30:00'), ('Grace', 'Wednesday', '15:30:00'),

('Grace', 'Thursday', '08:30:00'), ('Grace', 'Thursday', '09:30:00'), ('Grace', 'Thursday', '10:30:00'),
('Grace', 'Thursday', '11:30:00'), ('Grace', 'Thursday', '12:30:00'), ('Grace', 'Thursday', '13:30:00'),
('Grace', 'Thursday', '14:30:00'), ('Grace', 'Thursday', '15:30:00'),

('Grace', 'Friday', '08:30:00'), ('Grace', 'Friday', '09:30:00'), ('Grace', 'Friday', '10:30:00'),
('Grace', 'Friday', '11:30:00'), ('Grace', 'Friday', '12:30:00'), ('Grace', 'Friday', '13:30:00'),
('Grace', 'Friday', '14:30:00'), ('Grace', 'Friday', '15:30:00'),

('Grace', 'Saturday', '08:30:00'), ('Grace', 'Saturday', '09:30:00'), ('Grace', 'Saturday', '10:30:00'),
('Grace', 'Saturday', '11:30:00'), ('Grace', 'Saturday', '12:30:00'), ('Grace', 'Saturday', '13:30:00'),
('Grace', 'Saturday', '14:30:00'), ('Grace', 'Saturday', '15:30:00'),

('Grace', 'Sunday', '08:30:00'), ('Grace', 'Sunday', '09:30:00'), ('Grace', 'Sunday', '10:30:00'),
('Grace', 'Sunday', '11:30:00'), ('Grace', 'Sunday', '12:30:00'), ('Grace', 'Sunday', '13:30:00'),
('Grace', 'Sunday', '14:30:00'), ('Grace', 'Sunday', '15:30:00');


INSERT INTO TimeSlotEmployees (DayOfWeek, TimeSlot)
VALUES
('Monday', '08:30:00'), ('Monday', '09:30:00'), ('Monday', '10:30:00'),
('Monday', '11:30:00'), ('Monday', '12:30:00'), ('Monday', '13:30:00'),
('Monday', '14:30:00'), ('Monday', '15:30:00'),
('Tuesday', '08:30:00'), ('Tuesday', '09:30:00'), ('Tuesday', '10:30:00'),
('Tuesday', '11:30:00'), ('Tuesday', '12:30:00'), ('Tuesday', '13:30:00'),
('Tuesday', '14:30:00'), ('Tuesday', '15:30:00'),
('Wednesday', '08:30:00'), ('Wednesday', '09:30:00'), ('Wednesday', '10:30:00'),
('Wednesday', '11:30:00'), ('Wednesday', '12:30:00'), ('Wednesday', '13:30:00'),
('Wednesday', '14:30:00'), ('Wednesday', '15:30:00'),
('Thursday', '08:30:00'), ('Thursday', '09:30:00'), ('Thursday', '10:30:00'),
('Thursday', '11:30:00'), ('Thursday', '12:30:00'), ('Thursday', '13:30:00'),
('Thursday', '14:30:00'), ('Thursday', '15:30:00'),
('Friday', '08:30:00'), ('Friday', '09:30:00'), ('Friday', '10:30:00'),
('Friday', '11:30:00'), ('Friday', '12:30:00'), ('Friday', '13:30:00'),
('Friday', '14:30:00'), ('Friday', '15:30:00'),
('Saturday', '08:30:00'), ('Saturday', '09:30:00'), ('Saturday', '10:30:00'),
('Saturday', '11:30:00'), ('Saturday', '12:30:00'), ('Saturday', '13:30:00'),
('Saturday', '14:30:00'), ('Saturday', '15:30:00'),
('Sunday', '08:30:00'), ('Sunday', '09:30:00'), ('Sunday', '10:30:00'),
('Sunday', '11:30:00'), ('Sunday', '12:30:00'), ('Sunday', '13:30:00'),
('Sunday', '14:30:00'), ('Sunday', '15:30:00');


UPDATE TimeSlotEmployees tse
JOIN EmployeeAvailability ea
    ON tse.DayOfWeek = ea.DayOfWeek
    AND tse.TimeSlot = ea.TimeSlot
LEFT JOIN (
    SELECT EmployeeName, COUNT(*) AS AssignmentCount
    FROM (
        SELECT Employee1 AS EmployeeName FROM TimeSlotEmployees WHERE Employee1 IS NOT NULL
        UNION ALL
        SELECT Employee2 AS EmployeeName FROM TimeSlotEmployees WHERE Employee2 IS NOT NULL
    ) AS EmployeeCounts
    GROUP BY EmployeeName
) AS ec
    ON ea.EmployeeName = ec.EmployeeName
SET
    tse.Employee1 = ea.EmployeeName
WHERE
    ea.Availability = TRUE
    AND tse.Employee1 IS NULL
    AND (ec.AssignmentCount IS NULL OR ec.AssignmentCount < 20);


UPDATE TimeSlotEmployees tse
JOIN EmployeeAvailability ea
    ON tse.DayOfWeek = ea.DayOfWeek
    AND tse.TimeSlot = ea.TimeSlot
LEFT JOIN (
    SELECT EmployeeName, COUNT(*) AS AssignmentCount
    FROM (
        SELECT Employee1 AS EmployeeName FROM TimeSlotEmployees WHERE Employee1 IS NOT NULL
        UNION ALL
        SELECT Employee2 AS EmployeeName FROM TimeSlotEmployees WHERE Employee2 IS NOT NULL
    ) AS EmployeeCounts
    GROUP BY EmployeeName
) AS ec
    ON ea.EmployeeName = ec.EmployeeName
SET
    tse.Employee2 = ea.EmployeeName
WHERE
    ea.Availability = TRUE
    AND tse.Employee1 IS NOT NULL
    AND tse.Employee1 != ea.EmployeeName
    AND tse.Employee2 IS NULL
    AND (ec.AssignmentCount IS NULL OR ec.AssignmentCount < 20);
