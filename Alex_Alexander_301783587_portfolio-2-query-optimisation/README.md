# Portfolio 2: Query Processing and Optimisation

## 1. Course Information

- **Course:** MIT 8103 – Advanced Database Systems
- **Portfolio:** 2 – Query Processing and Optimisation
- **Case Study:** Agricultural Workforce Attendance Management System
- **Organisation:** GreenFields Agricultural Operations Ltd.
- **Database Management System:** PostgreSQL 18
- **Database Tool:** pgAdmin 4

## 2. Project Overview

This portfolio focuses on SQL query development, query processing and database performance optimisation using PostgreSQL.

The practical exercise uses the Agricultural Workforce Attendance Management System developed in Portfolio 1.

The objective is to retrieve, filter, group and analyse workforce attendance information while examining how PostgreSQL processes queries and how indexes can support efficient data retrieval.

A synthetic dataset was generated to provide a larger volume of attendance records for query optimisation exercises.

## 3. Project Objectives

The objectives of this portfolio are to:

- Develop SQL queries using SELECT, WHERE, JOIN and ORDER BY.
- Perform aggregate operations using COUNT, AVG and GROUP BY.
- Understand PostgreSQL query execution plans.
- Use EXPLAIN and EXPLAIN ANALYZE to examine query execution.
- Create and verify database indexes.
- Evaluate query performance using execution statistics.
- Understand how indexing can improve data retrieval efficiency.

## 4. Practical Activities

The following activities are covered:

| No. | Activity | Description |

| 1 | Basic SQL queries | Retrieve and filter employee and attendance records. |
| 2 | JOIN operations | Combine employee, farm location, and attendance information. |
| 3 | Aggregate queries | Calculate attendance totals and average working hours. |
| 4 | Query execution plans | Examine query processing using EXPLAIN. |
| 5 | Query performance analysis | Use EXPLAIN ANALYZE to inspect actual execution statistics. |
| 6 | Indexing | Create and verify an attendance date index. |
| 7 | Optimisation dataset | Generate synthetic attendance records for performance testing. |
| 8 | Before-and-after comparison | Compare query execution plans with and without indexing. |

## 5. Database and Test Dataset

**Database name:** `agricultural_workforce_attendance`

**Database Management System:** PostgreSQL 18

**Database client:** pgAdmin 4

The optimisation exercise used synthetic employee and attendance data.

The attendance dataset was generated to contain 20,000 attendance records with the following distribution:

| Attendance Status | Records | Percentage |

| Present | 16,000 | 80% |
| Absent | 2,000 | 10% |
| Late | 2,000 | 10% |
| **Total** | **20,000** | **100%** |

This dataset provided a larger volume of records for examining query execution and indexing behaviour.

## 6. Indexing and Query Optimisation

An index was created on the `attendance_date` column of the attendance table.

**Index name:** `idx_attendance_date`

**SQL statement:**

```sql
CREATE INDEX idx_attendance_date
ON attendance (attendance_date);
```

The purpose of the index was to support queries that retrieve attendance records for specific dates.

PostgreSQL execution plans were examined using:

```sql
EXPLAIN
```

and:

```sql
EXPLAIN ANALYZE
```

Execution statistics such as scan method, actual rows, execution time and buffer usage were used to assess query behaviour.

Actual before-and-after performance measurements are documented in the detailed portfolio report.

## 7. Folder Structure

```text
Alex_Alexander_301783587_portfolio-2-query-optimisation/
│
├── README.md
│
├── documentation/
│   └── portfolio-2-query-optimisation.md
│
├── sql/
│   ├── 01_basic_select.sql
│   ├── 02_employee_location_join.sql
│   ├── 03_attendance_filter.sql
│   ├── 04_attendance_grouping.sql
│   ├── 05_employees_by_status.sql
│   ├── 06_employees_by_location.sql
│   ├── 07_attendance_by_status.sql
│   ├── 08_average_working_hours.sql
│   ├── 09_execution_plan_analysis.sql
│   └── 10_create_attendance_date_index.sql
│
└── screenshots/
    ├── 01_basic_queries.png
    ├── 02_join_query_results.png
    ├── 03_aggregate_query_results.png
    ├── 04_explain_execution_plan.png
    ├── 05_explain_analyze_results.png
    ├── 06_index_creation.png
    ├── 07_dataset_distribution.png
    ├── 08_before_indexing.png
    └── 09_after_indexing.png
```

## 8. Implementation Evidence

SQL scripts are stored in the `sql` folder.

Screenshots showing query results, execution plans, dataset generation and index creation are stored in the `screenshots` folder.

The detailed explanation of query development, execution plans, indexing and performance analysis is provided in:

`documentation/portfolio-2-query-optimisation.md`

## 9. Learning Outcomes

This portfolio demonstrates practical understanding of SQL query development, joins, aggregate functions, query execution plans and indexing.

It also provides experience analysing PostgreSQL query behaviour and understanding how database indexes can support efficient data retrieval.

## 10. References

- https://github.com/AlexAlexander301783587/MIT-8103-Advanced-Database-Systems
- PostgreSQL Documentation: https://www.postgresql.org/docs/
- Course materials: MIT 8103 – Advanced Database Systems.