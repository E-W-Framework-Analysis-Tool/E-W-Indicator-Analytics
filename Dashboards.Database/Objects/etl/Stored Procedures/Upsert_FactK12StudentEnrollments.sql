CREATE PROCEDURE [etl].[Upsert_FactK12StudentEnrollments]
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
		  , COALESCE([dr].[DimRaceId], -1)                              AS [DimRaceId]
		  , COALESCE([dels].[DimEnglishLearnerStatusId], -1)            AS [DimEnglishLearnerStatusId]
		  , COALESCE([dhs].[DimHomelessnessStatusId], -1)               AS [DimHomelessnessStatusId]
		  , COALESCE([deds].[DimEconomicallyDisadvantagedStatusId], -1) AS [DimEconomicallyDisadvantagedStatusId]
		  , COALESCE([dfcs].[DimFosterCareStatusId], -1)                AS [DimFosterCareStatusId]
		  , COALESCE([dnds].[DimNOrDStatusId], -1)                      AS [DimNOrDStatusId]
		  , COALESCE([dds].[DimDisabilityStatusId], -1)                 AS [DimDisabilityStatusId]
		  , COALESCE([dkd].[DimK12DemographicId], -1)                   AS [DimK12DemographicId]
		FROM
			[staging].[FactK12StudentEnrollments]                             AS [fact]
				INNER JOIN [reporting].[DimSEAs]                              AS [ds]
							   ON [fact].[SeaOrganizationIdentifierSea] = [ds].[SeaOrganizationIdentifierSea]
				INNER JOIN [reporting].[DimLEAs]                              AS [dl]
							   ON [fact].[LeaIdentifierSea] = [dl].[LeaIdentifierSea]
								   AND [ds].[DimSeaId] = [dl].[SeaId]
				INNER JOIN [reporting].[DimK12Schools]                        AS [dks]
							   ON [fact].[SchoolIdentifierSea] = [dks].[SchoolIdentifierSea]
								   AND [ds].[DimSeaId] = [dks].[SeaId]
								   AND [dl].[DimLeaId] = [dks].[LeaId]
				INNER JOIN [reporting].[DimStudents]                          AS [dsu]
							   ON [fact].[StudentIdentifierState] = [dsu].[StudentIdentifierState]
				LEFT JOIN  [reporting].[DimRaces]                             AS [dr]
							   ON [fact].[RaceCode] = [dr].[RaceCode]
				LEFT JOIN  [reporting].[DimEnglishLearnerStatuses]            AS [dels]
							   ON [fact].[EnglishLearnerStatusCode] = [dels].[EnglishLearnerStatusCode]
				LEFT JOIN  [reporting].[DimHomelessnessStatuses]              AS [dhs]
							   ON [fact].[HomelessnessStatusCode] = [dhs].[HomelessnessStatusCode]
				LEFT JOIN  [reporting].[DimEconomicallyDisadvantagedStatuses] AS [deds]
							   ON [fact].[EconomicDisadvantageStatusCode] = [deds].[EconomicDisadvantageStatusCode]
				LEFT JOIN  [reporting].[DimFosterCareStatuses]                AS [dfcs]
							   ON [fact].[ProgramParticipationFosterCareCode] = [dfcs].[FosterCareStatusCode]
				LEFT JOIN  [reporting].[DimNOrDStatuses]                      AS [dnds]
							   ON [fact].[NeglectedOrDelinquentAcademicAchievementIndicatorCode] =
								  [dnds].[NeglectedOrDelinquentLongTermStatusCode]
				LEFT JOIN  [reporting].[DimDisabilityStatuses]                AS [dds]
							   ON [fact].[DisabilityStatusCode] = [dds].[DisabilityStatusCode]
				LEFT JOIN  [reporting].[DimK12Demographics]                   AS [dkd]
							   ON [fact].[SexCode] = [dkd].[SexCode]
		WHERE
			  [ds].[DimSeaId] IS NOT NULL
		  AND [dl].[DimLeaId] IS NOT NULL
		  AND [dks].[DimK12SchoolId] IS NOT NULL
		  AND [dsu].[DimK12StudentId] IS NOT NULL
		)
		MERGE [reporting].[FactK12StudentEnrollments] AS [Target]
	USING [Source]
	ON (
		[Target].[SchoolYear] = [Source].[SchoolYear]
			AND [target].[SeaId] = [source].[DimSeaId]
			AND [target].[LeaId] = [source].[DimLeaId]
			AND [target].[K12SchoolId] = [Source].[DimK12SchoolId]
			AND [target].[K12StudentId] = [source].[DimK12StudentId]
			AND [target].[GradeLevelCode] = [source].[GradeLevelCode]
		)
	WHEN MATCHED
		AND (
			[Target].[CohortYear] != [source].[CohortYear]
				OR [target].[CohortGraduationYear] != [source].[CohortGraduationYear]
				OR [target].[ProjectedGraduationYear] != [source].[ProjectedGraduationYear]
				OR [target].[RaceId] != [source].[DimRaceId]
				OR [target].[EnglishLearnerStatusId] != [source].[DimEnglishLearnerStatusId]
				OR [Target].[HomelessnessStatusId] != [source].[DimHomelessnessStatusId]
				OR [target].[EconomicallyDisadvantagedStatusId] != [source].[DimEconomicallyDisadvantagedStatusId]
				OR [target].[FosterCareStatusId] != [source].[DimFosterCareStatusId]
				OR [target].[NOrDStatusId] != [source].[DimNOrDStatusId]
				OR [target].[DisabilityStatusId] != [source].[DimDisabilityStatusId]
				OR [target].[K12DemographicId] != [source].[DimK12DemographicId]
			)
		THEN
		UPDATE
		SET
			[Target].[CohortYear]                        = [source].[CohortYear]
		  , [Target].[CohortGraduationYear]              = [source].[CohortGraduationYear]
		  , [Target].[ProjectedGraduationYear]           = [source].[ProjectedGraduationYear]
		  , [Target].[RaceId]                            = [source].[DimRaceId]
		  , [Target].[EnglishLearnerStatusId]            = [source].[DimEnglishLearnerStatusId]
		  , [Target].[HomelessnessStatusId]              = [source].[DimHomelessnessStatusId]
		  , [Target].[EconomicallyDisadvantagedStatusId] = [source].[DimEconomicallyDisadvantagedStatusId]
		  , [Target].[FosterCareStatusId]                = [source].[DimFosterCareStatusId]
		  , [Target].[NOrDStatusId]                      = [source].[DimNOrDStatusId]
		  , [Target].[DisabilityStatusId]                = [source].[DimDisabilityStatusId]
		  , [target].[K12DemographicId]                  = [source].[DimK12DemographicId]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				  [CohortYear]
				, [SchoolYear]
				, [CohortGraduationYear]
				, [ProjectedGraduationYear]
				, [SeaId]
				, [LeaId]
				, [K12SchoolId]
				, [K12StudentId]
				, [GradeLevelCode]
				, [RaceId]
				, [EnglishLearnerStatusId]
				, [HomelessnessStatusId]
				, [EconomicallyDisadvantagedStatusId]
				, [FosterCareStatusId]
				, [NOrDStatusId]
				, [DisabilityStatusId]
				, [K12DemographicId]
			)
		VALUES
			(
				  [Source].[CohortYear]
				, [Source].[SchoolYear]
				, [Source].[CohortGraduationYear]
				, [Source].[ProjectedGraduationYear]
				, [Source].[DimSeaId]
				, [Source].[DimLeaId]
				, [Source].[DimK12SchoolId]
				, [Source].[DimK12StudentId]
				, [Source].[GradeLevelCode]
				, [Source].[DimRaceId]
				, [Source].[DimEnglishLearnerStatusId]
				, [Source].[DimHomelessnessStatusId]
				, [Source].[DimEconomicallyDisadvantagedStatusId]
				, [Source].[DimFosterCareStatusId]
				, [Source].[DimNOrDStatusId]
				, [Source].[DimDisabilityStatusId]
				, [Source].[DimK12DemographicId]
			);
	
	PRINT ('Upsert for [reporting].[FactK12StudentEnrollments] completed.');
END
GO