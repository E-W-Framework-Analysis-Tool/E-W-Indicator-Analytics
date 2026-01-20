CREATE VIEW [bi].[vw_FactK12StudentEnrollments] AS
SELECT
	[CohortYear]
  , [SchoolYear]
  , [CohortGraduationYear]
  , [SeaId]
  , [LeaId]
  , [K12SchoolId]
  , [K12StudentId]
  , [GradeLevelCode]
  , [EnglishLearnerStatusId]
  , [HomelessnessStatusId]
  , [EconomicallyDisadvantagedStatusId]
  , [FosterCareStatusId]
  , [NOrDStatusId]
  , [DisabilityStatusId]
FROM
	[reporting].[FactK12StudentEnrollments]
