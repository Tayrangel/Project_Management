CREATE TABLE [dbo].[Fato003]
(
	[id_cliente] NVARCHAR(50) NOT NULL , 
    [id_projeto] NVARCHAR(50) NOT NULL, 
    [id_dia] NVARCHAR(50) NOT NULL, 
    [tempo_manutencao] FLOAT NULL, 
    PRIMARY KEY ([id_cliente], [id_dia], [id_projeto]), 
    CONSTRAINT [FK_Fato003_Dim_Cliente] FOREIGN KEY ([id_cliente]) REFERENCES [Dim_Cliente]([id_cliente]), 
    CONSTRAINT [FK_Fato003_Dim_Projeto] FOREIGN KEY ([id_projeto]) REFERENCES [Dim_Projeto]([id_projeto]), 
    CONSTRAINT [FK_Fato003_Dim_Tempo] FOREIGN KEY ([id_dia]) REFERENCES [Dim_Tempo]([id_dia]),
)
