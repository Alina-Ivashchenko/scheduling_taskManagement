// Import the database connection
const connection = require('./db');

/**
 * Function to create a new notification in the database
 * @param {number} userId - The ID of the user
 * @param {string} message - The message content for the notification
 */
function createNotification(userId, message) {
    const sql = 'INSERT INTO notifications (user_id, message, timestamp) VALUES (?, ?, NOW())';
    connection.query(sql, [userId, message], (err, result) => {
        if (err) {
            console.error('Error creating notification:', err);
            return;
        }
        console.log('Notification created for User ID:', userId);
    });
}

/**
 * Function to retrieve notifications for a specific user
 * @param {number} userId - The ID of the user
 * @param {function} callback - The callback function to handle the results
 */
function getNotificationsForUser(userId, callback) {
    const sql = 'SELECT * FROM notifications WHERE user_id = ?';
    connection.query(sql, [userId], (err, results) => {
        if (err) {
            console.error('Error retrieving notifications:', err);
            callback(err, null);
            return;
        }
        callback(null, results);
    });
}

// Export the functions to be used in other parts of the application
module.exports = { createNotification, getNotificationsForUser };
