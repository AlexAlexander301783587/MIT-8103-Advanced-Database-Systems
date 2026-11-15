# MIT 8103 – Advanced Database Systems
## Portfolio 5: Distributed and Cloud Database Exercise

**Student:** Alex Alexander  
**Student ID:** 301783587  
**Case Study:** Agricultural Workforce Attendance Management System  
**Database Platform:** PostgreSQL 18

### 1. Overview

This portfolio explores distributed database concepts using PostgreSQL logical replication. The exercise uses the Agricultural Workforce Attendance Management System developed in the earlier portfolios.

The objective is to demonstrate how attendance data can be replicated from an operational database to a separate reporting database.

### 2. Database Architecture

| Component | Database |
|---|---|
| Publisher | `agricultural_workforce_attendance` |
| Subscriber | `attendance_reporting_db` |
| Publication | `attendance_publication` |

The publication includes these tables:

- `farm_locations`
- `employees`
- `attendance`

Both databases are currently hosted on the same local PostgreSQL server. This is a practical logical replication exercise, not a geographically distributed deployment.

### 3. Work Completed

- Configured PostgreSQL logical replication using `wal_level = logical`.
- Set `max_wal_senders = 10`.
- Set `max_replication_slots = 10`.
- Created the subscriber database.
- Created the publication for the three attendance system tables.
- Verified the publication contains the three tables.
- Compared publisher and subscriber table column counts.

### 4. Remaining Activities

- Verify subscriber primary keys and constraints.
- Create the logical replication subscription.
- Verify initial data synchronisation.
- Test INSERT, UPDATE and DELETE replication.
- Capture implementation screenshots and query results.
- Complete the final replication analysis.

### 5. Folder Structure

```text
Alex_Alexander_301783587_portfolio-5-distributed-cloud/
│
├── README.md
├── sql/
├── screenshots/
└── documentation/
```

### 6. Evidence

Screenshots, SQL scripts and implementation results will be stored in their respective folders as the remaining activities are completed.

### 7. Conclusion

This exercise demonstrates the practical preparation of PostgreSQL logical replication for an agricultural workforce attendance reporting environment. The final conclusion will be updated after subscription and replication testing.