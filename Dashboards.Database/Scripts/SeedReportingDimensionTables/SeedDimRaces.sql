PRINT('SEED START: [reporting].[DimRaces]');
SET IDENTITY_INSERT [reporting].[DimRaces] ON;

INSERT INTO [reporting].[DimRaces] ([DimRaceId], [RaceCode], [RaceDescription], [RaceEdFactsCode])
SELECT [src].[Id], [src].[Code], [src].[Description], [src].[EdFactsCode]
FROM (VALUES 
    (-1, 'MISSING', 'MISSING', 'MISSING')
) AS src(Id, Code, [Description], [EdFactsCode])
WHERE NOT EXISTS (
    SELECT 1 FROM [reporting].[DimRaces] AS [tgt]
    WHERE [tgt].[RaceCode] = [src].[Code]
);

SET IDENTITY_INSERT [reporting].[DimRaces] OFF;
PRINT('SEED END: [reporting].[DimRaces]');

GO
