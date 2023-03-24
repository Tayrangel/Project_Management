/*
Script de implantação para DW_DOCMANAGE

Este código foi gerado por uma ferramenta.
As alterações feitas nesse arquivo poderão causar comportamento incorreto e serão perdidas se
o código for gerado novamente.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DW_DOCMANAGE"
:setvar DefaultFilePrefix "DW_DOCMANAGE"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detecta o modo SQLCMD e desabilita a execução do script se o modo SQLCMD não tiver suporte.
Para reabilitar o script após habilitar o modo SQLCMD, execute o comando a seguir:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'O modo SQLCMD deve ser habilitado para executar esse script com êxito.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'A operação de refatoração Renomear com chave 792a5921-5fde-4b92-8894-63a725a6e07a foi ignorada; o elemento [dbo].[Dim_Tempo].[Id] (SqlSimpleColumn) não será renomeado para id_dia';


GO
PRINT N'A operação de refatoração Renomear com chave 65dfa65a-f5c6-4bd9-aab6-44f7dc59397a foi ignorada; o elemento [dbo].[Dim_Cliente].[Id] (SqlSimpleColumn) não será renomeado para id_cliente';


GO
PRINT N'A operação de refatoração Renomear com chave 8d930cb1-a5cb-4ddd-bc8e-6938e518edd9 foi ignorada; o elemento [dbo].[Dim_Projeto].[Id] (SqlSimpleColumn) não será renomeado para id_projeto';


GO
PRINT N'A operação de refatoração Renomear com chave deb031fa-d6ee-49b7-a66b-98bab263eccb foi ignorada; o elemento [dbo].[Dim_Categoria].[Id] (SqlSimpleColumn) não será renomeado para id_categoria';


GO
PRINT N'A operação de refatoração Renomear com chave 39e7b669-4dea-4f15-9772-f80d3bab30b4 foi ignorada; o elemento [dbo].[Dim_Servico].[Id] (SqlSimpleColumn) não será renomeado para id_servico';


GO
PRINT N'A operação de refatoração Renomear com chave d4d6034f-5ed0-434a-9346-b004d2b11311 foi ignorada; o elemento [dbo].[Dim_Atividade].[Id] (SqlSimpleColumn) não será renomeado para id_atividade';


GO
PRINT N'A operação de refatoração Renomear com chave 068a3176-2706-496e-862c-d7d23ff95e93 foi ignorada; o elemento [dbo].[Dim_Gerenciamento].[Id] (SqlSimpleColumn) não será renomeado para id_analise';


GO
PRINT N'A operação de refatoração Renomear com chave c68287e7-3d14-48ab-b2b9-2befcebb89dd foi ignorada; o elemento [dbo].[Fato_001].[Id] (SqlSimpleColumn) não será renomeado para id_cliente';


GO
PRINT N'A operação de refatoração Renomear com chave 083e5ba7-e7f8-44c1-a779-dcdf10fec3b8 foi ignorada; o elemento [dbo].[Dim_Tempo].[Id] (SqlSimpleColumn) não será renomeado para id_dia';


GO
PRINT N'A operação de refatoração Renomear com chave ddd310b7-59fa-43eb-a2bc-449b6dae778f foi ignorada; o elemento [dbo].[Fato001].[Id] (SqlSimpleColumn) não será renomeado para id_dia';


GO
PRINT N'A operação de refatoração Renomear com chave c9099524-a3b1-48b7-a785-b714d613b2f4 foi ignorada; o elemento [dbo].[Fato002].[Id] (SqlSimpleColumn) não será renomeado para id_gerenciamento';


GO
PRINT N'A operação de refatoração Renomear com chave 1c3b6a2a-025a-4aaf-aa7a-e9a6e4a1b504 foi ignorada; o elemento [dbo].[Fato003].[Id] (SqlSimpleColumn) não será renomeado para id_cliente';


GO
PRINT N'A operação de refatoração Renomear com chave 72f13af7-4d8a-4cc3-963e-df1f829e5476, 130a7012-b58a-48ca-a4ec-5d6c50ef043e foi ignorada; o elemento [dbo].[Fato002].[raias] (SqlSimpleColumn) não será renomeado para open';


GO
PRINT N'A operação de refatoração Renomear com chave f1cd83a4-a5b8-476e-bbe9-ab27967062a4 foi ignorada; o elemento [dbo].[Fato002].[num_cards] (SqlSimpleColumn) não será renomeado para in_progress';


GO
PRINT N'Criando Tabela [dbo].[Dim_Atividade]...';


GO
CREATE TABLE [dbo].[Dim_Atividade] (
    [id_atividade]   NVARCHAR (50)  NOT NULL,
    [desc_atividade] NVARCHAR (200) NULL,
    [id_servico]     NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([id_atividade] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Dim_Categoria]...';


GO
CREATE TABLE [dbo].[Dim_Categoria] (
    [id_categoria]   NVARCHAR (50)  NOT NULL,
    [desc_categoria] NVARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([id_categoria] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Dim_Cliente]...';


GO
CREATE TABLE [dbo].[Dim_Cliente] (
    [id_cliente]   NVARCHAR (50)  NOT NULL,
    [desc_cliente] NVARCHAR (200) NULL,
    [id_cidade]    NVARCHAR (50)  NULL,
    [desc_cidade]  NVARCHAR (200) NULL,
    [id_estado]    NVARCHAR (50)  NULL,
    [desc_estado]  NVARCHAR (200) NULL,
    [id_regiao]    NVARCHAR (50)  NULL,
    [desc_regiao]  NVARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([id_cliente] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Dim_Gerenciamento]...';


GO
CREATE TABLE [dbo].[Dim_Gerenciamento] (
    [id_gerenciamento]   NVARCHAR (50)  NOT NULL,
    [desc_gerenciamento] NVARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([id_gerenciamento] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Dim_Projeto]...';


GO
CREATE TABLE [dbo].[Dim_Projeto] (
    [id_projeto]   NVARCHAR (50)  NOT NULL,
    [desc_projeto] NVARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([id_projeto] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Dim_Servico]...';


GO
CREATE TABLE [dbo].[Dim_Servico] (
    [id_servico]   NVARCHAR (50)  NOT NULL,
    [desc_servico] NVARCHAR (200) NULL,
    [id_categoria] NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([id_servico] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Dim_Tempo]...';


GO
CREATE TABLE [dbo].[Dim_Tempo] (
    [id_dia]             NVARCHAR (50) NOT NULL,
    [data]               DATE          NULL,
    [id_semana]          INT           NULL,
    [nome_dia_semana]    NVARCHAR (50) NULL,
    [id_mes]             INT           NULL,
    [nome_mes]           NVARCHAR (50) NULL,
    [id_mes_ano]         NVARCHAR (50) NULL,
    [nome_mes_ano]       NVARCHAR (50) NULL,
    [id_trimestre]       INT           NULL,
    [nome_trimestre]     NVARCHAR (50) NULL,
    [id_trimestre_ano]   NVARCHAR (50) NULL,
    [nome_trimestre_ano] NVARCHAR (50) NULL,
    [id_semestre]        INT           NULL,
    [nome_semestre]      NVARCHAR (50) NULL,
    [id_semestre_ano]    NVARCHAR (50) NULL,
    [nome_semestre_ano]  NVARCHAR (50) NULL,
    [ano]                NVARCHAR (50) NULL,
    [tipo_dia]           NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([id_dia] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Fato001]...';


GO
CREATE TABLE [dbo].[Fato001] (
    [id_dia]           NVARCHAR (50)  NOT NULL,
    [id_cliente]       NVARCHAR (50)  NOT NULL,
    [id_projeto]       NVARCHAR (50)  NOT NULL,
    [id_gerenciamento] NVARCHAR (50)  NOT NULL,
    [id_atividade]     NVARCHAR (50)  NOT NULL,
    [status_atividade] NVARCHAR (200) NULL,
    [tempo_rastreado]  FLOAT (53)     NULL,
    [lead_time]        FLOAT (53)     NULL,
    [cycle_time_1]     FLOAT (53)     NULL,
    [cycle_time_2]     FLOAT (53)     NULL,
    PRIMARY KEY CLUSTERED ([id_dia] ASC, [id_cliente] ASC, [id_projeto] ASC, [id_gerenciamento] ASC, [id_atividade] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Fato002]...';


GO
CREATE TABLE [dbo].[Fato002] (
    [id_gerenciamento] NVARCHAR (50) NOT NULL,
    [id_projeto]       NVARCHAR (50) NOT NULL,
    [id_dia]           NVARCHAR (50) NOT NULL,
    [id_analise]       NVARCHAR (50) NOT NULL,
    [work_in_progress] INT           NULL,
    [open]             INT           NULL,
    [in_progress]      INT           NULL,
    [blocked]          INT           NULL,
    [completed]        INT           NULL,
    [review]           INT           NULL,
    [accepted]         INT           NULL,
    [deploy_prod]      INT           NULL,
    [closed]           INT           NULL,
    PRIMARY KEY CLUSTERED ([id_gerenciamento] ASC, [id_projeto] ASC, [id_dia] ASC, [id_analise] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Fato003]...';


GO
CREATE TABLE [dbo].[Fato003] (
    [id_cliente]       NVARCHAR (50) NOT NULL,
    [id_projeto]       NVARCHAR (50) NOT NULL,
    [id_dia]           NVARCHAR (50) NOT NULL,
    [tempo_manutencao] FLOAT (53)    NULL,
    PRIMARY KEY CLUSTERED ([id_cliente] ASC, [id_dia] ASC, [id_projeto] ASC)
);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Dim_Atividade_Dim_Servico]...';


GO
ALTER TABLE [dbo].[Dim_Atividade] WITH NOCHECK
    ADD CONSTRAINT [FK_Dim_Atividade_Dim_Servico] FOREIGN KEY ([id_servico]) REFERENCES [dbo].[Dim_Servico] ([id_servico]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Dim_Servico_Dim_Categoria]...';


GO
ALTER TABLE [dbo].[Dim_Servico] WITH NOCHECK
    ADD CONSTRAINT [FK_Dim_Servico_Dim_Categoria] FOREIGN KEY ([id_categoria]) REFERENCES [dbo].[Dim_Categoria] ([id_categoria]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato001_Dim_Tempo]...';


GO
ALTER TABLE [dbo].[Fato001] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato001_Dim_Tempo] FOREIGN KEY ([id_dia]) REFERENCES [dbo].[Dim_Tempo] ([id_dia]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato001_Dim_Cliente]...';


GO
ALTER TABLE [dbo].[Fato001] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato001_Dim_Cliente] FOREIGN KEY ([id_cliente]) REFERENCES [dbo].[Dim_Cliente] ([id_cliente]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato001_Dim_Projeto]...';


GO
ALTER TABLE [dbo].[Fato001] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato001_Dim_Projeto] FOREIGN KEY ([id_projeto]) REFERENCES [dbo].[Dim_Projeto] ([id_projeto]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato001_Dim_Gerenciamento]...';


GO
ALTER TABLE [dbo].[Fato001] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato001_Dim_Gerenciamento] FOREIGN KEY ([id_gerenciamento]) REFERENCES [dbo].[Dim_Gerenciamento] ([id_gerenciamento]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato001_Dim_Atividade]...';


GO
ALTER TABLE [dbo].[Fato001] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato001_Dim_Atividade] FOREIGN KEY ([id_atividade]) REFERENCES [dbo].[Dim_Atividade] ([id_atividade]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato002_Dim_Gerenciamento]...';


GO
ALTER TABLE [dbo].[Fato002] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato002_Dim_Gerenciamento] FOREIGN KEY ([id_gerenciamento]) REFERENCES [dbo].[Dim_Gerenciamento] ([id_gerenciamento]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato002_Dim_Projeto]...';


GO
ALTER TABLE [dbo].[Fato002] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato002_Dim_Projeto] FOREIGN KEY ([id_projeto]) REFERENCES [dbo].[Dim_Projeto] ([id_projeto]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato002_Dim_Tempo]...';


GO
ALTER TABLE [dbo].[Fato002] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato002_Dim_Tempo] FOREIGN KEY ([id_dia]) REFERENCES [dbo].[Dim_Tempo] ([id_dia]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato003_Dim_Cliente]...';


GO
ALTER TABLE [dbo].[Fato003] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato003_Dim_Cliente] FOREIGN KEY ([id_cliente]) REFERENCES [dbo].[Dim_Cliente] ([id_cliente]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato003_Dim_Projeto]...';


GO
ALTER TABLE [dbo].[Fato003] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato003_Dim_Projeto] FOREIGN KEY ([id_projeto]) REFERENCES [dbo].[Dim_Projeto] ([id_projeto]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato003_Dim_Tempo]...';


GO
ALTER TABLE [dbo].[Fato003] WITH NOCHECK
    ADD CONSTRAINT [FK_Fato003_Dim_Tempo] FOREIGN KEY ([id_dia]) REFERENCES [dbo].[Dim_Tempo] ([id_dia]);


GO
-- Etapa de refatoração para atualizar o servidor de destino com logs de transação implantados

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '65dfa65a-f5c6-4bd9-aab6-44f7dc59397a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('65dfa65a-f5c6-4bd9-aab6-44f7dc59397a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '8d930cb1-a5cb-4ddd-bc8e-6938e518edd9')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('8d930cb1-a5cb-4ddd-bc8e-6938e518edd9')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'deb031fa-d6ee-49b7-a66b-98bab263eccb')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('deb031fa-d6ee-49b7-a66b-98bab263eccb')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '39e7b669-4dea-4f15-9772-f80d3bab30b4')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('39e7b669-4dea-4f15-9772-f80d3bab30b4')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'd4d6034f-5ed0-434a-9346-b004d2b11311')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('d4d6034f-5ed0-434a-9346-b004d2b11311')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '068a3176-2706-496e-862c-d7d23ff95e93')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('068a3176-2706-496e-862c-d7d23ff95e93')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c68287e7-3d14-48ab-b2b9-2befcebb89dd')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c68287e7-3d14-48ab-b2b9-2befcebb89dd')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '792a5921-5fde-4b92-8894-63a725a6e07a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('792a5921-5fde-4b92-8894-63a725a6e07a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '083e5ba7-e7f8-44c1-a779-dcdf10fec3b8')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('083e5ba7-e7f8-44c1-a779-dcdf10fec3b8')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ddd310b7-59fa-43eb-a2bc-449b6dae778f')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ddd310b7-59fa-43eb-a2bc-449b6dae778f')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c9099524-a3b1-48b7-a785-b714d613b2f4')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c9099524-a3b1-48b7-a785-b714d613b2f4')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '1c3b6a2a-025a-4aaf-aa7a-e9a6e4a1b504')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('1c3b6a2a-025a-4aaf-aa7a-e9a6e4a1b504')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '72f13af7-4d8a-4cc3-963e-df1f829e5476')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('72f13af7-4d8a-4cc3-963e-df1f829e5476')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '130a7012-b58a-48ca-a4ec-5d6c50ef043e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('130a7012-b58a-48ca-a4ec-5d6c50ef043e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f1cd83a4-a5b8-476e-bbe9-ab27967062a4')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f1cd83a4-a5b8-476e-bbe9-ab27967062a4')

GO

GO
PRINT N'Verificando os dados existentes em restrições recém-criadas';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Dim_Atividade] WITH CHECK CHECK CONSTRAINT [FK_Dim_Atividade_Dim_Servico];

ALTER TABLE [dbo].[Dim_Servico] WITH CHECK CHECK CONSTRAINT [FK_Dim_Servico_Dim_Categoria];

ALTER TABLE [dbo].[Fato001] WITH CHECK CHECK CONSTRAINT [FK_Fato001_Dim_Tempo];

ALTER TABLE [dbo].[Fato001] WITH CHECK CHECK CONSTRAINT [FK_Fato001_Dim_Cliente];

ALTER TABLE [dbo].[Fato001] WITH CHECK CHECK CONSTRAINT [FK_Fato001_Dim_Projeto];

ALTER TABLE [dbo].[Fato001] WITH CHECK CHECK CONSTRAINT [FK_Fato001_Dim_Gerenciamento];

ALTER TABLE [dbo].[Fato001] WITH CHECK CHECK CONSTRAINT [FK_Fato001_Dim_Atividade];

ALTER TABLE [dbo].[Fato002] WITH CHECK CHECK CONSTRAINT [FK_Fato002_Dim_Gerenciamento];

ALTER TABLE [dbo].[Fato002] WITH CHECK CHECK CONSTRAINT [FK_Fato002_Dim_Projeto];

ALTER TABLE [dbo].[Fato002] WITH CHECK CHECK CONSTRAINT [FK_Fato002_Dim_Tempo];

ALTER TABLE [dbo].[Fato003] WITH CHECK CHECK CONSTRAINT [FK_Fato003_Dim_Cliente];

ALTER TABLE [dbo].[Fato003] WITH CHECK CHECK CONSTRAINT [FK_Fato003_Dim_Projeto];

ALTER TABLE [dbo].[Fato003] WITH CHECK CHECK CONSTRAINT [FK_Fato003_Dim_Tempo];


GO
PRINT N'Atualização concluída.';


GO
