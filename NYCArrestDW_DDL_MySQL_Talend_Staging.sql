-- nycarrest.dim_age_group definition

CREATE TABLE `dim_age_group` (
  `Age_Group_SK` int NOT NULL AUTO_INCREMENT,
  `Age_LowerBand` int DEFAULT NULL,
  `Age_UpperBand` int DEFAULT NULL,
  `DI_JobID` varchar(100) DEFAULT NULL,
  `DI_CreateDate` date DEFAULT (curdate()),
  PRIMARY KEY (`Age_Group_SK`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- nycarrest.dim_arrest_boro definition

CREATE TABLE `dim_arrest_boro` (
  `Boro_SK` int NOT NULL AUTO_INCREMENT,
  `Arrest_Boro` varchar(100) DEFAULT NULL,
  `DI_JobID` varchar(100) DEFAULT NULL,
  `DI_CreateDate` date DEFAULT (curdate()),
  PRIMARY KEY (`Boro_SK`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- nycarrest.dim_arrest_precinct definition

CREATE TABLE `dim_arrest_precinct` (
  `Arrest_Precinct_SK` int NOT NULL AUTO_INCREMENT,
  `Arrest_Precinct` int DEFAULT NULL,
  `DI_JobID` varchar(100) DEFAULT NULL,
  `DI_CreateDate` date DEFAULT (curdate()),
  PRIMARY KEY (`Arrest_Precinct_SK`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- nycarrest.dim_date definition

CREATE TABLE `dim_date` (
  `Date_SK` int NOT NULL,
  `Year` int NOT NULL,
  `Month` varchar(100) NOT NULL,
  `Day` varchar(100) NOT NULL,
  `Full_Date` date NOT NULL,
  `DI_JobID` varchar(100) DEFAULT NULL,
  `DI_CreateDate` date DEFAULT (curdate()),
  PRIMARY KEY (`Date_SK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- nycarrest.dim_gen_offense definition

CREATE TABLE `dim_gen_offense` (
  `Gen_Offense_SK` int NOT NULL AUTO_INCREMENT,
  `Ky_Cd` int DEFAULT NULL,
  `Ofns_Desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DI_JobID` varchar(100) DEFAULT NULL,
  `DI_CreateDate` date DEFAULT (curdate()),
  PRIMARY KEY (`Gen_Offense_SK`)
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- nycarrest.dim_geography definition

CREATE TABLE `dim_geography` (
  `Geography_SK` int NOT NULL AUTO_INCREMENT,
  `X_COORD_CD` int DEFAULT NULL,
  `Y_COORD_CD` int DEFAULT NULL,
  `Latitude` varchar(100) DEFAULT NULL,
  `Longitude` varchar(100) DEFAULT NULL,
  `DI_JobID` varchar(100) DEFAULT NULL,
  `DI_CreateDate` date DEFAULT (curdate()),
  PRIMARY KEY (`Geography_SK`)
) ENGINE=InnoDB AUTO_INCREMENT=102652 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- nycarrest.dim_law definition

CREATE TABLE `dim_law` (
  `Law_SK` int NOT NULL AUTO_INCREMENT,
  `Law_Code` varchar(100) DEFAULT NULL,
  `Law_Cat_Cd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DI_JobID` varchar(100) DEFAULT NULL,
  `DI_CreateDate` date DEFAULT (curdate()),
  PRIMARY KEY (`Law_SK`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- nycarrest.dim_nyc_offense definition

CREATE TABLE `dim_nyc_offense` (
  `Nyc_Offense_SK` int NOT NULL AUTO_INCREMENT,
  `Pd_Cd` int DEFAULT NULL,
  `Pd_Desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DI_JobID` varchar(100) DEFAULT NULL,
  `DI_CreateDate` date DEFAULT (curdate()),
  PRIMARY KEY (`Nyc_Offense_SK`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- nycarrest.dim_race definition

CREATE TABLE `dim_race` (
  `Race_SK` int NOT NULL AUTO_INCREMENT,
  `Race` varchar(100) DEFAULT NULL,
  `DI_JobID` varchar(100) DEFAULT NULL,
  `DI_CreateDate` date DEFAULT (curdate()),
  PRIMARY KEY (`Race_SK`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- nycarrest.fact_arrests definition

CREATE TABLE `fact_arrests` (
  `Arrest_SK` int NOT NULL AUTO_INCREMENT,
  `Arrest_Key` int DEFAULT NULL,
  `Gen_Offense_SK` int DEFAULT NULL,
  `Nyc_Offense_SK` int DEFAULT NULL,
  `Law_SK` int DEFAULT NULL,
  `Boro_SK` int DEFAULT NULL,
  `Arrest_Precinct_SK` int DEFAULT NULL,
  `Age_Group_SK` int DEFAULT NULL,
  `Arrest_Date_SK` int DEFAULT NULL,
  `Geography_SK` int DEFAULT NULL,
  `Race_SK` int DEFAULT NULL,
  `Gender` varchar(100) DEFAULT NULL,
  `Jurisdiction_Code` int DEFAULT NULL,
  `DI_JobID` varchar(100) DEFAULT NULL,
  `DI_CreateDate` date DEFAULT (curdate()),
  PRIMARY KEY (`Arrest_SK`),
  KEY `fact_arrests_FK` (`Age_Group_SK`),
  KEY `fact_arrests_FK_1` (`Boro_SK`),
  KEY `fact_arrests_FK_2` (`Arrest_Precinct_SK`),
  KEY `fact_arrests_FK_3` (`Arrest_Date_SK`),
  KEY `fact_arrests_FK_4` (`Gen_Offense_SK`),
  KEY `fact_arrests_FK_5` (`Geography_SK`),
  KEY `fact_arrests_FK_6` (`Law_SK`),
  KEY `fact_arrests_FK_7` (`Nyc_Offense_SK`),
  KEY `fact_arrests_FK_8` (`Race_SK`),
  CONSTRAINT `fact_arrests_FK` FOREIGN KEY (`Age_Group_SK`) REFERENCES `dim_age_group` (`Age_Group_SK`),
  CONSTRAINT `fact_arrests_FK_1` FOREIGN KEY (`Boro_SK`) REFERENCES `dim_arrest_boro` (`Boro_SK`),
  CONSTRAINT `fact_arrests_FK_2` FOREIGN KEY (`Arrest_Precinct_SK`) REFERENCES `dim_arrest_precinct` (`Arrest_Precinct_SK`),
  CONSTRAINT `fact_arrests_FK_3` FOREIGN KEY (`Arrest_Date_SK`) REFERENCES `dim_date` (`Date_SK`),
  CONSTRAINT `fact_arrests_FK_4` FOREIGN KEY (`Gen_Offense_SK`) REFERENCES `dim_gen_offense` (`Gen_Offense_SK`),
  CONSTRAINT `fact_arrests_FK_5` FOREIGN KEY (`Geography_SK`) REFERENCES `dim_geography` (`Geography_SK`),
  CONSTRAINT `fact_arrests_FK_6` FOREIGN KEY (`Law_SK`) REFERENCES `dim_law` (`Law_SK`),
  CONSTRAINT `fact_arrests_FK_7` FOREIGN KEY (`Nyc_Offense_SK`) REFERENCES `dim_nyc_offense` (`Nyc_Offense_SK`),
  CONSTRAINT `fact_arrests_FK_8` FOREIGN KEY (`Race_SK`) REFERENCES `dim_race` (`Race_SK`)
) ENGINE=InnoDB AUTO_INCREMENT=155849 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SET GLOBAL FOREIGN_KEY_CHECKS = 0;
-- Just run below command to enable foreign keys again
-- SET GLOBAL FOREIGN_KEY_CHECKS = 1;







