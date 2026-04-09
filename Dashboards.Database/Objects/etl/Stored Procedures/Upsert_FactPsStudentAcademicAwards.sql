CREATE PROCEDURE [etl].[Upsert_FactPsStudentAcademicAwards]
AS
BEGIN
	SET NOCOUNT ON;
	
	WITH [Source] AS (
		SELECT
			[dpi].[DimPsInstitutionId]  AS [PsInstitutionId]
		  , [dps].[DimPSStudentId]      AS [PSStudentId]
		  , [base].[PsAcademicAwardTitleId]
		  , [base].[AcademicAwardDate]
		  , [base].[PsAcademicAwardStatusId]
		  , [base].[SchoolYear]
		  , [dkd].[DimK12DemographicId] AS [K12DemographicId]
		FROM
			[staging].[FactPsStudentAcademicAwards]        AS [base]
				LEFT JOIN [reporting].[PS_DimInstitutions] AS [dpi]
							  ON [base].[IPEDSIdentifier] = [dpi].[IPEDSIdentifier]
				LEFT JOIN [reporting].[PS_DimStudents]     AS [dps]
							  ON [base].[PsStudentStudentIdentifierState] = [dps].[StudentIdentifierState]
				LEFT JOIN [reporting].[DimK12Demographics] AS [dkd]
							  ON [base].[SexDescription] = [dkd].[SexDescription]
		
		
		WHERE
			[dpi].[DimPsInstitutionId] IS NOT NULL
			AND [dpi].[DimPsInstitutionId] IS NOT NULL
		)
		MERGE [reporting].[FactPsStudentAcademicAwards] AS [Target]
	USING [Source]
	ON (
		[Target].[SchoolYear] = [Source].[SchoolYear]
			AND [target].[PsInstitutionId] = [source].[PsInstitutionId]
			AND [target].[PSStudentId] = [source].[PSStudentId]
		)
	WHEN MATCHED
		AND (
			[Target].[K12DemographicId] != [Source].[K12DemographicId]
				OR [Target].[PsAcademicAwardStatusId] != [Source].[PsAcademicAwardStatusId]
				OR [Target].[AcademicAwardDate] != [Source].[AcademicAwardDate]
				OR [Target].[PsAcademicAwardTitleId] != [Source].[PsAcademicAwardTitleId]
			)
		THEN
		UPDATE
		SET
			[Target].[K12DemographicId]=[Source].[K12DemographicId]
		  , [Target].[PsAcademicAwardStatusId]=[Source].[PsAcademicAwardStatusId]
		  , [Target].[AcademicAwardDate]=[Source].[AcademicAwardDate]
		  , [Target].[PsAcademicAwardTitleId]=[Source].[PsAcademicAwardTitleId]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				  [PsInstitutionId]
				, [PSStudentId]
				, [PsAcademicAwardTitleId]
				, [AcademicAwardDate]
				, [PsAcademicAwardStatusId]
				, [SchoolYear]
				, [K12DemographicId]
			)
		VALUES
			(
				  [Source].[PsInstitutionId]
				, [Source].[PSStudentId]
				, [Source].[PsAcademicAwardTitleId]
				, [Source].[AcademicAwardDate]
				, [Source].[PsAcademicAwardStatusId]
				, [Source].[SchoolYear]
				, [Source].[K12DemographicId]
			);
	
	PRINT ('Upsert for [reporting].[FactPsStudentAcademicAwards] completed.');
END
GO