CREATE TABLE [reporting].[DimK12Courses](
	[DimK12CourseId] [int] IDENTITY(1,1) PRIMARY KEY,
	[CourseIdentifier] [nvarchar](40) NOT NULL,
	[CourseTitle] [nvarchar](60) NOT NULL,
	[CourseDescription] [nvarchar](1024) NULL,
	[CourseDepartmentName] [nvarchar](60) NOT NULL
)
GO
--------------------------------------------------------------------------------------
CREATE NONCLUSTERED INDEX NCIX_reporting_DimK12Courses_CourseIdentifier
ON [reporting].[DimK12Courses] ([CourseIdentifier]);
