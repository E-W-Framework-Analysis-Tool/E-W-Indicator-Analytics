CREATE VIEW [bi].[vw_DimSchoolYears] AS
SELECT DISTINCT [SchoolYear] FROM [reporting].[FactK12StudentEnrollments];