# Hannah Sawyer
# Deals Part 3 
# November 18, 2017
# Indicate that we are using the deals database
USE deals;  
# Execute a test query  
SELECT *
From companies;
#Add Foreign Keys to DealParts 
ALTER TABLE `dealparts`
	ADD FOREIGN KEY (`DealID`)
    REFERENCES `Deals` (`DealID`);
# Add FK to DealTypes
ALTER TABLE `dealtypes`
	ADD FOREIGN KEY (`TypeCode`)
    REFERENCES `TypeCodes` (`TypeCode`);
ALTER TABLE `dealtypes`
	ADD FOREIGN KEY (`DealID`)
    REFERENCES `Deals`(`DealID`);
# Add FK to PlayersSupport 
ALTER TABLE `playersupports`
	ADD FOREIGN KEY (`PlayerID`)
    REFERENCES `Players`(`PlayerID`);
ALTER TABLE `playersupports`
	ADD FOREIGN KEY (`FirmID`)
    REFERENCES `Firms`(`FirmID`);
ALTER TABLE `playersupports`
	ADD FOREIGN KEY (`SupportCodeID`)
    REFERENCES `SupportCodes`(`SupportCodeID`);
# Add FK to Players 
ALTER TABLE `players`
	ADD FOREIGN KEY (`CompanyID`)
    REFERENCES `Companies`(`CompanyID`);
ALTER TABLE `players`
	ADD FOREIGN KEY (`RoleCode`)
    REFERENCES `RoleCodes`(`RoleCode`);
ALTER TABLE `players`
	ADD FOREIGN KEY (`DealID`)
    REFERENCES `Deals`(`DealID`);