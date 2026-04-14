CREATE VIEW [bi].[vw_PS_DimStudents]
AS	
	SELECT DISTINCT
		[base].[DimPSStudentId]                                       AS [PsStudentId]
	  , MAX(COALESCE([fact].[EnglishLearnerStatusId], -1))            AS [EnglishLearnerStatusId]
	  , MAX(COALESCE([fact].[PsDemographicId], -1))                   AS [PsDemographicId]
	  , MAX(COALESCE([fact].[DisabilityStatusId], -1))                AS [DisabilityStatusId]
	  , MAX(COALESCE([fact].[EconomicallyDisadvantagedStatusId], -1)) AS [EconomicallyDisadvantagedStatusId]
	  , MAX(COALESCE([fact].[HomelessnessStatusId], -1))              AS [HomelessnessStatusId]
	  , MAX(COALESCE([fact].[MigrantStatusId], -1))                   AS [MigrantStatusId]
	  , MAX(COALESCE([fact].[PrimaryDisabilityTypeId], -1))           AS [PrimaryDisabilityTypeId]
	  , MAX(COALESCE([fact].[IdeaStatusId], -1))                      AS [IdeaStatusId]
	  , MAX(COALESCE([fact].[ImmigrantStatusId], -1))                 AS [ImmigrantStatusId]
	  , MAX(COALESCE([fact].[MilitaryStatusId], -1))                  AS [MilitaryStatusId]
	FROM
		[reporting].[PS_DimStudents]                     AS [base]
			LEFT JOIN
			[reporting].[FactPsStudentCourseTranscripts] AS [fact]
				ON [base].[DimPSStudentId] = [fact].[PsStudentId]
	GROUP BY
		[base].[DimPSStudentId]