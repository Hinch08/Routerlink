CREATE DATABASE routerlink;
USE routerlink;
CREATE TABLE routers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    ip_address VARCHAR(15) NOT NULL,
    location VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
if NOT EXISTS (SELECT * FROM information_schema.tables WHERE table_name = 'links' AND table_schema = 'routerlink') THEN
CREATE TABLE links (
    id INT AUTO_INCREMENT PRIMARY KEY,
    router_id INT,
    link_type VARCHAR(50),
    bandwidth INT,
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (router_id) REFERENCES routers(id)
);
END IF;
