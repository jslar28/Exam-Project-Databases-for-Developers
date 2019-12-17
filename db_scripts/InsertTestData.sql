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
INSERT INTO TUser(cFirstName,cSurname,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES ('John','Doe','Rentemestervej 1','2400',1,'88331212','a@a.dk',157.50);
INSERT INTO TUser(cFirstName,cSurname,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES ('Jakob','Jensen','Hvidovrevej 280','2650',7,'76567777','jako@jens.dk',107.00);
INSERT INTO TUser(cFirstName,cSurname,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES ('Mehmet','Deniz','Egevolden 188','2650',7,'76567777','me@me.dk',79.00);
INSERT INTO TUser(cFirstName,cSurname,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES ('Mia','Olsen','Bymuren 22','2650',7,'55662121','mia@olsen.dk',53.95);
INSERT INTO TUser(cFirstName,cSurname,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES ('Jakob','Fisker','Lygten 37','2400',1,'90897867','j@j.dk',83.25);
INSERT INTO TUser(cFirstName,cSurname,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES ('Mette','Mortensen','Valbyvej 65','4200',10,'76567777','me@Mortensen.dk',166.00);
INSERT INTO TUser(cFirstName,cSurname,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES ('Jens','Olesen','Vandværksvej 3','4200',10,'76313244','jens@olesen.dk',33.50);
INSERT INTO TUser(cFirstName,cSurname,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES ('Bibi','Albert','Nordre Fasanvej 32','2000',2,'89785544','bibi@albert.dk',39.00);
INSERT INTO TUser(cFirstName,cSurname,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES ('Lone','Kragh','Smalegade 8','2000',2,'34233344','lone@kragh.dk',174.50);
INSERT INTO TUser(cFirstName,cSurname,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES ('Britta','Nielsen','Ålekistevej 230','2720',3,'90908888','britta@nielsen.dk',74.50);
INSERT INTO TUser(cFirstName,cSurname,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES ('Hanibal','Stump','Linde Alle 3','2720',3,'77664454','hanibal@stump.dk',55.70);
INSERT INTO TUser(cFirstName,cSurname,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES ('Ali','Kaya','Engelsborgvej 32','2800',8,'43543322','ali@kaya.dk',113.50);
INSERT INTO TUser(cFirstName,cSurname,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES ('David','Lorenzen','Dyrlundsvej 12','4600',6,'60778855','d@l.dk',0.00);
INSERT INTO TUser(cFirstName,cSurname,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES ('Jytte','Jensen','Nørre Alle 2','8660',9,'54667788','jytte@jensen.dk',0.00);
INSERT INTO TUser(cFirstName,cSurname,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES ('Ole','Skam','Fuglevænget 7','4700',4,'76564433','ole@skam.dk',0.00);


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
INSERT INTO TCreditCard(cCardNumber,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('1122334455667788',1,'04/20','444',157.50,1);
INSERT INTO TCreditCard(cCardNumber,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('1133445566778899',1,'05/20','555',0.00,1);
INSERT INTO TCreditCard(cCardNumber,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('1144556677889900',1,'06/20','666',0.00,1);
INSERT INTO TCreditCard(cCardNumber,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('1155667788990011',2,'07/20','777',107.00,2);
INSERT INTO TCreditCard(cCardNumber,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('1166778899001122',3,'08/20','888',79.00,3);
INSERT INTO TCreditCard(cCardNumber,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('1177889900112233',4,'09/20','999',26.10,4);
INSERT INTO TCreditCard(cCardNumber,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('1188990011223344',4,'10/20','111',27.85,4);
INSERT INTO TCreditCard(cCardNumber,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('1199001122334455',5,'11/20','222',45.85,5);
INSERT INTO TCreditCard(cCardNumber,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('2211223344556677',5,'12/20','333',37.40,5);
INSERT INTO TCreditCard(cCardNumber,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('2222334455667788',6,'01/21','456',166.00,6);
INSERT INTO TCreditCard(cCardNumber,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('2244556677889900',6,'02/21','467',0.00,6);
INSERT INTO TCreditCard(cCardNumber,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('2255667788990011',7,'03/21','478',33.50,7);
INSERT INTO TCreditCard(cCardNumber,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('2266778899001122',8,'04/21','489',39.00,8);
INSERT INTO TCreditCard(cCardNumber,nIBANID,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('2277889900112233',NULL,9,'05/21','512',174.50,9);
INSERT INTO TCreditCard(cCardNumber,nIBANID,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('2288990011223344',NULL,9,'06/21','522',0.00,9);
INSERT INTO TCreditCard(cCardNumber,nIBANID,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('2299001122334455',NULL,9,'07/21','533',0.00,9);
INSERT INTO TCreditCard(cCardNumber,nIBANID,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('3311223344556677',NULL,10,'08/21','544',74.50,10);
INSERT INTO TCreditCard(cCardNumber,nIBANID,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('3322334455667788',NULL,11,'09/21','556',55.70,11);
INSERT INTO TCreditCard(cCardNumber,nIBANID,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('3333445566778899',NULL,11,'10/21','567',0.00,11);
INSERT INTO TCreditCard(cCardNumber,nIBANID,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('3344556677889900',NULL,11,'11/21','578',0.00,11);
INSERT INTO TCreditCard(cCardNumber,nIBANID,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('3355667788990011',NULL,12,'12/21','580',95.50,12);
INSERT INTO TCreditCard(cCardNumber,nIBANID,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('3366778899001122',NULL,12,'01/22','590',18.00,12);
INSERT INTO TCreditCard(cCardNumber,nIBANID,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('3377889900112233',NULL,12,'02/22','610',0.00,12);
INSERT INTO TCreditCard(cCardNumber,nIBANID,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('3388990011223344',NULL,13,'03/22','620',0.00,13);
INSERT INTO TCreditCard(cCardNumber,nIBANID,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('3399001122334455',NULL,13,'04/22','630',0.00,13);
INSERT INTO TCreditCard(cCardNumber,nIBANID,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('4411223344556677',NULL,13,'04/22','640',0.00,13);
INSERT INTO TCreditCard(cCardNumber,nIBANID,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('4422334455667788',NULL,14,'05/22','650',0.00,14);
INSERT INTO TCreditCard(cCardNumber,nIBANID,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('4433445566778899',NULL,14,'06/22','660',0.00,14);
INSERT INTO TCreditCard(cCardNumber,nIBANID,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('4444556677889900',NULL,14,'07/22','670',0.00,14);
INSERT INTO TCreditCard(cCardNumber,nIBANID,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('4455667788990011',NULL,15,'08/22','680',0.00,15);
INSERT INTO TCreditCard(cCardNumber,nIBANID,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('4466778899001122',NULL,15,'09/22','690',0.00,15);
INSERT INTO TCreditCard(cCardNumber,nIBANID,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('4477889900112233',NULL,15,'10/22','700',0.00,15);
INSERT INTO TCreditCard(cCardNumber,nIBANID,nCardHolderID,cExpiryDate,cCCV,nTotalAmountSpent,nUserID) VALUES ('4488990011223344',NULL,15,'11/22','710',0.00,15);

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

USE WebShopDB
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:25:55.853',25.00,45.00,1);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:27:20.437',25.00,69.50,1);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:27:46.183',25.00,43.00,1);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:29:25.723',25.00,28.50,4);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:30:17.530',25.00,34.00,4);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:30:49.303',25.00,44.50,4);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:31:48.357',25.00,28.00,5);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:32:08.830',25.00,23.50,5);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:32:24.300',25.00,27.50,5);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:33:43.727',25.00,4.00,6);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:34:02.003',25.00,22.10,6);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:34:19.420',25.00,10.00,7);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:35:02.060',25.00,12.35,7);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:35:21.580',25.00,5.50,7);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:37:29.120',25.00,13.50,8);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:37:48.680',25.00,32.35,8);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:38:06.890',25.00,18.70,9);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:39:00.883',25.00,18.70,9);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:40:13.323',25.00,35.00,10);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:40:28.257',25.00,53.50,10);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:41:56.920',25.00,45.00,10);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:42:11.313',25.00,32.50,10);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:43:00.123',25.00,16.00,12);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:43:18.187',25.00,17.50,12);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:44:09.947',25.00,39.00,13);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:44:52.953',25.00,11.50,14);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:44:54.840',25.00,11.50,14);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:45:08.607',25.00,25.50,14);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:45:14.373',25.00,25.50,14);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:46:45.987',25.00,47.50,14);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:47:06.700',25.00,12.50,14);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:47:08.897',25.00,4.50,14);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:47:26.737',25.00,36.00,14);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:48:05.010',25.00,30.00,17);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:48:06.457',25.00,30.00,17);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:48:14.940',25.00,14.50,17);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:48:51.033',25.00,13.50,18);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:49:12.357',25.00,11.50,18);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:49:22.967',25.00,7.85,18);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:49:23.363',25.00,7.85,18);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:50:19.283',25.00,15.00,18);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:50:59.083',25.00,25.50,21);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:51:15.273',25.00,25.00,21);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:51:58.410',25.00,17.50,21);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:52:08.430',25.00,27.50,21);
INSERT INTO TInvoice(dDate,nTax,nTotalAmount,nCreditCardID) VALUES ('2019-12-14 21:52:51.577',25.00,18.00,22);

USE WebShopDB
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (1,2,2,2.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (1,3,2,1.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (1,4,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (1,5,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (1,17,1,18.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (2,2,1,2.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (2,3,1,1.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (2,4,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (2,5,2,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (2,17,2,18.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (3,2,1,2.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (3,4,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (3,5,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (3,17,1,18.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (3,20,1,3.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (4,2,1,2.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (4,3,1,1.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (4,11,1,8.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (4,12,2,4.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (4,13,1,8.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (5,2,2,2.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (5,3,1,1.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (5,11,2,8.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (5,12,1,4.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (5,13,1,8.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (6,2,2,2.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (6,3,2,1.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (6,9,1,5.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (6,11,3,8.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (6,13,1,8.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (7,1,1,2.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (7,2,1,2.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (7,3,1,1.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (7,10,2,9.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (7,20,1,3.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (8,1,1,2.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (8,2,2,2.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (8,3,1,1.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (8,10,1,9.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (8,20,2,3.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (9,2,2,2.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (9,3,1,1.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (9,10,1,9.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (9,12,1,4.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (9,13,1,8.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (10,1,1,2.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (10,3,1,1.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (11,6,1,2.10);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (11,7,1,20.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (12,5,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (13,4,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (13,8,1,2.35);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (14,9,1,5.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (15,2,1,2.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (15,3,1,1.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (15,4,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (16,4,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (16,7,1,20.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (16,8,1,2.35);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (17,8,2,2.35);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (17,10,1,9.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (17,12,1,4.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (18,8,2,2.35);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (18,10,1,9.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (18,12,1,4.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (19,4,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (19,5,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (19,9,1,5.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (19,10,1,9.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (20,4,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (20,9,2,5.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (20,10,2,9.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (20,15,1,13.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (21,5,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (21,7,1,20.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (21,9,1,5.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (21,10,1,9.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (22,1,1,2.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (22,5,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (22,7,1,20.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (23,3,1,1.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (23,4,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (23,12,1,4.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (24,10,1,9.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (24,13,1,8.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (25,17,1,18.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (25,18,1,21.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (26,3,1,1.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (26,4,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (27,3,1,1.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (27,4,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (28,7,1,20.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (28,9,1,5.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (29,7,1,20.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (29,9,1,5.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (30,7,1,20.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (30,9,1,5.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (30,10,1,9.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (30,11,1,8.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (30,12,1,4.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (31,11,1,8.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (31,12,1,4.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (32,12,1,4.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (33,17,2,18.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (34,17,1,18.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (34,19,1,9.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (34,20,1,3.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (35,17,1,18.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (35,19,1,9.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (35,20,1,3.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (36,1,1,2.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (36,2,1,2.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (36,4,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (37,2,1,2.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (37,3,1,1.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (37,4,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (38,3,1,1.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (38,4,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (39,8,1,2.35);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (39,9,1,5.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (40,8,1,2.35);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (40,9,1,5.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (41,9,1,5.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (41,10,1,9.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (42,4,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (42,5,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (42,9,1,5.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (43,5,1,10.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (43,9,1,5.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (43,10,1,9.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (44,10,1,9.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (44,13,1,8.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (45,10,1,9.50);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (45,17,1,18.00);
INSERT INTO TInvoiceLine(nInvoiceID,nProductID,nQuantity,nUnitPrice) VALUES (46,17,1,18.00);