CREATE TABLE [reporting].[DimFosterCareStatuses](
	[DimFosterCareStatusId] [int]  IDENTITY(1,1) PRIMARY KEY,
	[FosterCareStatusCode] [nvarchar](50) NOT NULL,
	[FosterCareStatusDescription] [nvarchar](200) NULL
) 

GO
--------------------------------------------------------------------------------------
CREATE NONCLUSTERED INDEX NCIX_reporting_DimFosterCareStatuses_FosterCareStatusCode
ON [reporting].[DimFosterCareStatuses] ([FosterCareStatusCode]);
