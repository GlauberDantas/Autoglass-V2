USE [dbAutoglass]
GO

/****** Object:  Table [dbo].[tbProduto]    Script Date: 18/01/2022 12:08:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbProduto](
	[tbProduto_id] [int] IDENTITY(1,1) NOT NULL,
	[tbProduto_descricao] [varchar](100) NOT NULL,
	[tbProduto_Situacao] [bit] NOT NULL,
	[tbProduto_DataFabricacao] [date] NULL,
	[tbProduto_DataValidade] [date] NULL,
	[tbFornecedor_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tbProduto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbProduto]  WITH CHECK ADD  CONSTRAINT [fk_FornecedorProduto] FOREIGN KEY([tbFornecedor_Id])
REFERENCES [dbo].[tbFornecedor] ([tbFornecedor_Id])
GO

ALTER TABLE [dbo].[tbProduto] CHECK CONSTRAINT [fk_FornecedorProduto]
GO


