CREATE TABLE [staging].[FactPsStudentAcademicAwards]
	(
		[FactPsStudentAcademicAwardId]    [int]           NOT NULL,
		[IPEDSIdentifier]                 [int]           NULL,
		[PsStudentStudentIdentifierState] [nvarchar](40)  NULL,
		[PsAcademicAwardTitleId]          [int]           NULL,
		[AcademicAwardDate]               [datetime2](7)  NULL,
		[PsAcademicAwardStatusId]         [int]           NULL,
		[SchoolYear]                      [smallint]      NULL,
		[SexDescription]                  [nvarchar](200) NULL
	)
GO