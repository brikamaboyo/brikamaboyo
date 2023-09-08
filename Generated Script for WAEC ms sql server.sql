USE [NIFTY]
GO
/****** Object:  Table [dbo].[BANK]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BANK](
	[bank_code] [int] NOT NULL,
	[bank_name] [varchar](40) NULL,
	[bank_headquater] [varchar](40) NULL,
 CONSTRAINT [bank_code_pk] PRIMARY KEY CLUSTERED 
(
	[bank_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BANKBRANCH]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BANKBRANCH](
	[bank_branch_code] [int] NOT NULL,
	[bank_code] [int] NULL,
	[bank_branch_address] [varchar](40) NULL,
	[bank_branch_phone] [varchar](40) NULL,
	[bank_branch_email] [varchar](40) NULL,
 CONSTRAINT [bank_pk] PRIMARY KEY CLUSTERED 
(
	[bank_branch_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BLACKLIST]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BLACKLIST](
	[contractor_code] [int] NULL,
	[dates] [date] NULL,
	[description] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONTRACT]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTRACT](
	[contract_code] [int] NOT NULL,
	[contract_type] [varchar](40) NULL,
 CONSTRAINT [contract_pk] PRIMARY KEY CLUSTERED 
(
	[contract_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONTRACTOR]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTRACTOR](
	[contractor_code] [int] NOT NULL,
	[contract_detail] [int] NULL,
	[first_name] [varchar](40) NULL,
	[middle_name] [varchar](40) NULL,
	[last_name] [varchar](40) NULL,
	[dob] [date] NULL,
	[photo] [varbinary](max) NULL,
	[registration_date] [date] NULL,
	[nationality] [varchar](40) NULL,
	[document] [int] NULL,
	[contractor_sch] [varchar](10) NULL,
	[contra_qual] [int] NULL,
	[cont_status] [varchar](40) NULL,
	[field_of_study] [varchar](40) NULL,
	[contractor_region] [int] NULL,
 CONSTRAINT [contractor_pk] PRIMARY KEY CLUSTERED 
(
	[contractor_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONTRACTORBANK]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTRACTORBANK](
	[contractor_bank] [int] NOT NULL,
	[contractor_INTEGER] [int] NOT NULL,
	[account_INTEGER] [varchar](40) NOT NULL,
	[account_name] [varchar](40) NULL,
	[bban] [varchar](40) NULL,
 CONSTRAINT [contrabank_pk] PRIMARY KEY CLUSTERED 
(
	[contractor_bank] ASC,
	[contractor_INTEGER] ASC,
	[account_INTEGER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONTRACTORPOSTING]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTRACTORPOSTING](
	[contractorCode] [int] NULL,
	[contract_code] [int] NOT NULL,
	[posting_start_date] [date] NOT NULL,
	[posting_end_date] [date] NOT NULL,
	[centre_INTEGER] [int] NULL,
	[exam_category_code] [int] NULL,
 CONSTRAINT [contractoposting_pk] PRIMARY KEY CLUSTERED 
(
	[contract_code] ASC,
	[posting_end_date] ASC,
	[posting_start_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONTRACTORQUALIFICATION]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTRACTORQUALIFICATION](
	[contra_qual_code] [int] NOT NULL,
	[contractor_id] [int] NOT NULL,
	[qualification_date] [date] NULL,
 CONSTRAINT [contractor_qual_pk] PRIMARY KEY CLUSTERED 
(
	[contra_qual_code] ASC,
	[contractor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONTRACTORSCHOOL]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTRACTORSCHOOL](
	[contractor_code] [int] NOT NULL,
	[contractor_sch] [varchar](10) NOT NULL,
	[join_date] [date] NULL,
	[status] [varchar](20) NULL,
 CONSTRAINT [contractor_school_pk] PRIMARY KEY CLUSTERED 
(
	[contractor_code] ASC,
	[contractor_sch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONTRACTORTUTORIALCLASS]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTRACTORTUTORIALCLASS](
	[contractorID] [int] NOT NULL,
	[schoolID] [varchar](10) NOT NULL,
	[join_date] [date] NULL,
	[status] [varchar](10) NULL,
 CONSTRAINT [tutorial_class_pk] PRIMARY KEY CLUSTERED 
(
	[contractorID] ASC,
	[schoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOCUMENT]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOCUMENT](
	[document_code] [int] NOT NULL,
	[document_name] [varchar](40) NULL,
 CONSTRAINT [document_pk] PRIMARY KEY CLUSTERED 
(
	[document_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EXAMCENTER]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXAMCENTER](
	[region_code] [int] NULL,
	[centre_NUMBER] [int] NOT NULL,
	[centre_name] [varchar](40) NULL,
	[centre_address] [varchar](40) NULL,
	[contact_person] [varchar](40) NULL,
	[phone] [varchar](40) NULL,
	[email] [varchar](40) NULL,
 CONSTRAINT [examcenter_pk] PRIMARY KEY CLUSTERED 
(
	[centre_NUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GABECESUBJECT]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GABECESUBJECT](
	[gsubject_code] [varchar](10) NOT NULL,
	[gsubject_name] [varchar](40) NULL,
	[iscore_subject] [varchar](5) NULL,
	[subject_rate] [decimal](8, 2) NULL,
 CONSTRAINT [cabecesubject_pk] PRIMARY KEY CLUSTERED 
(
	[gsubject_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GCOURSEWORK]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GCOURSEWORK](
	[gsubject_id] [varchar](10) NOT NULL,
	[courseword_rate] [decimal](8, 2) NULL,
	[description] [varchar](500) NULL,
 CONSTRAINT [coursework_pk] PRIMARY KEY CLUSTERED 
(
	[gsubject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GEXAMCATEGORY]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GEXAMCATEGORY](
	[ex_category_code] [int] NOT NULL,
	[ex_category_name] [varchar](40) NULL,
 CONSTRAINT [examcategory_pk] PRIMARY KEY CLUSTERED 
(
	[ex_category_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GEXAMPAPAER]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GEXAMPAPAER](
	[exam_paper_code] [varchar](10) NOT NULL,
	[exam_paper_name] [varchar](40) NULL,
 CONSTRAINT [exam_paper_pk] PRIMARY KEY CLUSTERED 
(
	[exam_paper_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GMEETINGDETAILS]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMEETINGDETAILS](
	[SN] [int] NOT NULL,
	[mcode] [int] NULL,
	[mDate] [date] NULL,
	[Gcontractors] [int] NULL,
	[numOfDays] [int] NULL,
	[GsubDiscussed] [varchar](10) NULL,
 CONSTRAINT [gmeetingdet_sn_pk] PRIMARY KEY CLUSTERED 
(
	[SN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GORAL]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GORAL](
	[oral_subject] [varchar](10) NULL,
	[oral_description] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GPRACTICAL]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GPRACTICAL](
	[gsubject_id] [varchar](10) NOT NULL,
	[practical_rate] [decimal](8, 2) NULL,
	[description] [varchar](500) NULL,
 CONSTRAINT [practical_work_pk] PRIMARY KEY CLUSTERED 
(
	[gsubject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GQUESTIONSBANK]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GQUESTIONSBANK](
	[counter] [int] IDENTITY(1,1) NOT NULL,
	[gexaminerID] [int] NULL,
	[gsubjectID] [varchar](10) NULL,
	[questionType] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GSCRIPTALLOCATION]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GSCRIPTALLOCATION](
	[schoolId] [varchar](10) NOT NULL,
	[subjectMarked] [varchar](10) NOT NULL,
	[examinerID] [int] NOT NULL,
	[numOfScript] [int] NULL,
 CONSTRAINT [seniorScriptMarking_pk] PRIMARY KEY CLUSTERED 
(
	[schoolId] ASC,
	[subjectMarked] ASC,
	[examinerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GSUBJECTPAPER]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GSUBJECTPAPER](
	[subject_code] [varchar](10) NOT NULL,
	[subject_paper_code] [varchar](20) NOT NULL,
	[subject_paper_name] [varchar](20) NOT NULL,
 CONSTRAINT [gsub_paper_pk] PRIMARY KEY CLUSTERED 
(
	[subject_code] ASC,
	[subject_paper_code] ASC,
	[subject_paper_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MEETINGS]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEETINGS](
	[meeting_code] [int] NOT NULL,
	[meeting_type] [varchar](40) NULL,
 CONSTRAINT [meeting_meetingCode_pk] PRIMARY KEY CLUSTERED 
(
	[meeting_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OVERNIGHTALLOWANCE]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OVERNIGHTALLOWANCE](
	[town_code] [int] NULL,
	[townStatus] [int] NULL,
	[overnight_rate] [decimal](8, 2) NULL,
	[fareRate] [decimal](8, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QUALIFICATION]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUALIFICATION](
	[qualification_code] [int] NOT NULL,
	[qualification_name] [varchar](40) NULL,
 CONSTRAINT [qualification_code_pk] PRIMARY KEY CLUSTERED 
(
	[qualification_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REGION]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REGION](
	[region_code] [int] NOT NULL,
	[region_name] [varchar](40) NULL,
 CONSTRAINT [region_pk] PRIMARY KEY CLUSTERED 
(
	[region_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SCHOOL]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCHOOL](
	[scl_code] [varchar](10) NOT NULL,
	[scl_name] [varchar](40) NULL,
	[sch_level] [varchar](40) NULL,
	[scl_region] [int] NULL,
 CONSTRAINT [junsch_pk] PRIMARY KEY CLUSTERED 
(
	[scl_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TOWN]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TOWN](
	[town_code] [int] NOT NULL,
	[town_name] [varchar](40) NULL,
	[town_location] [int] NULL,
 CONSTRAINT [town_town_code_pk] PRIMARY KEY CLUSTERED 
(
	[town_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TOWNSTATUS]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TOWNSTATUS](
	[status_code] [int] NOT NULL,
	[town_description] [varchar](40) NULL,
 CONSTRAINT [townstatus_pk] PRIMARY KEY CLUSTERED 
(
	[status_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VEHICLE]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VEHICLE](
	[vehicle_code] [int] NOT NULL,
	[vehicle_type] [varchar](40) NULL,
 CONSTRAINT [vehicle_pk] PRIMARY KEY CLUSTERED 
(
	[vehicle_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VEHICLEREFUND]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VEHICLEREFUND](
	[towncode] [int] NOT NULL,
	[townStatusCode] [int] NOT NULL,
	[vehicleCode] [int] NOT NULL,
	[refund_rate] [decimal](8, 2) NULL,
 CONSTRAINT [vehicle_refund_pk] PRIMARY KEY CLUSTERED 
(
	[towncode] ASC,
	[townStatusCode] ASC,
	[vehicleCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WASSCESUBJECT]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WASSCESUBJECT](
	[wsubject_code] [varchar](10) NOT NULL,
	[wsubject_name] [varchar](40) NULL,
	[iscore_subject] [varchar](5) NULL,
 CONSTRAINT [WASSCEsubject_pk] PRIMARY KEY CLUSTERED 
(
	[wsubject_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WCOURSEWORK]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WCOURSEWORK](
	[wsubject_id] [varchar](10) NOT NULL,
	[courseword_rate] [decimal](8, 2) NULL,
	[description] [varchar](500) NULL,
 CONSTRAINT [wcoursework_pk] PRIMARY KEY CLUSTERED 
(
	[wsubject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WMEETINGDETAILS]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WMEETINGDETAILS](
	[SN] [int] NOT NULL,
	[WMcode] [int] NULL,
	[WMDate] [date] NULL,
	[Wcontractors] [int] NULL,
	[numOfDays] [int] NULL,
	[WsubDiscussed] [varchar](10) NULL,
 CONSTRAINT [Wmeetingdet_sn_pk] PRIMARY KEY CLUSTERED 
(
	[SN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WPRACTICAL]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WPRACTICAL](
	[wsubject_id] [varchar](10) NOT NULL,
	[practical_rate] [decimal](8, 2) NULL,
	[description] [varchar](500) NULL,
 CONSTRAINT [wpractical_work_pk] PRIMARY KEY CLUSTERED 
(
	[wsubject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WQUESTIONSBANK]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WQUESTIONSBANK](
	[counter] [int] IDENTITY(1,1) NOT NULL,
	[wexaminerID] [int] NULL,
	[wsubjectID] [varchar](10) NULL,
	[questionType] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WSCRIPTALLOCATION]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WSCRIPTALLOCATION](
	[schoolId] [varchar](10) NOT NULL,
	[subjectMarked] [varchar](10) NOT NULL,
	[examinerID] [int] NOT NULL,
	[numOfScript] [int] NULL,
 CONSTRAINT [WASSCEScriptMarking_pk] PRIMARY KEY CLUSTERED 
(
	[schoolId] ASC,
	[subjectMarked] ASC,
	[examinerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WSUBJECTPAPER]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WSUBJECTPAPER](
	[wsubject_paper_code] [varchar](10) NOT NULL,
	[wsubject_paper_name] [varchar](40) NOT NULL,
 CONSTRAINT [w_subjectPaper_pk] PRIMARY KEY CLUSTERED 
(
	[wsubject_paper_code] ASC,
	[wsubject_paper_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WSUBJECTPAPERRATE]    Script Date: 8/8/2023 1:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WSUBJECTPAPERRATE](
	[subjectCode] [varchar](10) NULL,
	[paper_rate] [decimal](8, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CONTRACTOR] ADD  CONSTRAINT [default_registration_date]  DEFAULT (getdate()) FOR [registration_date]
GO
ALTER TABLE [dbo].[BLACKLIST]  WITH CHECK ADD  CONSTRAINT [blacklist_examiner_fk] FOREIGN KEY([contractor_code])
REFERENCES [dbo].[CONTRACTOR] ([contractor_code])
GO
ALTER TABLE [dbo].[BLACKLIST] CHECK CONSTRAINT [blacklist_examiner_fk]
GO
ALTER TABLE [dbo].[CONTRACTOR]  WITH CHECK ADD  CONSTRAINT [contract_detail_fk] FOREIGN KEY([contract_detail])
REFERENCES [dbo].[CONTRACT] ([contract_code])
GO
ALTER TABLE [dbo].[CONTRACTOR] CHECK CONSTRAINT [contract_detail_fk]
GO
ALTER TABLE [dbo].[CONTRACTOR]  WITH CHECK ADD  CONSTRAINT [contractor_document_fk] FOREIGN KEY([document])
REFERENCES [dbo].[DOCUMENT] ([document_code])
GO
ALTER TABLE [dbo].[CONTRACTOR] CHECK CONSTRAINT [contractor_document_fk]
GO
ALTER TABLE [dbo].[CONTRACTOR]  WITH CHECK ADD  CONSTRAINT [contractor_qualification_fk] FOREIGN KEY([contra_qual])
REFERENCES [dbo].[QUALIFICATION] ([qualification_code])
GO
ALTER TABLE [dbo].[CONTRACTOR] CHECK CONSTRAINT [contractor_qualification_fk]
GO
ALTER TABLE [dbo].[CONTRACTOR]  WITH CHECK ADD  CONSTRAINT [contractor_region_fk] FOREIGN KEY([contractor_region])
REFERENCES [dbo].[REGION] ([region_code])
GO
ALTER TABLE [dbo].[CONTRACTOR] CHECK CONSTRAINT [contractor_region_fk]
GO
ALTER TABLE [dbo].[CONTRACTOR]  WITH CHECK ADD  CONSTRAINT [contractor_sch_fk] FOREIGN KEY([contractor_sch])
REFERENCES [dbo].[SCHOOL] ([scl_code])
GO
ALTER TABLE [dbo].[CONTRACTOR] CHECK CONSTRAINT [contractor_sch_fk]
GO
ALTER TABLE [dbo].[CONTRACTORBANK]  WITH CHECK ADD  CONSTRAINT [contrabank_contractor_INTEGER_fk] FOREIGN KEY([contractor_INTEGER])
REFERENCES [dbo].[CONTRACTOR] ([contractor_code])
GO
ALTER TABLE [dbo].[CONTRACTORBANK] CHECK CONSTRAINT [contrabank_contractor_INTEGER_fk]
GO
ALTER TABLE [dbo].[CONTRACTORBANK]  WITH CHECK ADD  CONSTRAINT [contractor_bank_fk] FOREIGN KEY([contractor_bank])
REFERENCES [dbo].[BANK] ([bank_code])
GO
ALTER TABLE [dbo].[CONTRACTORBANK] CHECK CONSTRAINT [contractor_bank_fk]
GO
ALTER TABLE [dbo].[CONTRACTORPOSTING]  WITH CHECK ADD  CONSTRAINT [contractoposting_contract_fk] FOREIGN KEY([contract_code])
REFERENCES [dbo].[CONTRACT] ([contract_code])
GO
ALTER TABLE [dbo].[CONTRACTORPOSTING] CHECK CONSTRAINT [contractoposting_contract_fk]
GO
ALTER TABLE [dbo].[CONTRACTORPOSTING]  WITH CHECK ADD  CONSTRAINT [contractor_contractorPosting_fk] FOREIGN KEY([contractorCode])
REFERENCES [dbo].[CONTRACTOR] ([contractor_code])
GO
ALTER TABLE [dbo].[CONTRACTORPOSTING] CHECK CONSTRAINT [contractor_contractorPosting_fk]
GO
ALTER TABLE [dbo].[CONTRACTORQUALIFICATION]  WITH CHECK ADD  CONSTRAINT [contra_id_fk] FOREIGN KEY([contractor_id])
REFERENCES [dbo].[CONTRACTOR] ([contractor_code])
GO
ALTER TABLE [dbo].[CONTRACTORQUALIFICATION] CHECK CONSTRAINT [contra_id_fk]
GO
ALTER TABLE [dbo].[CONTRACTORQUALIFICATION]  WITH CHECK ADD  CONSTRAINT [contra_qual_fk] FOREIGN KEY([contra_qual_code])
REFERENCES [dbo].[QUALIFICATION] ([qualification_code])
GO
ALTER TABLE [dbo].[CONTRACTORQUALIFICATION] CHECK CONSTRAINT [contra_qual_fk]
GO
ALTER TABLE [dbo].[CONTRACTORSCHOOL]  WITH CHECK ADD  CONSTRAINT [contractor_code_fk] FOREIGN KEY([contractor_code])
REFERENCES [dbo].[CONTRACTOR] ([contractor_code])
GO
ALTER TABLE [dbo].[CONTRACTORSCHOOL] CHECK CONSTRAINT [contractor_code_fk]
GO
ALTER TABLE [dbo].[CONTRACTORSCHOOL]  WITH CHECK ADD  CONSTRAINT [contractor_school_fk] FOREIGN KEY([contractor_sch])
REFERENCES [dbo].[SCHOOL] ([scl_code])
GO
ALTER TABLE [dbo].[CONTRACTORSCHOOL] CHECK CONSTRAINT [contractor_school_fk]
GO
ALTER TABLE [dbo].[CONTRACTORTUTORIALCLASS]  WITH CHECK ADD  CONSTRAINT [tutorial_class_contractor] FOREIGN KEY([contractorID])
REFERENCES [dbo].[CONTRACTOR] ([contractor_code])
GO
ALTER TABLE [dbo].[CONTRACTORTUTORIALCLASS] CHECK CONSTRAINT [tutorial_class_contractor]
GO
ALTER TABLE [dbo].[CONTRACTORTUTORIALCLASS]  WITH CHECK ADD  CONSTRAINT [tutorial_class_sch] FOREIGN KEY([schoolID])
REFERENCES [dbo].[SCHOOL] ([scl_code])
GO
ALTER TABLE [dbo].[CONTRACTORTUTORIALCLASS] CHECK CONSTRAINT [tutorial_class_sch]
GO
ALTER TABLE [dbo].[EXAMCENTER]  WITH CHECK ADD  CONSTRAINT [examcenter_region_fk] FOREIGN KEY([region_code])
REFERENCES [dbo].[REGION] ([region_code])
GO
ALTER TABLE [dbo].[EXAMCENTER] CHECK CONSTRAINT [examcenter_region_fk]
GO
ALTER TABLE [dbo].[GCOURSEWORK]  WITH CHECK ADD  CONSTRAINT [coursework_subject_fk] FOREIGN KEY([gsubject_id])
REFERENCES [dbo].[GABECESUBJECT] ([gsubject_code])
GO
ALTER TABLE [dbo].[GCOURSEWORK] CHECK CONSTRAINT [coursework_subject_fk]
GO
ALTER TABLE [dbo].[GMEETINGDETAILS]  WITH CHECK ADD  CONSTRAINT [meetingDetail_contractor] FOREIGN KEY([Gcontractors])
REFERENCES [dbo].[CONTRACTOR] ([contractor_code])
GO
ALTER TABLE [dbo].[GMEETINGDETAILS] CHECK CONSTRAINT [meetingDetail_contractor]
GO
ALTER TABLE [dbo].[GMEETINGDETAILS]  WITH CHECK ADD  CONSTRAINT [meetingDetail_mcode] FOREIGN KEY([mcode])
REFERENCES [dbo].[MEETINGS] ([meeting_code])
GO
ALTER TABLE [dbo].[GMEETINGDETAILS] CHECK CONSTRAINT [meetingDetail_mcode]
GO
ALTER TABLE [dbo].[GMEETINGDETAILS]  WITH CHECK ADD  CONSTRAINT [meetingDetails_subject] FOREIGN KEY([GsubDiscussed])
REFERENCES [dbo].[GABECESUBJECT] ([gsubject_code])
GO
ALTER TABLE [dbo].[GMEETINGDETAILS] CHECK CONSTRAINT [meetingDetails_subject]
GO
ALTER TABLE [dbo].[GORAL]  WITH CHECK ADD  CONSTRAINT [oralSubject_subject] FOREIGN KEY([oral_subject])
REFERENCES [dbo].[GABECESUBJECT] ([gsubject_code])
GO
ALTER TABLE [dbo].[GORAL] CHECK CONSTRAINT [oralSubject_subject]
GO
ALTER TABLE [dbo].[GPRACTICAL]  WITH CHECK ADD  CONSTRAINT [practical_work_subject_fk] FOREIGN KEY([gsubject_id])
REFERENCES [dbo].[GABECESUBJECT] ([gsubject_code])
GO
ALTER TABLE [dbo].[GPRACTICAL] CHECK CONSTRAINT [practical_work_subject_fk]
GO
ALTER TABLE [dbo].[GQUESTIONSBANK]  WITH CHECK ADD  CONSTRAINT [Gexaminer_questionSet_fk] FOREIGN KEY([gexaminerID])
REFERENCES [dbo].[CONTRACTOR] ([contractor_code])
GO
ALTER TABLE [dbo].[GQUESTIONSBANK] CHECK CONSTRAINT [Gexaminer_questionSet_fk]
GO
ALTER TABLE [dbo].[GQUESTIONSBANK]  WITH CHECK ADD  CONSTRAINT [Gquestion_subject_fk] FOREIGN KEY([gsubjectID])
REFERENCES [dbo].[GABECESUBJECT] ([gsubject_code])
GO
ALTER TABLE [dbo].[GQUESTIONSBANK] CHECK CONSTRAINT [Gquestion_subject_fk]
GO
ALTER TABLE [dbo].[GSCRIPTALLOCATION]  WITH CHECK ADD  CONSTRAINT [gScript_examiner_fk] FOREIGN KEY([examinerID])
REFERENCES [dbo].[CONTRACTOR] ([contractor_code])
GO
ALTER TABLE [dbo].[GSCRIPTALLOCATION] CHECK CONSTRAINT [gScript_examiner_fk]
GO
ALTER TABLE [dbo].[GSCRIPTALLOCATION]  WITH CHECK ADD  CONSTRAINT [schoolid_fk] FOREIGN KEY([schoolId])
REFERENCES [dbo].[SCHOOL] ([scl_code])
GO
ALTER TABLE [dbo].[GSCRIPTALLOCATION] CHECK CONSTRAINT [schoolid_fk]
GO
ALTER TABLE [dbo].[GSCRIPTALLOCATION]  WITH CHECK ADD  CONSTRAINT [subjectMarked_fk] FOREIGN KEY([subjectMarked])
REFERENCES [dbo].[GABECESUBJECT] ([gsubject_code])
GO
ALTER TABLE [dbo].[GSCRIPTALLOCATION] CHECK CONSTRAINT [subjectMarked_fk]
GO
ALTER TABLE [dbo].[GSUBJECTPAPER]  WITH CHECK ADD  CONSTRAINT [sub_paper_fk] FOREIGN KEY([subject_code])
REFERENCES [dbo].[GABECESUBJECT] ([gsubject_code])
GO
ALTER TABLE [dbo].[GSUBJECTPAPER] CHECK CONSTRAINT [sub_paper_fk]
GO
ALTER TABLE [dbo].[SCHOOL]  WITH CHECK ADD  CONSTRAINT [sch_region_fk] FOREIGN KEY([scl_region])
REFERENCES [dbo].[REGION] ([region_code])
GO
ALTER TABLE [dbo].[SCHOOL] CHECK CONSTRAINT [sch_region_fk]
GO
ALTER TABLE [dbo].[TOWN]  WITH CHECK ADD  CONSTRAINT [townLocation_fk] FOREIGN KEY([town_location])
REFERENCES [dbo].[TOWNSTATUS] ([status_code])
GO
ALTER TABLE [dbo].[TOWN] CHECK CONSTRAINT [townLocation_fk]
GO
ALTER TABLE [dbo].[VEHICLEREFUND]  WITH CHECK ADD  CONSTRAINT [towncode_fk] FOREIGN KEY([towncode])
REFERENCES [dbo].[TOWN] ([town_code])
GO
ALTER TABLE [dbo].[VEHICLEREFUND] CHECK CONSTRAINT [towncode_fk]
GO
ALTER TABLE [dbo].[VEHICLEREFUND]  WITH CHECK ADD  CONSTRAINT [townstatus_vehicle_fk] FOREIGN KEY([townStatusCode])
REFERENCES [dbo].[TOWNSTATUS] ([status_code])
GO
ALTER TABLE [dbo].[VEHICLEREFUND] CHECK CONSTRAINT [townstatus_vehicle_fk]
GO
ALTER TABLE [dbo].[VEHICLEREFUND]  WITH CHECK ADD  CONSTRAINT [vehicle_code_fk] FOREIGN KEY([vehicleCode])
REFERENCES [dbo].[VEHICLE] ([vehicle_code])
GO
ALTER TABLE [dbo].[VEHICLEREFUND] CHECK CONSTRAINT [vehicle_code_fk]
GO
ALTER TABLE [dbo].[WCOURSEWORK]  WITH CHECK ADD  CONSTRAINT [wcoursework_subject_fk] FOREIGN KEY([wsubject_id])
REFERENCES [dbo].[WASSCESUBJECT] ([wsubject_code])
GO
ALTER TABLE [dbo].[WCOURSEWORK] CHECK CONSTRAINT [wcoursework_subject_fk]
GO
ALTER TABLE [dbo].[WMEETINGDETAILS]  WITH CHECK ADD  CONSTRAINT [WmeetingDetail_contractor] FOREIGN KEY([Wcontractors])
REFERENCES [dbo].[CONTRACTOR] ([contractor_code])
GO
ALTER TABLE [dbo].[WMEETINGDETAILS] CHECK CONSTRAINT [WmeetingDetail_contractor]
GO
ALTER TABLE [dbo].[WMEETINGDETAILS]  WITH CHECK ADD  CONSTRAINT [WmeetingDetail_WMcode] FOREIGN KEY([WMcode])
REFERENCES [dbo].[MEETINGS] ([meeting_code])
GO
ALTER TABLE [dbo].[WMEETINGDETAILS] CHECK CONSTRAINT [WmeetingDetail_WMcode]
GO
ALTER TABLE [dbo].[WMEETINGDETAILS]  WITH CHECK ADD  CONSTRAINT [WmeetingDetails_subject] FOREIGN KEY([WsubDiscussed])
REFERENCES [dbo].[WASSCESUBJECT] ([wsubject_code])
GO
ALTER TABLE [dbo].[WMEETINGDETAILS] CHECK CONSTRAINT [WmeetingDetails_subject]
GO
ALTER TABLE [dbo].[WPRACTICAL]  WITH CHECK ADD  CONSTRAINT [wpractical_work_subject_fk] FOREIGN KEY([wsubject_id])
REFERENCES [dbo].[WASSCESUBJECT] ([wsubject_code])
GO
ALTER TABLE [dbo].[WPRACTICAL] CHECK CONSTRAINT [wpractical_work_subject_fk]
GO
ALTER TABLE [dbo].[WQUESTIONSBANK]  WITH CHECK ADD  CONSTRAINT [Wexaminer_questionSet_fk] FOREIGN KEY([wexaminerID])
REFERENCES [dbo].[CONTRACTOR] ([contractor_code])
GO
ALTER TABLE [dbo].[WQUESTIONSBANK] CHECK CONSTRAINT [Wexaminer_questionSet_fk]
GO
ALTER TABLE [dbo].[WQUESTIONSBANK]  WITH CHECK ADD  CONSTRAINT [Wquestion_subject_fk] FOREIGN KEY([wsubjectID])
REFERENCES [dbo].[WASSCESUBJECT] ([wsubject_code])
GO
ALTER TABLE [dbo].[WQUESTIONSBANK] CHECK CONSTRAINT [Wquestion_subject_fk]
GO
ALTER TABLE [dbo].[WSCRIPTALLOCATION]  WITH CHECK ADD  CONSTRAINT [Wschoolid_fk] FOREIGN KEY([schoolId])
REFERENCES [dbo].[SCHOOL] ([scl_code])
GO
ALTER TABLE [dbo].[WSCRIPTALLOCATION] CHECK CONSTRAINT [Wschoolid_fk]
GO
ALTER TABLE [dbo].[WSCRIPTALLOCATION]  WITH CHECK ADD  CONSTRAINT [WScript_examiner_fk] FOREIGN KEY([examinerID])
REFERENCES [dbo].[CONTRACTOR] ([contractor_code])
GO
ALTER TABLE [dbo].[WSCRIPTALLOCATION] CHECK CONSTRAINT [WScript_examiner_fk]
GO
ALTER TABLE [dbo].[WSCRIPTALLOCATION]  WITH CHECK ADD  CONSTRAINT [WsubjectMarked_fk] FOREIGN KEY([subjectMarked])
REFERENCES [dbo].[GABECESUBJECT] ([gsubject_code])
GO
ALTER TABLE [dbo].[WSCRIPTALLOCATION] CHECK CONSTRAINT [WsubjectMarked_fk]
GO
ALTER TABLE [dbo].[WSUBJECTPAPER]  WITH CHECK ADD  CONSTRAINT [w_subject_paper_code_fk] FOREIGN KEY([wsubject_paper_code])
REFERENCES [dbo].[WASSCESUBJECT] ([wsubject_code])
GO
ALTER TABLE [dbo].[WSUBJECTPAPER] CHECK CONSTRAINT [w_subject_paper_code_fk]
GO
ALTER TABLE [dbo].[WSUBJECTPAPERRATE]  WITH CHECK ADD  CONSTRAINT [wsubpaper_subject_fk] FOREIGN KEY([subjectCode])
REFERENCES [dbo].[WASSCESUBJECT] ([wsubject_code])
GO
ALTER TABLE [dbo].[WSUBJECTPAPERRATE] CHECK CONSTRAINT [wsubpaper_subject_fk]
GO
ALTER TABLE [dbo].[GSCRIPTALLOCATION]  WITH CHECK ADD  CONSTRAINT [CHK_number_of_script_GABECE] CHECK  (([numOfScript]<=(300)))
GO
ALTER TABLE [dbo].[GSCRIPTALLOCATION] CHECK CONSTRAINT [CHK_number_of_script_GABECE]
GO
ALTER TABLE [dbo].[WSCRIPTALLOCATION]  WITH CHECK ADD  CONSTRAINT [CHK_number_of_script_WASSCE] CHECK  (([numOfScript]<=(300)))
GO
ALTER TABLE [dbo].[WSCRIPTALLOCATION] CHECK CONSTRAINT [CHK_number_of_script_WASSCE]
GO
