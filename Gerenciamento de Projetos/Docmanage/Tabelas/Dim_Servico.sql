CREATE TABLE [dbo].[Dim_Servico]
(
	[id_servico] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [desc_servico] NVARCHAR(200) NULL, 
    [id_categoria] NVARCHAR(50) NULL, 
    CONSTRAINT [FK_Dim_Servico_Dim_Categoria] FOREIGN KEY ([id_categoria]) REFERENCES [Dim_Categoria]([id_categoria])
)
