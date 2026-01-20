CREATE VIEW [bi].[vw_DimCohortGraduationYears] AS
SELECT DISTINCT [CohortGraduationYear] FROM [reporting].[FactK12StudentEnrollments];