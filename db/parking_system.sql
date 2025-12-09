-- Create th/parking_system_wzj8e database
CREATE DATABASE parking_system;

-- Connect to it
\c parking_system;

-- Create the tables (updated for Postgres)
CREATE TABLE users (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    id_number VARCHAR(50) NOT NULL,
    vehicle_type VARCHAR(50) NOT NULL,
    mobile_no VARCHAR(20) NOT NULL,
    plate_number VARCHAR(20) NOT NULL UNIQUE,
    qr_code_path TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE parking_logs (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    plate_number VARCHAR(20),
    time_in TIMESTAMP,
    time_out TIMESTAMP
);
ALTER TABLE parking_logs
ADD COLUMN parking_area VARCHAR(100);







ON CONFLICT DO NOTHING;
SELECT * FROM user

CREATE TABLE IF NOT EXISTS parking_areas (
    area_code VARCHAR(50) PRIMARY KEY,   -- e.g. 'hiraya', 'agriculture', 'kinaadman', ...
    area_name VARCHAR(150),
    capacity INT NOT NULL,               -- max vehicles allowed
    current_count INT NOT NULL DEFAULT 0 -- current vehicles inside
);

INSERT INTO parking_areas (area_code, area_name, capacity, current_count)
VALUES
  ('hiraya', 'Hiraya Parking Lot', 100, 0),
  ('agriculture', 'Agriculture Parking Lot', 80, 0),
  ('kinaadman', 'Kinaadman Grounds', 120, 0),
  ('hero_lib', 'Hero Lib Parking Lot', 60, 0),
  ('forestry', 'Forestry Parking Lot', 50, 0),
  ('nsb', 'NSB Parking Lot', 40, 0)
ON CONFLICT (area_code) DO NOTHING;







-- 1. Create the database
CREATE DATABASE parking_system;

-- 2. Connect to it
\c parking_system;

-- 3. Create users table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    id_number VARCHAR(50) NOT NULL,
    vehicle_type VARCHAR(50) NOT NULL,
    mobile_no VARCHAR(20) NOT NULL,
    plate_number VARCHAR(20) NOT NULL UNIQUE,
    qr_code_path TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Create parking_logs table
CREATE TABLE IF NOT EXISTS parking_logs (
    id SERIAL PRIMARY KEY,
    plate_number VARCHAR(20),
    time_in TIMESTAMP,
    time_out TIMESTAMP,
    parking_area VARCHAR(50)
);

-- 5. Create parking_areas table
CREATE TABLE IF NOT EXISTS parking_areas (
    area_code VARCHAR(50) PRIMARY KEY,
    area_name VARCHAR(150),
    capacity INT NOT NULL,
    current_count INT NOT NULL DEFAULT 0
);

-- 6. Insert default parking areas
INSERT INTO parking_areas (area_code, area_name, capacity, current_count) VALUES
  ('hiraya', 'Hiraya Parking Lot', 100, 0),
  ('agriculture', 'Agriculture Parking Lot', 80, 0),
  ('kinaadman', 'Kinaadman Grounds', 120, 0),
  ('hero_lib', 'Hero Lib Parking Lot', 60, 0),
  ('forestry', 'Forestry Parking Lot', 50, 0),
  ('nsb', 'NSB Parking Lot', 40, 0)
ON CONFLICT (area_code) DO NOTHING;
CREATE TABLE IF NOT EXISTS entry_exit_history (
    id SERIAL PRIMARY KEY,
    plate_number VARCHAR(20),
    action VARCHAR(10), -- "in" or "out"
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



-- 7. (Optional) check tables
\dt
SELECT * FROM parking_areas;
SELECT * FROM users;
SELECT * FROM parking_logs;



------------------------------------





-- Connect to parking_system:
-- \c parking_system

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    id_number VARCHAR(50) NOT NULL,
    vehicle_type VARCHAR(50) NOT NULL,
    mobile_no VARCHAR(20) NOT NULL,
    plate_number VARCHAR(20) NOT NULL UNIQUE,
    qr_code_path TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS parking_logs (
    id SERIAL PRIMARY KEY,
    plate_number VARCHAR(20),
    time_in TIMESTAMP,
    time_out TIMESTAMP,
    parking_area VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS parking_areas (
    area_code VARCHAR(50) PRIMARY KEY,
    area_name VARCHAR(150),
    capacity INT NOT NULL,
    current_count INT NOT NULL DEFAULT 0
);

INSERT INTO parking_areas (area_code, area_name, capacity, current_count) VALUES
  ('hiraya', 'Hiraya Parking Lot', 100, 0),
  ('agriculture', 'Agriculture Parking Lot', 80, 0),
  ('kinaadman', 'Kinaadman Grounds', 120, 0),
  ('hero_lib', 'Hero Lib Parking Lot', 60, 0),
  ('forestry', 'Forestry Parking Lot', 50, 0),
  ('nsb', 'NSB Parking Lot', 40, 0)
ON CONFLICT (area_code) DO NOTHING;

select * from users
select * from parking_areas
Select * from parking_logs

ALTER TABLE users ADD COLUMN created_at TIMESTAMP DEFAULT NOW();


UPDATE users
SET created_at = NOW()
WHERE created_at IS NULL;

SELECT id, full_name, created_at FROM users;


