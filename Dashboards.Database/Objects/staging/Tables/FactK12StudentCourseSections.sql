CREATE TABLE [staging].[FactK12StudentCourseSections](
	[FactK12StudentCourseSectionId] [bigint] NOT NULL,
	[FactK12StudentEnrollmentId] [bigint] NULL,
	[SchoolYear] [smallint] NULL,
	[SeaOrganizationIdentifierSea] [nvarchar](50) NULL,
	[LeaIdentifierSea] [nvarchar](50) NULL,
	[SchoolIdentifierSea] [nvarchar](50) NULL,
	[StudentIdentifierState] [nvarchar](40) NULL,
	[GradeLevelCode] [varchar](8) NULL,
	[CourseIdentifier] [nvarchar](40) NULL,
  [CourseLevelCharacteristicCode] [nvarchar](50) NULL,
	[StudentCourseSectionGradeEarned] [nvarchar](15) NULL,
	[StudentCourseSectionGradeNarrative] [nvarchar](300) NULL
)
