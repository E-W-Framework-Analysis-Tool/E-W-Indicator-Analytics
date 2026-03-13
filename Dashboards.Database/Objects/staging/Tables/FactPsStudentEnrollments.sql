CREATE TABLE [staging].[FactPsStudentEnrollments]
(
	[FactPsStudentEnrollmentsId]      [bigint],
	[IPEDSIdentifier]                 INT,
	[SchoolYear]                      SMALLINT,
	[PsStudentStudentIdentifierState] NVARCHAR(40),
	[PsEnrollmentStatusId]            INT
)