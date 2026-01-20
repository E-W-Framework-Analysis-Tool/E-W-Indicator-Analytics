CREATE TABLE [reporting].[DimHomelessnessStatuses](
	[DimHomelessnessStatusId] [int]  IDENTITY(1,1) PRIMARY KEY,
	[HomelessnessStatusCode] [nvarchar](100) NOT NULL,
	[HomelessnessStatusDescription] [nvarchar](300) NULL
)
GO
--------------------------------------------------------------------------------------
CREATE NONCLUSTERED INDEX NCIX_reporting_DimHomelessnessStatuses_HomelessnessStatusCode
ON [reporting].[DimHomelessnessStatuses] ([HomelessnessStatusCode]);
