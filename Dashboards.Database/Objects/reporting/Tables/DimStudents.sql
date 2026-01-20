CREATE TABLE [reporting].[DimStudents](
	[DimK12StudentId] [bigint] IDENTITY(1,1) PRIMARY KEY,
	[StudentIdentifierState] [nvarchar](40) NULL
)
GO
--------------------------------------------------------------------------------------
CREATE NONCLUSTERED INDEX NCIX_reporting_DimStudents_StudentIdentifierState
ON [reporting].[DimStudents] ([StudentIdentifierState]);
