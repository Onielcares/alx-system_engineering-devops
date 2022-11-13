-- Create a database to test replication
CREATE DATABASE IF NOT EXISTS tyrell_corp;
CREATE TABLE IF NOT EXISTS tyrell_corp.nexus6(
        id INT,
        name VARCHAR(256)
);
INSERT INTO tyrell_corp.nexus6 (id, name) VALUES (1, 'leon');
GRANT SELECT ON tyrell_corp.nexus6 TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;