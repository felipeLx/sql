SELECT SellStartDate, CONVERT(nvarchar(30), SellStartDate) AS ConvertedDate,CONVERT(nvarchar(30), SellStartDate, 126) AS ISO08601FormatDateFROM SalesLT.Product;

SELECT CONVERT(varchar(5), ProductID) + ': ' + Name AS ProductNameFROM SalesLT.Product;

SELECT Name, TRY_CAST(Size AS Integer) AS NumericSizeFROM SalesLT.Product;

SELECT Name, ISNULL(TRY_CAST(Size AS Integer),0) AS NumericSizeFROM SalesLT.Product;

SELECT ProductNumber, ISNULL(Color, '') + ', ' + ISNULL(Size, '') AS ProductDetails
FROM SalesLT.Product;

SELECT Name, NULLIF(Color, 'Multi') AS SingleColor
FROM SalesLT.Product;

SELECT Name, COALESCE(SellEndDate, SellStartDate) AS StatusLastUpdated
FROM SalesLT.Product;

SELECT Name,
    CASE
        WHEN SellEndDate IS NULL THEN 'Currently for sale'
        ELSE 'No longer available'
    END AS SalesStatus
FROM SalesLT.Product;

SELECT Name,
    CASE Size
        WHEN 'S' THEN 'Small'
        WHEN 'M' THEN 'Medium'
        WHEN 'L' THEN 'Large'
        WHEN 'XL' THEN 'Extra-Large'
        ELSE ISNULL(Size, 'n/a')
    END AS ProductSize
FROM SalesLT.Product;

SELECT Salesperson, Title + ' ' + LastName AS CustomerName, Phone
FROM SalesLT.Customer;

SELECT CAST(CustomerID AS varchar) + ': ' + CompanyName AS CustomerCompany
FROM SalesLT.Customer;

SELECT SalesOrderNumber + ' (' + STR(RevisionNumber, 1) + ')' AS OrderRevision,
   CONVERT(nvarchar(30), OrderDate, 102) AS OrderDate
FROM SalesLT.SalesOrderHeader;

FROM SalesLT.Customer; FROM SalesLT.Customer;

SELECT CustomerID, COALESCE(EmailAddress, Phone) AS PrimaryContact
FROM SalesLT.Customer;

SELECT SalesOrderID, OrderDate,
    CASE
        WHEN ShipDate IS NULL THEN 'Awaiting Shipment'
        ELSE 'Shipped'
    END AS ShippingStatus
FROM SalesLT.SalesOrderHeader;

# You must retrieve data from a column that is defined as char(1). If the value in the column is a digit between 0 and 9, the query should # return it as an integer value. Otherwise, the query should return NULL. Which function should you use?
# TRY_CONVERT

# You must return the Cellphone column from the Sales.Customer table. Cellphone is a varchar column that permits NULL values. For rows # where the Cellphone value is NULL, your query should return the text 'None'. What query should you use?
SELECT ISNULL(Cellphone, 'None') AS Cellphone FROM Sales.Customer;

