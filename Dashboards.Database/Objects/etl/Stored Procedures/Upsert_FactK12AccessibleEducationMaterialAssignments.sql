CREATE PROCEDURE [etl].[Upsert_FactK12AccessibleEducationMaterialAssignments]
AS
BEGIN
	SET NOCOUNT ON;
	
	WITH [Source] AS (
		SELECT
			[fact].[SchoolYear]
		  , [ds].[DimSeaId]
		  , [dl].[DimLeaId]
		  , [dks].[DimK12SchoolId]
		  , [dsu].[DimK12StudentId]
		  , [fact].[RuralStatusId]
		FROM
			[staging].[FactK12AccessibleEducationMaterialAssignments] AS [fact]
				INNER JOIN [reporting].[DimSEAs]                      AS [ds]
							   ON [fact].[SeaOrganizationIdentifierSea] = [ds].[SeaOrganizationIdentifierSea]
				INNER JOIN [reporting].[DimLEAs]                      AS [dl]
							   ON [fact].[LeaIdentifierSea] = [dl].[LeaIdentifierSea]
								   AND [ds].[DimSeaId] = [dl].[SeaId]
				INNER JOIN [reporting].[DimK12Schools]                AS [dks]
							   ON [fact].[SchoolIdentifierSea] = [dks].[SchoolIdentifierSea]
								   AND [ds].[DimSeaId] = [dks].[SeaId]
								   AND [dl].[DimLeaId] = [dks].[LeaId]
				INNER JOIN [reporting].[DimStudents]                  AS [dsu]
							   ON [fact].[StudentIdentifierState] = [dsu].[StudentIdentifierState]
		WHERE
			  [ds].[DimSeaId] IS NOT NULL
		  AND [dl].[DimLeaId] IS NOT NULL
		  AND [dks].[DimK12SchoolId] IS NOT NULL
		  AND [dsu].[DimK12StudentId] IS NOT NULL
		)
		MERGE [reporting].[FactK12AccessibleEducationMaterialAssignments] AS [Target]
	USING [Source]
	ON (
		[Target].[SchoolYear] = [Source].[SchoolYear]
			AND [target].[SeaId] = [source].[DimSeaId]
			AND [target].[LeaId] = [source].[DimLeaId]
			AND [target].[K12SchoolId] = [Source].[DimK12SchoolId]
			AND [target].[K12StudentId] = [source].[DimK12StudentId]
		)
	WHEN MATCHED
		AND (
			[Target].[RuralStatusId] != [source].[RuralStatusId]
			)
		THEN
		UPDATE
		SET
			[Target].[RuralStatusId] = [source].[RuralStatusId]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				  [SchoolYear]
				, [SeaId]
				, [LeaId]
				, [K12SchoolId]
				, [K12StudentId]
				, [RuralStatusId]
			)
		VALUES
			(
				  [Source].[SchoolYear]
				, [Source].[DimSeaId]
				, [Source].[DimLeaId]
				, [Source].[DimK12SchoolId]
				, [Source].[DimK12StudentId]
				, [Source].[RuralStatusId]
			);
	
	PRINT 'Upsert for [reporting].[FactK12AccessibleEducationMaterialAssignments] completed.';
END
GO
