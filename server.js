const express = require('express');
const mysql = require('mysql2'); // Use mysql2 for better support
const cors = require('cors');

const app = express();
const PORT = 3000; // Use a single port for the server

// Middleware
app.use(cors({
    origin: '*',
    methods: ['GET', 'POST'],
    allowedHeaders: ['Content-Type']
}));
app.use(express.json()); // To parse JSON request bodies

// Database connection
const db = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'Login123',
    database: 'auth',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

db.getConnection((err, connection) => {
    if (err) {
        console.error('Database connection failed:', err.stack);
    } else {
        console.log('Connected to MySQL database.');
        connection.release();
    }
});

app.post('/login', (req, res) => {
    const { username, password } = req.body;

    console.log('Credentials received:', { username, password }); // Debug log

    const query = 'SELECT * FROM users WHERE username = ? AND password = ?';
    db.query(query, [username, password], (err, results) => {
        if (err) {
            console.error('Query execution error:', err); // Log query issues
            res.status(500).send('Internal server error');
        } else {
            console.log('Query result:', results); // Check results
            if (results.length > 0) {
                res.json({ success: true });
            } else {
                res.status(401).send('Invalid username or password');
            }
        }
    });
});

// Schedule endpoint
app.get('/schedule', (req, res) => {
    const query = 'SELECT * FROM timeslotemployees';
    db.query(query, (err, results) => {
        if (err) {
            console.error('Error fetching schedule data:', err);
            res.status(500).json({ success: false, message: 'Error fetching schedule data', error: err.message });
        } else {
            res.json({ success: true, data: results });
        }
    });
});

// Availability endpoint
app.get('/availability', (req, res) => {
    const query = 'SELECT * FROM employeeavailability';
    db.query(query, (err, results) => {
        if (err) {
            console.error('Error fetching availability:', err);
            res.status(500).json({ success: false, message: 'Error fetching availability data', error: err.message });
        } else {
            res.json({ success: true, data: results });
        }
    });
});

// Update availability endpoint
app.post('/updateAvailability', (req, res) => {
    const updatedData = req.body;

    if (!Array.isArray(updatedData) || updatedData.length === 0) {
        return res.status(400).json({ success: false, message: 'No data provided' });
    }

    const updates = updatedData.map(item => {
        const { EmployeeName, DayOfWeek, TimeSlot, Availability } = item;
        return new Promise((resolve, reject) => {
            const sql = `
                UPDATE employeeavailability
                SET Availability = ?
                WHERE EmployeeName = ? AND DayOfWeek = ? AND TimeSlot = ?;
            `;
            db.query(sql, [Availability, EmployeeName, DayOfWeek, TimeSlot], (err, results) => {
                if (err) reject(err);
                else if (results.affectedRows === 0) {
                    const insertSql = `
                        INSERT INTO employeeavailability (EmployeeName, DayOfWeek, TimeSlot, Availability)
                        VALUES (?, ?, ?, ?);
                    `;
                    db.query(insertSql, [EmployeeName, DayOfWeek, TimeSlot, Availability], (insertErr) => {
                        if (insertErr) reject(insertErr);
                        else resolve();
                    });
                } else resolve();
            });
        });
    });

    Promise.all(updates)
        .then(() => updateTimeSlotEmployees())
        .then(() => res.json({ success: true }))
        .catch(err => {
            console.error('Error updating availability:', err);
            res.status(500).json({ success: false, message: 'Error updating availability data', error: err.message });
        });
});

// Function to update `timeslotemployees`
function updateTimeSlotEmployees() {
    return new Promise((resolve, reject) => {
        // 使用 TRUE 和 FALSE 进行比较
        const removeAssignments = `
            UPDATE timeslotemployees tse
            JOIN employeeavailability ea ON tse.DayOfWeek = ea.DayOfWeek AND tse.TimeSlot = ea.TimeSlot
            SET
                tse.Employee1 = CASE WHEN tse.Employee1 = ea.EmployeeName AND ea.Availability = FALSE THEN NULL ELSE tse.Employee1 END,
                tse.Employee2 = CASE WHEN tse.Employee2 = ea.EmployeeName AND ea.Availability = FALSE THEN NULL ELSE tse.Employee2 END
            WHERE
                (tse.Employee1 = ea.EmployeeName OR tse.Employee2 = ea.EmployeeName)
                AND ea.Availability = FALSE;
        `;

        const updateEmployee1 = `
            UPDATE timeslotemployees tse
            JOIN employeeavailability ea
                ON tse.DayOfWeek = ea.DayOfWeek
                AND tse.TimeSlot = ea.TimeSlot
            LEFT JOIN (
                SELECT EmployeeName, COUNT(*) AS AssignmentCount
                FROM (
                    SELECT Employee1 AS EmployeeName FROM timeslotemployees WHERE Employee1 IS NOT NULL
                    UNION ALL
                    SELECT Employee2 AS EmployeeName FROM timeslotemployees WHERE Employee2 IS NOT NULL
                ) AS EmployeeCounts
                GROUP BY EmployeeName
            ) AS ec
                ON ea.EmployeeName = ec.EmployeeName
            SET
                tse.Employee1 = ea.EmployeeName
            WHERE
                ea.Availability = TRUE
                AND tse.Employee1 IS NULL
                AND (tse.Employee2 IS NULL OR tse.Employee2 != ea.EmployeeName)
                AND (ec.AssignmentCount IS NULL OR ec.AssignmentCount < 20);
        `;

        const updateEmployee2 = `
            UPDATE timeslotemployees tse
            JOIN employeeavailability ea
                ON tse.DayOfWeek = ea.DayOfWeek
                AND tse.TimeSlot = ea.TimeSlot
            LEFT JOIN (
                SELECT EmployeeName, COUNT(*) AS AssignmentCount
                FROM (
                    SELECT Employee1 AS EmployeeName FROM timeslotemployees WHERE Employee1 IS NOT NULL
                    UNION ALL
                    SELECT Employee2 AS EmployeeName FROM timeslotemployees WHERE Employee2 IS NOT NULL
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
        `;

        // 使用事务来确保数据一致性
        db.getConnection((err, connection) => {
            if (err) {
                console.error('Error getting connection:', err);
                return reject(err);
            }

            connection.beginTransaction(err => {
                if (err) {
                    connection.release();
                    console.error('Error starting transaction:', err);
                    return reject(err);
                }

                // 首先执行删除分配的语句
                connection.query(removeAssignments, (err, results) => {
                    if (err) {
                        return connection.rollback(() => {
                            connection.release();
                            console.error('Error executing removeAssignments:', err);
                            reject(err);
                        });
                    }

                    console.log('removeAssignments affectedRows:', results.affectedRows);

                    // 执行第一个更新
                    connection.query(updateEmployee1, (err, results) => {
                        if (err) {
                            return connection.rollback(() => {
                                connection.release();
                                console.error('Error executing updateEmployee1:', err);
                                reject(err);
                            });
                        }

                        console.log('updateEmployee1 affectedRows:', results.affectedRows);

                        // 执行第二个更新
                        connection.query(updateEmployee2, (err, results) => {
                            if (err) {
                                return connection.rollback(() => {
                                    connection.release();
                                    console.error('Error executing updateEmployee2:', err);
                                    reject(err);
                                });
                            }

                            console.log('updateEmployee2 affectedRows:', results.affectedRows);

                            // 提交事务
                            connection.commit(err => {
                                if (err) {
                                    return connection.rollback(() => {
                                        connection.release();
                                        console.error('Error committing transaction:', err);
                                        reject(err);
                                    });
                                }

                                console.log('timeslotemployees updated successfully.');
                                connection.release();
                                resolve();
                            });
                        });
                    });
                });
            });
        });
    });
}

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
