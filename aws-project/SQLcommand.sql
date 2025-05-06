show DATABASES;

use prodatabase;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL
);

INSERT INTO users (username, password, email) 
VALUES 
('chandru', 'kvs123#', 'hellochandru@gmail.com'),
('vijay', 'vijay890', 'vijay@gmail.com'),
('raja', 'raja546', 'raja@gmail.com');

SELECT * FROM users;
