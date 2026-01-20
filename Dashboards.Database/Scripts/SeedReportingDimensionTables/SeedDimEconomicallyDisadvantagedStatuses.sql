PRINT('SEED START: [reporting].[DimEconomicallyDisadvantagedStatuses]');
SET IDENTITY_INSERT [reporting].[DimEconomicallyDisadvantagedStatuses] ON;

INSERT INTO [reporting].[DimEconomicallyDisadvantagedStatuses] ([DimEconomicallyDisadvantagedStatusId], [EconomicDisadvantageStatusCode], [EconomicDisadvantageStatusDescription])
SELECT [src].[Id], [src].[Code], [src].[Description]
FROM (VALUES 
    (-1, 'MISSING', 'MISSING'),
    (1, 'Yes', 'Yes'),
    (2, 'No', 'No')
) AS src(Id, Code, Description)
WHERE NOT EXISTS (
    SELECT 1 FROM [reporting].[DimEconomicallyDisadvantagedStatuses] AS [tgt]
    WHERE [tgt].[EconomicDisadvantageStatusCode] = [src].[Code]
);

SET IDENTITY_INSERT [reporting].[DimEconomicallyDisadvantagedStatuses] OFF;
PRINT('SEED END: [reporting].[DimEconomicallyDisadvantagedStatuses]');

GO
