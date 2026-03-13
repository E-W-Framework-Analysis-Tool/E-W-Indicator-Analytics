CREATE TABLE [reporting].[DimPsEnrollmentStatuses]
(
	[DimPsEnrollmentStatusId]                      [int]           NOT NULL,
	[PostsecondaryExitOrWithdrawalTypeCode]        [nvarchar](50)  NOT NULL,
	[PostsecondaryExitOrWithdrawalTypeDescription] [nvarchar](200) NOT NULL,
	[PostsecondaryEnrollmentStatusCode]            [nvarchar](50)  NOT NULL,
	[PostsecondaryEnrollmentStatusDescription]     [nvarchar](200) NOT NULL,
	[PostSecondaryEnrollmentStatusEdFactsCode]     [varchar](50)   NOT NULL,
	CONSTRAINT [PK_DimPsEnrollmentStatusId] PRIMARY KEY ([DimPsEnrollmentStatusId]),
)