CREATE VIEW [bi].[vw_FactK12StaffCounts]
AS
	SELECT DISTINCT
		[SchoolYear]
	  , [K12SchoolId]
	  , [K12StaffId]
	  , [K12StaffCategoryId]
	  , [StaffFullTimeEquivalency]
	FROM
		[reporting].[FactK12StaffCounts]