

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


CREATE TABLE attendance (
    attendance_id INTEGER GENERATED ALWAYS AS IDENTITY,
    employee_id INTEGER NOT NULL,
    location_id INTEGER NOT NULL,
    attendance_date DATE NOT NULL,
    check_in_time TIMESTAMPTZ,
    check_out_time TIMESTAMPTZ,
    attendance_status VARCHAR(20) NOT NULL,
    recorded_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_attendance
        PRIMARY KEY (attendance_id),

    CONSTRAINT fk_attendance_employee
        FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_attendance_location
        FOREIGN KEY (location_id)
        REFERENCES farm_locations(location_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT uq_employee_attendance_date
        UNIQUE (employee_id, attendance_date),

    CONSTRAINT chk_attendance_status
        CHECK (
            attendance_status IN (
                'Present',
                'Absent',
                'Late',
                'On Leave'
            )
        ),

    CONSTRAINT chk_attendance_checkout
        CHECK (
            check_in_time IS NULL
            OR check_out_time IS NULL
            OR check_out_time > check_in_time
        )
);



SELECT
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_name = 'attendance'
ORDER BY ordinal_position;



SELECT
    conname AS constraint_name,
    contype AS constraint_type
FROM pg_constraint
WHERE conrelid = 'attendance'::regclass
ORDER BY conname;


