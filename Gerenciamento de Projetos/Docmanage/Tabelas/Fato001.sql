CREATE TABLE [dbo].[Fato001]
(
	[id_dia] NVARCHAR(50) NOT NULL , 
    [id_cliente] NVARCHAR(50) NOT NULL, 
    [id_projeto] NVARCHAR(50) NOT NULL, 
    [id_gerenciamento] NVARCHAR(50) NOT NULL, 
    [id_atividade] NVARCHAR(50) NOT NULL, 
    [status_atividade] NVARCHAR(200) NULL, 
    [date_closed] DATE NULL, 
    [tempo_rastreado] FLOAT NULL, 
    [date_open] DATE NULL, 
    [date_in_progress] DATE NULL, 
    [date_blocked] DATE NULL, 
    [date_completed] DATE NULL, 
    [date_review] DATE NULL, 
    [date_accepted] DATE NULL, 
    [date_deploy_prod] DATE NULL, 
    PRIMARY KEY ([id_dia], [id_cliente], [id_projeto], [id_gerenciamento], [id_atividade]), 
    CONSTRAINT [FK_Fato001_Dim_Tempo] FOREIGN KEY ([id_dia]) REFERENCES [Dim_Tempo]([id_dia]), 
    CONSTRAINT [FK_Fato001_Dim_Cliente] FOREIGN KEY ([id_cliente]) REFERENCES [Dim_Cliente]([id_cliente]), 
    CONSTRAINT [FK_Fato001_Dim_Projeto] FOREIGN KEY ([id_projeto]) REFERENCES [Dim_Projeto]([id_projeto]), 
    CONSTRAINT [FK_Fato001_Dim_Gerenciamento] FOREIGN KEY ([id_gerenciamento]) REFERENCES [Dim_Gerenciamento]([id_gerenciamento]), 
    CONSTRAINT [FK_Fato001_Dim_Atividade] FOREIGN KEY ([id_atividade]) REFERENCES [Dim_Atividade]([id_atividade])
)
