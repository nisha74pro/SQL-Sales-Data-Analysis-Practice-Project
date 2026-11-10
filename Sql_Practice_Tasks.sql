CREATE DATABASE Practice

Use Practice;

SELECT * FROM SalesData$;
----------------------------------------------------------------------------------------------------
/*Concatenate FirstName and LastNames and call the Column FullName*/

SELECT TOP(50)
       FirstName, LastName,
       CONCAT(FirstName,' ',LastName)       AS    FullName
FROM SalesData$;

-------------------------------------------------------------------------------------------------------
/*Extract username from emailaddress and allias it as Username*/

SELECT
      LEFT(Email,CHARINDEX('@', Email) - 1)      AS      UserName
FROM SalesData$;

--------------------------------------------------------------------------------------------------------
/*Extract domainname from emailaddress and allias it as DomainName*/

SELECT
      RIGHT(Email,CHARINDEX('@', Email) )      AS      DomainName
FROM SalesData$;

---------------------------------------------------------------------------------------------------------
/*Find age of each Customer from DOB*/

SELECT
    FirstName,
    DOB,
    DATEDIFF(YEAR, DOB, GETDATE()) AS Age
FROM SalesData$;

----------------------------------------------------------------------------------------------------------
/*Implement price structure in Amount column
If Amount is between £51 and £80, reduce it by £20. Otherwise, leave it unchanged*/

SELECT *,
CASE
    WHEN Amount BETWEEN 51 AND 80 THEN Amount - 20
    ELSE Amount
END AS New_Amount
FROM SalesData$;

-------------------------------------------------------------------------------------------------------------
/*Concatenate Firstname and Lastname initial*/

SELECT
    Firstname + ' ' + LEFT(Lastname, 1) AS FullNameWithInitial
FROM SalesData$;

--------------------------------------------------------------------------------------------------------------
/*Concatenate ID and Last Name*/

SELECT
    CONCAT(ID, ' ', Lastname) AS ID_Name
FROM SalesData;

--------------------------------------------------------------------------------------------------------------
/*If Colour is Black, add 10 to Amount*/

SELECT *,
CASE
    WHEN Color = 'Black' THEN Amount + 10
    ELSE Amount
END AS Black_Amount
FROM SalesData$;

--------------------------------------------------------------------------------------------------------------
/*If Colour is Silver, reduce Amount by 20%*/

SELECT *,
CASE
    WHEN Color = 'Silver' THEN Amount * 0.8
    ELSE Amount
END AS Silver_Amount
FROM SalesData$;
-------------------------------------------------------------------------------------------------------------
/*If Colour is Multi, increase Amount by 2*/

SELECT *,
CASE
    WHEN Color = 'Multi' THEN Amount + 2
    ELSE Amount
END AS Multi_Amount
FROM SalesData$;

----------------------------------------------------------------------------------------------------------------
/*If Colour is White, add 21 to Amount*/

SELECT *,
CASE
    WHEN Color = 'White' THEN Amount + 21
    ELSE Amount
END AS White_Amount
FROM SalesData$;
-------------------------------------------------------------------------------------
/*Show all data where Colour is BLUE or Multi and ID is between 10 and 60*/

SELECT *
FROM SalesData$
WHERE Color IN ('Blue', 'Multi')
AND ID BETWEEN 10 AND 60;
--------------------------------------------------------------------------------------
/*Filter Colour to Black*/

SELECT *
FROM SalesData$
WHERE Color = 'Black';
---------------------------------------------------------------------------------------
/*Return the sum of Amount*/

SELECT SUM(Amount) AS Total_Amount
FROM SalesData$;

---------------------------------------------------------------------------------------
/*Find total Amount by Product_Subcategory*/

SELECT
    Product_Subcategory,
    SUM(Amount) AS Total_Amount
FROM SalesData$
GROUP BY Product_Subcategory;
------------------------------------------------------------------------------------------
/*Find total Amount by Product_Subcategory and Colour*/

SELECT
    Product_Subcategory,
    Color,
    SUM(Amount) AS Total_Amount
FROM SalesData$
GROUP BY Product_Subcategory, Color;
------------------------------------------------------------------------------------------
