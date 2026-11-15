# MIT 8103 – Advanced Database Systems
## Individual Practical Database Portfolio

**Course:** MIT 8103 – Advanced Database Systems  
**Project:** Individual Practical Database Portfolio  
**Case Study:** Agricultural Workforce Attendance Management System  
**Selected Organisation:** GreenFields Agricultural Operations Ltd.  
**Database Technologies:** PostgreSQL and MongoDB  
**Development Tools:** pgAdmin 4 and MongoDB Compass

---

## 1. Project Overview

This repository contains my individual practical database portfolio for MIT 8103 – Advanced Database Systems.

The project uses an Agricultural Workforce Attendance Management System as its case study. The proposed system is designed to manage employee information, farm locations, and daily workforce attendance records.

The practical exercises demonstrate database design, SQL query processing and optimisation, transaction management, concurrency control, NoSQL data modelling, and distributed or cloud database concepts.

The same case study is maintained across the five portfolios to demonstrate how different database concepts and technologies can support the requirements of one organisation.

## 2. Project Objectives

The objectives of this practical portfolio are to:

- Design and implement a relational database using PostgreSQL.
- Develop and execute SQL queries for retrieving and analysing data.
- Examine query execution plans and demonstrate indexing and optimisation.
- Demonstrate database transactions using COMMIT and ROLLBACK.
- Explore transaction isolation, concurrency control, and locking.
- Design and implement a NoSQL data model using MongoDB.
- Examine distributed and cloud database concepts, including replication, sharding, availability, and consistency.
- Document practical implementation activities and supporting evidence.

## 3. Case Study Description

GreenFields Agricultural Operations Ltd. manages employees working across multiple farm locations.

The organisation requires a database system that can maintain employee information, associate employees with their respective farm locations, and record daily attendance.

The system follows the approach of maintaining one attendance record per employee per working day. Each record can contain the employee's check-in time, check-out time, attendance date, attendance status, and associated farm location.

The case study provides a practical foundation for exploring relational and non-relational database technologies.

## 4. Portfolio Structure

The repository is organised into five practical portfolios and supporting documentation.

| Portfolio | Description | Marks |
|---|---|---:|
| Portfolio 1 | Database Design and Modelling | 7 |
| Portfolio 2 | Query Processing and Optimisation | 7 |
| Portfolio 3 | Transactions and Concurrency | 7 |
| Portfolio 4 | NoSQL and Advanced Data Models | 7 |
| Portfolio 5 | Distributed and Cloud Database Exercise | 6 |
| Final Documentation | Summary, reflection, evidence and references | 6 |
| **Total** | | **40** |

### Portfolio 1 – Database Design and Modelling

[Open Portfolio 1 README](portfolio-1-database-design/README.md)

This portfolio covers the business requirements, entity-relationship modelling, relational schema design, primary and foreign keys, constraints, and database normalisation.

**Technology:** PostgreSQL 18 and pgAdmin 4.

### Portfolio 2 – Query Processing and Optimisation

[Open Portfolio 2 README](portfolio-2-query-optimisation/README.md)

This portfolio covers SQL queries, joins, aggregate functions, execution plans, indexing, and query performance analysis.

**Technology:** PostgreSQL 18 and pgAdmin 4.

### Portfolio 3 – Transactions and Concurrency

[Open Portfolio 3 README](portfolio-3-transactions-concurrency/README.md)

This portfolio explores transaction management, COMMIT, ROLLBACK, isolation levels, concurrent transactions, row-level locking, and deadlock handling.

**Technology:** PostgreSQL 18 and pgAdmin 4.

### Portfolio 4 – NoSQL and Advanced Data Models

[Open Portfolio 4 README](portfolio-4-nosql/README.md)

This portfolio explores document-based data modelling, MongoDB collections and documents, data retrieval, aggregation pipelines, and indexing.

**Technology:** MongoDB Community Server and MongoDB Compass.

### Portfolio 5 – Distributed and Cloud Database Exercise

[Open Portfolio 5 README](portfolio-5-distributed-cloud/README.md)

This portfolio examines distributed database concepts and their application to the agricultural workforce attendance system, including replication, sharding, availability, consistency, and cloud deployment.

**Technology:** To be documented based on the practical implementation and selected approach.

## 5. Database Environments

### Relational Database

| Item | Details |
|---|---|
| DBMS | PostgreSQL |
| Version | PostgreSQL 18 |
| Administration Tool | pgAdmin 4 |
| Database Name | `agricultural_workforce_attendance` |
| Database Type | Relational |

### NoSQL Database

| Item | Details |
|---|---|
| DBMS | MongoDB |
| Administration Tool | MongoDB Compass |
| Database Name | `agricultural_workforce_nosql` |
| Collection | `attendance_records` |
| Database Type | Document-oriented NoSQL |

## 6. Repository Organisation

The project files are organised as follows:

```text
Alex_Alexander_301783587/
│
├── Alex_Alexander_301783587_README.md
│
├── Alex_Alexander_301783587_portfolio-1-database-design/
│   ├── README.md
│   ├── documentation/
│   ├── sql/
│   └── screenshots/
│
├── Alex_Alexander_301783587_portfolio-2-query-optimisation/
│   ├── README.md
│   ├── documentation/
│   ├── sql/
│   ├── execution-plans/
│   └── screenshots/
│
├── Alex_Alexander_301783587_portfolio-3-transactions-concurrency/
│   ├── README.md
│   ├── documentation/
│   ├── sql/
│   └── screenshots/
│
├── Alex_Alexander_301783587_portfolio-4-nosql/
│   ├── README.md
│   ├── documentation/
│   └── screenshots/
│
└── Alex_Alexander_301783587_portfolio-5-distributed-cloud/
    ├── README.md
    ├── documentation/
    └── screenshots/
```

*The folders and files will contain the corresponding scripts, documentation, implementation evidence, and screenshots for each portfolio.*

## 7. Evidence and Documentation

Each portfolio is supported by relevant practical evidence, which may include:

- SQL scripts and query outputs.
- Database structures and relationships.
- Execution plans and performance comparisons.
- Transaction execution results.
- MongoDB documents, queries, aggregation results, and indexes.
- Distributed or cloud database configuration and test results.
- Screenshots showing the actual implementation.

Evidence is organised within the relevant portfolio folder to make verification easier.

## 8. Learning Outcomes

Through these practical exercises, I aim to demonstrate an understanding of:

1. Relational database design and normalisation.
2. SQL query development and optimisation.
3. Database transaction processing and ACID properties.
4. Concurrency management and transaction isolation.
5. NoSQL database design and implementation.
6. Distributed database architecture and cloud database concepts.

## 9. AI Assistance Declaration

AI tools were used as learning and support resources during the preparation of this portfolio.

Their assistance included explaining database concepts, providing guidance on SQL and MongoDB implementation, helping troubleshoot technical errors, and supporting documentation preparation.

All generated suggestions and code were reviewed against the project requirements and tested where applicable. Practical results and screenshots are included as evidence of implementation. The student remains responsible for understanding, verifying, and explaining the submitted work.

## 10. References

- https://github.com/AlexAlexander301783587/MIT-8103-Advanced-Database-Systems
- PostgreSQL Documentation: https://www.postgresql.org/docs/
- MongoDB Documentation: https://www.mongodb.com/docs/
- MIT 8103 Advanced Database Systems course materials and lecturer-provided practical portfolio requirements.

---

**End of Main Repository README**