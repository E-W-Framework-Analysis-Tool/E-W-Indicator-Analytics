CREATE TABLE [reporting].[FactK12StudentAssessments](
	[FactK12StudentAssessmentId] [int] IDENTITY(1,1) PRIMARY KEY,
	[FactK12StudentEnrollmentId] [bigint] NULL REFERENCES [reporting].[FactK12StudentEnrollments]([FactK12StudentEnrollmentId]),
	[SchoolYear] [smallint] NOT NULL REFERENCES [reporting].[DimSchoolYears]([Year]),
	[SeaId] [int] NOT NULL REFERENCES [reporting].[DimSEAs]([DimSeaId]),
	[LeaId] [int] NOT NULL REFERENCES [reporting].[DimLEAs]([DimLeaId]),
	[K12SchoolId] [int] NOT NULL REFERENCES [reporting].[DimK12Schools]([DimK12SchoolId]),
	[K12StudentId] [bigint] NOT NULL REFERENCES [reporting].[DimStudents]([DimK12StudentId]),
	[GradeLevelCode] [varchar](8) NOT NULL REFERENCES [reporting].[DimGradeLevels]([GradeLevelCode]),
	[AssessmentId] [int] NOT NULL REFERENCES [reporting].[DimAssessments]([DimAssessmentId]),
	[AssessmentSubtestId] [int] NOT NULL REFERENCES [reporting].[DimAssessmentSubtests]([DimAssessmentSubtestId]),
	[AssessmentResultScoreValueACTScore] [nvarchar](35) NULL,
	[AssessmentResultScoreValueSATScore] [nvarchar](35) NULL
)
