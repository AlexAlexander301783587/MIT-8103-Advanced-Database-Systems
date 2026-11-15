# PORTFOLIO 3: TRANSACTIONS AND CONCURRENCY

**Course:** MIT 8103 – Advanced Database Systems  
**Programme:** Master of Information Technology  
**Case Study:** Agricultural Workforce Attendance Management System  
**Organisation:** GreenFields Agricultural Operations Ltd.  
**Database Management System:** PostgreSQL 18  
**Database Tool:** pgAdmin 4

---

## 1. Introduction

This portfolio examines database transactions, transaction management, isolation levels and concurrency control using PostgreSQL.

The practical exercises were based on the Agricultural Workforce Attendance Management System developed in Portfolio 1.

The purpose was to understand how database transactions maintain data consistency, how changes can be committed or rolled back, and how PostgreSQL manages simultaneous access to database records.

The exercises also examined concurrency problems, row-level locking and deadlock detection.

## 2. Transaction Management

A database transaction is a sequence of database operations treated as one logical unit of work.

In the attendance management system, transactions are important when supervisors correct employee attendance records. The correction should either be successfully saved or cancelled without leaving an incomplete change.

### 2.1 ACID Properties

Database transactions follow four fundamental properties known as ACID.

| Property | Explanation | Attendance system application |
|---|---|---|
| Atomicity | All operations succeed or none are applied. | An attendance correction should not be partially completed. |
| Consistency | Transactions maintain database rules and constraints. | Attendance records must contain valid statuses and relationships. |
| Isolation | Concurrent transactions are controlled to prevent improper interference. | Multiple supervisors should not unintentionally overwrite each other's updates. |
| Durability | Committed changes remain saved. | Approved attendance corrections remain stored after completion. |

These properties help ensure the reliability and integrity of the database.

## 3. COMMIT and ROLLBACK Operations

Two important transaction commands implemented in this portfolio were COMMIT and ROLLBACK.

### 3.1 ROLLBACK

ROLLBACK cancels changes made within an active transaction that has not been committed.

The following SQL demonstrates the operation:

```sql
BEGIN;

UPDATE attendance a
SET attendance_status = 'Late'
FROM employees e
WHERE a.employee_id = e.employee_id
  AND e.employee_no = 'PERF-EMP-00001'
  AND a.attendance_date = CURRENT_DATE - 1;

ROLLBACK;
```

After ROLLBACK, the original attendance status is restored.

This demonstrates how an incorrect attendance correction can be cancelled before it becomes permanent.

### 3.2 COMMIT

COMMIT permanently saves changes made during an active transaction.

Example:

```sql
BEGIN;

UPDATE attendance a
SET attendance_status = 'Late'
FROM employees e
WHERE a.employee_id = e.employee_id
  AND e.employee_no = 'PERF-EMP-00001'
  AND a.attendance_date = CURRENT_DATE - 1;

COMMIT;
```

After COMMIT, the updated attendance status remains saved.

### 3.3 Difference Between COMMIT and ROLLBACK

| COMMIT | ROLLBACK |
|---|---|
| Saves transaction changes. | Cancels uncommitted transaction changes. |
| Ends the transaction successfully. | Ends the transaction by aborting its changes. |
| Changes remain in the database. | Previous committed values remain unchanged. |

## 4. Transaction Isolation Levels

Transaction isolation determines how concurrent transactions interact and what data changes they can observe.

PostgreSQL supports the following standard isolation levels.

| Isolation level | Description |
|---|---|
| Read Uncommitted | PostgreSQL treats this level as Read Committed. |
| Read Committed | Each statement sees data committed before that statement begins. |
| Repeatable Read | Repeated reads within a transaction use a consistent snapshot. |
| Serializable | Provides the strongest isolation and prevents non-serializable transaction outcomes. |

PostgreSQL uses Read Committed as its default isolation level.

### 4.1 Repeatable Read Implementation

The following statement was used to start a transaction with Repeatable Read isolation:

```sql
BEGIN;

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
```

A SELECT query was then executed to retrieve an employee's attendance record.

A second database session was used to update and commit the same record.

When the first transaction repeated its SELECT query, it continued to see the original value because Repeatable Read maintains a consistent snapshot.

After the first transaction ended, a new query could see the committed change.

This demonstrates the behaviour of Repeatable Read isolation in PostgreSQL.

## 5. Concurrency Problems and Control

Concurrency occurs when multiple transactions access or modify database records simultaneously.

One important concurrency problem is the Lost Update problem.

### 5.1 Lost Update Problem

A lost update can occur when one transaction overwrites a change made by another transaction without properly accounting for the earlier update.

In the attendance management system, two supervisors may attempt to correct the same employee's attendance record.

For example:

- Supervisor A changes the attendance status to Present.
- Supervisor B changes the same record to Absent.
- The final result may overwrite Supervisor A's correction.

This can lead to inaccurate attendance information if the updates are not properly managed.

### 5.2 PostgreSQL Concurrency Control

PostgreSQL uses Multi-Version Concurrency Control (MVCC) to manage concurrent database access.

MVCC allows transactions to work with different versions of records, reducing unnecessary blocking between readers and writers.

PostgreSQL also uses row-level locks to coordinate conflicting updates.

### 5.3 Row-Level Locking

The SELECT FOR UPDATE command was examined as a method of locking attendance records before modifying them.

Example:

```sql
BEGIN;

SELECT attendance_id, attendance_status
FROM attendance
WHERE employee_id = (
    SELECT employee_id
    FROM employees
    WHERE employee_no = 'PERF-EMP-00001'
)
AND attendance_date = CURRENT_DATE - 1
FOR UPDATE;

-- Perform the authorised attendance correction.

COMMIT;
```

The selected record remains locked until the transaction ends.

This prevents another transaction from modifying the same row while the lock is held.

## 6. Deadlocks and Transaction Management

A deadlock occurs when two or more transactions wait indefinitely for resources locked by each other.

### 6.1 Deadlock Scenario

The practical demonstration used two separate database sessions.

- Transaction A locked Employee 1's attendance record.
- Transaction B locked Employee 2's attendance record.
- Transaction A attempted to lock Employee 2's record.
- Transaction B attempted to lock Employee 1's record.

Both transactions were waiting for locks held by the other transaction.

This created a deadlock situation.

### 6.2 PostgreSQL Deadlock Detection

PostgreSQL automatically detects deadlocks.

When a deadlock is identified, PostgreSQL aborts one of the transactions to break the deadlock cycle.

The affected transaction can then be rolled back and retried where appropriate.

### 6.3 Deadlock Prevention

The following practices can help reduce deadlocks:

1. Acquire database locks in a consistent order.
2. Keep transactions as short as possible.
3. Avoid unnecessary locking.
4. Use appropriate indexes to improve record retrieval.
5. Implement transaction retry mechanisms for recoverable deadlock errors.

## 7. Practical Implementation Summary

The portfolio examined the following database transaction operations:

| Exercise | Practical implementation | Evidence |
|---|---|---|
| 1 | ROLLBACK transaction | Original value restored |
| 2 | COMMIT transaction | Updated value retained |
| 3 | Repeatable Read isolation | Consistent snapshot across queries |
| 4 | Concurrent updates | Row-level locking behaviour |
| 5 | Deadlock demonstration | Deadlock detection and recovery |

The screenshots and execution outputs should be included as supporting evidence for each exercise.

## 8. Conclusion

This portfolio provided practical experience in transaction management and concurrency control using PostgreSQL.

The exercises demonstrated how COMMIT and ROLLBACK manage database changes, how transaction isolation controls concurrent access, and how row-level locking helps coordinate simultaneous updates.

The deadlock exercise also demonstrated the importance of appropriate transaction management and PostgreSQL's automatic deadlock detection mechanism.

These concepts are essential for maintaining accurate and reliable workforce attendance records, particularly where multiple supervisors and administrators access the system simultaneously.

## 9. Individual Reflection

Through this practical exercise, I gained a better understanding of how relational databases manage transactions and concurrent access.

I learned the importance of COMMIT and ROLLBACK, the differences between transaction isolation levels, and how PostgreSQL uses MVCC and row-level locking to coordinate database operations.

The concurrency and deadlock exercises also improved my understanding of the problems that can occur when multiple users attempt to update the same database records.

These concepts are important when designing reliable enterprise database systems.

## 10. AI Assistance Declaration

ChatGPT was used as a learning and technical assistance tool during the development of this portfolio.

Its assistance included explaining transaction management, ACID properties, SQL transaction commands, isolation levels, concurrency problems, row-level locking and deadlock handling.

It also provided guidance on developing SQL examples and structuring the technical documentation.

The SQL examples and practical results must be reviewed, executed and verified by the student in PostgreSQL. The student remains responsible for understanding the implementation and ensuring that the submitted evidence reflects the actual practical work performed.

## 11. References

1. PostgreSQL Global Development Group. *PostgreSQL Documentation – Transaction Management*. https://www.postgresql.org/docs/current/tutorial-transactions.html
2. PostgreSQL Global Development Group. *PostgreSQL Documentation – Transaction Isolation*. https://www.postgresql.org/docs/current/transaction-iso.html
3. PostgreSQL Global Development Group. *PostgreSQL Documentation – Explicit Locking*. https://www.postgresql.org/docs/current/explicit-locking.html
4. PostgreSQL Global Development Group. *PostgreSQL Documentation – MVCC Introduction*. https://www.postgresql.org/docs/current/mvcc-intro.html

## 12. Supporting Evidence Checklist

- [ ] ROLLBACK transaction SQL and screenshots.
- [ ] COMMIT transaction SQL and screenshots.
- [ ] Transaction isolation level implementation.
- [ ] Repeatable Read results from both database sessions.
- [ ] Concurrent update demonstration.
- [ ] Row-level locking evidence.
- [ ] Deadlock simulation and PostgreSQL error message.
- [ ] Deadlock recovery or rollback evidence.
- [ ] SQL scripts committed to GitHub.
- [ ] GitHub repository URL included.

**GitHub repository:** [(https://github.com/AlexAlexander301783587/MIT-8103-Advanced-Database-Systems.git)]

**Submission:** Portfolio 3 – Transactions and Concurrency.