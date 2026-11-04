-- Fictional IT Asset Management database
-- Run ONLY on a SQL Server instance where ITAssetDB does not already exist.
-- This script intentionally refuses to overwrite an existing database.
IF DB_ID(N'ITAssetDB') IS NOT NULL
BEGIN
    THROW 50001, 'ITAssetDB already exists. Setup cancelled to protect existing data.', 1;
END;
GO

CREATE DATABASE ITAssetDB;
GO
USE ITAssetDB;
GO

CREATE TABLE dbo.Locations (
    LocationID INT IDENTITY(1,1) PRIMARY KEY,
    LocationName NVARCHAR(100) NOT NULL,
    City NVARCHAR(100) NOT NULL
);

CREATE TABLE dbo.Assets (
    AssetID INT IDENTITY(1,1) PRIMARY KEY,
    Hostname NVARCHAR(100) NOT NULL,
    DeviceType NVARCHAR(50) NOT NULL,
    Status NVARCHAR(30) NOT NULL DEFAULT 'Active',
    LocationID INT NOT NULL,
    CONSTRAINT CK_Assets_Status CHECK (
        Status IN ('Active', 'In Storage', 'Inactive', 'Under Repair', 'Retired')
    ),
    CONSTRAINT FK_Assets_Locations FOREIGN KEY (LocationID)
        REFERENCES dbo.Locations(LocationID)
);

INSERT INTO dbo.Locations (LocationName, City)
VALUES
    ('Head Office', 'Hull'),
    ('Regional Office', 'Leeds'),
    ('Distribution Centre', 'York'),
    ('Satellite Office', 'Manchester');

INSERT INTO dbo.Assets (Hostname, DeviceType, Status, LocationID)
VALUES
    ('LAPTOP-001', 'Laptop', 'Active', 1),
    ('DESKTOP-001', 'Desktop', 'Active', 1),
    ('LAPTOP-002', 'Laptop', 'Active', 2),
    ('SERVER-001', 'Server', 'Active', 3);

SELECT a.AssetID, a.Hostname, a.DeviceType, a.Status,
       l.LocationName, l.City
FROM dbo.Assets AS a
INNER JOIN dbo.Locations AS l
    ON a.LocationID = l.LocationID
ORDER BY a.Hostname;
