PRINT ('SEED START: [reporting].[DimPsAcademicAwardStatuses]');

SET IDENTITY_INSERT [reporting].[DimPsAcademicAwardStatuses] ON;

INSERT
INTO [reporting].[DimPsAcademicAwardStatuses]
	(
		  [DimPsAcademicAwardStatusId]
		, [PescAwardLevelTypeCode]
		, [PescAwardLevelTypeDescription]
		, [ProfessionalOrTechnicalCredentialConferredCode]
		, [ProfessionalOrTechnicalCredentialConferredDescription]
	)
SELECT
	[src].[Id]
  , [src].[Code]
  , [src].[Description]
  , [src].[ConferredCode]
  , [src].[ConferredDescription]
FROM
	(VALUES
		 (
			 -1, 'MISSING', 'MISSING', 'MISSING', 'MISSING'
		 )) AS [src]([Id], [Code], [Description], [ConferredCode], [ConferredDescription])
WHERE
	NOT EXISTS(SELECT 1
			   FROM [reporting].[DimPsAcademicAwardStatuses] AS [tgt]
			   WHERE [tgt].[DimPsAcademicAwardStatusId] = [src].[Id]);

SET IDENTITY_INSERT [reporting].[DimPsAcademicAwardStatuses] OFF;

PRINT ('SEED END: [reporting].[DimPsAcademicAwardStatuses]');

GO