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
	nCardHolderID INT NOT NULL IDENTITY(1,1),
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
	CONSTRAINT FK_TUser_TCity FOREIGN KEY (nCityID) REFERENCES TCity (nCityID) ON UPDATE CASCADE,
	INDEX IDX_TUser_TCity (nCityID)
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
	CONSTRAINT FK_TCreditCard_TUser FOREIGN KEY (nUserID) REFERENCES TUser (nUserID) ON UPDATE CASCADE ON DELETE CASCADE,
	INDEX IDX_TCreditCard_TIBAN (nIBANID),
	INDEX IDX_TCreditCard_TCardHolder (nCardHolderID),
	INDEX IDX_TCreditCard_TUser (nUserID)
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
	CONSTRAINT PK_TProduct PRIMARY KEY (nProductID),
	INDEX IDX_cName (cName)
) WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.TProductHistory));

CREATE TABLE TInvoice (
	nInvoiceID INT NOT NULL IDENTITY(1,1),
	dDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	nTax NUMERIC(4,2) NOT NULL,
	nTotalAmount MONEY NOT NULL,
	nCreditCardID INT NOT NULL,
	CONSTRAINT PK_TInvoice PRIMARY KEY (nInvoiceID),
	CONSTRAINT FK_TInvoice_TCreditCard FOREIGN KEY (nCreditCardID) REFERENCES TCreditCard (nCreditCardID) ON UPDATE CASCADE,
	INDEX IDX_TInvoice_TCreditCard (nCreditCardID)
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
-- Make sure we are using the correct database