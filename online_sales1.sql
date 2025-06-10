SELECT * FROM data.details;

SELECT COUNT(DISTINCT Quantity) as Profit FROM data.details;

SELECT Category, SUM(profit) as PaymentMode FROM data.details GROUP BY Category;
SELECT PaymentMode, AVG(Quantity) as Profit FROM data.details GROUP BY PaymentMode;

SELECT SUM(Amount) FROM data.details;

SELECT * FROM data.details ORDER BY Quantity ASC;
SELECT * FROM data.details ORDER BY Quantity DESC;

SELECT Category, SUM(Profit) AS Profit FROM data.details WHERE Quantity >= 4 AND Profit > GROUP BY Category;