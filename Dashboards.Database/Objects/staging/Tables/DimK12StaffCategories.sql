CREATE TABLE [staging].[DimK12StaffCategories]
(
	[DimK12StaffCategoryId]                               [int]           NULL,
	[K12StaffClassificationCode]                          [nvarchar](50)  NULL,
	[K12StaffClassificationDescription]                   [nvarchar](100) NULL,
	[K12StaffClassificationEdFactsCode]                   [nvarchar](50)  NULL,
	[SpecialEducationSupportServicesCategoryCode]         [nvarchar](50)  NULL,
	[SpecialEducationSupportServicesCategoryDescription]  [nvarchar](200) NULL,
	[SpecialEducationSupportServicesCategoryEdFactsCode]  [nvarchar](50)  NULL,
	[TitleIProgramStaffCategoryCode]                      [nvarchar](50)  NULL,
	[TitleIProgramStaffCategoryDescription]               [nvarchar](100) NULL,
	[TitleIProgramStaffCategoryEdFactsCode]               [nvarchar](50)  NULL,
	[MigrantEducationProgramStaffCategoryCode]            [nvarchar](50)  NULL,
	[MigrantEducationProgramStaffCategoryDescription]     [nvarchar](200) NULL,
	[ProfessionalEducationalJobClassificationCode]        [nvarchar](50)  NULL,
	[ProfessionalEducationalJobClassificationDescription] [nvarchar](200) NULL,
)