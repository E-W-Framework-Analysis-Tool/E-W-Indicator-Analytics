CREATE TABLE [reporting].[PS_DimStudents]
(
	[DimPSStudentId]        [bigint] IDENTITY (1,1),
	[StudentIdentifierState] [nvarchar](40) NULL,
	CONSTRAINT [PK_PS_DimPSStudentId] PRIMARY KEY ([DimPSStudentId]),
	INDEX [NCIX_PS_DimStudents_StudentIdentifierState] NONCLUSTERED ([StudentIdentifierState])
)
GO