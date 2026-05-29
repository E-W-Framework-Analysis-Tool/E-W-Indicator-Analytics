CREATE VIEW [bi].[vw_FactPsStudentCourseTranscripts]
AS
	SELECT
		[FactPsStudentCourseTranscriptId]
	  , [SchoolYear]
	  , [PsInstitutionId]
	  , [PsStudentId]
	  , [CipCodeId]
	  , [NumberOfCreditsAttempted]
	  , [NumberOfCreditsEarned]
	  , [StudentCourseSectionGradeEarned]
	FROM [reporting].[FactPsStudentCourseTranscripts]