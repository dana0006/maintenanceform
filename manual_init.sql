-- Create only the essential table that Odoo is looking for
CREATE TABLE IF NOT EXISTS ir_module_module (
    id serial PRIMARY KEY,
    name varchar NOT NULL,
    state varchar(16),
    latest_version varchar
);

-- Insert base module record
INSERT INTO ir_module_module (name, state, latest_version) 
VALUES ('base', 'installed', '18.0.1.0')
ON CONFLICT (name) DO NOTHING;