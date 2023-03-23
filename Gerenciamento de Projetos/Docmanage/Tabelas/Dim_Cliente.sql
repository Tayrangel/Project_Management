CREATE TABLE [dbo].[Dim_Cliente]
(
	[id_cliente] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [desc_cliente] NVARCHAR(200) NULL, 
    [id_cidade] NVARCHAR(50) NULL, 
    [desc_cidade] NVARCHAR(200) NULL, 
    [id_estado] NVARCHAR(50) NULL, 
    [desc_estado] NVARCHAR(200) NULL, 
    [id_regiao] NVARCHAR(50) NULL, 
    [desc_regiao] NVARCHAR(200) NULL
)
