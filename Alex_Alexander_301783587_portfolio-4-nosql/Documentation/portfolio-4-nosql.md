# PORTFOLIO 4: NOSQL AND ADVANCED DATA MODELS

**Course:** MIT 8103 – Advanced Database Systems  
**Case Study:** Agricultural Workforce Attendance Management System  
**Organisation:** GreenFields Agricultural Operations Ltd.  
**Database Technology:** MongoDB  
**Database Model:** Document-oriented NoSQL database

## 1. Introduction

This portfolio demonstrates the implementation of a NoSQL database model for the Agricultural Workforce Attendance Management System. The purpose is to explore how a document-oriented database can store and retrieve workforce attendance information.

MongoDB was selected because it stores information in flexible, JSON-like BSON documents. This makes it possible to represent related attendance information, including employee details, farm location, attendance date, check-in time, check-out time and attendance status, within a single document.

## 2. Selected NoSQL Database Model

The document-oriented model was selected for this exercise.

The MongoDB database is named `agricultural_workforce_nosql`, and the collection is named `attendance_records`.

Each document represents one employee's attendance record for one working day.

The document structure contains:

- Employee number.
- Employee first and last names.
- Farm location.
- Attendance date.
- Check-in time.
- Check-out time.
- Attendance status.

Employee and farm location details are embedded within the attendance document. This reduces the need for separate lookups when retrieving an attendance record with its associated employee and location information.

## 3. Database Implementation

MongoDB Community Server was used as the database engine, while MongoDB Compass provided the graphical interface for database administration and document management.

The database and collection were created successfully, subject to the implementation evidence included in this submission.

Three sample attendance documents were designed to demonstrate different attendance conditions:

| Employee | Farm location | Attendance status |
|---|---|---|
| John James | Test Farm North | Present |
| Mary Johnson | Test Farm South | Late |
| David Williams | Test Farm North | Absent |

The sample documents demonstrate how MongoDB stores nested objects and date fields.

## 4. Querying and Aggregation

MongoDB document filtering was used to retrieve attendance records based on specific conditions.

Examples included:

- Retrieving all attendance records.
- Filtering employees with Present attendance status.
- Finding employees assigned to Test Farm North.
- Retrieving employees with Late or Absent attendance status.

The MongoDB Aggregation Framework was also used to group attendance documents by attendance status and farm location.

The `$group` stage was used to calculate attendance totals, while `$project` was used to select output fields and calculate percentages.

These operations demonstrate functionality comparable to SQL filtering and grouping operations.

## 5. Indexing

A compound index was designed using the fields `employeeNo` and `attendanceDate`.

The index name is:

`idx_employee_attendance_date`

The purpose of the index is to support queries that retrieve attendance records using an employee number and attendance date.

The unique constraint on the compound index also enforces the business rule that an employee should have no more than one attendance document for a particular date.

The index was designed to improve data retrieval efficiency and enforce data uniqueness. Actual performance improvement would require testing with a larger dataset and comparing execution statistics.

## 6. Suitability of MongoDB for the Case Study

MongoDB is suitable for demonstrating a document-oriented approach to agricultural workforce attendance management for the following reasons:

1. **Flexible data structure:** Documents can contain nested employee and farm location information.
2. **Efficient retrieval:** Related attendance information can be retrieved together without requiring relational joins.
3. **Scalability:** MongoDB supports horizontal scaling through sharding when data volumes and infrastructure requirements increase.
4. **Aggregation:** Its aggregation framework supports reporting and analysis of attendance information.
5. **Indexing:** Single-field and compound indexes support efficient data retrieval.

However, MongoDB also has limitations. Embedding employee and location information can result in duplicated data. Changes to employee information may require updating multiple documents if the embedded information is repeated. Data validation and consistency rules must also be designed carefully.

## 7. Comparison Between PostgreSQL and MongoDB

| Feature | PostgreSQL | MongoDB |
|---|---|---|
| Database model | Relational | Document-oriented |
| Data storage | Tables and rows | Collections and documents |
| Schema | Structured schema | Flexible document structure |
| Relationships | Foreign keys and joins | Embedding and references |
| Query language | SQL | MongoDB Query Language |
| Aggregation | GROUP BY and aggregate functions | Aggregation Framework |
| Indexing | B-tree and other index types | Single-field and compound indexes |

PostgreSQL was used for the relational implementation in the earlier portfolios, while MongoDB demonstrated an alternative document-oriented approach to storing the same attendance information.

## 8. Conclusion

This portfolio demonstrated the use of MongoDB as a document-oriented NoSQL database for the Agricultural Workforce Attendance Management System.

The practical exercise covered database and collection creation, document insertion, document filtering, aggregation and compound indexing.

The exercise provided an opportunity to understand the differences between relational and NoSQL database models and how different database technologies can be applied to the same business problem.

## 9. Individual Reflection

Through this exercise, I gained practical experience working with MongoDB and understanding how document-oriented databases differ from relational databases.

I learned how nested documents can represent related information, how MongoDB queries retrieve specific records, and how the Aggregation Framework performs data analysis.

The exercise also improved my understanding of indexing and the importance of selecting an appropriate database model based on application requirements.

## 10. AI Declaration

ChatGPT was used as a learning and guidance tool to explain NoSQL concepts, assist with MongoDB document design, provide example queries and support the preparation of documentation.

The practical implementation, execution of database operations, verification of results and final review remain the responsibility of the student. All submitted screenshots and execution results should reflect the actual work performed.

## 11. References

- MongoDB Documentation. https://www.mongodb.com/docs/
- PostgreSQL Documentation. https://www.postgresql.org/docs/
- Course materials: MIT 8103 – Advanced Database Systems.

## 12. Evidence Checklist

Include the following actual screenshots:

1. MongoDB Compass connection.
2. Database and collection creation.
3. Inserted attendance documents.
4. Document filtering results.
5. Aggregation by attendance status.
6. Aggregation by farm location.
7. Attendance percentage calculation.
8. Compound index creation and verification.

**GitHub folder:** `portfolio-4-nosql/`

structure:

- `screenshots/`
- `documentation/`
- `README.md`

**GitHub repository:** [(https://github.com/AlexAlexander301783587/MIT-8103-Advanced-Database-Systems.git)]

**Important:** Remove or revise any statement about successful implementation if the corresponding activity has not actually been executed and verified.