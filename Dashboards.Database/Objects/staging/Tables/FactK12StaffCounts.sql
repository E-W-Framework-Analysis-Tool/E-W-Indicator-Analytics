CREATE TABLE [staging].[FactK12StaffCounts]
(
	[FactK12StaffCountId]                [int],
	[SchoolYear]                         [smallint],
	[SeaOrganizationIdentifierSea]       [nvarchar](50),
	[LeaIdentifierSea]                   [nvarchar](50),
	[SchoolIdentifierSea]                [nvarchar](50),
	[K12StaffStaffMemberIdentifierState] [nvarchar](40),
	[K12StaffCategoryId]                 [int],
	[StaffFullTimeEquivalency]           [decimal](18, 3) NULL
)