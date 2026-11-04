-- Read-only practice queries from SQL Lessons 11-34.
-- Run against the fictional ITAssetDB after setup.
USE ITAssetDB;
GO

-- Count all assets
SELECT COUNT(*) AS TotalAssets
FROM dbo.Assets;

-- Filter active laptops
SELECT *
FROM dbo.Assets
WHERE DeviceType = 'Laptop'
  AND Status = 'Active';

-- Alternative ways to match multiple statuses
SELECT *
FROM dbo.Assets
WHERE Status = 'Inactive' OR Status = 'Under Repair';

SELECT *
FROM dbo.Assets
WHERE Status IN ('Inactive', 'Under Repair');

-- AND / OR precedence
SELECT *
FROM dbo.Assets
WHERE DeviceType = 'Laptop'
  AND (Status = 'Active' OR Status = 'In Storage');

-- Sort within device type
SELECT *
FROM dbo.Assets
ORDER BY DeviceType ASC, Hostname ASC;

-- Show asset and location information
SELECT a.Hostname, a.DeviceType, l.LocationName, l.City
FROM dbo.Assets AS a
INNER JOIN dbo.Locations AS l
    ON a.LocationID = l.LocationID;

-- Keep all locations, including any without devices
SELECT l.LocationName, a.Hostname
FROM dbo.Locations AS l
LEFT JOIN dbo.Assets AS a
    ON l.LocationID = a.LocationID;

-- Find locations without assigned assets
SELECT l.LocationName, a.Hostname
FROM dbo.Locations AS l
LEFT JOIN dbo.Assets AS a
    ON l.LocationID = a.LocationID
WHERE a.AssetID IS NULL;

-- Count by device type
SELECT DeviceType, COUNT(*) AS TotalAssets
FROM dbo.Assets
GROUP BY DeviceType;

-- Count by location; COUNT(column) excludes unmatched LEFT JOIN rows
SELECT l.LocationName, COUNT(a.AssetID) AS TotalAssets
FROM dbo.Locations AS l
LEFT JOIN dbo.Assets AS a
    ON l.LocationID = a.LocationID
GROUP BY l.LocationID, l.LocationName
ORDER BY l.LocationName;
