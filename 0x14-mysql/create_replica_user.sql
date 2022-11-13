-- Create a replica user
CREATE USER 'replica_user'@'%' IDENTIFIED BY 'projectcorrection280hbtn';
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
GRANT SELECT ON mysql.user TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;