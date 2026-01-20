# E-W-Indicator-Analytics
Sample BI dashboards created for select Essential Questions in the Education-to-Workforce Indicator Framework

### Project Structure

This repository contains the end-to-end data pipeline for generating education-related dashboards. It follows a standard Extract, Transform, Load (ETL) pattern, moving data from the CEDS Data Warehouse into a specialized DataMart for reporting.

The solution is divided into three primary components:

1. **Dashboards.Database**
- **Type**: SQL Server Database Project (.sqlproj)
- **Purpose**: Defines the schema for the Dashboards DataMart.
- **Content**: Contains table definitions, views, and stored procedures optimized for Power BI consumption. It acts as the destination layer for the ETL process.

2. **Dashboards.Database.ETL**
- **Type**: SQL Server Integration Services (SSIS) Project
- **Purpose**: The orchestration layer that handles data movement.
- **Workflow**: 
    * Connects to the CEDS Data Warehouse as the source.
    * Applies necessary business logic and transformations.
    * Loads the processed data into the Dashboards DataMart.

3. **Power BI**
- Type: Power BI Desktop Files (.pbix)
- Purpose: The visualization layer used by stakeholders to answer "Essential Questions" (EQs).
- Current Status: 
    - **EQ 12**: (In Progress) — Focused on specific education metrics defined in the CEDS framework.
    - _Note: Future EQs will be added to this directory as individual report files._

### Getting Started

#### Prerequisites
- Visual Studio (with SQL Server Data Tools and SSIS extensions).
- SQL Server instance to host the DataMart.
- Power BI Desktop for report editing.
- Access to a CEDS Data Warehouse environment.

#### Deployment Flow
1. **Database**: Deploy the Dashboards.Database project to your SQL instance to create the schema.
2. **ETL**: Open Dashboards.Database.ETL, update the _Project.Params_ variables to point to the Source (CEDS DWH) and Destination (Dashboards DataMart), and execute the packages.
3. **Reports**: Open the .pbix files in the Power BI folder and refresh the data source to point to your newly populated DataMart.
