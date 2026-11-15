# PORTFOLIO 2: QUERY PROCESSING AND OPTIMISATION

**Course:** MIT 8103 – Advanced Database Systems  
**Programme:** Master of Information Technology  
**Case Study:** Agricultural Workforce Attendance Management System  
**Organisation:** GreenFields Agricultural Operations Ltd.  
**Database Management System:** PostgreSQL 18  
**Database Tool:** pgAdmin 4

---

## 1. Introduction

This portfolio demonstrates the development, execution and optimisation of SQL queries using PostgreSQL. The practical exercises were performed using the Agricultural Workforce Attendance Management System developed in Portfolio 1.

The main objective was to retrieve, filter, join, group and summarise workforce attendance information while examining how PostgreSQL executes queries and how indexing can improve database performance.

The exercises also involved generating synthetic attendance records to provide a larger dataset for performance testing.

## 2. Database Environment

The practical implementation used the following environment:

| Component | Description |
|---|---|
| Database | agricultural_workforce_attendance |
| DBMS | PostgreSQL 18 |
| Interface | pgAdmin 4 |
| Case study | Agricultural Workforce Attendance Management System |
| Main tables | employees, farm_locations, attendance |

The database contains three relational tables:

- **farm_locations:** Stores agricultural farm locations.
- **employees:** Stores employee information and current farm assignments.
- **attendance:** Stores employees' daily attendance information.

## 3. SQL Query Development

Several SQL queries were developed and executed to retrieve useful information from the database.

### 3.1 Basic SELECT Query

The following query retrieves employee records:

```sql
SELECT * FROM employees;
```

This query demonstrates basic data retrieval using the SELECT statement.

### 3.2 Employee and Farm Location JOIN

```sql
SELECT
    e.employee_no,
    e.first_name,
    e.last_name,
    fl.location_name
FROM employees e
INNER JOIN farm_locations fl
    ON e.location_id = fl.location_id;
```

The INNER JOIN combines employee records with their corresponding farm locations using the location_id foreign key.

### 3.3 Attendance Filtering

```sql
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
```

The WHERE clause filters the attendance records to display employees whose attendance status is Present.

### 3.4 Attendance Grouping

```sql
SELECT
    attendance_status,
    COUNT(*) AS total_employees
FROM attendance
GROUP BY attendance_status
ORDER BY total_employees DESC;
```

The GROUP BY clause groups attendance records according to their status, while COUNT() calculates the number of records in each group.

## 4. Aggregate Queries

Aggregate functions were used to summarise workforce and attendance information.

The practical exercises included:

1. Counting employees by employment status using COUNT() and GROUP BY.
2. Counting employees by farm location using LEFT JOIN.
3. Summarising attendance records by attendance status.
4. Calculating average working hours using AVG() and EXTRACT().

The average working-hours calculation used the difference between check-out and check-in timestamps. Records with missing timestamps were excluded to prevent incomplete attendance records from affecting the calculation.

## 5. Query Execution Plans

PostgreSQL query execution plans were examined using EXPLAIN and EXPLAIN ANALYZE.

### 5.1 EXPLAIN

EXPLAIN displays the execution plan selected by PostgreSQL without executing the query.

It provides information such as:

- Sequential scans.
- Index scans.
- Join operations.
- Estimated costs.
- Estimated number of rows.

### 5.2 EXPLAIN ANALYZE

EXPLAIN ANALYZE executes the SQL query and reports actual execution information.

The following query was used:

```sql
EXPLAIN ANALYZE
SELECT
    e.employee_no,
    e.first_name,
    e.last_name,
    fl.location_name
FROM employees e
INNER JOIN farm_locations fl
    ON e.location_id = fl.location_id;
```

The execution plan was examined to understand how PostgreSQL processed the join operation.

The following performance indicators were considered:

- Planning Time.
- Execution Time.
- Actual Rows.
- Loops.
- Scan and join methods.

The exercise demonstrated the difference between estimated execution information and actual query performance.

## 6. Database Indexing

An index was created on the attendance_date column to support queries that retrieve attendance records for specific dates.

The following SQL statement was executed:

```sql
CREATE INDEX idx_attendance_date
ON attendance (attendance_date);
```

The index was subsequently verified through PostgreSQL's pg_indexes system view.

The purpose of the index was to provide PostgreSQL with an additional access path for retrieving attendance records based on attendance dates.

Indexes can improve data retrieval performance, although they require additional storage and introduce maintenance overhead during INSERT, UPDATE and DELETE operations.

## 7. Query Optimisation and Performance Testing

To demonstrate query optimisation using a larger dataset, synthetic performance records were introduced.

The test dataset used a dedicated employee-number prefix, PERF-, to distinguish synthetic records from the original case-study records.

The generated attendance records contained the following distribution:

| Attendance status | Number of records | Percentage |
|---|---:|---:|
| Present | 16,000 | 80% |
| Absent | 2,000 | 10% |
| Late | 2,000 | 10% |
| **Total** | **20,000** | **100%** |

The synthetic records were used exclusively for database performance testing.

### 7.1 Performance Test Query

The following query was used to retrieve attendance records for a particular date:

```sql
EXPLAIN (ANALYZE, BUFFERS)
SELECT
    attendance_id,
    employee_id,
    attendance_date,
    attendance_status
FROM attendance
WHERE attendance_date = CURRENT_DATE - 10;
```

The query was designed to examine how PostgreSQL retrieves records using the attendance_date column.

### 7.2 Before-and-After Index Comparison

The performance test involved two stages:

**Stage 1 – Before indexing**

The attendance date index was temporarily removed, and the query execution plan was examined.

**Stage 2 – After indexing**

The attendance date index was recreated, table statistics were updated using ANALYZE, and the same query was executed again.

The execution plans were compared using:

- Scan method.
- Actual execution time.
- Number of rows returned.
- Shared buffer activity.

### 7.3 Performance Comparison Results

The actual execution-plan results will be used to determine whether the index improved query performance.

A sequential scan may still be selected by PostgreSQL when it estimates that scanning the table is more efficient than using an index. Therefore, the presence of an index does not guarantee that PostgreSQL will use it for every query.

## 8. Performance Analysis

The practical exercises demonstrated that query performance depends on several factors, including:

- The volume of data stored in the database.
- The structure of SQL queries.
- The availability of appropriate indexes.
- The distribution of values within the tables.
- PostgreSQL's query planner and table statistics.

The use of synthetic records provided a larger dataset for evaluating query execution behaviour.

The comparison of execution plans provides practical evidence of how indexing can influence data retrieval. Actual performance conclusions should be based on the measured execution time and buffer activity rather than assumptions.

## 9. Conclusion

This portfolio provided practical experience in SQL query development, aggregate functions, joins, filtering, query execution plans, database indexing and query optimisation using PostgreSQL.

The exercises demonstrated how SQL can be used to retrieve and summarise agricultural workforce attendance information and how execution plans can help database administrators understand query performance.

The practical work also highlighted the importance of appropriate indexing and performance testing when working with larger relational databases.

## 10. Individual Reflection

Through this exercise, I gained practical understanding of how PostgreSQL processes SQL queries and how database indexes can support efficient data retrieval.

I also learned the difference between EXPLAIN and EXPLAIN ANALYZE, the importance of examining actual execution metrics, and why an index may not always be selected by the query planner.

The use of synthetic attendance data helped demonstrate the importance of testing database performance with a larger volume of records rather than relying only on small demonstration datasets.

## 11. AI Assistance Declaration

ChatGPT was used as a learning and technical assistance tool during the development of this portfolio.

Its assistance included explaining SQL statements, providing guidance on query execution plans, suggesting indexing approaches, helping develop synthetic test data and supporting the preparation of technical documentation.

All SQL statements were intended to be executed and verified in PostgreSQL through pgAdmin 4. The student remains responsible for reviewing, understanding and validating the implementation and the final performance findings.

## 12. References

1. PostgreSQL Global Development Group. *PostgreSQL Documentation – SELECT*. https://www.postgresql.org/docs/current/sql-select.html
2. PostgreSQL Global Development Group. *PostgreSQL Documentation – EXPLAIN*. https://www.postgresql.org/docs/current/sql-explain.html
3. PostgreSQL Global Development Group. *PostgreSQL Documentation – Indexes*. https://www.postgresql.org/docs/current/indexes.html
4. PostgreSQL Global Development Group. *PostgreSQL Documentation – Aggregate Functions*. https://www.postgresql.org/docs/current/functions-aggregate.html

## 13. Supporting Evidence Checklist

The following evidence are in the portfolio-2-query-optimisation\screenshot

- [ ] Basic SELECT query and output.
- [ ] Employee and farm location JOIN query and output.
- [ ] Attendance filtering query and output.
- [ ] Attendance grouping query and output.
- [ ] Aggregate query results.
- [ ] EXPLAIN execution plan.
- [ ] EXPLAIN ANALYZE execution plan.
- [ ] Existing database index verification.
- [ ] Successful attendance date index creation.
- [ ] Synthetic dataset generation and verification.
- [ ] Before-indexing execution plan.
- [ ] After-indexing execution plan.
- [ ] Performance comparison and analysis.
- [ ] SQL scripts committed to the GitHub repository.

**GitHub repository:** [Insert your repository URL]

**Submission:** Portfolio 2 – Query Processing and Optimisation.