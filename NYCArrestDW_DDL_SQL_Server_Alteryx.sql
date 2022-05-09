
create database NYCArrestDW_Alteryx;


-- nycarrest.dim_age_group definition

CREATE TABLE dbo.dim_age_group (
  Age_Group_SK int NOT NULL ,
  Age_LowerBand int DEFAULT NULL,
  Age_UpperBand int DEFAULT NULL,
  DI_JobID varchar(100) DEFAULT NULL,
  DI_CreateDate date DEFAULT (CURRENT_TIMESTAMP),
  PRIMARY KEY (Age_Group_SK)
);


-- nycarrest.dim_arrest_boro definition

CREATE TABLE dbo.dim_arrest_boro (
  Boro_SK int NOT NULL ,
  Arrest_Boro varchar(100) DEFAULT NULL,
  DI_JobID varchar(100) DEFAULT NULL,
  DI_CreateDate date DEFAULT (CURRENT_TIMESTAMP),
  PRIMARY KEY (Boro_SK)
);


-- nycarrest.dim_arrest_precinct definition

CREATE TABLE dbo.dim_arrest_precinct (
  Arrest_Precinct_SK int NOT NULL ,
  Arrest_Precinct int DEFAULT NULL,
  DI_JobID varchar(100) DEFAULT NULL,
  DI_CreateDate date DEFAULT (CURRENT_TIMESTAMP),
  PRIMARY KEY (Arrest_Precinct_SK)
);


-- nycarrest.dbo.dim_date definition

CREATE TABLE dbo.dim_date (
  Date_SK int NOT NULL,
  Year int NOT NULL,
  Month varchar(100) NOT NULL,
  Day varchar(100) NOT NULL,
  Full_Date date NOT NULL,
  DI_JobID varchar(100) DEFAULT NULL,
  DI_CreateDate date DEFAULT (CURRENT_TIMESTAMP),
  PRIMARY KEY (Date_SK)
) ;



-- nycarrest.dbo.dim_gen_offense definition

CREATE TABLE dbo.dim_gen_offense (
  Gen_Offense_SK int NOT NULL ,
  Ky_Cd int DEFAULT NULL,
  Ofns_Desc varchar(100) DEFAULT NULL,
  DI_JobID varchar(100) DEFAULT NULL,
  DI_CreateDate date DEFAULT (CURRENT_TIMESTAMP),
  PRIMARY KEY (Gen_Offense_SK)
);



-- nycarrest.dbo.dim_geography definition

CREATE TABLE dbo.dim_geography (
  Geography_SK int NOT NULL ,
  X_COORD_CD int DEFAULT NULL,
  Y_COORD_CD int DEFAULT NULL,
  Latitude varchar(100) DEFAULT NULL,
  Longitude varchar(100) DEFAULT NULL,
  DI_JobID varchar(100) DEFAULT NULL,
  DI_CreateDate date DEFAULT (CURRENT_TIMESTAMP),
  PRIMARY KEY (Geography_SK)
);



-- nycarrest.dbo.dim_law definition

CREATE TABLE dbo.dim_law (
  Law_SK int NOT NULL ,
  Law_Code varchar(100) DEFAULT NULL,
  Law_Cat_Cd varchar(100) DEFAULT NULL,
  DI_JobID varchar(100) DEFAULT NULL,
  DI_CreateDate date DEFAULT (CURRENT_TIMESTAMP),
  PRIMARY KEY (Law_SK)
);



-- nycarrest.dbo.dim_nyc_offense definition

CREATE TABLE dbo.dim_nyc_offense (
  Nyc_Offense_SK int NOT NULL ,
  Pd_Cd int DEFAULT NULL,
  Pd_Desc varchar(100) DEFAULT NULL,
  DI_JobID varchar(100) DEFAULT NULL,
  DI_CreateDate date DEFAULT (CURRENT_TIMESTAMP),
  PRIMARY KEY (Nyc_Offense_SK)
);



-- nycarrest.dbo.dim_race definition

CREATE TABLE dbo.dim_race (
  Race_SK int NOT NULL ,
  Race varchar(100) DEFAULT NULL,
  DI_JobID varchar(100) DEFAULT NULL,
  DI_CreateDate date DEFAULT (CURRENT_TIMESTAMP),
  PRIMARY KEY (Race_SK)
) ;



-- nycarrest.fact_arrests definition

CREATE TABLE dbo.fact_arrests (
  Arrest_SK int NOT NULL ,
  Arrest_Key int DEFAULT NULL,
  Gen_Offense_SK int DEFAULT NULL,
  Nyc_Offense_SK int DEFAULT NULL,
  Law_SK int DEFAULT NULL,
  Boro_SK int DEFAULT NULL,
  Arrest_Precinct_SK int DEFAULT NULL,
  Age_Group_SK int DEFAULT NULL,
  Arrest_Date_SK int DEFAULT NULL,
  Geography_SK int DEFAULT NULL,
  Race_SK int DEFAULT NULL,
  Gender varchar(100) DEFAULT NULL,
  Jurisdiction_Code int DEFAULT NULL,
  DI_JobID varchar(100) DEFAULT NULL,
  DI_CreateDate date DEFAULT (CURRENT_TIMESTAMP),
  PRIMARY KEY (Arrest_SK),
  CONSTRAINT fact_arrests_FK FOREIGN KEY (Age_Group_SK) REFERENCES dbo.dim_age_group (Age_Group_SK),
  CONSTRAINT fact_arrests_FK_1 FOREIGN KEY (Boro_SK) REFERENCES dbo.dim_arrest_boro (Boro_SK),
  CONSTRAINT fact_arrests_FK_2 FOREIGN KEY (Arrest_Precinct_SK) REFERENCES dbo.dim_arrest_precinct (Arrest_Precinct_SK),
  CONSTRAINT fact_arrests_FK_3 FOREIGN KEY (Arrest_Date_SK) REFERENCES dbo.dim_date (Date_SK),
  CONSTRAINT fact_arrests_FK_4 FOREIGN KEY (Gen_Offense_SK) REFERENCES dbo.dim_gen_offense (Gen_Offense_SK),
  CONSTRAINT fact_arrests_FK_5 FOREIGN KEY (Geography_SK) REFERENCES dbo.dim_geography (Geography_SK),
  CONSTRAINT fact_arrests_FK_6 FOREIGN KEY (Law_SK) REFERENCES dbo.dim_law (Law_SK),
  CONSTRAINT fact_arrests_FK_7 FOREIGN KEY (Nyc_Offense_SK) REFERENCES dbo.dim_nyc_offense (Nyc_Offense_SK),
  CONSTRAINT fact_arrests_FK_8 FOREIGN KEY (Race_SK) REFERENCES dbo.dim_race (Race_SK)
);


SET GLOBAL FOREIGN_KEY_CHECKS = 0;
-- Just run below command to enable foreign keys again
-- SET GLOBAL FOREIGN_KEY_CHECKS = 1;







