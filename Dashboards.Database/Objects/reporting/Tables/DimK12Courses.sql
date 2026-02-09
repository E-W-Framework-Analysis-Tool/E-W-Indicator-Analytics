CREATE TABLE [reporting].[DimK12Courses]
(
	[DimK12CourseId]       [int] IDENTITY (1,1),
	[CourseIdentifier]     [nvarchar](40)   NOT NULL,
	[CourseTitle]          [nvarchar](60)   NOT NULL,
	[CourseDescription]    [nvarchar](1024) NULL,
	[CourseDepartmentName] [nvarchar](60)   NOT NULL,
	CONSTRAINT [PK_DimK12CourseId] PRIMARY KEY ([DimK12CourseId]),
	INDEX [NCIX_DimK12Courses_CourseIdentifier] NONCLUSTERED ([CourseIdentifier])
)
GO
--------------------------------------------------------------------------------------
