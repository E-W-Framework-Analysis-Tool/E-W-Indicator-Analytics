CREATE PROCEDURE [etl].[Upsert_DimK12StaffCategories]
AS
BEGIN
	SET NOCOUNT ON;
	
	WITH [Source] AS (
		SELECT MIN([DimK12StaffCategoryId]) AS [DimK12StaffCategoryId], [K12StaffClassificationDescription]
		FROM [staging].[DimK12StaffCategories]
		GROUP BY [K12StaffClassificationDescription]
		)
		MERGE [reporting].[DimK12StaffCategories] AS [Target]
	USING [Source]
	ON ([target].[DimK12StaffCategoryId] = [source].[DimK12StaffCategoryId] AND
		[Target].[K12StaffClassificationDescription] = [Source].[K12StaffClassificationDescription])
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				  [DimK12StaffCategoryId]
				, [K12StaffClassificationDescription]
			)
		VALUES
			(
				  [Source].[DimK12StaffCategoryId]
				, [Source].[K12StaffClassificationDescription]
			);
	
	PRINT 'Upsert for [reporting].[DimK12StaffCategories] completed.';
END
GO