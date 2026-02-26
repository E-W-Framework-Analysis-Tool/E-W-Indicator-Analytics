CREATE VIEW [bi].[vw_DimStaffs]
	AS
		SELECT DISTINCT
			[ds].[DimK12StaffId]
		FROM
			[reporting].[DimStaffs]                        AS [ds]
				LEFT JOIN [reporting].[FactK12StaffCounts] AS [fkcs]
							  ON [ds].[DimK12StaffId] = [fkcs].[K12StaffId]
		WHERE
			[fkcs].[K12StaffId] IS NOT NULL