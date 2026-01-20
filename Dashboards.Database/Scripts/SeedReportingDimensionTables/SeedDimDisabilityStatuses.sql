PRINT('SEED START: [reporting].[DimDisabilityStatuses]');
SET IDENTITY_INSERT [reporting].[DimDisabilityStatuses] ON;

INSERT INTO [reporting].[DimDisabilityStatuses] ([DimDisabilityStatusId], [DisabilityStatusCode], [DisabilityStatusDescription])
SELECT [src].[Id], [src].[Code], [src].[Description]
FROM (VALUES 
    (-1, 'MISSING', 'MISSING'),
    (1, 'Yes', 'Student with disability'),
    (2, 'No', 'Not a Disability student')
) AS src(Id, Code, Description)
WHERE NOT EXISTS (
    SELECT 1 FROM [reporting].[DimDisabilityStatuses] AS [tgt]
    WHERE [tgt].[DisabilityStatusCode] = [src].[Code]
);

SET IDENTITY_INSERT [reporting].[DimDisabilityStatuses] OFF;
PRINT('SEED END: [reporting].[DimDisabilityStatuses]');

GO
