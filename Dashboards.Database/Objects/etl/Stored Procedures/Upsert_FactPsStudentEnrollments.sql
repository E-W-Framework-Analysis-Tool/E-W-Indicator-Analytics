CREATE PROCEDURE [etl].[Upsert_FactPsStudentEnrollments]
AS
BEGIN
	SET NOCOUNT ON;
	
	WITH [Source] AS (
		SELECT
			[dpi].[DimPsInstitutionId] AS [PsInstitutionId]
		  , [fact].[SchoolYear]
		  , [ds].[DimPSStudentId]      AS [PSStudentId]
		  , [fact].[PsEnrollmentStatusId]
		FROM
			[staging].[FactPsStudentEnrollments]            AS [fact]
				INNER JOIN [reporting].[PS_DimInstitutions] AS [dpi]
							   ON [fact].[IPEDSIdentifier] = [dpi].[IPEDSIdentifier]
				INNER JOIN [reporting].[PS_DimStudents]     AS [ds]
							   ON [fact].[PsStudentStudentIdentifierState] = [ds].[StudentIdentifierState]
		WHERE
			[dpi].[IPEDSIdentifier] IS NOT NULL
		)
		MERGE [reporting].[FactPsStudentEnrollments] AS [Target]
	USING [Source]
	ON (
		[Target].[SchoolYear] = [Source].[SchoolYear]
			AND [target].[PsInstitutionId] = [source].[PsInstitutionId]
			AND [target].[PSStudentId] = [source].[PSStudentId]
		)
	WHEN MATCHED
		AND (
			[Target].[PsEnrollmentStatusId] != [source].[PsEnrollmentStatusId]
			)
		THEN
		UPDATE
		SET
			[Target].[PsEnrollmentStatusId] = [source].[PsEnrollmentStatusId]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				  [PsInstitutionId]
				, [SchoolYear]
				, [PSStudentId]
				, [PsEnrollmentStatusId]
			)
		VALUES
			(
				  [Source].[PsInstitutionId]
				, [Source].[SchoolYear]
				, [Source].[PSStudentId]
				, [Source].[PsEnrollmentStatusId]
			);
	
	PRINT ('Upsert for [reporting].[FactPsStudentEnrollments] completed.');
END
GO