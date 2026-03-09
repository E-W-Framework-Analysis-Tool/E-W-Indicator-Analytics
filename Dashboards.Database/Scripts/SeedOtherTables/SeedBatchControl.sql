PRINT('SEED START: [etl].[BatchControl]');

INSERT INTO [etl].[BatchControl] ([YearProcessed], [LastRunDate])
SELECT [src].[YearProcessed], [src].[LastRunDate]
FROM (VALUES 
    (1900, '1900-01-01 00:00:00.000')
) AS src([YearProcessed], [LastRunDate])
WHERE NOT EXISTS (
    SELECT 1 FROM [etl].[BatchControl] AS [tgt]
    WHERE [tgt].[YearProcessed] = src.[YearProcessed]
);

PRINT('SEED END: [etl].[BatchControl]');

GO
