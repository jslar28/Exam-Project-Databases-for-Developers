-- First creates the database and then creates all the tables
CREATE DATABASE WebShopDB
GO

-- Make sure we are using the correct database
USE WebShopDB

-- Creates tables
CREATE TABLE TCity (
	nCityID SMALLINT NOT NULL IDENTITY (1,1),
	cCityName VARCHAR(40) NOT NULL,
	CONSTRAINT PK_TCity PRIMARY KEY (nCityID)
);

CREATE TABLE TIBAN (
	nIBANID INT NOT NULL IDENTITY(1,1),
	cIBAN VARCHAR(40) NOT NULL UNIQUE,
	CONSTRAINT PK_TIBAN PRIMARY KEY (nIBANID)
);

CREATE TABLE TCardHolder(
	nCardHolderID INT NOT NULL UNIQUE IDENTITY(1,1),
	cName VARCHAR(50) NOT NULL,
	CONSTRAINT PK_TCardHolder PRIMARY KEY (nCardHolderID)
);

CREATE TABLE TUser (
	nUserID INT NOT NULL IDENTITY(1,1),
	cFirstName VARCHAR(40) NOT NULL,
	cSurname VARCHAR(40) NOT NULL,
	cAddress VARCHAR(100),
	cZipCode CHAR(4) NOT NULL,
	nCityID SMALLINT NOT NULL,
	cPhoneNumber CHAR(8) NOT NULL,
	cEmail VARCHAR(255) NOT NULL UNIQUE CHECK(cEmail LIKE '%@%.%'),
	nTotalSpent MONEY NOT NULL DEFAULT 0,
	CONSTRAINT PK_TUser PRIMARY KEY (nUserID),
	CONSTRAINT FK_TUser_TCity FOREIGN KEY (nCityID) REFERENCES TCity (nCityID) ON UPDATE CASCADE
);

CREATE TABLE TCreditCard (
	nCreditCardID INT NOT NULL IDENTITY(1,1),
	cCardNumber CHAR(16) NOT NULL,
	nIBANID INT,
	nCardHolderID INT NOT NULL,
	cExpiryDate CHAR(5) NOT NULL CHECK (cExpiryDate LIKE '__/__'),
	cCCV CHAR(3) NOT NULL,
	nTotalAmountSpent MONEY NOT NULL DEFAULT 0,
	nUserID INT NOT NULL,
	CONSTRAINT PK_TCreditCard PRIMARY KEY (nCreditCardID),
	CONSTRAINT FK_TCreditCard_TIBAN FOREIGN KEY (nIBANID) REFERENCES TIBAN (nIBANID) ON UPDATE CASCADE,
	CONSTRAINT FK_TCreditCard_TCardHolder FOREIGN KEY (nCardHolderID) REFERENCES TCardHolder (nCardHolderID) ON UPDATE CASCADE,
	CONSTRAINT FK_TCreditCard_TUser FOREIGN KEY (nUserID) REFERENCES TUser (nUserID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE TProduct (
	nProductID INT NOT NULL IDENTITY(1,1),
	cName VARCHAR(40) NOT NULL,
	cDescription TEXT,
	nUnitPrice MONEY NOT NULL,
	nStock SMALLINT NOT NULL DEFAULT 0,
	nAverageRating NUMERIC(2,1) NOT NULL DEFAULT 0,
	dValidFrom DATETIME2 (2) GENERATED ALWAYS AS ROW START,
	dValidTo DATETIME2 (2) GENERATED ALWAYS AS ROW END,
	PERIOD FOR SYSTEM_TIME (dValidFrom, dValidTo),
	CONSTRAINT PK_TProduct PRIMARY KEY (nProductID)
) WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.TProductHistory));

CREATE TABLE TInvoice (
	nInvoiceID INT NOT NULL IDENTITY(1,1),
	dDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	nTax NUMERIC(4,2) NOT NULL,
	nTotalAmount MONEY NOT NULL,
	nCreditCardID INT NOT NULL,
	CONSTRAINT PK_TInvoice PRIMARY KEY (nInvoiceID),
	CONSTRAINT FK_TInvoice_TCreditCard FOREIGN KEY (nCreditCardID) REFERENCES TCreditCard (nCreditCardID) ON UPDATE CASCADE
);

CREATE TABLE TInvoiceLine(
	nInvoiceID INT NOT NULL,
	nProductID INT NOT NULL,
	nQuantity SMALLINT NOT NULL,
	nUnitPrice MONEY NOT NULL,
	CONSTRAINT PK_TInvoiceLine PRIMARY KEY (nInvoiceID, nProductID),
	CONSTRAINT FK_TInvoiceLine_TInvoice FOREIGN KEY (nInvoiceID) REFERENCES TInvoice (nInvoiceID) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_TInvoiceLine_TProduct FOREIGN KEY (nProductID) REFERENCES TProduct (nProductID) ON UPDATE CASCADE
);

CREATE TABLE TRating(
	nUserID INT NOT NULL,
	nProductID INT NOT NULL,
	nScore NUMERIC (1,0) NOT NULL,
	cComment TEXT,
	dValidFrom DATETIME2 (2) GENERATED ALWAYS AS ROW START,
	dValidTo DATETIME2 (2) GENERATED ALWAYS AS ROW END,
	PERIOD FOR SYSTEM_TIME (dValidFrom, dValidTo),
	CONSTRAINT PK_TRating PRIMARY KEY (nUserID, nProductID),
	CONSTRAINT FK_TRating_TUser FOREIGN KEY (nUserID) REFERENCES TUser (nUserID) ON DELETE CASCADE ON UPDATE CASCADE, 
	CONSTRAINT FK_TRating_TProduct FOREIGN KEY (nProductID) REFERENCES TProduct (nProductID) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT CHK_nScore CHECK (nScore>=0 AND nScore<=5)
)  WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.TRatingHistory));


-- Creates audit tables
CREATE TABLE TUserAudit (
	nUserAuditID BIGINT NOT NULL IDENTITY(1,1),
	nUserIDBefore INT,
	cFirstNameBefore VARCHAR(40),
	cSurnameBefore VARCHAR(40),
	cAddressBefore VARCHAR(100),
	cZipCodeBefore CHAR(4),
	cPhoneNumberBefore CHAR(8),
	cEmailBefore VARCHAR(50),
	nTotalSpentBefore MONEY,
	nUserIDAfter INT,
	cFirstNameAfter VARCHAR(40),
	cSurnameAfter VARCHAR(40),
	cAddressAfter VARCHAR(100),
	cZipCodeAfter CHAR(4),
	cPhoneNumberAfter CHAR(8),
	cEmailAfter VARCHAR(50),
	nTotalSpentAfter MONEY,
	cTypeOfStatement CHAR(6) NOT NULL,
	cTimeOfQuery DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
	cDBMSUserID VARCHAR(50) NOT NULL DEFAULT SUSER_ID(),
	cDBMSUser VARCHAR(50) NOT NULL DEFAULT SUSER_NAME(),
	cHostID VARCHAR(50) NOT NULL DEFAULT HOST_ID(), -- hostID/ID of computer
	cHost VARCHAR(50) NOT NULL DEFAULT HOST_NAME(), -- hostname/name of computer
	CONSTRAINT PK_TUserAudit PRIMARY KEY (nUserAuditID),
);

CREATE TABLE TCreditCardAudit (
	nCreditCardAuditID BIGINT IDENTITY(1,1),
	nCreditCardIDBefore INT,
	cCardNumberBefore CHAR(16),
	nIBANIDBefore INT,
	nCardHolderIDBefore INT,
	cExpiryDateBefore CHAR(5),
	cCCVBefore CHAR(3),
	nTotalAmountSpentBefore MONEY,
	nUserIDBefore INT,
	nCreditCardIDAfter INT,
	cCardNumberAfter CHAR(16),
	nIBANIDAfter INT,
	nCardHolderIDAfter INT,
	cExpiryDateAfter CHAR(5),
	cCCVAfter CHAR(3),
	nTotalAmountSpentAfter MONEY,
	nUserIDAfter INT,
	cTypeOfStatement CHAR(6) NOT NULL,
	cTimeOfQuery DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
	cDBMSUserID VARCHAR(50) NOT NULL DEFAULT SUSER_ID(),
	cDBMSUser VARCHAR(50) NOT NULL DEFAULT SUSER_NAME(),
	cHostID VARCHAR(50) NOT NULL DEFAULT HOST_ID(), -- hostID/ID of computer
	cHost VARCHAR(50) NOT NULL DEFAULT HOST_NAME(), -- hostname/name of computer
	CONSTRAINT PK_TCreditCardAudit PRIMARY KEY (nCreditCardAuditID)
);
GO
-- Make sure we are using the correct database


-- Make sure to use the correct database
USE WebShopDB

-- Creates the login AdminUser with password 'Password123'.  
CREATE LOGIN AdminUser	  
    WITH PASSWORD = 'Password123';  

-- Creates a database user for the login created above.  
CREATE USER AdminUser FOR LOGIN AdminUser;  

-- Grant user AdminUser the role of db_owner
ALTER ROLE db_owner ADD MEMBER AdminUser;
ALTER LOGIN AdminUser WITH DEFAULT_DATABASE = WebShopDB

-- Creates the login Mehmet with password 'Qwerty123'.
CREATE LOGIN Mehmet
	WITH PASSWORD = 'Qwerty123'

-- Creates a database user for the login created above.
CREATE USER Mehmet FOR LOGIN Mehmet;

-- Grant user Mehmet the role of db_datareader
ALTER ROLE db_datareader ADD MEMBER Mehmet;
ALTER LOGIN Mehmet WITH DEFAULT_DATABASE = WebShopDB

-- Creates the login Jakob with password 'Wasd123'.
CREATE LOGIN Jakob
	WITH PASSWORD = 'Wasd123'

-- Creates a database user for the login created above.
CREATE USER Jakob FOR LOGIN Jakob;

-- Grant user Jakob the role of db_datareader
ALTER ROLE db_datareader ADD MEMBER Jakob;
ALTER LOGIN Jakob WITH DEFAULT_DATABASE = WebShopDB
DENY SELECT ON OBJECT::dbo.TInvoice TO Jakob;
DENY SELECT ON OBJECT::dbo.TInvoiceLine TO Jakob;

GO
 --Remember to write down design descisions
 --We decided to use the SQL server standart fixed database level roles because
 --they already contained the permissions we needed for our users, the only thing
 --we needed to alter was the SELECT permissions for the restricted reader user on
 --the invoice related tables


-- Makes sure we are using the correct database
USE WebShopDB
GO

-- Audit table triggers for TUser
CREATE OR ALTER TRIGGER triggerUserAuditInsertAfter ON dbo.TUser
	AFTER INSERT
AS
BEGIN
	DECLARE @nUserID INT
	DECLARE @cFirstName VARCHAR(40)
	DECLARE @cSurname VARCHAR(40)
	DECLARE @cAddress VARCHAR(100)
	DECLARE @cZipCode CHAR(4)
	DECLARE @cPhoneNumber CHAR(8)
	DECLARE @cEmail VARCHAR(50)
	DECLARE @nTotalSpent SMALLMONEY	

	SELECT @nUserID = nUserID, @cFirstName = cFirstName, @cSurname = cSurname, @cAddress = cAddress,
		@cZipCode = cZipCode, @cPhoneNumber = cPhoneNumber, @cEmail = cEmail, @nTotalSpent = nTotalSpent
	FROM inserted
		
	INSERT INTO dbo.TUserAudit (nUserIDAfter, cFirstNameAfter, cSurnameAfter, cAddressAfter, cZipCodeAfter,
								cPhoneNumberAfter, cEmailAfter, nTotalSpentAfter, cTypeOfStatement)
	VALUES (@nUserID, @cFirstName, @cSurname, @cAddress, @cZipCode, @cPhoneNumber, @cEmail, @nTotalSpent, 'Insert')
END
GO

CREATE OR ALTER TRIGGER triggerUserAuditDeleteAfter ON dbo.TUser
	AFTER DELETE
AS
BEGIN
	DECLARE @nUserID INT
	DECLARE @cFirstName VARCHAR(40)
	DECLARE @cSurname VARCHAR(40)
	DECLARE @cAddress VARCHAR(100)
	DECLARE @cZipCode CHAR(4)
	DECLARE @cPhoneNumber CHAR(8)
	DECLARE @cEmail VARCHAR(50)
	DECLARE @nTotalSpent SMALLMONEY	

	SELECT @nUserID = nUserID, @cFirstName = cFirstName, @cSurname = cSurname, @cAddress = cAddress,
		@cZipCode = cZipCode, @cPhoneNumber = cPhoneNumber, @cEmail = cEmail, @nTotalSpent = nTotalSpent
	FROM deleted
		
	INSERT INTO dbo.TUserAudit (nUserIDBefore, cFirstNameBefore, cSurnameBefore, cAddressBefore, cZipCodeBefore,
								cPhoneNumberBefore, cEmailBefore, nTotalSpentBefore, cTypeOfStatement)
	VALUES (@nUserID, @cFirstName, @cSurname, @cAddress, @cZipCode, @cPhoneNumber, @cEmail, @nTotalSpent, 'Delete')
END
GO

CREATE OR ALTER TRIGGER triggerUserAuditUpdateAfter ON dbo.TUser
	AFTER UPDATE
AS
BEGIN
	DECLARE @nUserIDBefore INT
	DECLARE @cFirstNameBefore VARCHAR(40)
	DECLARE @cSurnameBefore VARCHAR(40)
	DECLARE @cAddressBefore VARCHAR(100)
	DECLARE @cZipCodeBefore CHAR(4)
	DECLARE @cPhoneNumberBefore CHAR(8)
	DECLARE @cEmailBefore VARCHAR(50)
	DECLARE @nTotalSpentBefore SMALLMONEY
	DECLARE @nUserIDAfter INT
	DECLARE @cFirstNameAfter VARCHAR(40)
	DECLARE @cSurnameAfter VARCHAR(40)
	DECLARE @cAddressAfter VARCHAR(100)
	DECLARE @cZipCodeAfter CHAR(4)
	DECLARE @cPhoneNumberAfter CHAR(8)
	DECLARE @cEmailAfter VARCHAR(50)
	DECLARE @nTotalSpentAfter SMALLMONEY

	SELECT @nUserIDBefore = nUserID, @cFirstNameBefore = cFirstName, @cSurnameBefore = cSurname, @cAddressBefore = cAddress,
		@cZipCodeBefore = cZipCode, @cPhoneNumberBefore = cPhoneNumber, @cEmailBefore = cEmail, @nTotalSpentBefore = nTotalSpent
	FROM deleted

	SELECT @nUserIDAfter = nUserID, @cFirstNameAfter = cFirstName, @cSurnameAfter = cSurname, @cAddressAfter = cAddress,
		@cZipCodeAfter = cZipCode, @cPhoneNumberAfter = cPhoneNumber, @cEmailAfter = cEmail, @nTotalSpentAfter = nTotalSpent
	FROM inserted
		
	INSERT INTO dbo.TUserAudit (nUserIDBefore, cFirstNameBefore, cSurnameBefore, cAddressBefore, cZipCodeBefore,
				cPhoneNumberBefore, cEmailBefore, nTotalSpentBefore, 
				nUserIDAfter, cFirstNameAfter, cSurnameAfter, cAddressAfter, cZipCodeAfter,
				cPhoneNumberAfter, cEmailAfter, nTotalSpentAfter, cTypeOfStatement)
			VALUES (@nUserIDBefore, @cFirstNameBefore, @cSurnameBefore, @cAddressBefore, @cZipCodeBefore,
					@cPhoneNumberBefore, @cEmailBefore, @nTotalSpentBefore,
					@nUserIDAfter, @cFirstNameAfter, @cSurnameAfter, @cAddressAfter, @cZipCodeAfter,
					@cPhoneNumberAfter, @cEmailAfter, @nTotalSpentAfter, 'Update')
END
GO

-- Audit table triggers for TCreditCard
CREATE OR ALTER TRIGGER triggerCreditCardAuditInsertAfter ON dbo.TCreditCard
	AFTER INSERT
AS
BEGIN
	DECLARE @nCreditCardID INT
	DECLARE @cCardNumber CHAR(16)
	DECLARE @nIBANID INT
	DECLARE @nCardHolderID INT
	DECLARE @cExpiryDate CHAR(5)
	DECLARE @cCCV CHAR(3)
	DECLARE @nTotalAmountSpent SMALLMONEY
	DECLARE @nUserID INT

	SELECT @nCreditCardID = nCreditCardID, @cCardNumber = cCardNumber, @nIBANID = nIBANID, @nCardHolderID = nCardHolderID,
		@cExpiryDate = cExpiryDate, @cCCV = cCCV, @nTotalAmountSpent = nTotalAmountSpent, @nUserID = nUserID
	FROM inserted
		
	INSERT INTO dbo.TCreditCardAudit (nCreditCardIDAfter, cCardNumberAfter, nIBANIDAfter, nCardHolderIDAfter,
									cExpiryDateAfter, cCCVAfter, nTotalAmountSpentAfter, nUserIDAfter, cTypeOfStatement)
	VALUES (@nCreditCardID, @cCardNumber, @nIBANID, @nCardHolderID, @cExpiryDate, @cCCV, @nTotalAmountSpent, @nUserID, 'Insert')
END
GO

CREATE OR ALTER TRIGGER triggerCreditCardAuditDeleteAfter ON dbo.TCreditCard
	AFTER DELETE
AS
BEGIN
	DECLARE @nCreditCardID INT
	DECLARE @cCardNumber CHAR(16)
	DECLARE @nIBANID INT
	DECLARE @nCardHolderID INT
	DECLARE @cExpiryDate CHAR(5)
	DECLARE @cCCV CHAR(3)
	DECLARE @nTotalAmountSpent SMALLMONEY
	DECLARE @nUserID INT

	SELECT @nCreditCardID = nCreditCardID, @cCardNumber = cCardNumber, @nIBANID = nIBANID, @nCardHolderID = nCardHolderID,
		@cExpiryDate = cExpiryDate, @cCCV = cCCV, @nTotalAmountSpent = nTotalAmountSpent, @nUserID = nUserID
	FROM deleted
		
	INSERT INTO dbo.TCreditCardAudit (nCreditCardIDBefore, cCardNumberBefore, nIBANIDBefore, nCardHolderIDBefore,
									cExpiryDateBefore, cCCVBefore, nTotalAmountSpentBefore, nUserIDBefore, cTypeOfStatement)
	VALUES (@nCreditCardID, @cCardNumber, @nIBANID, @nCardHolderID, @cExpiryDate, @cCCV, @nTotalAmountSpent, @nUserID, 'Delete')
END
GO

CREATE OR ALTER TRIGGER triggerCreditCardAuditUpdateAfter ON dbo.TCreditCard
	AFTER UPDATE
AS
BEGIN
	DECLARE @nCreditCardIDBefore INT
	DECLARE @cCardNumberBefore CHAR(16)
	DECLARE @nIBANIDBefore INT
	DECLARE @nCardHolderIDBefore INT
	DECLARE @cExpiryDateBefore CHAR(5)
	DECLARE @cCCVBefore CHAR(3)
	DECLARE @nTotalAmountSpentBefore SMALLMONEY
	DECLARE @nUserIDBefore INT
	DECLARE @nCreditCardIDAfter INT
	DECLARE @cCardNumberAfter CHAR(16)
	DECLARE @nIBANIDAfter INT
	DECLARE @nCardHolderIDAfter INT
	DECLARE @cExpiryDateAfter CHAR(5)
	DECLARE @cCCVAfter CHAR(3)
	DECLARE @nTotalAmountSpentAfter SMALLMONEY
	DECLARE @nUserIDAfter INT

	SELECT @nCreditCardIDBefore = nCreditCardID, @cCardNumberBefore = cCardNumber, @nIBANIDBefore = nIBANID, 
		@nCardHolderIDBefore = nCardHolderID, @cExpiryDateBefore = cExpiryDate, @cCCVBefore = cCCV,
		@nTotalAmountSpentBefore = nTotalAmountSpent, @nUserIDBefore = nUserID
	FROM deleted
	
	SELECT @nCreditCardIDAfter = nCreditCardID, @cCardNumberAfter = cCardNumber, @nIBANIDAfter = nIBANID, 
		@nCardHolderIDAfter = nCardHolderID, @cExpiryDateAfter = cExpiryDate, @cCCVAfter = cCCV,
		@nTotalAmountSpentAfter = nTotalAmountSpent, @nUserIDAfter = nUserID
	FROM inserted

	INSERT INTO dbo.TCreditCardAudit (nCreditCardIDBefore, cCardNumberBefore, nIBANIDBefore, nCardHolderIDBefore,
					cExpiryDateBefore, cCCVBefore, nTotalAmountSpentBefore, nUserIDBefore,
					nCreditCardIDAfter, cCardNumberAfter, nIBANIDAfter, nCardHolderIDAfter,
					cExpiryDateAfter, cCCVAfter, nTotalAmountSpentAfter, nUserIDAfter, cTypeOfStatement)
				VALUES (@nCreditCardIDBefore, @cCardNumberBefore, @nIBANIDBefore, @nCardHolderIDBefore,
						@cExpiryDateBefore, @cCCVBefore, @nTotalAmountSpentBefore, @nUserIDBefore,
						@nCreditCardIDAfter, @cCardNumberAfter, @nIBANIDAfter, @nCardHolderIDAfter,
						@cExpiryDateAfter, @cCCVAfter, @nTotalAmountSpentAfter, @nUserIDAfter,'Update')
END
GO

-- Referential integrity triggers



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


-- Insert products
USE WebShopDB
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Apple','Danish apple',2.50,9,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Orange','1. class from Spain',2.00,23,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Kiwi','From China',1.50,22,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Green Grape','1 kg. From Italy',10.00,22,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Red Grape','1 kg. From Italy',10.00,18,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Banana','1. class from Turkey',2.10,7,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Carrot','2 kg. Danish',20.00,11,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Lemon','Yellow and Juicy',2.35,13,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Cucumber','Danish',5.50,19,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Iceberg','Danish',9.50,22,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Parsley','Danish',8.00,14,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Radishes','Danish',4.50,16,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Avocado','From Turkey',8.00,14,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Onion','2 kg. Danish',18.00,2,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Garlic','Danish',13.50,4,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Aubergine','Turkish',6.00,3,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Pineapples','1. class',18.00,23,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Papaya','From Mexico',21.00,6,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Pomegranate','From Spain',9.00,4,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Lime','From Turkey',3.00,14,0);
GO

-- Insert cities
USE WebShopDB
INSERT INTO TCity([cCityName]) VALUES('København NV');
INSERT INTO TCity([cCityName]) VALUES('Frederiksberg');
INSERT INTO TCity([cCityName]) VALUES('Vanløse');
INSERT INTO TCity([cCityName]) VALUES('Næstved');
INSERT INTO TCity([cCityName]) VALUES('Silkeborg');
INSERT INTO TCity([cCityName]) VALUES('Køge');
INSERT INTO TCity([cCityName]) VALUES('Hvidovre');
INSERT INTO TCity([cCityName]) VALUES('Kongens Lyngby');
INSERT INTO TCity([cCityName]) VALUES('Skanderborg');
INSERT INTO TCity([cCityName]) VALUES('Slagelse');
GO
-- Kbh NV: 2400, Frederiksberg: 2000, Vanløse: 2720, Næstved: 4700, Silkeborg: 8600, Køge: 4600, Hvidovre: 2650, Kongens Lyngby: 2800, Skanderborg: 8660, Slagelse: 4200

-- Insert users
USE WebShopDB
INSERT INTO TUser([cFirstName],[cSurname],[cAddress],[cZipCode],[nCityID],[cPhoneNumber],[cEmail]) VALUES('John','Doe','Rentemestervej 1',2400,1,88331212,'a@a.dk');
INSERT INTO TUser([cFirstName],[cSurname],[cAddress],[cZipCode],[nCityID],[cPhoneNumber],[cEmail]) VALUES('Jakob','Jensen','Hvidovrevej 280',2650,7,76567777,'jako@jens.dk');
INSERT INTO TUser([cFirstName],[cSurname],[cAddress],[cZipCode],[nCityID],[cPhoneNumber],[cEmail]) VALUES('Mehmet','Deniz','Egevolden 188',2650,7,76567777,'me@me.dk');
INSERT INTO TUser([cFirstName],[cSurname],[cAddress],[cZipCode],[nCityID],[cPhoneNumber],[cEmail]) VALUES('Mia','Olsen','Bymuren 22',2650,7,55662121,'mia@olsen.dk');
INSERT INTO TUser([cFirstName],[cSurname],[cAddress],[cZipCode],[nCityID],[cPhoneNumber],[cEmail]) VALUES('Jakob','Fisker','Lygten 37',2400,1,90897867,'j@j.dk');
INSERT INTO TUser([cFirstName],[cSurname],[cAddress],[cZipCode],[nCityID],[cPhoneNumber],[cEmail]) VALUES('Mette','Mortensen','Valbyvej 65',4200,10,76567777,'me@Mortensen.dk');
INSERT INTO TUser([cFirstName],[cSurname],[cAddress],[cZipCode],[nCityID],[cPhoneNumber],[cEmail]) VALUES('Jens','Olesen','Vandværksvej 3',4200,10,76313244,'jens@olesen.dk');
INSERT INTO TUser([cFirstName],[cSurname],[cAddress],[cZipCode],[nCityID],[cPhoneNumber],[cEmail]) VALUES('Bibi','Albert','Nordre Fasanvej 32',2000,2,89785544,'bibi@albert.dk');
INSERT INTO TUser([cFirstName],[cSurname],[cAddress],[cZipCode],[nCityID],[cPhoneNumber],[cEmail]) VALUES('Lone','Kragh','Smalegade 8',2000,2,34233344,'lone@kragh.dk');
INSERT INTO TUser([cFirstName],[cSurname],[cAddress],[cZipCode],[nCityID],[cPhoneNumber],[cEmail]) VALUES('Britta','Nielsen','Ålekistevej 230',2720,3,90908888,'britta@nielsen.dk');
INSERT INTO TUser([cFirstName],[cSurname],[cAddress],[cZipCode],[nCityID],[cPhoneNumber],[cEmail]) VALUES('Hanibal','Stump','Linde Alle 3',2720,3,77664454,'hanibal@stump.dk');
INSERT INTO TUser([cFirstName],[cSurname],[cAddress],[cZipCode],[nCityID],[cPhoneNumber],[cEmail]) VALUES('Ali','Kaya','Engelsborgvej 32',2800,8,43543322,'ali@kaya.dk');
INSERT INTO TUser([cFirstName],[cSurname],[cAddress],[cZipCode],[nCityID],[cPhoneNumber],[cEmail]) VALUES('David','Lorenzen','Dyrlundsvej 12',4600,6,60778855,'d@l.dk');
INSERT INTO TUser([cFirstName],[cSurname],[cAddress],[cZipCode],[nCityID],[cPhoneNumber],[cEmail]) VALUES('Jytte','Jensen','Nørre Alle 2',8660,9,54667788,'jytte@jensen.dk');
INSERT INTO TUser([cFirstName],[cSurname],[cAddress],[cZipCode],[nCityID],[cPhoneNumber],[cEmail]) VALUES('Ole','Skam','Fuglevænget 7',4700,4,76564433,'ole@skam.dk');
GO

-- Insert card holders
USE WebShopDB
INSERT INTO TCardHolder([cName]) VALUES ('John Doe');
INSERT INTO TCardHolder([cName]) VALUES ('Jakob Jensen');
INSERT INTO TCardHolder([cName]) VALUES ('Mehmet Deniz');
INSERT INTO TCardHolder([cName]) VALUES ('Mia Olsen');
INSERT INTO TCardHolder([cName]) VALUES ('Jakob Fisker');
INSERT INTO TCardHolder([cName]) VALUES ('Mette Mortensen');
INSERT INTO TCardHolder([cName]) VALUES ('Jens Olesen');
INSERT INTO TCardHolder([cName]) VALUES ('Bibi Albert');
INSERT INTO TCardHolder([cName]) VALUES ('Lone Kragh');
INSERT INTO TCardHolder([cName]) VALUES ('Britta Nielsen');
INSERT INTO TCardHolder([cName]) VALUES ('Hanibal Stump');
INSERT INTO TCardHolder([cName]) VALUES ('Ali Kaya');
INSERT INTO TCardHolder([cName]) VALUES ('David Lorenzen');
INSERT INTO TCardHolder([cName]) VALUES ('Jytte Jensen');
INSERT INTO TCardHolder([cName]) VALUES ('Ole Skam');
GO

-- Insert IBANs
USE WebShopDB
INSERT INTO TIBAN([cIBAN]) VALUES('DK73827931798');
INSERT INTO TIBAN([cIBAN]) VALUES('DK73827498798');
INSERT INTO TIBAN([cIBAN]) VALUES('DK73890233232');
INSERT INTO TIBAN([cIBAN]) VALUES('DK73827333222');
INSERT INTO TIBAN([cIBAN]) VALUES('DK73899883332');
INSERT INTO TIBAN([cIBAN]) VALUES('DK73832322222');
INSERT INTO TIBAN([cIBAN]) VALUES('DK73224332323');
INSERT INTO TIBAN([cIBAN]) VALUES('DK73998833333');
GO

-- Insert credit cards
USE WebShopDB
INSERT INTO TCreditCard([cCardNumber],[nIBANID],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(1122334455667788,1,1,'04/20',444,1);
INSERT INTO TCreditCard([cCardNumber],[nIBANID],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(1133445566778899,1,1,'05/20',555,1);
INSERT INTO TCreditCard([cCardNumber],[nIBANID],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(1144556677889900,1,1,'06/20',666,1);
INSERT INTO TCreditCard([cCardNumber],[nIBANID],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(1155667788990011,2,2,'07/20',777,2);
INSERT INTO TCreditCard([cCardNumber],[nIBANID],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(1166778899001122,3,3,'08/20',888,3);
INSERT INTO TCreditCard([cCardNumber],[nIBANID],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(1177889900112233,4,4,'09/20',999,4);
INSERT INTO TCreditCard([cCardNumber],[nIBANID],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(1188990011223344,4,4,'10/20',111,4);
INSERT INTO TCreditCard([cCardNumber],[nIBANID],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(1199001122334455,5,5,'11/20',222,5);
INSERT INTO TCreditCard([cCardNumber],[nIBANID],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(2211223344556677,5,5,'12/20',333,5);
INSERT INTO TCreditCard([cCardNumber],[nIBANID],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(2222334455667788,6,6,'01/21',456,6);
INSERT INTO TCreditCard([cCardNumber],[nIBANID],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(2244556677889900,6,6,'02/21',467,6);
INSERT INTO TCreditCard([cCardNumber],[nIBANID],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(2255667788990011,7,7,'03/21',478,7);
INSERT INTO TCreditCard([cCardNumber],[nIBANID],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(2266778899001122,8,8,'04/21',489,8);
INSERT INTO TCreditCard([cCardNumber],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(2277889900112233,9,'05/21',512,9);
INSERT INTO TCreditCard([cCardNumber],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(2288990011223344,9,'06/21',522,9);
INSERT INTO TCreditCard([cCardNumber],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(2299001122334455,9,'07/21',533,9);
INSERT INTO TCreditCard([cCardNumber],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(3311223344556677,10,'08/21',544,10);
INSERT INTO TCreditCard([cCardNumber],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(3322334455667788,11,'09/21',556,11);
INSERT INTO TCreditCard([cCardNumber],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(3333445566778899,11,'10/21',567,11);
INSERT INTO TCreditCard([cCardNumber],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(3344556677889900,11,'11/21',578,11);
INSERT INTO TCreditCard([cCardNumber],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(3355667788990011,12,'12/21',580,12);
INSERT INTO TCreditCard([cCardNumber],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(3366778899001122,12,'01/22',590,12);
INSERT INTO TCreditCard([cCardNumber],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(3377889900112233,12,'02/22',610,12);
INSERT INTO TCreditCard([cCardNumber],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(3388990011223344,13,'03/22',620,13);
INSERT INTO TCreditCard([cCardNumber],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(3399001122334455,13,'04/22',630,13);
INSERT INTO TCreditCard([cCardNumber],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(4411223344556677,13,'04/22',640,13);
INSERT INTO TCreditCard([cCardNumber],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(4422334455667788,14,'05/22',650,14);
INSERT INTO TCreditCard([cCardNumber],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(4433445566778899,14,'06/22',660,14);
INSERT INTO TCreditCard([cCardNumber],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(4444556677889900,14,'07/22',670,14);
INSERT INTO TCreditCard([cCardNumber],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(4455667788990011,15,'08/22',680,15);
INSERT INTO TCreditCard([cCardNumber],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(4466778899001122,15,'09/22',690,15);
INSERT INTO TCreditCard([cCardNumber],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(4477889900112233,15,'10/22',700,15);
INSERT INTO TCreditCard([cCardNumber],[nCardHolderID],[cExpiryDate],[cCCV],[nUserID]) VALUES(4488990011223344,15,'11/22',710,15);
GO
-- TODO: Insert Invoice
-- TODO: Insert InvoiceLines