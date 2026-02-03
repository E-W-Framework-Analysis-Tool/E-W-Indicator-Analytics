CREATE VIEW [bi].[vw_FactK12StudentCourseSections] AS
SELECT
	[SchoolYear]
  , [K12SchoolId]
  , [GradeLevelCode]
  , [K12CourseId]
  , [K12CourseStatusId]
  , [K12StudentId]
  , [StudentCourseSectionGradeEarned] AS [LetterGradeEarned]
FROM
	[reporting].[FactK12StudentCourseSections];
