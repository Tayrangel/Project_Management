CREATE TABLE [dbo].[Dim_Tempo]
(
	[id_dia] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [data] DATE NULL, 
    [id_semana] INT NULL, 
    [nome_dia_semana] NVARCHAR(50) NULL, 
    [id_mes] INT NULL, 
    [nome_mes] NVARCHAR(50) NULL, 
    [id_mes_ano] NVARCHAR(50) NULL, 
    [nome_mes_ano] NVARCHAR(50) NULL, 
    [id_trimestre] INT NULL, 
    [nome_trimestre] NVARCHAR(50) NULL, 
    [id_trimestre_ano] NVARCHAR(50) NULL, 
    [nome_trimestre_ano] NVARCHAR(50) NULL, 
    [id_semestre] INT NULL, 
    [nome_semestre] NVARCHAR(50) NULL, 
    [id_semestre_ano] NVARCHAR(50) NULL, 
    [nome_semestre_ano] NVARCHAR(50) NULL, 
    [ano] NVARCHAR(50) NULL, 
    [tipo_dia] NVARCHAR(50) NULL
)
