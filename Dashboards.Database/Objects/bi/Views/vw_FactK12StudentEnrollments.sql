CREATE VIEW [bi].[vw_FactK12StudentEnrollments] AS
SELECT
	[fkse].[CohortYear]
  , [fkse].[SchoolYear]
  , [fkse].[CohortGraduationYear]
  , [fkse].[K12SchoolId]
  , [fkse].[K12StudentId]
  , [fkse].[GradeLevelCode]
  , [fkse].[EnglishLearnerStatusId]
  , [fkse].[HomelessnessStatusId]
  , [fkse].[EconomicallyDisadvantagedStatusId]
  , [fkse].[FosterCareStatusId]
  , [fkse].[NOrDStatusId]
  , [fkse].[DisabilityStatusId]
  , [fkaema].[RuralStatusId]
FROM
	[reporting].[FactK12StudentEnrollments] AS [fkse]
		INNER JOIN [reporting].[FactK12AccessibleEducationMaterialAssignments] AS [fkaema]
					   ON [fkaema].[SeaId] = [fkse].[SeaId]
						   AND [fkaema].[LeaId] = [fkse].[LeaId]
						   AND [fkaema].[K12SchoolId] = [fkse].[K12SchoolId]
						   AND [fkaema].[K12StudentId] = [fkse].[K12StudentId];
