CREATE VIEW [bi].[vw_DimCohortYears] AS
SELECT DISTINCT [CohortYear] FROM [reporting].[FactK12StudentEnrollments];