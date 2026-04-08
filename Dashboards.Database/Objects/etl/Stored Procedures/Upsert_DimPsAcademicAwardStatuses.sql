CREATE PROCEDURE [etl].[Upsert_DimPsAcademicAwardStatuses]
AS
BEGIN
	SET NOCOUNT ON;
	
	MERGE [reporting].[DimPsAcademicAwardStatuses] AS [Target]
	USING [staging].[DimPsAcademicAwardStatuses] AS [Source]
	ON ([Target].[DimPsAcademicAwardStatusId] = [Source].[DimPsAcademicAwardStatusId])
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				  [PescAwardLevelTypeCode]
				, [PescAwardLevelTypeDescription]
				, [ProfessionalOrTechnicalCredentialConferredCode]
				, [ProfessionalOrTechnicalCredentialConferredDescription]
			)
		VALUES
			(
				  [Source].[PescAwardLevelTypeCode]
				, [Source].[PescAwardLevelTypeDescription]
				, [Source].[ProfessionalOrTechnicalCredentialConferredCode]
				, [Source].[ProfessionalOrTechnicalCredentialConferredDescription]
			);
	
	PRINT 'Upsert for [reporting].[Upsert_DimPsAcademicAwardStatuses] completed.';
END
GO