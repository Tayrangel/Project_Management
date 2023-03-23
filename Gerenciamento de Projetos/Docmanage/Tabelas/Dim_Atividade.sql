CREATE TABLE [dbo].[Dim_Atividade]
(
	[id_atividade] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [desc_atividade] NVARCHAR(200) NULL, 
    [id_servico] NVARCHAR(50) NULL, 
    CONSTRAINT [FK_Dim_Atividade_Dim_Servico] FOREIGN KEY ([id_servico]) REFERENCES [Dim_Servico]([id_servico])
)
