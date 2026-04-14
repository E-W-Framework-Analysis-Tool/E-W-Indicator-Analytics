CREATE VIEW [bi].[vw_FactPsStudentAcademicAwards]
AS
	SELECT
		[FactPsStudentAcademicAwardId]
	  , [SchoolYear]
	  , [PsInstitutionId]
	  , [PSStudentId]
	  , [PsAcademicAwardTitleId]
	  , [AcademicAwardDate]
	  , [PsAcademicAwardStatusId]
	FROM [reporting].[FactPsStudentAcademicAwards]