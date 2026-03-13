CREATE PROCEDURE [etl].[Upsert_DimCipCodes]
AS
BEGIN
	SET NOCOUNT ON;
	
	MERGE [reporting].[DimCipCodes] AS [Target]
	USING [staging].[DimCipCodes] AS [Source]
	ON ([Target].[DimCipCodeId] = [Source].[DimCipCodeId])
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				  [DimCipCodeId]
				, [CipCode]
				, [CipDescription]
				, [CipUseCode]
				, [CipUseDescription]
				, [CipVersionCode]
				, [CipVersionDescription]
			)
		VALUES
			(
				  [Source].[DimCipCodeId]
				, [Source].[CipCode]
				, [Source].[CipDescription]
				, [Source].[CipUseCode]
				, [Source].[CipUseDescription]
				, [Source].[CipVersionCode]
				, [Source].[CipVersionDescription]
			);
	
	PRINT 'Upsert for [reporting].[Upsert_DimCipCodes] completed.';
END
GO
