-- Makes sure we are using the correct database
USE WebShopDB
GO

-- Stored procedure for rating products
    -- Inserts rating
    -- Updates average rating the product that has been rated
CREATE OR ALTER PROCEDURE RateProduct 
	(@UserID INT, @ProductID INT, @Score NUMERIC(1,0), @Comment TEXT)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			SET NOCOUNT ON

			INSERT INTO TRating (nUserID, nProductID, nScore, cComment)
				VALUES (@UserID, @ProductID, @Score, @Comment)

			-- To text that transaction rolls back:
			--	RAISERROR (
			--		'Error raised in TRY block.',			-- Message text
            --		16,										-- Severity
            --		1										-- State
            --	);

			DECLARE @RatingCount NUMERIC(2,1)
			SET @RatingCount = (SELECT COUNT(*) FROM TRating WHERE nProductID = @ProductID)
			PRINT (@RatingCount)

			DECLARE @Ratings INT
			SET @Ratings = (SELECT SUM(nScore) FROM TRating WHERE nProductID = @ProductID)
			PRINT(@Ratings)

			DECLARE @NewAverageRating NUMERIC(2,1)
			SET @NewAverageRating = (@Ratings / @RatingCount)
			PRINT (@NewAverageRating)

			UPDATE TProduct
				SET nAverageRating = @NewAverageRating
				WHERE nProductID = @ProductID

			COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
END
GO
-- Example run: EXEC RateProduct 9, 9, 3, 'Decent'


-- Stored procedure for searching products
    -- Checks against both name and description
    -- Note that the description is converted to VARCHAR, because TEXT doesn't work with string concatenation
USE WebShopDB
GO
CREATE OR ALTER PROCEDURE SearchProduct 
	(@ProductName VARCHAR(40), @ProductDescription TEXT)
AS
BEGIN
	SELECT * FROM TProduct
		WHERE cName LIKE '%' + @ProductName + '%'
		AND cDescription LIKE '%' + CONVERT(VARCHAR(MAX), @ProductDescription) + '%'
END
GO

USE WebShopDB
GO
CREATE OR ALTER PROCEDURE CheckStock 
	(@Quantity INT, @ProductID INT, @InStock BIT OUTPUT)
AS
DECLARE @CalculatedStock INT
BEGIN
	SELECT @CalculatedStock = (nStock - @Quantity) FROM TProduct
		WHERE nProductID = @ProductID
	IF (@CalculatedStock < 0)
		SET @InStock = 0
	ELSE
		SET @InStock = 1
END
GO

USE WebShopDB
GO
CREATE OR ALTER PROCEDURE CheckStockAndInsertInvoiceLine
	(@Quantity INT, @ProductID INT, @InvoiceID INT, @UnitPrice MONEY)
AS
DECLARE @CalculatedStock INT
DECLARE @CurrentStock INT
BEGIN
	SET @CurrentStock = (SELECT nStock FROM TProduct
		WHERE nProductID = @ProductID)
	SET @CalculatedStock = (@CurrentStock - @Quantity)
	
	IF (@CalculatedStock < 0)
		RAISERROR ('Item not in stock', 16, 1);
	ELSE
		INSERT INTO TInvoiceLine (nInvoiceID, nProductID, nQuantity, nUnitPrice) 
			VALUES (@invoiceID, @productID, @quantity, @unitPrice)
		UPDATE TProduct
			SET nStock = (nStock - @Quantity)
			WHERE nProductID = @ProductID
END
GO

USE WebShopDB
GO
CREATE OR ALTER PROCEDURE UpdateCreditCardAnUser
	(@CreditCardID INT, @UserID INT, @TotalAmountSpent MONEY)
AS
BEGIN
	UPDATE TCreditCard
		SET nTotalAmountSpent = (nTotalAmountSpent + @TotalAmountSpent)
		WHERE nCreditCardID = @CreditCardID

	UPDATE TUser
		SET nTotalSpent = (nTotalSpent + @TotalAmountSpent)
		WHERE nUserID = @UserID
END
GO