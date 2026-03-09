CREATE VIEW [bi].[vw_DimK12CourseStatuses]
AS
	SELECT *,
	CASE
		WHEN CourseLevelCharacteristicDescription = 'International Baccalaureate course' THEN 'IB'
		WHEN CourseLevelCharacteristicDescription = 'Dual enrollment' THEN 'Dual Credit'
		WHEN CourseLevelCharacteristicDescription = 'General course' THEN 'General'
		WHEN CourseLevelCharacteristicDescription = 'Advanced placement course' THEN 'AP'
		ELSE 'Other'
	END AS CourseLevel
	FROM [reporting].[DimK12CourseStatuses];
