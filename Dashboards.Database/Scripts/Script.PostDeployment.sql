/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


-- Seed [reporting] Dimension tables
:r .\SeedReportingDimensionTables\SeedDimDisabilityStatuses.sql
:r .\SeedReportingDimensionTables\SeedDimEconomicallyDisadvantagedStatuses.sql
:r .\SeedReportingDimensionTables\SeedDimEnglishLearnerStatuses.sql
:r .\SeedReportingDimensionTables\SeedDimFosterCareStatuses.sql
:r .\SeedReportingDimensionTables\SeedDimGradeLevels.sql
:r .\SeedReportingDimensionTables\SeedDimHomelessnessStatuses.sql
:r .\SeedReportingDimensionTables\SeedDimNOrDStatuses.sql
:r .\SeedReportingDimensionTables\SeedDimSchoolYears.sql
:r .\SeedReportingDimensionTables\SeedDimK12Demographics.sql
:r .\SeedReportingDimensionTables\SeedDimRaces.sql
:r .\SeedReportingDimensionTables\SeedDimK12CourseStatuses.sql
:r .\SeedReportingDimensionTables\SeedDimPsAcademicAwardStatuses.sql
:r .\SeedReportingDimensionTables\SeedDimPsAcademicAwardTitles.sql

-- Seed other tables
:r .\SeedOtherTables\SeedBatchControl.sql

