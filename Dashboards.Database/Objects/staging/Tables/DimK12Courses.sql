CREATE TABLE [staging].[DimK12Courses]
(
	[DimK12CourseId]       [int]            NOT NULL,
	[CourseIdentifier]     [nvarchar](40)   NOT NULL,
	[CourseTitle]          [nvarchar](60)   NOT NULL,
	[CourseDescription]    [nvarchar](1024) NULL,
	[CourseDepartmentName] [nvarchar](60)   NOT NULL
)
GO
--------------------------------------------------------------------------------------
