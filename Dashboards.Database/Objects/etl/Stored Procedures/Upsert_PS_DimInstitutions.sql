CREATE PROCEDURE [etl].[Upsert_PS_DimInstitutions]
AS
BEGIN
	SET NOCOUNT ON;
	
	MERGE [reporting].[PS_DimInstitutions] AS [Target]
	USING [staging].[PS_DimInstitutions] AS [Source]
	ON (
		[target].[IPEDSIdentifier] = [source].[IPEDSIdentifier]
		)
	WHEN MATCHED THEN
		UPDATE
		SET
			[Target].[NameOfInstitution] = [Source].[NameOfInstitution]
		  , [Target].[StateAbbreviation] = [Source].[StateAbbreviation]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				  [NameOfInstitution]
				, [IPEDSIdentifier]
				, [StateAbbreviation]
			)
		VALUES
			(
				  [source].[NameOfInstitution]
				, [source].[IPEDSIdentifier]
				, [Source].[StateAbbreviation]
			);
	
	PRINT 'Upsert for [reporting].[Upsert_PS_DimInstitutions] completed.';
END
GO
