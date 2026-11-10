# SQL Sales Data Analysis – Practice Project

## Project Overview

This project demonstrates practical SQL skills using Microsoft SQL Server and a sales dataset.

The objective is to practise SQL queries to extract, manipulate, transform, filter and analyse sales data.

This project is part of my Business Data Analytics learning journey, focusing on developing practical SQL skills for data analysis and business insights.

## Tools & Technologies

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- SQL

## SQL Concepts Covered

- Database creation and selection
- String manipulation
- CONCAT(), LEFT(), RIGHT() and CHARINDEX()
- Date functions: DATEDIFF() and GETDATE()
- Conditional statements using CASE WHEN
- Data filtering using WHERE, IN and BETWEEN
- Aggregate functions using SUM()
- Data grouping using GROUP BY
- Business rule implementation using conditional calculations

## SQL Practice Tasks

1. Create a database and select the database.
2. Concatenate first name and last name.
3. Extract username from email address.
4. Extract domain name from email address.
5. Calculate customer age using date of birth.
6. Apply conditional price adjustments.
7. Concatenate first name and last name initial.
8. Concatenate ID and last name.
9. Increase amount for Black-coloured products.
10. Reduce amount for Silver-coloured products by 20%.
11. Increase amount for Multi-coloured products.
12. Increase amount for White-coloured products.
13. Filter Blue and Multi-coloured products using an ID range.
14. Filter Black-coloured products.
15. Calculate total amount.
16. Calculate total amount by product subcategory.
17. Calculate total amount by product subcategory and colour.

---

# SQL Queries

## 1. Database Creation

```sql
CREATE DATABASE Practice

Use Practice;

SELECT * FROM SalesData$;
```

## 2. Concatenate First Name and Last Name

```sql
SELECT TOP(50)
       FirstName, LastName,
       CONCAT(FirstName,' ',LastName)       AS    FullName
FROM SalesData$;
```

## 3. Extract Username from Email Address

```sql
SELECT
      LEFT(Email,CHARINDEX('@', Email) - 1)      AS      UserName
FROM SalesData$;
```

## 4. Extract Domain Name from Email Address

```sql
SELECT
      RIGHT(Email,CHARINDEX('@', Email) )      AS      DomainName
FROM SalesData$;
```

## 5. Calculate Customer Age from DOB

```sql
SELECT
    FirstName,
    DOB,
    DATEDIFF(YEAR, DOB, GETDATE()) AS Age
FROM SalesData$;
```

## 6. Implement Conditional Price Structure

If Amount is between £51 and £80, reduce it by £20. Otherwise, leave it unchanged.

```sql
SELECT *,
CASE
    WHEN Amount BETWEEN 51 AND 80 THEN Amount - 20
    ELSE Amount
END AS New_Amount
FROM SalesData$;
```

## 7. Concatenate First Name and Last Name Initial

```sql
SELECT
    Firstname + ' ' + LEFT(Lastname, 1) AS FullNameWithInitial
FROM SalesData$;
```

## 8. Concatenate ID and Last Name

```sql
SELECT
    CONCAT(ID, ' ', Lastname) AS ID_Name
FROM SalesData;
```

## 9. If Colour is Black, Add 10 to Amount

```sql
SELECT *,
CASE
    WHEN Color = 'Black' THEN Amount + 10
    ELSE Amount
END AS Black_Amount
FROM SalesData$;
```

## 10. If Colour is Silver, Reduce Amount by 20%

```sql
SELECT *,
CASE
    WHEN Color = 'Silver' THEN Amount * 0.8
    ELSE Amount
END AS Silver_Amount
FROM SalesData$;
```

## 11. If Colour is Multi, Increase Amount by 2

```sql
SELECT *,
CASE
    WHEN Color = 'Multi' THEN Amount + 2
    ELSE Amount
END AS Multi_Amount
FROM SalesData$;
```

## 12. If Colour is White, Add 21 to Amount

```sql
SELECT *,
CASE
    WHEN Color = 'White' THEN Amount + 21
    ELSE Amount
END AS White_Amount
FROM SalesData$;
```

## 13. Filter Blue or Multi-Coloured Products and ID Between 10 and 60

```sql
SELECT *
FROM SalesData$
WHERE Color IN ('Blue', 'Multi')
AND ID BETWEEN 10 AND 60;
```

## 14. Filter Black-Coloured Products

```sql
SELECT *
FROM SalesData$
WHERE Color = 'Black';
```

## 15. Calculate Total Amount

```sql
SELECT SUM(Amount) AS Total_Amount
FROM SalesData$;
```

## 16. Calculate Total Amount by Product Subcategory

```sql
SELECT
    Product_Subcategory,
    SUM(Amount) AS Total_Amount
FROM SalesData$
GROUP BY Product_Subcategory;
```

## 17. Calculate Total Amount by Product Subcategory and Colour

```sql
SELECT
    Product_Subcategory,
    Color,
    SUM(Amount) AS Total_Amount
FROM SalesData$
GROUP BY Product_Subcategory, Color;
```

---

## Key Learning Outcomes

Through this project, I practised:

- Retrieving and manipulating data using SQL.
- Extracting information from text columns.
- Working with date functions.
- Applying conditional business rules using CASE WHEN.
- Filtering data using multiple conditions.
- Calculating totals using aggregate functions.
- Grouping data to summarise sales information.

## Dataset Information

The project uses a sales dataset containing customer details, email addresses, dates of birth, product information, colours and transaction amounts.

The original dataset is included in this repository.

## Author

 Qualified Finance Professional | Aspiring Data Analyst**

GitHub: [My GitHub Profile](https://github.com/nisha74pro)

LinkedIn: [My LinkedIn Profile](https://www.linkedin.com/poornisha-ramesh)

---

*This project is part of my ongoing SQL and Business Data Analytics learning journey.*
