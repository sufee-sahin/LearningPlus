USE ElearningDB
GO;
--role table for roles like admin, instructor, student
CREATE Table Roles(
intRoleID INT PRIMARY KEY IDENTITY(1,1),
txtRoleName NVARCHAR(20) NOT NULL,
dtCreated DATETIME2 NOT NULL,
txtCreatedBy NVARCHAR(50) NOT NULL,
dtLastModified DATETIME2 NOT NULL,
txtLastModifiedBy NVARCHAR(50) NOT NULL,
flagActive BIT
)

--user table for users
CREATE TABLE Users(
intUserID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
txtFirstName NVARCHAR(50) NOT NULL,
txtLastName NVARCHAR(50),
txtEmail NVARCHAR(150) NOT NULL UNIQUE,
txtMobileNo NVARCHAR(15) NOT NULL,
txtPasswordHash NVARCHAR(256) NOT NULL,
intRoleID INT NOT NULL,
dtCreated DATETIME2 NOT NULL,
txtCreatedBy NVARCHAR(50) NOT NULL,
dtLastModified DATETIME2 NOT NULL,
txtLastModifiedBy NVARCHAR(50) NOT NULL,
flagActive BIT,
FOREIGN KEY (intRoleID) REFERENCES Roles(intRoleID)
)

-- This table stores JWT refresh tokens for authenticated users.
-- When a user logs in, a refresh token is generated and saved here.
-- It is used to issue new access tokens when the old one expires,
-- so the user does not have to log in again every 30 minutes.
-- A token can be revoked on logout or if a security breach is detected.
CREATE TABLE RefreshTokens (
    intTokenID      INT PRIMARY KEY IDENTITY(1,1),
    intUserID       UNIQUEIDENTIFIER NOT NULL,
    txtToken        NVARCHAR(512) NOT NULL UNIQUE,
    dtExpiresAt     DATETIME2 NOT NULL,
    dtCreated       DATETIME2 NOT NULL,
    txtCreatedBy    NVARCHAR(50) NOT NULL,
    flagIsRevoked   BIT,
    FOREIGN KEY (intUserID) REFERENCES Users(intUserID)
);

