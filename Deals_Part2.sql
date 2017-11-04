#Hannah Sawyer 
#Deals Part 2 Assignment 
# November 4, 2017
USE deals;
SELECT *
FROM COMPANIES
WHERE CompanyName like '%Inc.';
SELECT *
FROM COMPANIES 
ORDER BY CompanyID;
SELECT DealName, PartNumber, DollarValue
FROM Deals, DealParts
WHERE Deals.DealID=DealParts.DealID;
SELECT DealName, PartNumber, DollarValue
FROM Deals join DealParts on (Deals.DealID=DealParts.DealID);
SELECT DealName, RoleCode, CompanyName
FROM Companies 
	JOIN Players ON (Companies.CompanyID = Players.CompanyID)
    JOIN Deals ON (Players.DealID = Deals.DealID)
ORDER BY DealName;
CREATE VIEW CompanyDeals AS 
SELECT DealName, RoleCode, CompanyName
FROM Companies 
	JOIN Players ON (Companies.CompanyID = Players.CompanyID)
    JOIN Deals ON (Players.DealID =Deals.DealID)
ORDER BY DealName;
SELECT * FROM CompanyDeals;
# 9. Create a view named DealValues that lists the DealID, total dollar value and number of parts for each deal.
CREATE VIEW DealValues AS 
SELECT Deals.DealID, SUM(DollarValue) AS TotDolValue, COUNT(PartNumber)
FROM Deals
	JOIN DealParts ON (Deals.DealID = DealParts.DealID)
GROUP BY DealID;
SELECT * FROM DealValues;
# 10 Create a view named DealSummary that lists the DealID, DealName, number of players, total dollar value, and number of parts for each deal.
CREATE VIEW DealSummary AS
SELECT Deals.DealID, DealName, COUNT(Players.PlayerID), SUM(DollarValue), COUNT(PartNumber)
FROM Deals
	Join DealParts ON (Deals.DealID = DealParts.DealID)
    Join Players ON (Deals.DealID = Players.DealID)
GROUP BY Deals.DealID
ORDER By Deals.DealID;
SELECT * FROM DealSummary;
# 11 Create a view called DealsByType that lists TypeCode, number of deals, and total value of deals for each deal type.
CREATE VIEW DealsByType AS
SELECT TypeCodes.TypeCode, COUNT(DealParts.DealID) AS NumberOfDeals, SUM(DollarValue) AS TotDollarValue
FROM TypeCodes
	JOIN DealTypes ON (TypeCodes.TypeCode = DealTypes.TypeCode)
    JOIN DealParts ON (DealTypes.DealID = DealParts.DealID) 
GROUP BY TypeCodes.TypeCode
ORDER BY TypeCodes.TypeCode;
SELECT * FROM DealsByType;
# 12 Create a view called DealPlayers that lists the CompanyID, Name, and Role Code for each deal. Sort the players by the RoleSortOrder.
CREATE VIEW DealPlayers AS
SELECT Companies.CompanyID, Companies.CompanyName, Players.RoleCode
FROM Companies 
	JOIN Players USING (CompanyID)
    JOIN RoleCodes USING(RoleCode)
ORDER BY RoleSortOrder;
SELECT * FROM DealPlayers;
# 13 Create a view called DealsByFirm that lists the FirmID, Name, number of deals, and total value of deals for each firm.
CREATE VIEW DealsByFirm AS 
SELECT Firms.FirmID, Firms.Name,COUNT(Players.DealID), SUM(TotDolValue)
FROM Firms
	LEFT JOIN PlayerSupports ON (Firms.FirmID = PlayerSupports.FirmID)
	LEFT JOIN Players ON (PlayerSupports.PlayerID = Players.PlayerID)
	LEFT JOIN DealValues USING(DealID)
GROUP BY FirmID, Firms.Name;
SElECT * FROM DealsByFirm

