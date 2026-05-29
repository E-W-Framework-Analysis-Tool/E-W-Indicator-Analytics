CREATE TABLE [reporting].[PS_DimInstitutions]
(
	[DimPsInstitutionId] [int] IDENTITY (1,1),
	[NameOfInstitution]  [nvarchar](1000) NOT NULL,
	[IPEDSIdentifier]    [int]            NULL,
	[StateAbbreviation]  [nvarchar](50)   NULL,
	CONSTRAINT [PK_DimPsInstitutionId] PRIMARY KEY ([DimPsInstitutionId]),
	INDEX [NCIX_DimPsInstitutions_IPEDSIdentifier] NONCLUSTERED ([IPEDSIdentifier])
)
GO