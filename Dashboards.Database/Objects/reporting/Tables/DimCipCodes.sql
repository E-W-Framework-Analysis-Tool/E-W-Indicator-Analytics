CREATE TABLE [reporting].[DimCipCodes]
(
	[DimCipCodeId]          [int],
	[CipCode]               [nvarchar](7)        NULL,
	[CipDescription]        [nvarchar](200)      NULL,
	[CipUseCode]            [nvarchar](50)       NULL,
	[CipUseDescription]     [nvarchar](200)      NULL,
	[CipVersionCode]        [nvarchar](50)       NULL,
	[CipVersionDescription] [nvarchar](200)      NULL,
	CONSTRAINT [PK_DimCipCodeId] PRIMARY KEY ([DimCipCodeId]),
)