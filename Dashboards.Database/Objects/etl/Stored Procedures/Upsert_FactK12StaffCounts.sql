CREATE PROCEDURE [etl].[Upsert_FactK12StaffCounts]
AS
BEGIN
	SET NOCOUNT ON;
	
	WITH [Source] AS (
		SELECT
			[fact].[SchoolYear]
		  , [fact].[K12StaffCategoryId]
		  , [fact].[StaffFullTimeEquivalency]
		  , [ds].[DimSeaId]
		  , [dl].[DimLeaId]
		  , [dks].[DimK12SchoolId]
		  , [dsf].[DimK12StaffId]
		FROM
			[staging].[FactK12StaffCounts]             AS [fact]
				INNER JOIN [reporting].[DimSEAs]       AS [ds]
							   ON [fact].[SeaOrganizationIdentifierSea] = [ds].[SeaOrganizationIdentifierSea]
				INNER JOIN [reporting].[DimLEAs]       AS [dl]
							   ON [fact].[LeaIdentifierSea] = [dl].[LeaIdentifierSea]
								   AND [ds].[DimSeaId] = [dl].[SeaId]
				INNER JOIN [reporting].[DimK12Schools] AS [dks]
							   ON [fact].[SchoolIdentifierSea] = [dks].[SchoolIdentifierSea]
								   AND [ds].[DimSeaId] = [dks].[SeaId]
								   AND [dl].[DimLeaId] = [dks].[LeaId]
				INNER JOIN [reporting].[DimStaffs]     AS [dsf]
							   ON [fact].[K12StaffStaffMemberIdentifierState] = [dsf].[StaffIdentifierState]
		)
		MERGE [reporting].[FactK12StaffCounts] AS [Target]
	USING [Source]
	ON (
		[Target].[SchoolYear] = [Source].[SchoolYear]
			AND [target].[SeaId] = [source].[DimSeaId]
			AND [target].[LeaId] = [source].[DimLeaId]
			AND [target].[K12SchoolId] = [Source].[DimK12SchoolId]
			AND [target].[K12StaffId] = [source].[DimK12StaffId]
		)
	WHEN MATCHED
		AND (
			[Target].[K12StaffCategoryId] != [source].[K12StaffCategoryId]
				OR [target].[StaffFullTimeEquivalency] != [source].[StaffFullTimeEquivalency]
			)
		THEN
		UPDATE
		SET
			[Target].[K12StaffCategoryId]       = [source].[K12StaffCategoryId]
		  , [Target].[StaffFullTimeEquivalency] = [source].[StaffFullTimeEquivalency]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				  [SchoolYear]
				, [SeaId]
				, [LeaId]
				, [K12SchoolId]
				, [K12StaffId]
				, [K12Staff_CurrentId]
				, [K12StaffCategoryId]
				, [StaffFullTimeEquivalency]
			)
		VALUES
			(
				  [Source].[SchoolYear]
				, [Source].[DimSeaId]
				, [Source].[DimLeaId]
				, [Source].[DimK12SchoolId]
				, [Source].[DimK12StaffId]
				, [Source].[DimK12StaffId]
				, [Source].[K12StaffCategoryId]
				, [Source].[StaffFullTimeEquivalency]
			);
	
	PRINT ('Upsert for [reporting].[FactK12StaffCounts] completed.');
END
GO