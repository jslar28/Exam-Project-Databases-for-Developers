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

-- TODO: Insert Invoice
-- TODO: Insert InvoiceLines