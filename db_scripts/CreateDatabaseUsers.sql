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

 --Remember to write down design descisions
 --We decided to use the SQL server standart fixed database level roles because
 --they already contained the permissions we needed for our users, the only thing
 --we needed to alter was the SELECT permissions for the restricted reader user on
 --the invoice related tables
