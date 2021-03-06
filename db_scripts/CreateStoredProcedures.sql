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
CREATE OR ALTER PROCEDURE BuyProduct 
	(@Tax NUMERIC(4,2), @TotalAmount MONEY, @CreditCardID INT, @UserID INT, @JSON_PRODUCTS NVARCHAR(MAX))
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			SET NOCOUNT ON
			DECLARE @InvoiceID INT

			INSERT INTO TInvoice(nTax, nTotalAmount, nCreditCardID)
				VALUES (@Tax, @TotalAmount, @CreditCardID)
			SET @InvoiceID = SCOPE_IDENTITY() -- Last identity value generated in this scope (InvoiceID)
			
			DECLARE @CurrentStock TABLE(ProductID INT, Stock INT, Quantity INT, CalculatedStock AS (Stock - Quantity))
			INSERT INTO @CurrentStock
				SELECT nProductID, nStock, Quantity FROM OPENJSON(@JSON_PRODUCTS)
				WITH (
					ProductID INT '$.nProductID',
					Quantity INT '$.quantity',
					UnitPrice MONEY '$.unitPrice'
				)
				INNER JOIN TProduct
					ON nProductID = ProductID

			DECLARE @InsufficientStock INT
			SET @InsufficientStock = (
				SELECT COUNT(*) FROM @CurrentStock WHERE
					CalculatedStock < 0
				)

			IF (@InsufficientStock > 0)
				BEGIN
					RAISERROR('Item not in stock', 16, 1);
				END
			ELSE
				BEGIN
					INSERT INTO TInvoiceLine([nInvoiceID],[nProductID],[nQuantity],[nUnitPrice]) 
						SELECT @InvoiceId, ProductID, Quantity, UnitPrice FROM OPENJSON(@JSON_PRODUCTS)
						WITH (
							ProductID INT '$.nProductID',
							Quantity INT '$.quantity',
							UnitPrice MONEY '$.unitPrice'
						)

					UPDATE TProduct
						SET TProduct.nStock = cs.CalculatedStock FROM TProduct p
							INNER JOIN @CurrentStock cs
								ON p.nProductID = cs.ProductID

					UPDATE TCreditCard
						SET nTotalAmountSpent = (nTotalAmountSpent + @TotalAmount)
						WHERE nCreditCardID = @CreditCardID

					UPDATE TUser
						SET nTotalSpent = (nTotalSpent + @TotalAmount)
						WHERE nUserID = @UserID
											
					COMMIT
				END
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH
END
GO