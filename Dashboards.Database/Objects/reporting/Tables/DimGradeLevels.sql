CREATE TABLE [reporting].[DimGradeLevels](
	[GradeLevelCode] [varchar](8),
	[GradeLevelDescription] [varchar](100) NOT NULL,
	CONSTRAINT PK_DimGradeLevels_GradeLevelCode PRIMARY KEY ([GradeLevelCode])
)
GO
--------------------------------------------------------------------------------------
