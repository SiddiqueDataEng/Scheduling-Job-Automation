/*
 * Scheduling Job Automation
 * Project #79 - Complete Database Implementation
 * SQL Server 2008/2012
 * Technology: SQL Server Agent
 * Created: 2014
 */

USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'SchedulingETL')
BEGIN
    ALTER DATABASE SchedulingETL SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE SchedulingETL;
END
GO

CREATE DATABASE SchedulingETL
ON PRIMARY
(
    NAME = 'SchedulingETL_Data',
    FILENAME = 'C:\SQLData\SchedulingETL_Data.mdf',
    SIZE = 100MB,
    MAXSIZE = 5GB,
    FILEGROWTH = 10MB
)
LOG ON
(
    NAME = 'SchedulingETL_Log',
    FILENAME = 'C:\SQLData\SchedulingETL_Log.ldf',
    SIZE = 50MB,
    MAXSIZE = 1GB,
    FILEGROWTH = 5MB
);
GO

ALTER DATABASE SchedulingETL SET RECOVERY SIMPLE;
ALTER DATABASE SchedulingETL SET AUTO_UPDATE_STATISTICS ON;
GO

USE SchedulingETL;
GO

PRINT 'Database SchedulingETL created successfully';
PRINT 'Project: Scheduling Job Automation';
PRINT 'Description: SQL Agent ETL automation';
GO
