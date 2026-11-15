# Portfolio 5: Distributed and Cloud Database Exercise

## 1. Introduction

This portfolio examines distributed database concepts through the implementation of PostgreSQL logical replication.

The selected case study is the Agricultural Workforce Attendance Management System. The system maintains employee information, farm location records and daily attendance information.

As the attendance database grows, management may require a separate database for reporting and analysis. Logical replication provides a mechanism for copying selected data from an operational database to another database.

The practical exercise uses PostgreSQL 18 to configure a publisher and subscriber architecture.

## 2. Objectives

The objectives are to:

1. Understand distributed database architecture.
2. Configure PostgreSQL for logical replication.
3. Create a publication containing selected database tables.
4. Prepare a separate subscriber database.
5. Establish logical replication between databases.
6. Test data synchronisation and evaluate its usefulness for reporting.

## 3. Proposed Architecture

The implementation uses two PostgreSQL databases:

**Publisher database:** `agricultural_workforce_attendance`

This is the existing operational database. It contains the employee, farm location and attendance records.

**Subscriber database:** `attendance_reporting_db`

This is the separate database intended to receive replicated data for reporting and analysis.

The publication is named `attendance_publication` and contains:

- `farm_locations`
- `employees`
- `attendance`

### Architecture flow

```text
Operational Attendance Database
agricultural_workforce_attendance
             |
             |
     attendance_publication
             |
             |
      Logical Replication
             |
             |
             v
Reporting Database
attendance_reporting_db
```

Both databases are hosted on the same local PostgreSQL server for this exercise. The architecture demonstrates database-level logical replication but does not represent geographical distribution or full high availability.

## 4. PostgreSQL Replication Configuration

PostgreSQL was configured to support logical replication.

The following settings were applied in the PostgreSQL configuration file:

| Parameter | Configured value | Purpose |
|---|---:|---|
| `wal_level` | `logical` | Enables logical decoding required for logical replication |
| `max_wal_senders` | `10` | Sets the maximum number of concurrent WAL sender processes |
| `max_replication_slots` | `10` | Allows replication slots to be created |

The PostgreSQL service was restarted after changing the configuration.

The `wal_level` setting was subsequently checked using:

```sql
SHOW wal_level;
```

The returned value was `logical`.

## 5. Publication Implementation

A publication named `attendance_publication` was created in the publisher database.

The SQL statement used was:

```sql
CREATE PUBLICATION attendance_publication
FOR TABLE
    public.farm_locations,
    public.employees,
    public.attendance;
```

The publication was verified using:

```sql
SELECT
    pubname,
    schemaname,
    tablename
FROM pg_publication_tables
WHERE pubname = 'attendance_publication'
ORDER BY tablename;
```

The verification returned the three intended tables.

This publication identifies the tables whose eligible changes can be sent to a subscriber.

## 6. Subscriber Database Preparation

A separate database named `attendance_reporting_db` was created.

The publisher and subscriber table structures were inspected using PostgreSQL's `information_schema.columns` view.

The verified column counts were:

| Table | Publisher | Subscriber |
|---|---:|---:|
| `farm_locations` | 3 | 3 |
| `employees` | 8 | 8 |
| `attendance` | 8 | 8 |

The publisher's column definitions were also inspected to establish the required structure.

Matching column counts alone do not prove that all column definitions, data types and constraints are identical. A further schema and primary-key verification is required before creating the subscription.

Logical replication does not automatically copy table definitions. The subscriber tables must be prepared separately.

## 7. Replication Testing

**Implementation status: Pending.**

The next practical activities are:

1. Verify the subscriber's primary keys and constraints.
2. Confirm the subscriber tables match the publisher's required structure.
3. Create a subscription to `attendance_publication`.
4. Verify that the initial table data is synchronised.
5. Insert a test record in the publisher and check whether it appears in the subscriber.
6. Update a test record and verify the change is replicated.
7. Test deletion using an appropriate test record.
8. Capture the query results and screenshots.

The results of these tests will be documented after successful execution.

## 8. Distributed Database Concepts

### 8.1 Replication

Replication maintains copies of selected data across multiple database locations or instances.

In this case study, the reporting database is intended to receive changes from the operational attendance database.

### 8.2 Sharding

Sharding involves dividing a large dataset into smaller portions and distributing those portions across multiple database servers.

For a larger agricultural operation, attendance records could potentially be partitioned or distributed according to farm location or operational region.

Sharding can improve scalability, but it introduces additional complexity in data distribution, query execution and maintenance.

### 8.3 Availability

A separate reporting database can help reporting activities continue independently of some workloads on the operational database.

However, logical replication alone does not guarantee high availability. Replication delays, subscriber failures and recovery procedures must also be considered.

### 8.4 Consistency

Logical replication is asynchronous. Changes committed on the publisher may take some time to appear on the subscriber.

Consequently, reports generated from the subscriber may briefly contain older information than the operational database.

This is an important consideration for attendance and payroll reporting.

### 8.5 Cloud Database Deployment

The same architecture could be implemented using managed PostgreSQL services in a cloud environment.

A cloud deployment would require appropriate network connectivity, authentication, security rules, backup policies and monitoring.

The current exercise uses a local PostgreSQL installation rather than a managed cloud database.

## 9. Advantages and Limitations

**Advantages**

- Separates reporting workloads from operational database activities.
- Allows selected tables to be replicated.
- Supports independent reporting and analysis.
- Demonstrates a practical approach to data distribution.

**Limitations**

- Replication is asynchronous.
- Subscriber table structures must be managed separately.
- Replication slots can retain WAL files if subscribers stop consuming changes.
- Logical replication does not automatically replicate all database objects or DDL.
- The current local setup does not demonstrate geographical resilience.

## 10. Reflection

This exercise demonstrates how PostgreSQL logical replication can support a separate reporting environment for an agricultural workforce attendance system.

It also highlights the importance of preparing matching subscriber tables, configuring replication parameters and verifying synchronisation.

The final reflection will be updated after completing the subscription and replication tests.

## 11. AI Declaration

ChatGPT was used as a learning and technical assistance tool to explain PostgreSQL logical replication, guide configuration, assist with SQL preparation and support the documentation process.

The SQL commands and implementation results are to be executed and verified by the student. Final claims in this portfolio will be based on actual implementation evidence.

## 12. References

PostgreSQL Global Development Group. *PostgreSQL Documentation: Logical Replication.*

https://www.postgresql.org/docs/current/logical-replication.html

PostgreSQL Global Development Group. *PostgreSQL Documentation: Configuration File.*

https://www.postgresql.org/docs/current/config-setting.html


**GitHub repository:** [(https://github.com/AlexAlexander301783587/MIT-8103-Advanced-Database-Systems.git)]