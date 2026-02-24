CREATE VIEW [bi].[vw_FactK12AccessibleEducationMaterialAssignments]
AS
	SELECT
		[SchoolYear]
	  , [SeaId]
	  , [LeaId]
	  , [K12SchoolId]
	  , [K12StudentId]
	  , [RuralStatusId]
	FROM [REPORTING].[FactK12AccessibleEducationMaterialAssignments];