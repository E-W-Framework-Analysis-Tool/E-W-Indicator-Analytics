PRINT('SEED START: [reporting].[DimEnglishLearnerStatuses]');
SET IDENTITY_INSERT [reporting].[DimEnglishLearnerStatuses] ON;

INSERT INTO [reporting].[DimEnglishLearnerStatuses] ([DimEnglishLearnerStatusId], [EnglishLearnerStatusCode], [EnglishLearnerStatusDescription])
SELECT [src].[Id], [src].[Code], [src].[Description]
FROM (VALUES 
    (-1, 'MISSING', 'MISSING'),
    (1, 'Yes', 'Yes'),
    (2, 'No', 'No')
) AS src(Id, Code, Description)
WHERE NOT EXISTS (
    SELECT 1 FROM [reporting].[DimEnglishLearnerStatuses] AS [tgt]
    WHERE [tgt].[EnglishLearnerStatusCode] = [src].[Code]
);

SET IDENTITY_INSERT [reporting].[DimEnglishLearnerStatuses] OFF;
PRINT('SEED END: [reporting].[DimEnglishLearnerStatuses]');

GO
