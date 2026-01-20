CREATE TABLE [etl].[BatchControl] (
    [YearProcessed] SMALLINT PRIMARY KEY,
    [LastRunDate]   DATETIME DEFAULT GETDATE()
);
