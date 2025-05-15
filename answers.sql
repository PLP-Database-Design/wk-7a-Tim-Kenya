Question 1: 
SELECT OrderID, CustomerName, Product
FROM ProductDetail
CROSS APPLY string_to_table(Products, ',');

Question 2: 
CREATE TABLE Orders (
    OrderID INT,
    CustomerName VARCHAR(255),
    PRIMARY KEY (OrderID)
);
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;
CREATE TABLE OrderProducts (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
INSERT INTO OrderProducts (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
