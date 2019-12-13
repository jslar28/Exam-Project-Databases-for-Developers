USE WebShopDB

-- Creates tables
CREATE TABLE TZipCode (
	cZipCode char(4) NOT NULL,
	cCityName varchar(40) NOT NULL,
	CONSTRAINT PK_TZipCode PRIMARY KEY (cZipCode)
);

CREATE TABLE TIBAN (
	nIBANID int NOT NULL IDENTITY(1,1),
	cIBAN varchar(40) NOT NULL UNIQUE,
	CONSTRAINT PK_TIBAN PRIMARY KEY (nIBANID)
);

CREATE TABLE TCardHolder(
	nCardHolderID int NOT NULL IDENTITY(1,1),
	cName varchar(50) NOT NULL,
	CONSTRAINT PK_TCardHolder PRIMARY KEY (nCardHolderID)
);

CREATE TABLE TUser (
	nUserID int NOT NULL IDENTITY(1,1),
	cFirstName varchar(40) NOT NULL,
	cSurname varchar(40) NOT NULL,
	cAddress varchar(100),
	cZipCode char(4) NOT NULL,
	cPhoneNumber char(8) NOT NULL,
	cEmail varchar(50) NOT NULL UNIQUE CHECK(cEmail LIKE '%@%.%'),
	nTotalSpent smallmoney NOT NULL DEFAULT 0,
	CONSTRAINT PK_TUser PRIMARY KEY (nUserID),
	CONSTRAINT FK_TUser_TZipCode FOREIGN KEY (cZipCode) REFERENCES TZipCode (cZipCode) ON UPDATE CASCADE
);

CREATE TABLE TCreditCard (
	nCreditCardID int NOT NULL IDENTITY(1,1),
	cCardNumber char(16) NOT NULL,
	nIBANID int,
	nCardHolderID int NOT NULL,
	cExpiryDate char(5) NOT NULL CHECK (cExpiryDate LIKE '__/__'),
	cCCV char(3) NOT NULL,
	nTotalAmountSpent smallmoney NOT NULL DEFAULT 0,
	nUserID int NOT NULL,
	CONSTRAINT PK_TCreditCard PRIMARY KEY (nCreditCardID),
	CONSTRAINT FK_TCreditCard_TIBAN FOREIGN KEY (nIBANID) REFERENCES TIBAN (nIBANID) ON UPDATE CASCADE,
	CONSTRAINT FK_TCreditCard_TCardHolder FOREIGN KEY (nCardHolderID) REFERENCES TCardHolder (nCardHolderID) ON UPDATE CASCADE,
	CONSTRAINT FK_TCreditCard_TUser FOREIGN KEY (nUserID) REFERENCES TUser (nUserID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TProduct (
	nProductID int NOT NULL IDENTITY(1,1),
	cName varchar(40) NOT NULL,
	cDescription varchar(500) NOT NULL,
	nUnitPrice smallmoney NOT NULL,
	nStock smallint NOT NULL DEFAULT 0,
	nAverageRating numeric(1,1) NOT NULL DEFAULT 0,
	dValidFrom DATETIME2 (2) GENERATED ALWAYS AS ROW START,
	dValidTo DATETIME2 (2) GENERATED ALWAYS AS ROW END,
	PERIOD FOR SYSTEM_TIME (dValidFrom, dValidTo),
	CONSTRAINT PK_TProduct PRIMARY KEY (nProductID)
) WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.TProductHistory));

CREATE TABLE TInvoice (
	nInvoiceID int NOT NULL IDENTITY(1,1),
	dDate datetime2 NOT NULL,
	nTax numeric(2,2) NOT NULL,
	nTotalAmount smallmoney NOT NULL,
	nCreditCardID int NOT NULL,
	CONSTRAINT PK_TInvoice PRIMARY KEY (nInvoiceID),
	CONSTRAINT FK_TInvoice_TCreditCard FOREIGN KEY (nCreditCardID) REFERENCES TCreditCard (nCreditCardID) ON UPDATE CASCADE
);

CREATE TABLE TInvoiceLine(
	nInvoiceID int NOT NULL,
	nProductID int NOT NULL,
	nQuantity smallint NOT NULL,
	nUnitPrice smallmoney NOT NULL,
	CONSTRAINT PK_TInvoiceLine PRIMARY KEY (nInvoiceID, nProductID),
	CONSTRAINT FK_TInvoiceLine_TInvoice FOREIGN KEY (nInvoiceID) REFERENCES TInvoice (nInvoiceID) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_TInvoiceLine_TProduct FOREIGN KEY (nProductID) REFERENCES TProduct (nProductID) ON UPDATE CASCADE
);

CREATE TABLE TRating(
	nUserID int NOT NULL,
	nProductID int NOT NULL,
	nScore numeric (1,0) NOT NULL,
	cComment varchar(500),
	dValidFrom DATETIME2 (2) GENERATED ALWAYS AS ROW START,
	dValidTo DATETIME2 (2) GENERATED ALWAYS AS ROW END,
	PERIOD FOR SYSTEM_TIME (dValidFrom, dValidTo),
	CONSTRAINT PK_TRating PRIMARY KEY (nUserID, nProductID),
	CONSTRAINT FK_TRating_TUser FOREIGN KEY (nUserID) REFERENCES TUser (nUserID) ON DELETE CASCADE ON UPDATE CASCADE, 
	CONSTRAINT FK_TRating_TProduct FOREIGN KEY (nProductID) REFERENCES TProduct (nProductID) ON DELETE CASCADE ON UPDATE CASCADE
)  WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.TRatingHistory));


-- Creates audit tables
CREATE TABLE TUserAudit (
	nUserAuditID int NOT NULL IDENTITY(1,1),
	nUserIDBefore int,
	cFirstNameBefore varchar(40),
	cSurnameBefore varchar(40),
	cAddressBefore varchar(100),
	cZipCodeBefore char(4),
	cPhoneNumberBefore char(8),
	cEmailBefore varchar(50) CHECK(cEmailBefore LIKE '%@%.%'),
	nTotalSpentBefore smallmoney,
	nUserIDAfter int,
	cFirstNameAfter varchar(40),
	cSurnameAfter varchar(40),
	cAddressAfter varchar(100),
	cZipCodeAfter char(4),
	cPhoneNumberAfter char(8),
	cEmailAfter varchar(50) CHECK(cEmailAfter LIKE '%@%.%'),
	nTotalSpentAfter smallmoney,
	cTypeOfStatement varchar(20) NOT NULL,
	cTimeOfQuery datetime2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
	cDBMSUserID varchar(50) NOT NULL DEFAULT SUSER_ID(),
	cDBMSUser varchar(50) NOT NULL DEFAULT SUSER_NAME(),
	cHostID varchar(50) NOT NULL DEFAULT HOST_ID(), -- hostID/ID of computer
	cHost varchar(50) NOT NULL DEFAULT HOST_NAME(), -- hostname/name of computer
	CONSTRAINT PK_TUserAudit PRIMARY KEY (nUserAuditID),
);

CREATE TABLE TCreditCardAudit (
	nCreditCardAuditID int IDENTITY(1,1),
	nCreditCardIDBefore int,
	cCardNumberBefore char(16),
	nIBANIDBefore int,
	nCardHolderIDBefore int,
	cExpiryDateBefore char(5) CHECK (cExpiryDateBefore LIKE '__/__'),
	cCCVBefore char(3),
	nTotalAmountSpentBefore smallmoney,
	nUserIDBefore int,
	nCreditCardIDAfter int,
	cCardNumberAfter char(16),
	nIBANIDAfter int,
	nCardHolderIDAfter int,
	cExpiryDateAfter char(5) CHECK (cExpiryDateAfter LIKE '__/__'),
	cCCVAfter char(3),
	nTotalAmountSpentAfter smallmoney,
	nUserIDAfter int,
	cTypeOfStatement varchar(20) NOT NULL,
	cTimeOfQuery datetime2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
	cDBMSUserID varchar(50) NOT NULL DEFAULT SUSER_ID(),
	cDBMSUser varchar(50) NOT NULL DEFAULT SUSER_NAME(),
	cHostID varchar(50) NOT NULL DEFAULT HOST_ID(), -- hostID/ID of computer
	cHost varchar(50) NOT NULL DEFAULT HOST_NAME(), -- hostname/name of computer
	CONSTRAINT PK_TCreditCardAudit PRIMARY KEY (nCreditCardAuditID)
);