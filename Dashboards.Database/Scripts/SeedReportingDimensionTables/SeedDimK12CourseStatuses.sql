PRINT('SEED START: [reporting].[DimK12CourseStatuses]');
SET IDENTITY_INSERT [reporting].[DimK12CourseStatuses] ON;

INSERT INTO [reporting].[DimK12CourseStatuses] ([DimK12CourseStatusId], [CourseLevelCharacteristicCode], [CourseLevelCharacteristicDescription])
SELECT [src].[Id], [src].[Code], [src].[Description]
FROM (VALUES
    (-1, 'MISSING', 'MISSING')
) AS src(Id, Code, [Description])
WHERE NOT EXISTS (
    SELECT 1 FROM [reporting].[DimK12CourseStatuses] AS [tgt]
    WHERE [tgt].[CourseLevelCharacteristicCode] = [src].[Code]
);

SET IDENTITY_INSERT [reporting].[DimK12CourseStatuses] OFF;
PRINT('SEED END: [reporting].[DimK12CourseStatuses]');

GO
