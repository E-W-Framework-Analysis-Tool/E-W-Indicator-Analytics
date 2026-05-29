CREATE TABLE [staging].[PS_DimInstitutions]
(
	[DimPsInstitutionId]  [int]            NULL,
	[NameOfInstitution]   [nvarchar](1000) NULL,
	[IPEDSIdentifier]	  [int]			   NULL,
	[StateAbbreviation]   [nvarchar](50)   NULL
)
GO