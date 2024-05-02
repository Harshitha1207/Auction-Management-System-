
create table USERR(
UserID int primary key auto_increment,
UserName VARCHAR(50) NOT NULL,
Passwordd VARCHAR(50) NOT NULL,
Age INT NOT NULL,
UserRole enum('Buyer','Seller','Admin') NOT NULL,
Approved boolean DEFAULT FALSE
);

INSERT INTO USERR(Username,Passwordd,Age,UserRole,Approved) VALUES
('Daniel', 'Password1', '32','Buyer',true),
('Adam','Password2','22','Buyer',true),
('Vickey','Password3','44','Seller',true),
('Deanna','Password6','35','Seller',false),
('Lily','Password12','52','Admin',true),
('Rashmi', 'Password$%1', '24','Buyer',true), 
('Aditya','Y<3A123','26','Seller',true), 
('Sarvesh','Sarvgunnsanpam@123','22','Seller',false), 
('Yugali','Happly13','26','Buyer',false), 
('Rajath','Hatrd12','29','Admin',true), 
('Dhrumil','RnD!344', 'Seller',true);


create table product_category(
Category_ID INT PRIMARY KEY AUTO_INCREMENT,
CategoryName VARCHAR(50) NOT NULL
);

INSERT INTO Product_Category (CategoryName) VALUES
('Electronics'),
('Furniture'),
('Fashion'),
('Books'),
('Automobile'),
('Patio/Garden Equipments'),
('Medical');

SELECT * FROM product_category

CREATE TABLE Product(
ProductID INT PRIMARY KEY AUTO_INCREMENT,
ProductName VARCHAR(100) NOT NULL,
ProductDetails TEXT,
CategoryID INT NOT NULL,
SellerID INT NOT NULL,
FOREIGN KEY (CategoryID) REFERENCES Product_Category(CategoryID),
FOREIGN KEY (SellerID) REFERENCES User(UserID)
);

select * from product
select * from userr

INSERT INTO Product (ProductName, ProductDetails, CategoryID, SellerID)
VALUES
('iPhone X', 'Apple iPhone X with 64GB storage', 1, 3),
('Samsung TV', 'Samsung 55-inch Smart TV', 2, 4),
('Louis Vuitton Bag', 'LV Monogram Canvas Bag', 3, 5),
('Harry Potter and the Philosopher\'s Stone', 'J.K. Rowling\'s first book in the Harry
Potter series', 4, 3),
('MacBook Pro', 'Apple MacBook Pro with 16GB RAM and 512GB SSD', 1, 4);

INSERT INTO Product (ProductName, ProductDetails, Category_ID, SellerID)
VALUES
('Audi - A6', '1 year Old used Car', 5, 8),
('Life Size Skeleton', 'Anatomy Lab studies- Skeleton for sale', 7, 9),
('Gardening tool set', '3Pc mini gardening tool, wooden handle', 6, 4);

CREATE TABLE Auction (
AuctionID INT PRIMARY KEY AUTO_INCREMENT,
ProductID INT NOT NULL,
BiddingStartTime DATETIME NOT NULL,
BiddingEndTime DATETIME NOT NULL,
WinningBidID INT,
FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
FOREIGN KEY (WinningBidID) REFERENCES Bid(BidID)
);

INSERT INTO Auction (ProductID, BiddingStartTime, BiddingEndTime,
WinningBidID) VALUES
(1, '2023-04-17 10:00:00', '2023-04-17 12:00:00', NULL),
(2, '2023-04-17 14:00:00', '2023-04-17 16:00:00', NULL),
(3, '2023-04-17 18:00:00', '2023-04-17 20:00:00', NULL),
(4, '2023-04-17 10:00:00', '2023-04-17 12:00:00', NULL),
(5, '2023-04-17 14:00:00', '2023-04-17 16:00:00', NULL);


CREATE TABLE Bid (
BidID INT PRIMARY KEY AUTO_INCREMENT,
AuctionID INT NOT NULL,
UserID INT NOT NULL,
BidAmount DECIMAL(10, 2) NOT NULL,
BidTime DATETIME NOT NULL,
FOREIGN KEY (AuctionID) REFERENCES Auction(AuctionID),
FOREIGN KEY (UserID) REFERENCES User(UserID)
);
INSERT INTO Bid (AuctionID, UserID, BidAmount, BidTime) VALUES
(1, 1, 150.00, '2023-04-17 10:30:00'),
(1, 2, 180.00, '2023-04-17 10:45:00'),
(1, 3, 200.00, '2023-04-17 11:00:00'),
(2, 1, 300.00, '2023-04-17 14:15:00'),
(2, 2, 250.00, '2023-04-17 14:30:00'),
(3, 3, 150.00, '2023-04-17 18:30:00'),
(3, 4, 180.00, '2023-04-17 18:45:00'),
(4, 2, 100.00, '2023-04-17 10:15:00'),
(4, 3, 120.00, '2023-04-17 10:30:00'),
(5, 1, 200.00, '2023-04-17 14:30:00'),
(5, 2, 250.00, '2023-04-17 14:45:00');

CREATE TABLE Administrator (
AdminID INT PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Email VARCHAR(100) NOT NULL,
Passwordd VARCHAR(100) NOT NULL,
CreatedAt DATETIME NOT NULL
);

drop table administrator


INSERT INTO Administrator (FirstName, LastName, Email, Passwordd, CreatedAt)
VALUES
('John', 'Doe', 'john.doe@example.com', 'mypassword1', '2023-04-17 09:00:00'),
('Jane', 'Smith', 'jane.smith@example.com', 'mypassword2', '2023-04-17 09:30:00'),
('David', 'Brown', 'david.brown@example.com', 'mypassword3', '2023-04-17 10:15:00');

select * from administrator


CREATE TABLE Feedback (
FeedbackID INT PRIMARY KEY AUTO_INCREMENT,
UserID INT NOT NULL,
AuctionID INT NOT NULL,
Rating INT NOT NULL,
Comment VARCHAR(255),
CreatedAt DATETIME NOT NULL,
FOREIGN KEY (UserID) REFERENCES User(UserID),
FOREIGN KEY (AuctionID) REFERENCES Auction(AuctionID)
);


INSERT INTO Feedback (UserID, AuctionID, Rating, Comment, CreatedAt) VALUES
(1, 1, 5, 'Great product! Fast shipping.', '2023-04-17 11:30:00'),
(2, 1, 4, 'Good condition, but slow shipping.', '2023-04-17 12:00:00'),
(3, 2, 3, 'Average product quality.', '2023-04-17 15:30:00'),
(4, 2, 5, 'Excellent service!', '2023-04-17 16:45:00'),
(1, 3, 4, 'Product as described, but late delivery.', '2023-04-17 20:15:00'),
(3, 3, 2, 'Poor product quality and slow customer support.', '2023-04-17
20:30:00');

INSERT INTO Feedback (UserID, AuctionID, Rating, Comment, CreatedAt) VALUES
(7, 5, 4, 'Great product! Shipping could have been faster.', '2023-04-17 16:37:08');

CREATE TABLE Shipment (
ShipmentID INT PRIMARY KEY AUTO_INCREMENT,
AuctionID INT NOT NULL,
UserID INT NOT NULL,
ShippingAddress VARCHAR(255) NOT NULL,
ShipmentStatus VARCHAR(50) NOT NULL,
ShippedAt DATETIME NOT NULL,
FOREIGN KEY (AuctionID) REFERENCES Auction(AuctionID),
FOREIGN KEY (UserID) REFERENCES User(UserID)
);


INSERT INTO Shipment (AuctionID, UserID, ShippingAddress, ShipmentStatus,
ShippedAt) VALUES
(1, 1, '1234 Elm Street, Springfield, IL', 'Shipped', '2023-04-17 12:30:00'),
(2, 2, '5678 Oak Avenue, Chicago, IL', 'Shipped', '2023-04-17 14:45:00'),
(3, 3, '7890 Maple Road, Peoria, IL', 'Pending', NULL),
(4, 4, '2345 Birch Lane, Rockford, IL', 'Delivered', '2023-04-17 18:15:00');

select * from product_category
select * from feedback
select * from auction
select * from bid

SELECT u.Username, f.comment, f.Rating
FROM Feedback f
INNER JOIN Userr u ON f.UserID = u.UserID
WHERE f.AuctionID = '5'

SELECT p.ProductName, p.ProductDetails, u.Username AS SellerUsername
FROM Product p
INNER JOIN Userr u ON p.SellerID = u.UserID
INNER JOIN Auction a ON p.ProductID = a.ProductID
WHERE a.BiddingEndTime < NOW();


SELECT c.CategoryName, COUNT(*) AS TotalProducts
FROM Product_Category c
INNER JOIN Product p ON c.Category_ID = p.Category_ID
INNER JOIN Auction a ON p.ProductID = a.ProductID
GROUP BY c.CategoryName
ORDER BY COUNT(*) DESC
LIMIT 1;
 
show tables

SELECT b.BidAmount, u.Username AS WinningBidderUsername
FROM Bid b
INNER JOIN userr u ON b.UserID = u.UserID
WHERE b.AuctionID = 2
ORDER BY b.BidAmount DESC
LIMIT 1;

select * from auction

SELECT SUM(auctionSalePrice) AS TotalSalesRevenue
FROM (
    SELECT p.ProductName, a.AuctionSalePrice
    FROM Product p
    JOIN Auction a ON p.ProductID = a.ProductID
    WHERE p.SellerID = 1
      AND a.AuctionStatus = 'Closed'
      AND a.AuctionEndsAt BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW()
) AS sellerSales;

SELECT COUNT(*) AS TotalBids, AVG(b.BidAmount) AS AverageBidAmount
FROM Bid b
WHERE b.AuctionID = 3

SELECT a.AuctionID, a.BiddingStartTime, a.BiddingEndTime, p.ProductName, p.ProductDetails, u.Username AS WinnerUsername, b.BidAmount AS WinningBidAmount,b.userID
FROM Auction a
JOIN Product p ON a.ProductID = p.ProductID
LEFT JOIN Bid b ON a.AuctionID = b.AuctionID AND b.BidAmount = (SELECT MAX(BidAmount) FROM Bid WHERE AuctionID = a.AuctionID)
LEFT JOIN Userr u ON b.userID = u.UserID
WHERE a.BiddingEndTime < NOW();

SELECT a.AuctionID, a.BiddingStartTime, a.BiddingEndTime, b.BidAmount, p.ProductName, p.ProductDetails
FROM Auction a 
JOIN Product p ON a.ProductID = p.ProductID
JOIN Bid b ON a.auctionID = B.AuctionID
WHERE a.AuctionID = 4;

SELECT COUNT(*) AS TotalBids
FROM Bid
WHERE AuctionID = 8;

SELECT UserID, COUNT(*) AS TotalBids
FROM Bid
GROUP BY userID
ORDER BY TotalBids DESC
LIMIT 1;

SELECT u.Username, u.userID, COUNT(*) AS TotalBids
FROM Userr u
INNER JOIN Bid b ON u.UserID = b.UserID
GROUP BY b.UserID
ORDER BY TotalBids DESC
LIMIT 1;

select * from userr
select * from product
select * from auction
select * FROM BID