# Portfolio 1: Database Design and Modelling

## 1. Course Information

- **Course:** MIT 8103 – Advanced Database Systems
- **Portfolio:** 1 – Database Design and Modelling
- **Case Study:** Agricultural Workforce Attendance Management System
- **Organisation:** GreenFields Agricultural Operations Ltd.
- **Database Management System:** PostgreSQL 18
- **Database Tool:** pgAdmin 4

## 2. Project Overview

This portfolio focuses on the design and implementation of a relational database for an Agricultural Workforce Attendance Management System.

The proposed system is designed to manage employee information, farm locations and daily attendance records. It provides a structured approach to recording employee check-in and check-out times, monitoring attendance status and maintaining accurate workforce attendance information.

The database was designed using relational database principles and implemented using PostgreSQL.

## 3. Project Objectives

The objectives of this portfolio are to:

- Identify the business requirements of the attendance management system.
- Design an Entity Relationship Diagram (ERD).
- Convert the ERD into a relational database schema.
- Identify primary keys and foreign keys.
- Apply appropriate database constraints.
- Demonstrate database normalisation up to Third Normal Form (3NF).
- Implement and verify the database using PostgreSQL.

## 4. Database Design

The database consists of three main relational tables:

| Table | Description |
|---|---|
| `farm_locations` | Stores farm location information. |
| `employees` | Stores employee information and assigned farm locations. |
| `attendance` | Stores employees' daily attendance records. |

### Entity Relationships

The database contains the following relationships:

1. One farm location can have many employees.
2. One employee can have many attendance records.
3. One farm location can be associated with many attendance records.

### Database Constraints

The following constraints were implemented:

- Primary key constraints.
- Foreign key constraints.
- Unique constraints.
- NOT NULL constraints.
- CHECK constraints.
- Default timestamp values.

A unique constraint on employee number prevents duplicate employee records, while a composite unique constraint on employee and attendance date ensures one attendance record per employee per day.

## 5. Database Information

**Database name:** `agricultural_workforce_attendance`

**Database Management System:** PostgreSQL 18

**Database client:** pgAdmin 4

The previous database, `agriculturalworkforcedb`, was retained separately while the new database was created for this practical exercise.

## 6. Database Implementation

The database was implemented in PostgreSQL using SQL Data Definition Language (DDL).

The implementation involved:

1. Creating the database.
2. Creating the `farm_locations` table.
3. Creating the `employees` table.
4. Creating the `attendance` table.
5. Defining primary and foreign keys.
6. Applying data validation constraints.
7. Verifying table structures and relationships.

## 7. Folder Structure

```text
Alex_Alexander_301783587_portfolio-1-database-design/
│
├── README.md
│
├── documentation/
│   └── portfolio-1-database-design.md
│
├── sql/
│   └── create_database_schema.sql
│
└── screenshots/
    ├── 01_database_creation.png
    ├── 02_farm_locations_table.png
    ├── 03_employees_table.png
    ├── 04_attendance_table.png
    ├── 05_database_relationships.png
    └── 06_database_constraints.png
```

## 8. Implementation Evidence

Screenshots showing database creation, table structures, relationships and constraints are stored in the `screenshots` folder.

The detailed explanation of the business requirements, ERD, relational schema, normalisation, implementation and testing is provided in:

`documentation/portfolio-1-database-design.md`

## 9. Learning Outcomes

This portfolio demonstrates practical understanding of relational database design, entity relationships, primary and foreign keys, database constraints and normalisation.

It also provides practical experience implementing a relational database using PostgreSQL.

## 10. References

- PostgreSQL Documentation: https://www.postgresql.org/docs/
- Course materials: MIT 8103 – Advanced Database Systems.
- https://github.com/AlexAlexander301783587/MIT-8103-Advanced-Database-Systems
