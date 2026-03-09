CREATE TABLE [reporting].[DimK12CourseStatuses]
(
	[DimK12CourseStatusId]                 [int] IDENTITY (1,1),
	[CourseLevelCharacteristicCode]        [nvarchar](50)  NOT NULL,
	[CourseLevelCharacteristicDescription] [nvarchar](200) NOT NULL,
	CONSTRAINT [PK_DimK12CourseStatusId] PRIMARY KEY ([DimK12CourseStatusId]),
	INDEX [NCIX_DimK12CourseStatuses_CourseLevelCharacteristicCode] NONCLUSTERED ([CourseLevelCharacteristicCode])
)
GO
--------------------------------------------------------------------------------------
