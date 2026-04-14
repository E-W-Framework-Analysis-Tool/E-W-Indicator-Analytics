CREATE VIEW [bi].[vw_PS_DimSchoolYears]
AS
	SELECT DISTINCT [SchoolYear]
	FROM [reporting].[FactPsStudentEnrollments]
	UNION
	SELECT DISTINCT [SchoolYear]
	FROM [reporting].[FactPsStudentCourseTranscripts]