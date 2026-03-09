CREATE VIEW [bi].[vw_DimK12StaffCategories]
AS
	SELECT
		[DimK12StaffCategoryId]
	  , [K12StaffClassificationDescription]
	FROM
		[reporting].[DimK12StaffCategories]