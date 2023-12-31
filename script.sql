USE [product]
GO
/****** Object:  Table [dbo].[sanpham]    Script Date: 9/22/2023 3:52:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sanpham](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Type] [int] NOT NULL,
	[Donvi] [int] NOT NULL,
	[Price] [varchar](20) NOT NULL,
	[Note] [varchar](50) NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
