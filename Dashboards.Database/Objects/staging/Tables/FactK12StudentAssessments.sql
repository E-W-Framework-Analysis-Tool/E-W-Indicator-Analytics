CREATE TABLE [staging].[FactK12StudentAssessments](
	[FactK12StudentAssessmentId] [int] NOT NULL,
	[FactK12StudentEnrollmentId] [bigint] NULL,
	[SchoolYear] [smallint] NULL,
	[SeaOrganizationIdentifierSea] [nvarchar](50) NULL,
	[LeaIdentifierSea] [nvarchar](50) NULL,
	[SchoolIdentifierSea] [nvarchar](50) NULL,
	[StudentIdentifierState] [nvarchar](40) NULL,
	[GradeLevelCode] [varchar](8) NULL,
	[AssessmentIdentifierState] [nvarchar](40) NULL,
	[AssessmentSubtestIdentifierInternal] [nvarchar](40) NULL,
	[AssessmentResultScoreValueACTScore] [nvarchar](35) NULL,
	[AssessmentResultScoreValueSATScore] [nvarchar](35) NULL
)
