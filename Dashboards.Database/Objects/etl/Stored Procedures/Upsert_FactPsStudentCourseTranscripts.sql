CREATE PROCEDURE [etl].[Upsert_FactPsStudentCourseTranscripts]
AS
BEGIN
	SET NOCOUNT ON;
	
	WITH [Source] AS (
		SELECT
			[base].[FactPsStudentCourseTranscriptId]
		  , [base].[SchoolYear]
		  , [dpi].[DimPsInstitutionId] AS [PsInstitutionId]
		  , [dps].[DimPSStudentId]     AS [PSStudentId]
		  , [base].[CipCodeId]
		  , [base].[EnglishLearnerStatusId]
		  , [base].[PsDemographicId]
		  , [base].[DisabilityStatusId]
		  , [base].[EconomicallyDisadvantagedStatusId]
		  , [base].[HomelessnessStatusId]
		  , [base].[MigrantStatusId]
		  , [base].[PrimaryDisabilityTypeId]
		  , [base].[IdeaStatusId]
		  , [base].[ImmigrantStatusId]
		  , [base].[MilitaryStatusId]
		  , [base].[NumberOfCreditsAttempted]
		  , [base].[NumberOfCreditsEarned]
		  , [base].[StudentCourseSectionGradeEarned]
		
		FROM
			[staging].[FactPsStudentCourseTranscripts]     AS [base]
				LEFT JOIN [reporting].[PS_DimInstitutions] AS [dpi]
							  ON [base].[IPEDSIdentifier] = [dpi].[IPEDSIdentifier]
				LEFT JOIN [reporting].[PS_DimStudents]     AS [dps]
							  ON [base].[PsStudentStudentIdentifierState] = [dps].[StudentIdentifierState]
		WHERE
			  [dpi].[DimPsInstitutionId] IS NOT NULL
		  AND [dpi].[DimPsInstitutionId] IS NOT NULL
		)
		MERGE [reporting].[FactPsStudentCourseTranscripts] AS [Target]
	USING [Source]
	ON (
		[Target].[SchoolYear] = [Source].[SchoolYear]
			AND [target].[PsInstitutionId] = [source].[PsInstitutionId]
			AND [target].[PSStudentId] = [source].[PSStudentId]
		)
	WHEN MATCHED
		AND (
			[Target].[CipCodeId] != [Source].[CipCodeId]
				OR [Target].[EnglishLearnerStatusId] != [Source].[EnglishLearnerStatusId]
				OR [Target].[PsDemographicId] != [Source].[PsDemographicId]
				OR [Target].[DisabilityStatusId] != [Source].[DisabilityStatusId]
				OR [Target].[EconomicallyDisadvantagedStatusId] != [Source].[EconomicallyDisadvantagedStatusId]
				OR [Target].[HomelessnessStatusId] != [Source].[HomelessnessStatusId]
				OR [Target].[MigrantStatusId] != [Source].[MigrantStatusId]
				OR [Target].[PrimaryDisabilityTypeId] != [Source].[PrimaryDisabilityTypeId]
				OR [Target].[IdeaStatusId] != [Source].[IdeaStatusId]
				OR [Target].[ImmigrantStatusId] != [Source].[ImmigrantStatusId]
				OR [Target].[MilitaryStatusId] != [Source].[MilitaryStatusId]
				OR [Target].[NumberOfCreditsAttempted] != [Source].[NumberOfCreditsAttempted]
				OR [Target].[NumberOfCreditsEarned] != [Source].[NumberOfCreditsEarned]
				OR [Target].[StudentCourseSectionGradeEarned] != [Source].[StudentCourseSectionGradeEarned]
			)
		THEN
		UPDATE
		SET
			[Target].[CipCodeId]                         = [Source].[CipCodeId]
		  , [Target].[EnglishLearnerStatusId]            = [Source].[EnglishLearnerStatusId]
		  , [Target].[PsDemographicId]                   = [Source].[PsDemographicId]
		  , [Target].[DisabilityStatusId]                = [Source].[DisabilityStatusId]
		  , [Target].[EconomicallyDisadvantagedStatusId] = [Source].[EconomicallyDisadvantagedStatusId]
		  , [Target].[HomelessnessStatusId]              = [Source].[HomelessnessStatusId]
		  , [Target].[MigrantStatusId]                   = [Source].[MigrantStatusId]
		  , [Target].[PrimaryDisabilityTypeId]           = [Source].[PrimaryDisabilityTypeId]
		  , [Target].[IdeaStatusId]                      = [Source].[IdeaStatusId]
		  , [Target].[ImmigrantStatusId]                 = [Source].[ImmigrantStatusId]
		  , [Target].[MilitaryStatusId]                  = [Source].[MilitaryStatusId]
		  , [Target].[NumberOfCreditsAttempted]          = [Source].[NumberOfCreditsAttempted]
		  , [Target].[NumberOfCreditsEarned]             = [Source].[NumberOfCreditsEarned]
		  , [Target].[StudentCourseSectionGradeEarned]   = [Source].[StudentCourseSectionGradeEarned]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				  [SchoolYear]
				, [PsInstitutionId]
				, [PSStudentId]
				, [CipCodeId]
				, [EnglishLearnerStatusId]
				, [PsDemographicId]
				, [DisabilityStatusId]
				, [EconomicallyDisadvantagedStatusId]
				, [HomelessnessStatusId]
				, [MigrantStatusId]
				, [PrimaryDisabilityTypeId]
				, [IdeaStatusId]
				, [ImmigrantStatusId]
				, [MilitaryStatusId]
				, [NumberOfCreditsAttempted]
				, [NumberOfCreditsEarned]
				, [StudentCourseSectionGradeEarned]
			)
		VALUES
			(
				  [Source].[SchoolYear]
				, [Source].[PsInstitutionId]
				, [Source].[PSStudentId]
				, [Source].[CipCodeId]
				, [Source].[EnglishLearnerStatusId]
				, [Source].[PsDemographicId]
				, [Source].[DisabilityStatusId]
				, [Source].[EconomicallyDisadvantagedStatusId]
				, [Source].[HomelessnessStatusId]
				, [Source].[MigrantStatusId]
				, [Source].[PrimaryDisabilityTypeId]
				, [Source].[IdeaStatusId]
				, [Source].[ImmigrantStatusId]
				, [Source].[MilitaryStatusId]
				, [Source].[NumberOfCreditsAttempted]
				, [Source].[NumberOfCreditsEarned]
				, [Source].[StudentCourseSectionGradeEarned]
			);
	
	PRINT ('Upsert for [reporting].[FactPsStudentCourseTranscripts] completed.');
END
GO