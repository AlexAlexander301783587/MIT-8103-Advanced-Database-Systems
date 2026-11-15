# Portfolio 3: Transactions and Concurrency

## 1. Course Information

- **Course:** MIT 8103 – Advanced Database Systems
- **Portfolio:** 3 – Transactions and Concurrency
- **Case Study:** Agricultural Workforce Attendance Management System
- **Organisation:** GreenFields Agricultural Operations Ltd.
- **Database Management System:** PostgreSQL 18
- **Database Tool:** pgAdmin 4

## 2. Project Overview

This portfolio focuses on database transactions, concurrency control and transaction management using PostgreSQL.

The practical exercises use the Agricultural Workforce Attendance Management System developed in Portfolio 1.

The objective is to demonstrate how database transactions maintain data consistency, how PostgreSQL handles simultaneous database operations and how transaction control mechanisms protect attendance records from inconsistent updates.

## 3. Project Objectives

The objectives of this portfolio are to:

- Understand the ACID properties of database transactions.
- Demonstrate transaction execution using BEGIN, COMMIT and ROLLBACK.
- Understand transaction isolation levels.
- Demonstrate the REPEATABLE READ isolation level.
- Examine concurrent database updates.
- Understand row-level locking and concurrency control.
- Demonstrate how database deadlocks occur and how PostgreSQL handles them.
- Understand the importance of transaction management in maintaining data integrity.

## 4. Practical Activities

The following activities are covered:

| No. | Activity | Description |
|---|---|---|
| 1 | ROLLBACK | Demonstrate how to reverse an uncommitted database transaction. |
| 2 | COMMIT | Demonstrate how to permanently save transaction changes. |
| 3 | Transaction isolation | Examine how REPEATABLE READ provides a consistent transaction snapshot. |
| 4 | Concurrent updates | Demonstrate simultaneous updates to the same attendance record. |
| 5 | Row-level locking | Examine how PostgreSQL controls access to records during concurrent transactions. |
| 6 | Deadlock demonstration | Demonstrate conflicting transaction locks and PostgreSQL deadlock detection. |

## 5. Database Environment

**Database name:** `agricultural_workforce_attendance`

**Database Management System:** PostgreSQL 18

**Database client:** pgAdmin 4

Two separate PostgreSQL Query Tool sessions are used for exercises requiring simultaneous transactions.

Synthetic employee attendance records are used for practical testing to avoid modifying actual employee records.

## 6. Transaction Management

PostgreSQL transaction control commands were used to demonstrate transaction management.

The main commands include:

| Command | Purpose |
|---|---|
| `BEGIN` | Starts a transaction. |
| `COMMIT` | Permanently saves transaction changes. |
| `ROLLBACK` | Reverses uncommitted changes. |
| `SET TRANSACTION ISOLATION LEVEL` | Sets the isolation level for a transaction. |
| `SELECT ... FOR UPDATE` | Locks selected rows against conflicting updates. |

## 7. Concurrency Control

The practical exercises demonstrate how PostgreSQL manages concurrent database operations.

The exercises examine:

- Transaction isolation using REPEATABLE READ.
- Concurrent updates to the same attendance record.
- Row-level locking.
- Deadlock detection and transaction recovery.

These mechanisms are important in an attendance management system where multiple authorised users may access or update attendance records simultaneously.

## 8. Folder Structure

```text
Alex_Alexander_301783587_portfolio-3-transactions-concurrency/
│
├── README.md
│
├── documentation/
│   └── portfolio-3-transactions-concurrency.md
│
├── sql/
│   ├── 01_transaction_rollback.sql
│   ├── 02_transaction_commit.sql
│   ├── 03_repeatable_read_session_a.sql
│   ├── 04_repeatable_read_session_b.sql
│   ├── 05_concurrent_update_session_a.sql
│   ├── 06_concurrent_update_session_b.sql
│   ├── 07_row_level_locking.sql
│   ├── 08_deadlock_session_a.sql
│   ├── 09_deadlock_session_b.sql
│   └── 10_deadlock_recovery.sql
│
└── screenshots/
    ├── 01_rollback_demonstration.png
    ├── 02_commit_demonstration.png
    ├── 03_repeatable_read_session_a.png
    ├── 04_repeatable_read_session_b.png
    ├── 05_concurrent_update.png
    ├── 06_row_level_locking.png
    └── 07_deadlock_detection.png
```

## 9. Implementation Evidence

SQL scripts demonstrating transaction management and concurrency control are stored in the `sql` folder.

Screenshots showing transaction execution, query results, concurrent operations, locking behaviour, and deadlock detection are stored in the `screenshots` folder.

The detailed explanation of transaction management, ACID properties, isolation levels, concurrency control, and practical implementation is provided in:

`documentation/portfolio-3-transactions-concurrency.md`

## 10. Learning Outcomes

This portfolio demonstrates practical understanding of database transactions, ACID properties, transaction isolation, concurrency control, row-level locking, and deadlock detection.

It also provides experience understanding how PostgreSQL protects database consistency when multiple transactions operate on shared data.

## 11. References

- https://github.com/AlexAlexander301783587/MIT-8103-Advanced-Database-Systems
- PostgreSQL Documentation: https://www.postgresql.org/docs/
- Course materials: MIT 8103 – Advanced Database Systems.