CREATE VIEW [bi].[vw_FactK12StudentAssessments] AS
SELECT
	  [SchoolYear]
  , [SeaId]
  , [LeaId]
  , [K12SchoolId]
  , [GradeLevelCode]
  , [AssessmentId]
  , [AssessmentSubtestId]
  , [K12StudentId]
  , [AssessmentResultScoreValueACTScore] AS [ACTScore]
  , [AssessmentResultScoreValueSATScore] AS [SATScore]
FROM
	[reporting].[FactK12StudentAssessments]
