-- Insert products
USE WebShopDB
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Apple','Danish apple',2.50,9,2.2);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Orange','1. class from Spain',2.00,23,3.7);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Kiwi','From China',1.50,22,2.6);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Green Grape','1 kg. From Italy',10.00,22,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Red Grape','1 kg. From Italy',10.00,18,2.5);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Banana','1. class from Turkey',2.10,7,3.3);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Carrot','2 kg. Danish',20.00,11,4.7);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Lemon','Yellow and Juicy',2.35,13,4.0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Cucumber','Danish',5.50,19,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Iceberg','Danish',9.50,22,3.2);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Parsley','Danish',8.00,14,2.8);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Radishes','Danish',4.50,16,2.0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Avocado','From Turkey',8.00,14,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Onion','2 kg. Danish',18.00,2,3.2);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Garlic','Danish',13.50,4,1.8);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Aubergine','Turkish',6.00,3,3.0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Pineapples','1. class',18.00,23,2.8);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Papaya','From Mexico',21.00,6,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Pomegranate','From Spain',9.00,4,0);
INSERT INTO TProduct([cName],[cDescription],[nUnitPrice],[nStock],[nAverageRating]) VALUES('Lime','From Turkey',3.00,14,3.5);
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

USE WebShopDB
-- UserID 14 -- UserID 13 -- UserID 11 -- UserID 10 -- UserID 9 -- UserID 7 -- UserID 5 -- UserID 3 -- UserID 2 -- UserID 1

-- productID 20 -- productID 17 -- productID 16 -- productID 15 -- productID 14 -- productID 12 -- productID 11 -- productID 10 
-- productID 8 -- productID 7 -- productID 6 -- productID 5 -- productID 3 -- productID 2 -- productID 1
-- With comments
INSERT INTO TRating (nUserID, nProductID, nScore, cComment) VALUES (1,20,4, 'So good'); --1
INSERT INTO TRating (nUserID, nProductID, nScore, cComment) VALUES (2,3,5, 'So nice'); --2
INSERT INTO TRating (nUserID, nProductID, nScore, cComment) VALUES (3,17,5, 'The best'); --3
INSERT INTO TRating (nUserID, nProductID, nScore, cComment) VALUES (2,1,1, 'Not very nice, not fresh'); --4
INSERT INTO TRating (nUserID, nProductID, nScore, cComment) VALUES (3,14,3, 'Decent'); --5
INSERT INTO TRating (nUserID, nProductID, nScore, cComment) VALUES (9,2,2, 'Not satisfying'); --6
INSERT INTO TRating (nUserID, nProductID, nScore, cComment) VALUES (10,10,4, 'Above average'); --7
INSERT INTO TRating (nUserID, nProductID, nScore, cComment) VALUES (7,12,1, 'Bad'); --8
INSERT INTO TRating (nUserID, nProductID, nScore, cComment) VALUES (13,8,2, 'Would not buy again'); --9
INSERT INTO TRating (nUserID, nProductID, nScore, cComment) VALUES (9,7,5, 'Best i ever had'); --10
INSERT INTO TRating (nUserID, nProductID, nScore, cComment) VALUES (11,11,3, 'Average'); --11
INSERT INTO TRating (nUserID, nProductID, nScore, cComment) VALUES (1,3,1, 'Eeeeeeww'); --12
INSERT INTO TRating (nUserID, nProductID, nScore, cComment) VALUES (13,15,2, 'So good it is very nice'); --13
INSERT INTO TRating (nUserID, nProductID, nScore, cComment) VALUES (9,16,4, 'Good and juicy'); --14
INSERT INTO TRating (nUserID, nProductID, nScore, cComment) VALUES (5,14,4, 'Very fresh can recommend'); --15
INSERT INTO TRating (nUserID, nProductID, nScore, cComment) VALUES (7,11,2, 'Dont buy this'); --16
INSERT INTO TRating (nUserID, nProductID, nScore, cComment) VALUES (11,10,1, 'Disgusting'); --17
INSERT INTO TRating (nUserID, nProductID, nScore, cComment) VALUES (13,5,4, 'I will tell my friends about this'); --18
INSERT INTO TRating (nUserID, nProductID, nScore, cComment) VALUES (14,8,5, '10/10'); --19
INSERT INTO TRating (nUserID, nProductID, nScore, cComment) VALUES (5,20,5, 'Best i have had in 2019'); --20
-- Without comments
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (2,20,1); --21
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (14,15,2); --22
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (11,17,3); --23
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (13,16,4); --24
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (10,14,5); --25
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (5,17,2); --26
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (3,1,1); --27
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (1,1,1); --28
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (7,3,3); --29
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (5,3,3); --30
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (3,5,1); --31
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (2,6,4); --32
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (11,7,5); --33
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (11,8,5); --34
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (14,20,4); --35
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (11,15,2); --36
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (10,12,3); --37
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (10,11,2); --38
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (1,10,5); --39
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (13,3,1); --40
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (9,6,4); --41
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (5,7,4); --42
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (7,8,5); --43
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (2,15,1); --44
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (10,17,1); --45
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (13,14,3); --46
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (14,1,3); --47
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (10,2,4); --48
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (14,14,2); --49
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (5,12,2); --50
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (2,11,3); --51
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (3,11,4); --52
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (13,10,1); --53
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (14,10,5); --54
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (5,16,1); --55
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (13,6,2); --56
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (11,14,2); --57
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (9,8,3); --58
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (3,2,5); --59
INSERT INTO TRating (nUserID, nProductID, nScore) VALUES (7,1,5); --60

-- TODO: Insert Invoice
-- TODO: Insert InvoiceLines