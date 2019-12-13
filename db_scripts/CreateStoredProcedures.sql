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
CREATE OR ALTER PROCEDURE SearchProduct 
	(@ProductName VARCHAR(40), @ProductDescription TEXT)
AS
BEGIN
	SELECT * FROM TProduct
		WHERE cName LIKE '%' + @ProductName + '%'
		AND cDescription LIKE '%' + CONVERT(VARCHAR(MAX), @ProductDescription) + '%'
END
GO