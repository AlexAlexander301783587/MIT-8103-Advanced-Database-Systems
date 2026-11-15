-- Confirm the connected database
SELECT current_database();

-- Check the tables in the public schema
SELECT
    table_schema,
    table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_type = 'BASE TABLE'
ORDER BY table_name;

-- Verify logical replication configuration
SHOW wal_level;
SHOW max_wal_senders;
SHOW max_replication_slots;



-- Check primary keys
SELECT
    tc.table_name,
    kcu.column_name,
    tc.constraint_name
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu
    ON tc.constraint_name = kcu.constraint_name
   AND tc.table_schema = kcu.table_schema
WHERE tc.constraint_type = 'PRIMARY KEY'
  AND tc.table_schema = 'public'
  AND tc.table_name IN (
      'farm_locations',
      'employees',
      'attendance'
  )
ORDER BY tc.table_name;

-- Check existing publications
SELECT
    pubname,
    puballtables
FROM pg_publication;

CREATE PUBLICATION attendance_publication
FOR TABLE
    public.farm_locations,
    public.employees,
    public.attendance;


SELECT
    pubname,
    schemaname,
    tablename
FROM pg_publication_tables
WHERE pubname = 'attendance_publication'
ORDER BY tablename;