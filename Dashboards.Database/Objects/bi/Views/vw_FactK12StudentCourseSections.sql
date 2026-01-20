CREATE VIEW [bi].[vw_FactK12StudentCourseSections] AS
SELECT
	  [SchoolYear]
  , [SeaId]
  , [LeaId]
  , [K12SchoolId]
  , [GradeLevelCode]
  , [K12CourseId]
  , [K12CourseStatusId]
  , [K12StudentId]
  , [StudentCourseSectionGradeEarned] AS [LetterGrade]
FROM
	[reporting].[FactK12StudentCourseSections]
