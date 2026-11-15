# Portfolio 4: NoSQL and Advanced Data Models

## Course Information
- **Course:** MIT 8103 – Advanced Database Systems
- **Portfolio:** 4 – NoSQL and Advanced Data Models
- **Case Study:** Agricultural Workforce Attendance Management System
- **Organisation:** GreenFields Agricultural Operations Ltd.
- **Database:** MongoDB
- **Database Model:** Document-oriented NoSQL

## 1. Project Overview

This portfolio demonstrates the implementation of a document-oriented NoSQL database for an Agricultural Workforce Attendance Management System.

MongoDB was selected to demonstrate how employee attendance information can be stored, retrieved, grouped and analysed using a flexible document-based data model.

The implementation follows the same case study used in the previous portfolios.

## 2. Objectives

The objectives of this portfolio are to:

- Understand the document-oriented NoSQL database model.
- Create a MongoDB database and collection.
- Design and insert attendance documents.
- Retrieve records using MongoDB queries.
- Perform data aggregation using the MongoDB Aggregation Framework.
- Create and verify a compound index.
- Compare MongoDB with the relational PostgreSQL implementation.

## 3. Technology Used

| Technology | Purpose |
|---|---|
| MongoDB Community Server | NoSQL database engine |
| MongoDB Compass | Database management interface |
| PostgreSQL | Relational database comparison |
| GitHub | Version control and evidence submission |

## 4. Database Information

**Database name:** `agricultural_workforce_nosql`

**Collection name:** `attendance_records`

Each attendance document represents one employee's attendance for one working day.

The document contains:
- Employee number and personal details.
- Farm location.
- Attendance date.
- Check-in and check-out times.
- Attendance status.

## 5. Practical Activities

The following activities are covered:

1. MongoDB installation and connection.
2. Database and collection creation.
3. Attendance document design and insertion.
4. Document retrieval and filtering.
5. Aggregation by attendance status.
6. Aggregation by farm location.
7. Attendance percentage calculation.
8. Compound index creation and verification.

## 6. Folder Structure

```text
Alex_Alexander_301783587_portfolio-4-nosql/
│
├── screenshots/
│   ├── 01_mongodb_database_creation.png
│   ├── 02_mongodb_inserted_documents.png
│   ├── 03_aggregation_by_status.png
│   ├── 04_aggregation_by_location.png
│   ├── 05_attendance_percentage.png
│   └── 06_mongodb_compound_index.png
│
├── documentation/
│   └── portfolio-4-nosql.md
│
└── README.md
```

## 7. Implementation Evidence

Screenshots of the MongoDB implementation and query results are stored in the `screenshots` folder.

The detailed explanation of the database design, implementation, suitability, limitations, and comparison with PostgreSQL is available in:

`documentation/portfolio-4-nosql.md`

## 8. Learning Outcome

This portfolio demonstrates practical understanding of MongoDB, document-oriented data modelling, querying, aggregation, and indexing. It also highlights the differences between relational and NoSQL database technologies.

## 9. References

- https://github.com/AlexAlexander301783587/MIT-8103-Advanced-Database-Systems
- MongoDB Documentation: https://www.mongodb.com/docs/
- PostgreSQL Documentation: https://www.postgresql.org/docs/