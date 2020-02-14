USE [NorthwindDataMart]
GO

/****** Object:  Table [dbo].[DimTime]    Script Date: 14/02/2020 12:45:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FacMeta](
	[TimeMetaKey] [int] IDENTITY(1,1) NOT NULL,
	[dateDT] [datetime]  NULL,
	[yearDT] [int] NULL,
	[monthDT] [varchar](20)  NULL,
	[dayDT] [int]  NULL,
	metaMount[money] NULL)
GO
INSERT INTO [dbo].[FacMeta] ([yearDT],[monthDT],[metaMount])
select dt.yearDT,dt.monthDT, sum([Total]) from [dbo].[Sales] s
inner join [dbo].[DimTime] dt on s.dateKey=dt.TimeKey
group by dt.yearDT,monthDT

truncate table [dbo].[FacMeta]

update [dbo].[FacMeta] set  [dateDT]=convert(datetime,(convert(varchar(10),dayDT)) +'/'+convert(varchar(10),monthDT)+'/'+convert(varchar(10),yearDT))

update [dbo].[FacMeta] set  [monthKey]=convert(int,convert(varchar(10),monthDT)+convert(varchar(10),yearDT))
 select  convert(int,convert(varchar(10),monthDT)+convert(varchar(10),yearDT)) from [dbo].[FacMeta]


 CREATE TABLE [dbo].[FacMeta](	
	monthkey as convert(int,convert(varchar(10),monthDT)+convert(varchar(10),yearDT)) ,
	[dateDT] [datetime]  NULL,	
	[yearDT] [int] not NULL,
	[monthDT] [varchar](20) not NULL,
	[dayDT] [int] NULL,
	[metaMount] [money] NULL)