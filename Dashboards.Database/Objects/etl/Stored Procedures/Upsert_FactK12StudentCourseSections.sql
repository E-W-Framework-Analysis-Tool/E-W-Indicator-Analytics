CREATE PROCEDURE [etl].[Upsert_FactK12StudentCourseSections]
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
		  , [dkc].[DimK12CourseId]
		  , COALESCE([dkcs].[DimK12CourseStatusId], -1) AS [DimK12CourseStatusId]
		  , [fkse].[FactK12StudentEnrollmentId]         AS [TargetFactK12StudentEnrollmentId]
		FROM
			[staging].[FactK12StudentCourseSections]               AS [fact]
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
				INNER JOIN [reporting].[DimK12Courses]             AS [dkc]
							   ON [fact].[CourseIdentifier] = [dkc].[CourseIdentifier]
				INNER JOIN [reporting].[FactK12StudentEnrollments] AS [fkse]
							   ON [fkse].[SeaId] = [ds].[DimSeaId]
								   AND [fkse].[LeaId] = [dl].[DimLeaId]
								   AND [fkse].[K12SchoolId] = [dks].[DimK12SchoolId]
								   AND [fkse].[K12StudentId] = [dsu].[DimK12StudentId]
								   AND [fkse].[GradeLevelCode] = [fact].[GradeLevelCode]
				LEFT JOIN  [reporting].[DimK12CourseStatuses]      AS [dkcs]
							   ON [fact].[CourseLevelCharacteristicCode] = [dkcs].[CourseLevelCharacteristicCode]
		WHERE
			  [ds].[DimSeaId] IS NOT NULL
		  AND [dl].[DimLeaId] IS NOT NULL
		  AND [dks].[DimK12SchoolId] IS NOT NULL
		  AND [dsu].[DimK12StudentId] IS NOT NULL
		  AND [dkc].[DimK12CourseId] IS NOT NULL
		)
		MERGE [reporting].[FactK12StudentCourseSections] AS [Target]
	USING [Source]
	ON (
		[Target].[SchoolYear] = [Source].[SchoolYear]
			AND [target].[SeaId] = [source].[DimSeaId]
			AND [target].[LeaId] = [source].[DimLeaId]
			AND [target].[K12SchoolId] = [Source].[DimK12SchoolId]
			AND [target].[K12StudentId] = [source].[DimK12StudentId]
			AND [target].[GradeLevelCode] = [source].[GradeLevelCode]
			AND [target].[K12CourseId] = [source].[DimK12CourseId]
		)
	WHEN MATCHED
		AND (
			[target].[StudentCourseSectionGradeEarned] != [source].[StudentCourseSectionGradeEarned]
				OR [target].[StudentCourseSectionGradeNarrative] != [source].[StudentCourseSectionGradeNarrative]
				OR [target].[K12CourseStatusId] != [source].[DimK12CourseStatusId]
			)
		THEN
		UPDATE
		SET
			[Target].[StudentCourseSectionGradeEarned]    = [source].[StudentCourseSectionGradeEarned]
		  , [Target].[StudentCourseSectionGradeNarrative] = [source].[StudentCourseSectionGradeNarrative]
		  , [Target].[K12CourseStatusId]                  = [Source].[DimK12CourseStatusId]
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
				, [K12CourseId]
				, [K12CourseStatusId]
				, [StudentCourseSectionGradeEarned]
				, [StudentCourseSectionGradeNarrative]
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
				, [Source].[DimK12CourseId]
				, [Source].[DimK12CourseStatusId]
				, [Source].[StudentCourseSectionGradeEarned]
				, [Source].[StudentCourseSectionGradeNarrative]
			);
	
	PRINT 'Upsert for [reporting].[FactK12StudentCourseSections] completed.';
END
GO
