CREATE TABLE [staging].[DimPsEnrollmentStatuses]
(
	[DimPsEnrollmentStatusId]                      [int]           NULL,
	[PostsecondaryExitOrWithdrawalTypeCode]        [nvarchar](50)  NULL,
	[PostsecondaryExitOrWithdrawalTypeDescription] [nvarchar](200) NULL,
	[PostsecondaryEnrollmentStatusCode]            [nvarchar](50)  NULL,
	[PostsecondaryEnrollmentStatusDescription]     [nvarchar](200) NULL,
	[PostSecondaryEnrollmentStatusEdFactsCode]     [varchar](50)   NULL
)