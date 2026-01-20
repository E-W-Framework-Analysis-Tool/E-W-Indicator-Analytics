CREATE VIEW [bi].[vw_DimRaces] AS
SELECT 
DimRaceId AS Id,
RaceCode as Code,
RaceDescription as [Desc]
FROM [reporting].[DimRaces];