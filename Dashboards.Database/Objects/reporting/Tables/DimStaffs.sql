CREATE TABLE [reporting].[DimStaffs]
(
	[DimK12StaffId]        [bigint] IDENTITY (1,1),
	[StaffIdentifierState] [nvarchar](40) NULL,
	CONSTRAINT [PK_DimK12StaffId]
		PRIMARY KEY ([DimK12StaffId]),
	INDEX [NCIX_DimStaffs_StaffIdentifierState] NONCLUSTERED ([StaffIdentifierState])
)
GO