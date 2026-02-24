CREATE TABLE [staging].[FactK12AccessibleEducationMaterialAssignments]
	(
		[SchoolYear]                                     SMALLINT,
		[SeaOrganizationIdentifierSea]                   NVARCHAR(50),
		[LeaIdentifierSea]                               NVARCHAR(50),
		[SchoolIdentifierSea]                            NVARCHAR(50),
		[StudentIdentifierState]                         NVARCHAR(40),
		[FactK12AccessibleEducationMaterialAssignmentId] INT,
		[RuralStatusId]                                  INT
	)