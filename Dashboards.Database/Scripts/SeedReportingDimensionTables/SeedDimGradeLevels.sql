PRINT('SEED START: [reporting].[DimGradeLevels]');

INSERT INTO [reporting].[DimGradeLevels] ([GradeLevelCode], [GradeLevelDescription])
SELECT [src].[Code], [src].[Description]
FROM (VALUES 
    ('UG', 'Ungraded'),
    ('PK', 'Pre-Kindergarten'),
    ('KG', 'Kindergarten'),
    ('01', 'First Grade'),
    ('02', 'Second Grade'),
    ('03', 'Third Grade'),
    ('04', 'Fourth Grade'),
    ('05', 'Fifth Grade'),
    ('06', 'Sixth Grade'),
    ('07', 'Seventh Grade'),
    ('08', 'Eighth Grade'),
    ('09', 'Ninth Grade'),
    ('10', 'Tenth Grade'),
    ('11', 'Eleventh Grade'),
    ('12', 'Twelfth Grade')
) AS src(Code, Description)
WHERE NOT EXISTS (
    SELECT 1 FROM [reporting].[DimGradeLevels] AS [tgt]
    WHERE [tgt].[GradeLevelCode] = src.Code
);

PRINT('SEED END: [reporting].[DimGradeLevels]');

GO
