CREATE TABLE [dbo].[Fato002]
(
	[id_gerenciamento] NVARCHAR(50) NOT NULL , 
    [id_projeto] NVARCHAR(50) NOT NULL, 
    [id_dia] NVARCHAR(50) NOT NULL, 
    [id_analise] NVARCHAR(50) NOT NULL, 
    [work_in_progress] INT NULL, 
    [raias] NVARCHAR(200) NULL, 
    [num_cards] INT NULL, 
    PRIMARY KEY ([id_gerenciamento], [id_projeto], [id_dia], [id_analise]), 
    CONSTRAINT [FK_Fato002_Dim_Gerenciamento] FOREIGN KEY ([id_gerenciamento]) REFERENCES [Dim_Gerenciamento]([id_gerenciamento]), 
    CONSTRAINT [FK_Fato002_Dim_Projeto] FOREIGN KEY ([id_projeto]) REFERENCES [Dim_Projeto]([id_projeto]), 
    CONSTRAINT [FK_Fato002_Dim_Tempo] FOREIGN KEY ([id_dia]) REFERENCES [Dim_Tempo]([id_dia])
)
