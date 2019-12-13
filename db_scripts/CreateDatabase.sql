-- First creates the database and then creates all the tables
USE master
If(DB_ID(N'WebShopDB') IS NULL)
	BEGIN
		CREATE DATABASE WebShopDB
	END

GO
USE WebShopDB
-- Make sure we are using the correct database