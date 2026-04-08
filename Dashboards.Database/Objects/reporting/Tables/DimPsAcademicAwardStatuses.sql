CREATE TABLE [reporting].[DimPsAcademicAwardStatuses]
(
	[DimPsAcademicAwardStatusId]                            [int] IDENTITY (1,1),
	[PescAwardLevelTypeCode]                                [nvarchar](50)  NULL,
	[PescAwardLevelTypeDescription]                         [nvarchar](400) NULL,
	[ProfessionalOrTechnicalCredentialConferredCode]        [nvarchar](50)  NULL,
	[ProfessionalOrTechnicalCredentialConferredDescription] [nvarchar](200) NULL,
	CONSTRAINT [PK_DimPsAcademicAwardStatusId]
		PRIMARY KEY ([DimPsAcademicAwardStatusId]),
	INDEX [NCIX_DimPsAcademicAwardStatuses_PescAwardLevelTypeDescription]
		NONCLUSTERED ([PescAwardLevelTypeDescription]),
	INDEX [NCIX_DimPsAcademicAwardStatuses_ProfessionalOrTechnicalCredentialConferredDescription]
		NONCLUSTERED ([ProfessionalOrTechnicalCredentialConferredDescription]),
)