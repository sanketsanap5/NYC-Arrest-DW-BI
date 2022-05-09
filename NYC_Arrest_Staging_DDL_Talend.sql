

CREATE DATABASE NYPD_Arrests_Staging_Talend;

CREATE TABLE `nypd_arrests_staging` (
  `ARREST_KEY` int NOT NULL,
  `ARREST_DATE` date,
  `PD_CD` int,
  `PD_DESC` varchar(200),
  `KY_CD` int,
  `OFNS_DESC` varchar(200),
  `LAW_CODE` varchar(200),
  `LAW_CAT_CD` varchar(10),
  `ARREST_BORO` varchar(10),
  `ARREST_PRECINCT` int,
  `JURISDICTION_CODE` int,
  `AGE_GROUP` varchar(50),
  `PERP_SEX` varchar(10),
  `PERP_RACE` varchar(50),
  `X_COORD_CD` int,
  `Y_COORD_CD` int,
  `LATITUDE` varchar(100),
  `LONGITUDE` varchar(100),
  `LON_LAT` varchar(500),
  PRIMARY KEY (`ARREST_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

