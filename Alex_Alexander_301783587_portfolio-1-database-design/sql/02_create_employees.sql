

CREATE TABLE employees (
    employee_id INTEGER GENERATED ALWAYS AS IDENTITY,
    employee_no VARCHAR(30) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    location_id INTEGER NOT NULL,
    employment_date DATE NOT NULL,
    employment_status VARCHAR(20) NOT NULL DEFAULT 'Active',
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_employees
        PRIMARY KEY (employee_id),

    CONSTRAINT uq_employees_employee_no
        UNIQUE (employee_no),

    CONSTRAINT fk_employees_location
        FOREIGN KEY (location_id)
        REFERENCES farm_locations(location_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_employees_employment_status
        CHECK (employment_status IN ('Active', 'Inactive'))
);


SELECT
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_name = 'employees'
ORDER BY ordinal_position;


SELECT
    conname AS constraint_name,
    contype AS constraint_type
FROM pg_constraint
WHERE conrelid = 'employees'::regclass
ORDER BY conname;

