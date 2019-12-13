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