CREATE PROCEDURE [etl].[Upsert_DimStaffs]
AS
BEGIN
	SET NOCOUNT ON;
	
	MERGE [reporting].[DimStaffs] AS [Target]
	USING [staging].[DimStaffs] AS [Source]
	ON ([Target].[StaffIdentifierState] = [Source].[StaffIdentifierState])
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				[StaffIdentifierState]
			)
		VALUES
			(
				[Source].[StaffIdentifierState]
			);
	
	PRINT 'Upsert for [reporting].[DimStaffs] completed.';
END
GO