CREATE VIEW [bi].[vw_DimPsAcademicAwardStatuses]
AS
	WITH [DimPsAcademicAwardStatuses] AS (
	SELECT
		[DimPsAcademicAwardStatusId]
	, [PescAwardLevelTypeDescription]
	, CASE
			WHEN [DimPsAcademicAwardStatusId] = 344
				THEN 'Certificate'
			WHEN [DimPsAcademicAwardStatusId] = 334
				THEN 'Bachelor''s Degree'
			WHEN [DimPsAcademicAwardStatusId] = 354
				THEN 'Master''s Degree'
			WHEN [DimPsAcademicAwardStatusId] IN (342, 331, 328)
				THEN 'Doctoral Degree'
			WHEN [PescAwardLevelTypeDescription] LIKE '%Doctor%'
				THEN 'Doctoral Degree'
			WHEN [PescAwardLevelTypeDescription] LIKE '%Master%'
				THEN 'Master''s Degree'
			WHEN [PescAwardLevelTypeDescription] LIKE '%Post%'
				THEN 'Certificate'
			WHEN [PescAwardLevelTypeDescription] LIKE '%Certificate%'
				THEN 'Certificate'
			WHEN [PescAwardLevelTypeDescription] LIKE '%Baccalaur%'
				THEN 'Bachelor''s Degree'
			WHEN [PescAwardLevelTypeDescription] LIKE '%Bachelor%'
				THEN 'Bachelor''s Degree'
			WHEN [PescAwardLevelTypeDescription] LIKE '%Diploma%'
				THEN 'Certificate'
			WHEN [PescAwardLevelTypeDescription] LIKE '%Associate%'
				THEN 'Associate''s Degree'
			ELSE 'Other'
		END AS [CredentialType]
	, [ProfessionalOrTechnicalCredentialConferredDescription]
	FROM [reporting].[DimPsAcademicAwardStatuses])
	SELECT
		*
	  , CASE
			WHEN [CredentialType] = 'Certificate'
				THEN 1
			WHEN [CredentialType] = 'Associate''s Degree'
				THEN 2
			WHEN [CredentialType] = 'Bachelor''s Degree'
				THEN 4
			WHEN [CredentialType] = 'Master''s Degree'
				THEN 2
			WHEN [CredentialType] = 'Doctoral Degree'
				THEN 5
			ELSE 3
		END AS [IntendedYears]	
	FROM [DimPsAcademicAwardStatuses];

GO