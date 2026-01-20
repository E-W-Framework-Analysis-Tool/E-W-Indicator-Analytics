CREATE VIEW [bi].[vw_DimK12Courses] AS
SELECT
	  [DimK12CourseId]       AS [Id]
  , [CourseIdentifier]     AS [Code]
  , [CourseTitle]
  , [CourseDepartmentName] AS [CourseSubject]
FROM [reporting].[DimK12Courses];
