CREATE TABLE [reporting].[DimDisabilityStatuses](
	[DimDisabilityStatusId] [int] IDENTITY(1,1) PRIMARY KEY,
	[DisabilityStatusCode] [nvarchar](100) NOT NULL,
	[DisabilityStatusDescription] [nvarchar](300) NULL
)
GO
--------------------------------------------------------------------------------------
CREATE NONCLUSTERED INDEX NCIX_reporting_DimDisabilityStatuses_DisabilityStatusCode
ON [reporting].[DimDisabilityStatuses] ([DisabilityStatusCode]);
