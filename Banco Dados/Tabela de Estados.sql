USE [dbAutoglass]
GO

/****** Object:  Table [dbo].[tbEstados]    Script Date: 27/12/2021 21:30:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbEstados](
	[id] [int] NOT NULL,
	[nome] [varchar](75) NULL,
	[uf] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbEstados] ADD  DEFAULT (NULL) FOR [nome]
GO

ALTER TABLE [dbo].[tbEstados] ADD  DEFAULT (NULL) FOR [uf]
GO


