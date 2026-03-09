PRINT('SEED START: [reporting].[DimHomelessnessStatuses]');
SET IDENTITY_INSERT [reporting].[DimHomelessnessStatuses] ON;

INSERT INTO [reporting].[DimHomelessnessStatuses] ([DimHomelessnessStatusId], [HomelessnessStatusCode], [HomelessnessStatusDescription])
SELECT [src].[Id], [src].[Code], [src].[Description]
FROM (VALUES 
    (-1, 'MISSING', 'MISSING'),
    (1, 'Yes', 'Homeless enrolled'),
    (2, 'No', 'Not Homeless enrolled')
) AS src(Id, Code, Description)
WHERE NOT EXISTS (
    SELECT 1 FROM [reporting].[DimHomelessnessStatuses] AS [tgt]
    WHERE [tgt].[HomelessnessStatusCode] = [src].[Code]
);

SET IDENTITY_INSERT [reporting].[DimHomelessnessStatuses] OFF;
PRINT('SEED END: [reporting].[DimHomelessnessStatuses]');

GO
