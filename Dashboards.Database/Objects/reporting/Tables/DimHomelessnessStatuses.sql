CREATE TABLE [reporting].[DimHomelessnessStatuses]
(
	[DimHomelessnessStatusId]       [int] IDENTITY (1,1),
	[HomelessnessStatusCode]        [nvarchar](100) NOT NULL,
	[HomelessnessStatusDescription] [nvarchar](300) NULL,
	CONSTRAINT [PK_DimHomelessnessStatusId] PRIMARY KEY ([DimHomelessnessStatusId]),
	INDEX [NCIX_DimHomelessnessStatuses_HomelessnessStatusCode] NONCLUSTERED ([HomelessnessStatusCode])
)
GO
--------------------------------------------------------------------------------------