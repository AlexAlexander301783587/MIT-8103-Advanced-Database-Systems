

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



INSERT INTO farm_locations (location_name, description)
VALUES
    ('Test Farm North', 'Demonstration farm location'),
    ('Test Farm South', 'Demonstration farm location');

SELECT * FROM farm_locations;



INSERT INTO employees (
    employee_no,
    first_name,
    last_name,
    location_id,
    employment_date,
    employment_status
)
VALUES
    (
        'TEST-EMP-001',
        'John',
        'James',
        (SELECT location_id FROM farm_locations
         WHERE location_name = 'Test Farm North'),
        '2025-01-15',
        'Active'
    ),
    (
        'TEST-EMP-002',
        'Mary',
        'Johnson',
        (SELECT location_id FROM farm_locations
         WHERE location_name = 'Test Farm North'),
        '2025-03-10',
        'Active'
    ),
    (
        'TEST-EMP-003',
        'David',
        'Williams',
        (SELECT location_id FROM farm_locations
         WHERE location_name = 'Test Farm South'),
        '2025-06-20',
        'Active'
    );

SELECT * FROM employees;


SELECT location_id
FROM farm_locations
WHERE location_name = 'Test Farm North'



INSERT INTO attendance (
    employee_id,
    location_id,
    attendance_date,
    check_in_time,
    check_out_time,
    attendance_status
)
VALUES
(
    (SELECT employee_id FROM employees
     WHERE employee_no = 'TEST-EMP-001'),
    (SELECT location_id FROM farm_locations
     WHERE location_name = 'Test Farm North'),
    '2026-11-11',
    '2026-11-11 07:00:00+01',
    '2026-11-11 16:00:00+01',
    'Present'
),
(
    (SELECT employee_id FROM employees
     WHERE employee_no = 'TEST-EMP-002'),
    (SELECT location_id FROM farm_locations
     WHERE location_name = 'Test Farm North'),
    '2026-11-11',
    '2026-11-11 07:20:00+01',
    '2026-11-11 16:10:00+01',
    'Late'
),
(
    (SELECT employee_id FROM employees
     WHERE employee_no = 'TEST-EMP-003'),
    (SELECT location_id FROM farm_locations
     WHERE location_name = 'Test Farm South'),
    '2026-11-11',
    NULL,
    NULL,
    'Absent'
);

SELECT * FROM attendance;



SELECT
    e.employee_no,
    e.first_name,
    e.last_name,
    fl.location_name,
    a.attendance_date,
    a.check_in_time,
    a.check_out_time,
    a.attendance_status
FROM attendance a
INNER JOIN employees e
    ON a.employee_id = e.employee_id
INNER JOIN farm_locations fl
    ON a.location_id = fl.location_id
ORDER BY e.employee_no;


INSERT INTO attendance (
    employee_id,
    location_id,
    attendance_date,
    attendance_status
)
VALUES (
    (SELECT employee_id FROM employees
     WHERE employee_no = 'TEST-EMP-001'),
    (SELECT location_id FROM farm_locations
     WHERE location_name = 'Test Farm North'),
    '2026-11-11',
    'Present'
);


INSERT INTO attendance (
    employee_id,
    location_id,
    attendance_date,
    attendance_status
)
VALUES (
    (SELECT employee_id FROM employees
     WHERE employee_no = 'TEST-EMP-001'),
    (SELECT location_id FROM farm_locations
     WHERE location_name = 'Test Farm North'),
    '2026-11-12',
    'Holiday'
);


INSERT INTO attendance (
    employee_id,
    location_id,
    attendance_date,
    check_in_time,
    check_out_time,
    attendance_status
)
VALUES (
    (SELECT employee_id FROM employees
     WHERE employee_no = 'TEST-EMP-001'),
    (SELECT location_id FROM farm_locations
     WHERE location_name = 'Test Farm North'),
    '2026-11-12',
    '2026-11-12 16:00:00+01',
    '2026-11-12 07:00:00+01',
    'Present'
);


SELECT
    e.employee_no,
    e.first_name,
    e.last_name,
    fl.location_name AS current_location
FROM employees e
INNER JOIN farm_locations fl
    ON e.location_id = fl.location_id
WHERE e.employee_no = 'TEST-EMP-001';



UPDATE employees
SET location_id = (
    SELECT location_id
    FROM farm_locations
    WHERE location_name = 'Test Farm South'
)
WHERE employee_no = 'TEST-EMP-001';



SELECT
    e.employee_no,
    a.attendance_date,
    fl.location_name AS attendance_location,
    a.attendance_status
FROM attendance a
INNER JOIN employees e
    ON a.employee_id = e.employee_id
INNER JOIN farm_locations fl
    ON a.location_id = fl.location_id
WHERE e.employee_no = 'TEST-EMP-001'
ORDER BY a.attendance_date;



INSERT INTO attendance (
    employee_id,
    location_id,
    attendance_date,
    check_in_time,
    check_out_time,
    attendance_status
)
VALUES (
    (
        SELECT employee_id
        FROM employees
        WHERE employee_no = 'TEST-EMP-001'
    ),
    (
        SELECT location_id
        FROM farm_locations
        WHERE location_name = 'Test Farm South'
    ),
    '2026-11-12',
    '2026-11-12 07:00:00+01',
    '2026-11-12 16:00:00+01',
    'Present'
);


SELECT
    table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_type = 'BASE TABLE'
  AND table_name IN (
      'farm_locations',
      'employees',
      'attendance'
  )
ORDER BY table_name;



SELECT
    table_name,
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name IN (
      'farm_locations',
      'employees',
      'attendance'
  )
ORDER BY table_name, ordinal_position;



SELECT
    tc.table_name,
    tc.constraint_name,
    tc.constraint_type
FROM information_schema.table_constraints tc
WHERE tc.table_schema = 'public'
  AND tc.table_name IN (
      'farm_locations',
      'employees',
      'attendance'
  )
ORDER BY tc.table_name, tc.constraint_type;


SELECT
    tc.table_name,
    kcu.column_name,
    ccu.table_name AS referenced_table,
    ccu.column_name AS referenced_column
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu
    ON tc.constraint_name = kcu.constraint_name
    AND tc.constraint_schema = kcu.constraint_schema
JOIN information_schema.constraint_column_usage ccu
    ON tc.constraint_name = ccu.constraint_name
    AND tc.constraint_schema = ccu.constraint_schema
WHERE tc.constraint_type = 'FOREIGN KEY'
  AND tc.table_schema = 'public'
ORDER BY tc.table_name;


SELECT
    (SELECT COUNT(*) FROM farm_locations) AS total_locations,
    (SELECT COUNT(*) FROM employees) AS total_employees,
    (SELECT COUNT(*) FROM attendance) AS total_attendance;



SELECT *
FROM employees;



SELECT
    e.employee_no,
    e.first_name,
    e.last_name,
    fl.location_name
FROM employees e
INNER JOIN farm_locations fl
    ON e.location_id = fl.location_id;


SELECT
    e.employee_no,
    e.first_name,
    e.last_name,
    a.attendance_date,
    a.attendance_status
FROM attendance a
INNER JOIN employees e
    ON a.employee_id = e.employee_id
WHERE a.attendance_status = 'Present';


SELECT
    attendance_status,
    COUNT(*) AS total_employees
FROM attendance
GROUP BY attendance_status
ORDER BY total_employees DESC;


SELECT
    employment_status,
    COUNT(*) AS total_employees
FROM employees
GROUP BY employment_status
ORDER BY total_employees DESC;


SELECT
    fl.location_name,
    COUNT(e.employee_id) AS total_employees
FROM farm_locations fl
LEFT JOIN employees e
    ON fl.location_id = e.location_id
GROUP BY fl.location_name
ORDER BY total_employees DESC;


SELECT
    attendance_status,
    COUNT(*) AS total_records
FROM attendance
GROUP BY attendance_status
ORDER BY total_records DESC;


SELECT
    ROUND(
        AVG(
            EXTRACT(EPOCH FROM (check_out_time - check_in_time)) / 3600
        )::NUMERIC,
        2
    ) AS average_working_hours
FROM attendance
WHERE check_in_time IS NOT NULL
  AND check_out_time IS NOT NULL;


EXPLAIN
SELECT
    e.employee_no,
    e.first_name,
    e.last_name,
    fl.location_name
FROM employees e
INNER JOIN farm_locations fl
    ON e.location_id = fl.location_id;



EXPLAIN ANALYZE
SELECT
    e.employee_no,
    e.first_name,
    e.last_name,
    fl.location_name
FROM employees e
INNER JOIN farm_locations fl
    ON e.location_id = fl.location_id;



EXPLAIN ANALYZE
SELECT
    attendance_date,
    attendance_status,
    COUNT(*) AS total_records
FROM attendance
WHERE attendance_date = DATE '2026-11-11'
GROUP BY attendance_date, attendance_status;


SELECT
    tablename,
    indexname,
    indexdef
FROM pg_indexes
WHERE schemaname = 'public'
  AND tablename IN ('employees', 'farm_locations', 'attendance')
ORDER BY tablename, indexname;


CREATE INDEX idx_attendance_date
ON attendance (attendance_date);


SELECT
    indexname,
    indexdef
FROM pg_indexes
WHERE tablename = 'attendance'
ORDER BY indexname;


EXPLAIN ANALYZE
SELECT
    attendance_id,
    employee_id,
    attendance_date,
    attendance_status
FROM attendance
WHERE attendance_date = DATE '2026-11-11';