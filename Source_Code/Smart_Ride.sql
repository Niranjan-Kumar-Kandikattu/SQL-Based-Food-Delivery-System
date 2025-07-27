create database smartride;
use smartride;
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    gender CHAR(1),
    age INT,
    city VARCHAR(50),
    signup_date DATE
);
INSERT INTO Users (user_id, full_name, gender, age, city, signup_date) 
VALUES 
(1001, 'Rajendra Sharma', 'M', 40, 'Chennai', '2022-08-21'),
(1002, 'Anjali Nair', 'F', 30, 'Hyderabad', '2022-06-13'),
(1003, 'Ravi Kumar', 'M', 40, 'Bengaluru', '2022-02-08'),
(1004, 'Meera Reddy', 'F', 28, 'Kochi', '2022-12-05'),
(1005, 'Sumanth Yadav', 'M', 25, 'Vijayawada', '2022-07-09'),
(1006, 'Sakshi Verma', 'F', 21, 'Chennai', '2022-01-03'),
(1007, 'Pooja Mehta', 'F', 32, 'Hyderabad', '2022-06-16'),
(1008, 'Harsha Rao', 'M', 27, 'Bengaluru', '2022-11-13'),
(1009, 'Leela Devi', 'F', 23, 'Kochi', '2022-06-28'),
(1010, 'Amit Raj', 'M', 39, 'Vijayawada', '2022-09-08');

CREATE TABLE Drivers (
    driver_id INT PRIMARY KEY,
    driver_name VARCHAR(100),
    vehicle_type VARCHAR(20),
    city VARCHAR(50),
    rating DECIMAL(2,1),
    joined_on DATE,
    total_rides INT,
    is_active VARCHAR(3)
);
INSERT INTO Drivers (driver_id, driver_name, vehicle_type, city, rating, joined_on, total_rides, is_active) 
VALUES
(501, 'Vikram Patil', 'Bike', 'Chennai', 4.7, '2022-05-06', 425, 'Yes'),
(502, 'Priya Rao', 'Auto', 'Hyderabad', 3.9, '2022-01-08', 184, 'Yes'),
(503, 'Mohan Kaur', 'Bike', 'Bengaluru', 4.5, '2022-05-16', 329, 'Yes'),
(504, 'Sandeep Kumar', 'Auto', 'Kochi', 3.9, '2021-06-21', 392, 'Yes'),
(505, 'Rajiv Sharma', 'Bike', 'Vijayawada', 4.9, '2022-05-19', 271, 'Yes'),
(506, 'Aarti Gupta', 'Auto', 'Chennai', 3.8, '2022-05-10', 326, 'Yes'),
(507, 'Vishal Jha', 'Bike', 'Hyderabad', 4.6, '2021-12-21', 386, 'Yes'),
(508, 'Ravi Singh', 'Auto', 'Bengaluru', 4.7, '2021-08-29', 456, 'Yes'),
(509, 'Shruti Mehra', 'Bike', 'Kochi', 4.3, '2021-07-11', 291, 'Yes'),
(510, 'Karan Patel', 'Auto', 'Vijayawada', 4.3, '2022-01-26', 214, 'Yes');

CREATE TABLE Rides (
    ride_id INT PRIMARY KEY,
    user_id INT,
    driver_id INT,
    start_location VARCHAR(100),
    end_location VARCHAR(100),
    fare DECIMAL(6,2),
    ride_date DATE,
    payment_mode VARCHAR(20),
    status VARCHAR(20),
    ride_duration INT,
    distance_km DECIMAL(4,1),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);
INSERT INTO Rides (ride_id, user_id, driver_id, start_location, end_location, fare, ride_date, payment_mode, status, ride_duration, distance_km) 
VALUES 
(9001, 1001, 501, 'T. Nagar', 'Velachery', 282.85, '2023-04-06', 'UPI', 'Completed', 43, 14.6),
(9002, 1002, 502, 'Velachery', 'Banjara Hills', 151.83, '2023-04-03', 'Cash', 'Completed', 24, 7.7),
(9003, 1003, 503, 'Banjara Hills', 'Gachibowli', 148.93, '2023-04-08', 'UPI', 'Completed', 33, 7.1),
(9004, 1004, 504, 'Gachibowli', 'Indiranagar', 278.59, '2023-03-28', 'Cash', 'Completed', 30, 7.7),
(9005, 1005, 505, 'Indiranagar', 'Kakkanad', 132.31, '2023-03-01', 'UPI', 'Completed', 21, 8.0),
(9006, 1006, 506, 'Kakkanad', 'MG Road', 215.87, '2023-04-04', 'Cash', 'Completed', 10, 6.0),
(9007, 1007, 507, 'MG Road', 'Jubilee Hills', 175.02, '2023-04-28', 'UPI', 'Completed', 20, 14.3),
(9008, 1008, 508, 'Jubilee Hills', 'Besant Nagar', 137.43, '2023-04-02', 'Cash', 'Completed', 22, 6.9),
(9009, 1009, 509, 'Besant Nagar', 'Whitefield', 213.16, '2023-03-08', 'UPI', 'Completed', 36, 6.8),
(9010, 1010, 510, 'Whitefield', 'T. Nagar', 113.21, '2023-03-13', 'Cash', 'Completed', 33, 14.7);

CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY,
    ride_id INT,
    user_rating INT,
    user_comment VARCHAR(255),
    FOREIGN KEY (ride_id) REFERENCES Rides(ride_id)
);
INSERT INTO Feedback (feedback_id, ride_id, user_rating, user_comment)
 VALUES
(3001, 9001, 4, 'Smooth ride'),
(3002, 9002, 3, 'Driver was a bit late'),
(3003, 9003, 5, 'Excellent experience'),
(3004, 9004, 4, 'Very helpful driver'),
(3005, 9005, 2, 'Vehicle not clean'),
(3006, 9006, 5, 'Quick and safe'),
(3007, 9007, 3, 'Too much traffic'),
(3008, 9008, 4, 'Good overall'),
(3009, 9009, 5, 'Great conversation with driver'),
(3010, 9010, 1, 'Very late and rude driver');

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    ride_id INT,
    amount DECIMAL(6,2),
    payment_mode VARCHAR(20),
    payment_status VARCHAR(20),
    payment_time DATETIME,
    FOREIGN KEY (ride_id) REFERENCES Rides(ride_id)
);
INSERT INTO Payments (payment_id, ride_id, amount, payment_mode, payment_status, payment_time)
 VALUES 
(4001, 9001, 282.85, 'UPI', 'Success', '2023-04-06 10:23:00'),
(4002, 9002, 151.83, 'Cash', 'Success', '2023-04-03 09:15:00'),
(4003, 9003, 148.93, 'UPI', 'Success', '2023-04-08 13:47:00'),
(4004, 9004, 278.59, 'Cash', 'Success', '2023-03-28 11:00:00'),
(4005, 9005, 132.31, 'UPI', 'Success', '2023-03-01 17:20:00'),
(4006, 9006, 215.87, 'Cash', 'Success', '2023-04-04 18:55:00'),
(4007, 9007, 175.02, 'UPI', 'Success', '2023-04-28 20:12:00'),
(4008, 9008, 137.43, 'Cash', 'Success', '2023-04-02 08:35:00'),
(4009, 9009, 213.16, 'UPI', 'Success', '2023-03-08 06:45:00'),
(4010, 9010, 113.21, 'Cash', 'Success', '2023-03-13 21:10:00');

CREATE TABLE Support_Tickets (
    ticket_id INT PRIMARY KEY,
    user_id INT,
    ride_id INT,
    issue_type VARCHAR(50),
    status VARCHAR(20),
    created_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (ride_id) REFERENCES Rides(ride_id)
);
INSERT INTO Support_Tickets (ticket_id, user_id, ride_id, issue_type, status, created_at) 
VALUES 
(6001, 1001, 9001, 'Late Arrival', 'Resolved', '2023-04-06 12:00:00'),
(6002, 1002, 9002, 'Fare Dispute', 'Pending', '2023-04-03 13:30:00'),
(6003, 1003, 9003, 'Driver Behavior', 'Resolved', '2023-04-08 14:10:00'),
(6004, 1004, 9004, 'Vehicle Cleanliness', 'Open', '2023-03-28 15:45:00'),
(6005, 1005, 9005, 'Wrong Route', 'Resolved', '2023-03-01 08:20:00'),
(6006, 1006, 9006, 'Driver Late', 'Resolved', '2023-04-04 09:10:00'),
(6007, 1007, 9007, 'App Crash', 'Pending', '2023-04-28 10:00:00'),
(6008, 1008, 9008, 'Payment Not Received', 'Open', '2023-04-02 11:55:00'),
(6009, 1009, 9009, 'Driver Rude', 'Resolved', '2023-03-08 13:25:00'),
(6010, 1010, 9010, 'Trip Cancelled', 'Pending', '2023-03-13 16:40:00');

-- stored procedures
DELIMITER $$

CREATE PROCEDURE GetActiveDriversByCity(IN p_city VARCHAR(255))
BEGIN
    SELECT driver_id, driver_name, vehicle_type, city, rating, total_rides
    FROM Drivers
    WHERE city = p_city AND is_active = 'Yes';
END$$

DELIMITER $$

CREATE PROCEDURE DeactivateDriver(IN p_driver_id INT)
BEGIN
    UPDATE Drivers
    SET is_active = 'No'
    WHERE driver_id = p_driver_id;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE GetDriverEarningsReport(IN p_driver_id INT)
BEGIN
    SELECT d.driver_name, COUNT(r.ride_id) AS total_rides, SUM(r.fare) AS total_earnings, AVG(r.fare) AS average_fare
    FROM Drivers d
    JOIN Rides r ON d.driver_id = r.driver_id
    WHERE d.driver_id = p_driver_id
    GROUP BY d.driver_id;
END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE GetDriverWithMostComplaints()
BEGIN
    SELECT d.driver_name, COUNT(t.ticket_id) AS total_complaints
    FROM Drivers d
    JOIN Rides r ON d.driver_id = r.driver_id
    JOIN Support_Tickets t ON r.ride_id = t.ride_id
    GROUP BY d.driver_id
    ORDER BY total_complaints DESC
    LIMIT 1;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE GetPendingSupportTicketsForUser(IN p_user_id INT)
BEGIN
    SELECT ticket_id, issue_type, status, created_at
    FROM Support_Tickets
    WHERE user_id = p_user_id AND status = 'Pending';
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE activateDriver(IN p_driver_id INT)
BEGIN
    UPDATE Drivers
    SET is_active = 'yes'
    WHERE driver_id = p_driver_id;
END$$

DELIMITER ;

-- views

CREATE VIEW DriverFeedbackSummary AS
SELECT d.driver_id, d.driver_name, COUNT(f.feedback_id) AS total_feedbacks, AVG(f.user_rating) AS avg_feedback
FROM Drivers d
LEFT JOIN Rides r ON d.driver_id = r.driver_id
LEFT JOIN Feedback f ON r.ride_id = f.ride_id
GROUP BY d.driver_id;

CREATE VIEW UsersWithPendingTickets AS
SELECT u.user_id, u.full_name, u.city, t.ticket_id, t.issue_type, t.status
FROM Users u
JOIN Support_Tickets t ON u.user_id = t.user_id
WHERE t.status = 'Pending';

CREATE VIEW TotalRidesByDriver AS
SELECT driver_id, driver_name, SUM(total_rides) AS total_completed_rides
FROM Drivers
GROUP BY driver_id;

CREATE VIEW CityRideStatistics AS
SELECT r.start_location AS city, COUNT(r.ride_id) AS total_rides, SUM(r.fare) AS total_earnings, AVG(r.fare) AS average_fare
FROM Rides r
GROUP BY r.start_location;

CREATE VIEW TopCitiesByRides AS
SELECT r.start_location AS city, COUNT(r.ride_id) AS total_rides
FROM Rides r
GROUP BY r.start_location
ORDER BY total_rides DESC
LIMIT 5;
