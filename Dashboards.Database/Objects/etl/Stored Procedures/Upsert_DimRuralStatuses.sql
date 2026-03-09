CREATE PROCEDURE [etl].[Upsert_DimRuralStatuses]
AS
BEGIN
	SET NOCOUNT ON;
	
	MERGE [reporting].[DimRuralStatuses] AS [Target]
	USING [staging].[DimRuralStatuses] AS [Source]
	ON ([Target].[DimRuralStatusId] = [Source].[DimRuralStatusId])
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				  [DimRuralStatusId]
				, [ERSRuralUrbanContinuumCodeCode]
				, [ERSRuralUrbanContinuumCodeDescription]
				, [RuralResidencyStatusCode]
				, [RuralResidencyStatusDescription]
			)
		VALUES
			(
				  [Source].[DimRuralStatusId]
				, [Source].[ERSRuralUrbanContinuumCodeCode]
				, [Source].[ERSRuralUrbanContinuumCodeDescription]
				, [Source].[RuralResidencyStatusCode]
				, [Source].[RuralResidencyStatusDescription]
			);
	
	PRINT 'Upsert for [reporting].[DimRuralStatuses] completed.';
END
GO