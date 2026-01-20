CREATE TABLE [reporting].[FactK12StudentCourseSections](
	[FactK12StudentCourseSectionId] [bigint] IDENTITY(1,1) PRIMARY KEY,
	[FactK12StudentEnrollmentId] [bigint] NULL REFERENCES [reporting].[FactK12StudentEnrollments]([FactK12StudentEnrollmentId]),
	[SchoolYear] [smallint] NOT NULL REFERENCES [reporting].[DimSchoolYears]([Year]),
	[SeaId] [int] NOT NULL REFERENCES [reporting].[DimSEAs]([DimSeaId]),
	[LeaId] [int] NOT NULL REFERENCES [reporting].[DimLEAs]([DimLeaId]),
	[K12SchoolId] [int] NOT NULL REFERENCES [reporting].[DimK12Schools]([DimK12SchoolId]),
	[K12StudentId] [bigint] NOT NULL REFERENCES [reporting].[DimStudents]([DimK12StudentId]),
	[GradeLevelCode] [varchar](8) NOT NULL REFERENCES [reporting].[DimGradeLevels]([GradeLevelCode]),
	[K12CourseId] [int] NOT NULL REFERENCES [reporting].[DimK12Courses]([DimK12CourseId]),
  [K12CourseStatusId] [int] NULL REFERENCES [reporting].[DimK12CourseStatuses]([DimK12CourseStatusId]),
	[StudentCourseSectionGradeEarned] [nvarchar](15) NULL,
	[StudentCourseSectionGradeNarrative] [nvarchar](300) NULL
)
