-- Question 1 Achieving 1NF (First Normal Form)
-- Question 1: Achieving First Normal Form (1NF)
-- Original table had a multi-valued column 'Products', which violates 1NF
-- In 1NF, each column must contain atomic (single) values
-- Solution: Split each product into its own row while preserving OrderID and CustomerName

-- Create normalized ProductDetail_1NF table
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Insert atomic product entries into ProductDetail_1NF
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Question 2 Achieving 2NF (Second Normal Form)
-- Insert customer data into Orders_2NF
INSERT INTO Orders_2NF (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Create OrderDetails_2NF table to hold product and quantity info
-- Each row now fully depends on the composite key (OrderID, Product)
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders_2NF(OrderID)
);

-- Insert product data into OrderDetails_2NF
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

