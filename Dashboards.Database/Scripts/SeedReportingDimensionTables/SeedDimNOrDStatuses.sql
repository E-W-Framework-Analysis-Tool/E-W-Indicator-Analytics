PRINT('SEED START: [reporting].[DimNOrDStatuses]');
SET IDENTITY_INSERT [reporting].[DimNOrDStatuses] ON;

INSERT INTO [reporting].[DimNOrDStatuses] ([DimNOrDStatusId], [NeglectedOrDelinquentLongTermStatusCode], [NeglectedOrDelinquentLongTermStatusDescription])
SELECT [src].[Id], [src].[Code], [src].[Description]
FROM (VALUES 
    (-1, 'MISSING', 'MISSING'),
    (1, 'Yes', 'Yes'),
    (2, 'No', 'No')
) AS src(Id, Code, Description)
WHERE NOT EXISTS (
    SELECT 1 FROM [reporting].[DimNOrDStatuses] AS [tgt]
    WHERE [tgt].[NeglectedOrDelinquentLongTermStatusCode] = [src].[Code]
);

SET IDENTITY_INSERT [reporting].[DimNOrDStatuses] OFF;
PRINT('SEED END: [reporting].[DimNOrDStatuses]');

GO
