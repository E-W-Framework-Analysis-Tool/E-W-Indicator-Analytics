CREATE TABLE [reporting].[DimStudents]
(
	[DimK12StudentId]        [bigint] IDENTITY (1,1),
	[StudentIdentifierState] [nvarchar](40) NULL,
	CONSTRAINT [PK_DimK12StudentId] PRIMARY KEY ([DimK12StudentId]),
	INDEX [NCIX_DimStudents_StudentIdentifierState] NONCLUSTERED ([StudentIdentifierState])
)
GO
--------------------------------------------------------------------------------------