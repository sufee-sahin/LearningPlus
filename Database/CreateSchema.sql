use ELearningPlus
go

-- Create Auth Schema
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'auth')
BEGIN
    EXEC('CREATE SCHEMA [auth] AUTHORIZATION [dbo]');
END
GO

-- Create Course Schema
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'course')
BEGIN
    EXEC('CREATE SCHEMA [course] AUTHORIZATION [dbo]');
END
GO

-- Create Commerce Schema
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'commerce')
BEGIN
    EXEC('CREATE SCHEMA [commerce] AUTHORIZATION [dbo]');
END
GO

-- Create Assessment Schema
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'assessment')
BEGIN
    EXEC('CREATE SCHEMA [assessment] AUTHORIZATION [dbo]');
END
GO

-- Create Learning Schema
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'learning')
BEGIN
    EXEC('CREATE SCHEMA [learning] AUTHORIZATION [dbo]');
END
GO

-- Create Discussion Schema
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'discussion')
BEGIN
    EXEC('CREATE SCHEMA [discussion] AUTHORIZATION [dbo]');
END
GO
