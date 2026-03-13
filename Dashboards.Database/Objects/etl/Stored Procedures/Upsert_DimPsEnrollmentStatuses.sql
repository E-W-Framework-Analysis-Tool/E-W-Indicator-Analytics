CREATE PROCEDURE [etl].[Upsert_DimPsEnrollmentStatuses]
AS
BEGIN
	SET NOCOUNT ON;
	
	MERGE [reporting].[DimPsEnrollmentStatuses] AS [Target]
	USING [staging].[DimPsEnrollmentStatuses] AS [Source]
	ON ([Target].[DimPsEnrollmentStatusId] = [Source].[DimPsEnrollmentStatusId])
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				  [DimPsEnrollmentStatusId]
				, [PostsecondaryExitOrWithdrawalTypeCode]
				, [PostsecondaryExitOrWithdrawalTypeDescription]
				, [PostsecondaryEnrollmentStatusCode]
				, [PostsecondaryEnrollmentStatusDescription]
				, [PostSecondaryEnrollmentStatusEdFactsCode]
			)
		VALUES
			(
				  [Source].[DimPsEnrollmentStatusId]
				, [Source].[PostsecondaryExitOrWithdrawalTypeCode]
				, [Source].[PostsecondaryExitOrWithdrawalTypeDescription]
				, [Source].[PostsecondaryEnrollmentStatusCode]
				, [Source].[PostsecondaryEnrollmentStatusDescription]
				, [Source].[PostSecondaryEnrollmentStatusEdFactsCode]
			);
	
	PRINT 'Upsert for [reporting].[Upsert_DimPsEnrollmentStatuses] completed.';
END
GO
