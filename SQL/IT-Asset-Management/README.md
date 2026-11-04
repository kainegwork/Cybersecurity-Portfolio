# IT Asset Management Database (SQL Server)

A personal SQL Server learning project for a fictional company's IT equipment inventory. Built independently using Microsoft SQL Server 2025 and SQL Server Management Studio (SSMS) 22, with entirely made-up assets and locations.

## What it does

The database tracks devices in an `Assets` table and offices in a `Locations` table. Each asset belongs to a valid location. The sample dataset contains four devices across three offices, plus a fourth office with no assigned assets.

## Skills practised

- Creating databases and tables with `CREATE DATABASE` and `CREATE TABLE`
- `INT IDENTITY` primary keys, `NOT NULL`, and default values
- `CHECK` constraints restricting asset statuses to Active, In Storage, Inactive, Under Repair, or Retired
- Foreign keys and referential integrity between assets and locations
- `INSERT`, `SELECT`, `UPDATE`, `WHERE`, `IN`, `AND`, `OR`, `ORDER BY`, and `CASE`
- Using `BEGIN TRANSACTION`, `ROLLBACK`, and `COMMIT`
- `INNER JOIN` and `LEFT JOIN`, including finding locations without assets
- Table aliases, `COUNT`, `GROUP BY`, and reporting totals per office

## Files

- [setup.sql](setup.sql) — Builds a **new** example database with sample data. Do not run against your existing working database or a production database.
- [practice-queries.sql](practice-queries.sql) — Non-destructive example queries reflecting the reporting exercises completed so far.

## Sample tables

**Locations:** `LocationID`, `LocationName`, `City`.

**Assets:** `AssetID`, `Hostname`, `DeviceType`, `Status`, `LocationID`.

`Assets.LocationID` is a mandatory foreign key referencing `Locations.LocationID`. The status field also has a `CHECK` constraint and defaults to `Active` when omitted.

## Example report

| Location | Total assets |
| --- | ---: |
| Head Office | 2 |
| Regional Office | 1 |
| Distribution Centre | 1 |
| Satellite Office | 0 |

The report uses a `LEFT JOIN` and `COUNT(a.AssetID)` to count real matches rather than counting the unmatched row for the empty office.

## Notes

This is a learning project, not a finished production inventory system. The project uses fictional data only, with no employer data, proprietary workflows or credentials. The setup script reproduces the final schema and sample data; it does not replay the intentionally invalid operations from the original learning session.

**Next steps:** `HAVING`, further relational tables, more detailed reports, and eventually integrating the data with a separate FastAPI learning project.
