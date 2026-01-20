PRINT('SEED START: [reporting].[DimK12Demographics]');
SET IDENTITY_INSERT [reporting].[DimK12Demographics] ON;

INSERT
INTO [reporting].[DimK12Demographics]
	(
		[DimK12DemographicId], [SexCode], [SexDescription]
	)
SELECT [src].[Id], [src].[Code], [src].[Description]
FROM (VALUES 
    (-1, 'MISSING', 'MISSING'),
    (1, 'Female', 'Female'),
    (2, 'Male', 'Male'),
    (3, 'NotSelected', 'Not Selected')
) AS src(Id, Code, [Description])
WHERE
	NOT EXISTS(SELECT 1
			   FROM [reporting].[DimK12Demographics] AS [tgt]
			   WHERE [tgt].[SexCode] = [src].[Code]);

SET IDENTITY_INSERT [reporting].[DimK12Demographics] OFF;

PRINT ('SEED END: [reporting].[DimK12Demographics]');

GO
