CREATE TABLE [staging].[DimPsAcademicAwardStatuses]
(
	[DimPsAcademicAwardStatusId]                            [int]           NULL,
	[PescAwardLevelTypeCode]                                [nvarchar](50)  NULL,
	[PescAwardLevelTypeDescription]                         [nvarchar](400) NULL,
	[ProfessionalOrTechnicalCredentialConferredCode]        [nvarchar](50)  NULL,
	[ProfessionalOrTechnicalCredentialConferredDescription] [nvarchar](200) NULL
)