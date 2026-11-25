/*
    Project     : LearningPlus
    Database    : ELearningPlus
    Description : Creates the LearningPlus database
*/

USE master;
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = 'ELearningPlus'
)
BEGIN
    CREATE DATABASE ELearningPlus;
END
GO