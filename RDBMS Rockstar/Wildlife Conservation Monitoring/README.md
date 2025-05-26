# Mastering PostgreSQL: From Queries to Joins

# What is PostgreSQL?

PostgreSQL is a powerful object-relational database management system (ORDBMS) that uses and extends the SQL language, combined with many features.

**A database is an organized collection of data, where data is stored electronically in a table format.**

PostgreSQL is a Database Management System that allows performing SQL queries.

### 🔑 Key Features of PostgreSQL:

**RDBMS:** PostgreSQL is a relational database management system that allows you to build connections from one table to another.

**SQL Compliant**: Fully supports the SQL standard and also provides many advanced features.

**Open Source:** PostgreSQL is an open-source DBMS. You can modify the source code if needed.

**Cross-Platform:** It works on all operating systems.

**Declarative:** PostgreSQL works declaratively. You don’t need to think about its working procedure.

**Flexibility:**  You can create your custom data type here. Besides, you can create user-defined functions, views, and procedures to avoid repetition.

## 🔍 Who Uses PostgreSQL?

Some of the world’s biggest companies trust PostgreSQL, including:

- Apple
- Spotify
- Instagram
- Reddit

## 🚀 Why Learn PostgreSQL?

If you're a developer, data analyst, or aspiring database administrator, learning PostgreSQL gives you access to one of the most robust tools in the data world. It’s widely supported by cloud platforms (like AWS, GCP, and Azure), has a massive community, and integrates well with nearly every modern programming language.

# 🔑 Understanding Primary Key and Foreign Key in PostgreSQL

## 🧩 What is a Primary Key?

A **Primary Key** is a **unique identifier** for each record (row) in a table.

### ✅ Key Characteristics:

- Must contain **unique** values
- Cannot contain **NULL** values
- There can be **only one** primary key in a table
- Often created on a single column (like `id`), but can also be **composite** (more than one column)

```jsx
CREATE TABLE customers (
customer_id SERIAL PRIMARY KEY,
name TEXT,
email TEXT
);

```

In this example:

- `customer_id` is the **primary key**
- Each customer will have a unique `customer_id`
- No two customers can have the same ID, and it can’t be empty

 

---

## 🔄 How Do They Work Together?

### 🎯 Real-Life Example:

Think of a **Primary Key** as a **passport number or nid number** — unique to each individual.

A **Foreign Key** is like listing someone's passport number as a reference on an application form.

---

## ❌ What Happens If You Violate the Rules?

PostgreSQL will stop you from inserting invalid data:

- Trying to insert a duplicate in a Primary Key column will throw an error.
- Inserting a record with a Foreign Key that doesn’t match any Primary Key in the referenced table will also throw an error.

You can control what happens on **delete** or **update** with options like:

```jsx
ON DELETE CASCADE
ON UPDATE CASCADE
```

These make child records automatically follow changes in the parent record.

## 🧠 Why Are These Keys Important?

- **Data Integrity**: Prevents invalid or orphaned records.
- **Relationship Modeling**: Defines how tables relate to each other.
- **Query Efficiency**: Speeds up joins and lookups using indexed keys.
- **Database Normalization**: Helps break data into related, non-redundant structures.

---

## 🏁 Conclusion

Understanding **Primary Keys** and **Foreign Keys** is essential when designing any relational database. They are the backbone of **data relationships and integrity** in PostgreSQL.

While design database, you can think of the Primary Key as the **anchor** of your data and the Foreign Key as the **bridge** connecting it all together.