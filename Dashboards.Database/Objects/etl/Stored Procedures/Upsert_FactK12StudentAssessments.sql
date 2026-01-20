CREATE PROCEDURE [etl].[Upsert_FactK12StudentAssessments]
AS
BEGIN
	SET NOCOUNT ON;
	
	WITH [Source] AS (
		SELECT
			[fact].*
		  , [ds].[DimSeaId]
		  , [dl].[DimLeaId]
		  , [dks].[DimK12SchoolId]
		  , [dsu].[DimK12StudentId]
		  , [da].[DimAssessmentId]
		  , [das].[DimAssessmentSubtestId]
		  , [fkse].[FactK12StudentEnrollmentId] AS [TargetFactK12StudentEnrollmentId]
		FROM
			[staging].[FactK12StudentAssessments]                  AS [fact]
				INNER JOIN [reporting].[DimSEAs]                   AS [ds]
							   ON [fact].[SeaOrganizationIdentifierSea] = [ds].[SeaOrganizationIdentifierSea]
				INNER JOIN [reporting].[DimLEAs]                   AS [dl]
							   ON [fact].[LeaIdentifierSea] = [dl].[LeaIdentifierSea]
								   AND [ds].[DimSeaId] = [dl].[SeaId]
				INNER JOIN [reporting].[DimK12Schools]             AS [dks]
							   ON [fact].[SchoolIdentifierSea] = [dks].[SchoolIdentifierSea]
								   AND [ds].[DimSeaId] = [dks].[SeaId]
								   AND [dl].[DimLeaId] = [dks].[LeaId]
				INNER JOIN [reporting].[DimStudents]               AS [dsu]
							   ON [fact].[StudentIdentifierState] = [dsu].[StudentIdentifierState]
				INNER JOIN [reporting].[DimAssessments]            AS [da]
							   ON [fact].[AssessmentIdentifierState] = [da].[AssessmentIdentifierState]
				INNER JOIN [reporting].[DimAssessmentSubtests]     AS [das]
							   ON [fact].[AssessmentSubtestIdentifierInternal] =
								  [das].[AssessmentSubtestIdentifierInternal]
				INNER JOIN [reporting].[FactK12StudentEnrollments] AS [fkse]
							   ON [fkse].[SeaId] = [ds].[DimSeaId]
								   AND [fkse].[LeaId] = [dl].[DimLeaId]
								   AND [fkse].[K12SchoolId] = [dks].[DimK12SchoolId]
								   AND [fkse].[K12StudentId] = [dsu].[DimK12StudentId]
								   AND [fkse].[GradeLevelCode] = [fact].[GradeLevelCode]
		WHERE
			  [ds].[DimSeaId] IS NOT NULL
		  AND [dl].[DimLeaId] IS NOT NULL
		  AND [dks].[DimK12SchoolId] IS NOT NULL
		  AND [dsu].[DimK12StudentId] IS NOT NULL
		  AND [da].[DimAssessmentId] IS NOT NULL
		  AND [das].[DimAssessmentSubtestId] IS NOT NULL
		)
		MERGE [reporting].[FactK12StudentAssessments] AS [Target]
	USING [Source]
	ON (
		[Target].[SchoolYear] = [Source].[SchoolYear]
			AND [target].[SeaId] = [source].[DimSeaId]
			AND [target].[LeaId] = [source].[DimLeaId]
			AND [target].[K12SchoolId] = [Source].[DimK12SchoolId]
			AND [target].[K12StudentId] = [source].[DimK12StudentId]
			AND [target].[GradeLevelCode] = [source].[GradeLevelCode]
			AND [target].[AssessmentId] = [source].[DimAssessmentId]
			AND [target].[AssessmentSubtestId] = [source].[DimAssessmentSubtestId]
		)
	WHEN MATCHED
		AND (
			[Target].[AssessmentResultScoreValueACTScore] != [source].[AssessmentResultScoreValueACTScore]
				OR [target].[AssessmentResultScoreValueSATScore] != [source].[AssessmentResultScoreValueSATScore]
			)
		THEN
		UPDATE
		SET
			[Target].[AssessmentResultScoreValueACTScore] = [source].[AssessmentResultScoreValueACTScore]
		  , [Target].[AssessmentResultScoreValueSATScore] = [source].[AssessmentResultScoreValueSATScore]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				  [SchoolYear]
				, [FactK12StudentEnrollmentId]
				, [SeaId]
				, [LeaId]
				, [K12SchoolId]
				, [K12StudentId]
				, [GradeLevelCode]
				, [AssessmentId]
				, [AssessmentSubtestId]
				, [AssessmentResultScoreValueACTScore]
				, [AssessmentResultScoreValueSATScore]
			)
		VALUES
			(
				  [Source].[SchoolYear]
				, [source].[TargetFactK12StudentEnrollmentId]
				, [Source].[DimSeaId]
				, [Source].[DimLeaId]
				, [Source].[DimK12SchoolId]
				, [Source].[DimK12StudentId]
				, [Source].[GradeLevelCode]
				, [Source].[DimAssessmentId]
				, [Source].[DimAssessmentSubtestId]
				, [Source].[AssessmentResultScoreValueACTScore]
				, [Source].[AssessmentResultScoreValueSATScore]
			);
	
	PRINT 'Upsert for [reporting].[FactK12StudentAssessments] completed.';
END
GO
