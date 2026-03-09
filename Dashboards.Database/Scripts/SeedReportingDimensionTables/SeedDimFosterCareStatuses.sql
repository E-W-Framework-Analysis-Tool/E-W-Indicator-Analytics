PRINT('SEED START: [reporting].[DimFosterCareStatuses]');
SET IDENTITY_INSERT [reporting].[DimFosterCareStatuses] ON;

INSERT INTO [reporting].[DimFosterCareStatuses] ([DimFosterCareStatusId], [FosterCareStatusCode], [FosterCareStatusDescription])
SELECT [src].[Id], [src].[Code], [src].[Description]
FROM (VALUES 
    (-1, 'MISSING', 'MISSING'),
    (1, 'Yes', 'Foster Care Students'),
    (2, 'No', 'Non Foster Care Students')
) AS src(Id, Code, Description)
WHERE NOT EXISTS (
    SELECT 1 FROM [reporting].[DimFosterCareStatuses] AS [tgt]
    WHERE [tgt].[FosterCareStatusCode] = [src].[Code]
);

SET IDENTITY_INSERT [reporting].[DimFosterCareStatuses] OFF;
PRINT('SEED END: [reporting].[DimFosterCareStatuses]');

GO
