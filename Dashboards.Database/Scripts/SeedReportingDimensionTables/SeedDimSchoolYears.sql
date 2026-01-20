PRINT('SEED START: [reporting].[DimSchoolYears]');

WITH
	[YearSequence] AS (SELECT 1970 AS [SchoolYear]
					   UNION ALL
					   SELECT [SchoolYear] + 1
					   FROM [YearSequence]
					   WHERE [SchoolYear] < 2099)
INSERT
INTO [reporting].[DimSchoolYears]
	(
		[Year]
	)
SELECT [SchoolYear]
FROM [YearSequence] AS [src]
WHERE
	NOT EXISTS(SELECT 1
			   FROM [reporting].[DimSchoolYears] AS [tgt]
			   WHERE [tgt].[Year] = [src].[SchoolYear])
ORDER BY
	[SchoolYear]
OPTION (MAXRECURSION 150);

PRINT('SEED END: [reporting].[DimSchoolYears]');

GO
