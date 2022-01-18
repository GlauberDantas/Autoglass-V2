USE [dbAutoglass]
GO

/****** Object:  Table [dbo].[tbCidades]    Script Date: 27/12/2021 21:30:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbCidades](
	[id] [int] NOT NULL,
	[nome] [varchar](120) NULL,
	[id_estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbCidades] ADD  DEFAULT (NULL) FOR [nome]
GO

ALTER TABLE [dbo].[tbCidades] ADD  DEFAULT (NULL) FOR [id_estado]
GO

ALTER TABLE [dbo].[tbCidades]  WITH CHECK ADD  CONSTRAINT [fk_Cidade_estado] FOREIGN KEY([id_estado])
REFERENCES [dbo].[tbEstados] ([id])
GO

ALTER TABLE [dbo].[tbCidades] CHECK CONSTRAINT [fk_Cidade_estado]
GO


