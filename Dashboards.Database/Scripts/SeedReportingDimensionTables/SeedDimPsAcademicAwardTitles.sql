PRINT ('SEED START: [reporting].[DimPsAcademicAwardTitles]');

SET IDENTITY_INSERT [reporting].[DimPsAcademicAwardTitles] ON;

INSERT
INTO [reporting].[DimPsAcademicAwardTitles]
	(
		  [DimPsAcademicAwardTitleId]
		, [AcademicAwardTitle]
	)
SELECT
	[src].[Id]
  , [src].[Code]
FROM
	(VALUES
		 (
			 -1, 'MISSING'
		 )) AS [src]([Id], [Code])
WHERE
	NOT EXISTS(SELECT 1
			   FROM [reporting].[DimPsAcademicAwardTitles] AS [tgt]
			   WHERE [tgt].[DimPsAcademicAwardTitleId] = [src].[Id]);

SET IDENTITY_INSERT [reporting].[DimPsAcademicAwardTitles] OFF;

PRINT ('SEED END: [reporting].[DimPsAcademicAwardTitles]');

GO