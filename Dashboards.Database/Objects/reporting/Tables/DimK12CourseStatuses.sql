CREATE TABLE [reporting].[DimK12CourseStatuses](
	[DimK12CourseStatusId] [int] IDENTITY(1,1) PRIMARY KEY,
	[CourseLevelCharacteristicCode] [nvarchar](50) NOT NULL,
	[CourseLevelCharacteristicDescription] [nvarchar](200) NOT NULL,
)
