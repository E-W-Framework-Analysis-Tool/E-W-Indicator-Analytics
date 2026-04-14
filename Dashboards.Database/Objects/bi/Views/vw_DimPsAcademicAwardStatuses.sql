CREATE VIEW [bi].[vw_DimPsAcademicAwardStatuses]
AS
	SELECT
		[DimPsAcademicAwardStatusId]
	  , [PescAwardLevelTypeDescription]
	  , CASE
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
	FROM [reporting].[DimPsAcademicAwardStatuses]