CREATE VIEW [bi].[vw_DimK12Courses] AS
SELECT
	[DimK12CourseId]
  , [CourseIdentifier]
  , [CourseTitle]
  , [CourseDepartmentName] AS [CourseSubject]
FROM [reporting].[DimK12Courses];
