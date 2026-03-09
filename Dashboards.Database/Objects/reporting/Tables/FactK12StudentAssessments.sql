CREATE TABLE [reporting].[FactK12StudentAssessments]
(
	[FactK12StudentAssessmentId]         [int] IDENTITY (1,1),
	[SchoolYear]                         [smallint]     NOT NULL,
	[SeaId]                              [int]          NOT NULL,
	[LeaId]                              [int]          NOT NULL,
	[K12SchoolId]                        [int]          NOT NULL,
	[K12StudentId]                       [bigint]       NOT NULL,
	[GradeLevelCode]                     [varchar](8)   NOT NULL,
	[AssessmentId]                       [int]          NOT NULL,
	[AssessmentSubtestId]                [int]          NOT NULL,
	[AssessmentResultScoreValueACTScore] [nvarchar](35) NULL,
	[AssessmentResultScoreValueSATScore] [nvarchar](35) NULL,
	CONSTRAINT [PK_FactK12StudentAssessmentId] PRIMARY KEY ([FactK12StudentAssessmentId]),
	CONSTRAINT [FK_FactK12StudentAssessments_SchoolYear_DimSchoolYears_Year] FOREIGN KEY ([SchoolYear]) REFERENCES [reporting].[DimSchoolYears] ([Year]), 
	CONSTRAINT [FK_FactK12StudentAssessments_SeaId_DimSEAs_DimSeaId] FOREIGN KEY ([SeaId]) REFERENCES [reporting].[DimSEAs] ([DimSeaId]),
	CONSTRAINT [FK_FactK12StudentAssessments_LeaId_DimLEAs_DimLeaId] FOREIGN KEY ([LeaId]) REFERENCES [reporting].[DimLEAs] ([DimLeaId]),
	CONSTRAINT [FK_FactK12StudentAssessments_K12SchoolId_DimK12Schools_DimK12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [reporting].[DimK12Schools] ([DimK12SchoolId]),
	CONSTRAINT [FK_FactK12StudentAssessments_K12StudentId_DimStudents_DimK12StudentId] FOREIGN KEY ([K12StudentId]) REFERENCES [reporting].[DimStudents] ([DimK12StudentId]),
	CONSTRAINT [FK_FactK12StudentAssessments_GradeLevelCode_DimGradeLevels_GradeLevelCode] FOREIGN KEY ([GradeLevelCode]) REFERENCES [reporting].[DimGradeLevels] ([GradeLevelCode]),
	CONSTRAINT [FK_FactK12StudentAssessments_AssessmentId_DimAssessments_DimAssessmentId] FOREIGN KEY ([AssessmentId]) REFERENCES [reporting].[DimAssessments] ([DimAssessmentId]),
	CONSTRAINT [FK_FactK12StudentAssessments_AssessmentSubtestId_DimAssessmentSubtests_DimAssessmentSubtestId] FOREIGN KEY ([AssessmentSubtestId]) REFERENCES [reporting].[DimAssessmentSubtests] ([DimAssessmentSubtestId]),
	INDEX [NCIX_FactK12StudentAssessments_NaturalKey] NONCLUSTERED 
		([SchoolYear] , [SeaId], [LeaId], [K12SchoolId], [K12StudentId], [GradeLevelCode], [AssessmentId], [AssessmentSubtestId])
)
GO
--------------------------------------------------------------------------------------
