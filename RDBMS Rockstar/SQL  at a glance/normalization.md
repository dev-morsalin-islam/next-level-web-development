# Database Normalization

Database normalization is a process used to eliminate data redundancy and improve data integrity by organizing data into multiple related tables.

We can remove database anomalies by using normalization.

There are 4 main types of normalization:

- 1st Normal Form (1NF)
- 2nd Normal Form (2NF)
- 3rd Normal Form (3NF)
- 4th Normal Form (4NF)

---

## **1st Normal Form (1NF)**

✅ **Rule:**

- All values in each column must be **atomic** (indivisible)
- Each record must be **unique**
- A column should **not contain multiple values**

🔸 **Example (Before 1NF):**

| StudentID | Name  | Subjects         |
|-----------|-------|------------------|
| 1         | Alice | Math, Science    |
| 2         | Bob   | Math, History    |

🔸 **After 1NF:**

| StudentID | Name  | Subject  |
|-----------|-------|----------|
| 1         | Alice | Math     |
| 1         | Alice | Science  |
| 2         | Bob   | Math     |
| 2         | Bob   | History  |

---

## **2nd Normal Form (2NF)**

✅ **Rule:**

- Must be in **1NF**
- All **non-key attributes** must depend on the **whole primary key** (not just part of a composite key)

🔸 **Example (Before 2NF):**

| StudentID | Subject  | StudentName |
|-----------|----------|-------------|
| 1         | Math     | Alice       |
| 1         | Science  | Alice       |
| 2         | Math     | Bob         |

> `StudentName` depends only on `StudentID`, not the full composite key (`StudentID + Subject`)

🔸 **After 2NF:**

**Students Table:**

| StudentID | StudentName |
|-----------|-------------|
| 1         | Alice       |
| 2         | Bob         |

**Enrollments Table:**

| StudentID | Subject  |
|-----------|----------|
| 1         | Math     |
| 1         | Science  |
| 2         | Math     |

---

## **3rd Normal Form (3NF)**

✅ **Rule:**

- Must be in **2NF**
- **No transitive dependencies**: non-key columns should not depend on other non-key columns

🔸 **Example (Before 3NF):**

| StudentID | StudentName | DepartmentID | DepartmentName |
|-----------|-------------|--------------|----------------|
| 1         | Alice       | D01          | Physics        |
| 2         | Bob         | D02          | History        |

> `DepartmentName` depends on `DepartmentID`, not directly on `StudentID`

🔸 **After 3NF:**

**Students Table:**

| StudentID | StudentName | DepartmentID |
|-----------|-------------|--------------|
| 1         | Alice       | D01          |
| 2         | Bob         | D02          |

**Departments Table:**

| DepartmentID | DepartmentName |
|--------------|----------------|
| D01          | Physics        |
| D02          | History        |

---

## **4th Normal Form (4NF)**

✅ **Rule:**

- Must be in **3NF**
- **No multi-valued dependencies**: An entity should not have more than one independent multi-valued attribute

🔸 **Example (Before 4NF):**

| StudentID | Hobby     | Language |
|-----------|-----------|----------|
| 1         | Reading   | English  |
| 1         | Reading   | French   |
| 1         | Swimming  | English  |
| 1         | Swimming  | French   |

> Hobbies and Languages are independent but both are multi-valued

🔸 **After 4NF:**

**Student_Hobbies Table:**

| StudentID | Hobby     |
|-----------|-----------|
| 1         | Reading   |
| 1         | Swimming  |

**Student_Languages Table:**

| StudentID | Language |
|-----------|----------|
| 1         | English  |
| 1         | French   |

---

> ✅ Normalization improves consistency, reduces redundancy, and makes databases easier to maintain and update.
