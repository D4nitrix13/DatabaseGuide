<!-- Author: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Email: danielperezdev@proton.me -->

# ***Complete Guide to SQL, NoSQL, and Database Design***

- *Welcome! This repository is designed to provide a comprehensive guide on SQL, NoSQL, and database design from the most basic concepts to deployment in production. Here you will find material that covers both theory and practice with applied examples in each section.*

---

## ***Table of Contents***

1. *Introduction*
2. *SQL Guide*
3. *50+ Essential SQL Commands*
4. *NoSQL Databases*
5. *Database Design*
   - *Conceptual Design*
   - *Logical Design*
   - *Physical Design*
6. *Practical Use Cases*
7. *Production Deployment*
8. *Additional Resources*

---

### ***Introduction***

- *This repository aims to provide a comprehensive understanding of how to work with relational and NoSQL databases. From fundamentals to advanced techniques, we cover how to design and deploy efficient and scalable databases for different types of applications.*

---

## ***SQL Guide***

---

### ***Essential SQL Commands***

- *This section includes more than **50 SQL commands** covering data manipulation, table management, indexes, transactions, and security:*

- **Basic Commands:**

1. **SELECT** *– Basic data query*
2. **INSERT** *– Insert new data*
3. **UPDATE** *– Modify existing records*
4. **DELETE** *– Delete records*
5. **JOIN** *– Combine data between tables*
6. **GROUP BY** *– Group results*
7. **ORDER BY** *– Sort results*
8. **CREATE TABLE** *– Create new tables*
9. **ALTER TABLE** *– Modify table structure*
10. **DROP TABLE** *– Drop tables*
11. **TRANSACTIONS** *– Transaction control*
12. **VIEWS** *– Create and use views*

---

## ***NoSQL Databases***

- *We explore the key differences between relational (SQL) and NoSQL databases, and when it is appropriate to use each. We also cover different types of NoSQL databases:*

- **Document-based** *(MongoDB)*
- **Key-Value** *(Redis)*
- **Wide-Column** *(Cassandra)*
- **Graph** *(Neo4j)*

---

### ***SQL vs. NoSQL Comparison***

- **Data Structure:** *Relational vs. Non-Relational*
- **Scalability:** *Vertical (SQL) vs. Horizontal (NoSQL)*
- **Use Cases:** *SQL for complex transactions, NoSQL for large distributed data volumes.*

---

## ***Database Design***

---

### ***Conceptual Design***

- *The **conceptual design** is the initial phase where business requirements are modeled without worrying about technical implementations. In this section, you will learn how to create entity-relationship diagrams (ERD) using tools like **Lucidchart** or **Draw.io**.*

---

### ***Logical Design***

- *In **logical design**, we transform conceptual models into detailed models. Here, you will learn how to define tables, relationships (1:1, 1:N, N:M), and how to normalize a database.*

- **Normalization:** *1NF, 2NF, 3NF*
- **Denormalization:** *When it’s needed in certain optimization scenarios.*

---

### ***Physical Design***

- *The **physical design** deals with how data will actually be stored on disk. Here, we discuss indexes, partitioning, and how to choose the best storage strategies to optimize query performance.*

---

## ***Practical Use Cases***

---

### ***1. Inventory Management System***

- **Implementation of a relational system for inventory management with:**

- *Relational schema design*
- *Queries to retrieve low stock products*
- *Supplier price updates*

---

### ***2. Distributed Social Network***

- *Implementation with **NoSQL** databases using **MongoDB** to store large volumes of user data, posts, and relationships between them.*

- *Each practical case includes detailed instructions, SQL or NoSQL scripts, and a step-by-step guide to deploy the solution.*

---

## ***Production Deployment***

---

### ***Relational Database Deployment***

- **MySQL/PostgreSQL:** *Configuration, backup and recovery, index optimization, and security.*
- **Backup and Restore:** *Strategies for regular backups.*

---

### ***NoSQL Database Deployment***

- **MongoDB:** *Replication and partitioning.*
- **Redis:** *High availability with Sentinel and Clustering.*

---

## ***Additional Resources***

- *[Official SQL Documentation](https://dev.mysql.com/doc/ "https://dev.mysql.com/doc/")*
- *[MongoDB Guide](https://docs.mongodb.com/ "https://docs.mongodb.com/")*

---

## ***Contributions***

> *Contributions are welcome! If you have suggestions, corrections, or want to add additional content to this project, feel free to open an issue or submit a pull request. Your help is essential in making this project a complete and up-to-date reference for the development community.*

---

## ***License***

> *This repository is published under the MIT License. Feel free to use, modify, and distribute the content according to the terms of this license.*

---

## ***Author***

- **Author:** *Daniel Benjamin Perez Morales*
- **GitHub:** *[D4nitrix13](https://github.com/D4nitrix13 "https://github.com/D4nitrix13")*
- **Email:** *`danielperezdev@proton.me`*
