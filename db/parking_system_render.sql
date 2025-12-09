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

CREATE TABLE IF NOT EXISTS entry_exit_history (
    id SERIAL PRIMARY KEY,
    plate_number VARCHAR(20),
    action VARCHAR(10), -- "in" or "out"
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
