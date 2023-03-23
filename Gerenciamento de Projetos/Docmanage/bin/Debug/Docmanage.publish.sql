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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Criando o banco de dados $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
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
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'As configurações de banco de dados não podem ser modificadas. Você deve ser um SysAdmin para aplicar essas configurações.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'As configurações de banco de dados não podem ser modificadas. Você deve ser um SysAdmin para aplicar essas configurações.';
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
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
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
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


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
    [date_closed]      DATE           NULL,
    [tempo_rastreado]  FLOAT (53)     NULL,
    [date_open]        DATE           NULL,
    [date_in_progress] DATE           NULL,
    [date_blocked]     DATE           NULL,
    [date_completed]   DATE           NULL,
    [date_review]      DATE           NULL,
    [date_accepted]    DATE           NULL,
    [date_deploy_prod] DATE           NULL,
    PRIMARY KEY CLUSTERED ([id_dia] ASC, [id_cliente] ASC, [id_projeto] ASC, [id_gerenciamento] ASC, [id_atividade] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[Fato002]...';


GO
CREATE TABLE [dbo].[Fato002] (
    [id_gerenciamento] NVARCHAR (50)  NOT NULL,
    [id_projeto]       NVARCHAR (50)  NOT NULL,
    [id_dia]           NVARCHAR (50)  NOT NULL,
    [id_analise]       NVARCHAR (50)  NOT NULL,
    [work_in_progress] INT            NULL,
    [raias]            NVARCHAR (200) NULL,
    [num_cards]        INT            NULL,
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
ALTER TABLE [dbo].[Dim_Atividade]
    ADD CONSTRAINT [FK_Dim_Atividade_Dim_Servico] FOREIGN KEY ([id_servico]) REFERENCES [dbo].[Dim_Servico] ([id_servico]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Dim_Servico_Dim_Categoria]...';


GO
ALTER TABLE [dbo].[Dim_Servico]
    ADD CONSTRAINT [FK_Dim_Servico_Dim_Categoria] FOREIGN KEY ([id_categoria]) REFERENCES [dbo].[Dim_Categoria] ([id_categoria]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato001_Dim_Tempo]...';


GO
ALTER TABLE [dbo].[Fato001]
    ADD CONSTRAINT [FK_Fato001_Dim_Tempo] FOREIGN KEY ([id_dia]) REFERENCES [dbo].[Dim_Tempo] ([id_dia]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato001_Dim_Cliente]...';


GO
ALTER TABLE [dbo].[Fato001]
    ADD CONSTRAINT [FK_Fato001_Dim_Cliente] FOREIGN KEY ([id_cliente]) REFERENCES [dbo].[Dim_Cliente] ([id_cliente]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato001_Dim_Projeto]...';


GO
ALTER TABLE [dbo].[Fato001]
    ADD CONSTRAINT [FK_Fato001_Dim_Projeto] FOREIGN KEY ([id_projeto]) REFERENCES [dbo].[Dim_Projeto] ([id_projeto]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato001_Dim_Gerenciamento]...';


GO
ALTER TABLE [dbo].[Fato001]
    ADD CONSTRAINT [FK_Fato001_Dim_Gerenciamento] FOREIGN KEY ([id_gerenciamento]) REFERENCES [dbo].[Dim_Gerenciamento] ([id_gerenciamento]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato001_Dim_Atividade]...';


GO
ALTER TABLE [dbo].[Fato001]
    ADD CONSTRAINT [FK_Fato001_Dim_Atividade] FOREIGN KEY ([id_atividade]) REFERENCES [dbo].[Dim_Atividade] ([id_atividade]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato002_Dim_Gerenciamento]...';


GO
ALTER TABLE [dbo].[Fato002]
    ADD CONSTRAINT [FK_Fato002_Dim_Gerenciamento] FOREIGN KEY ([id_gerenciamento]) REFERENCES [dbo].[Dim_Gerenciamento] ([id_gerenciamento]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato002_Dim_Projeto]...';


GO
ALTER TABLE [dbo].[Fato002]
    ADD CONSTRAINT [FK_Fato002_Dim_Projeto] FOREIGN KEY ([id_projeto]) REFERENCES [dbo].[Dim_Projeto] ([id_projeto]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato002_Dim_Tempo]...';


GO
ALTER TABLE [dbo].[Fato002]
    ADD CONSTRAINT [FK_Fato002_Dim_Tempo] FOREIGN KEY ([id_dia]) REFERENCES [dbo].[Dim_Tempo] ([id_dia]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato003_Dim_Cliente]...';


GO
ALTER TABLE [dbo].[Fato003]
    ADD CONSTRAINT [FK_Fato003_Dim_Cliente] FOREIGN KEY ([id_cliente]) REFERENCES [dbo].[Dim_Cliente] ([id_cliente]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato003_Dim_Projeto]...';


GO
ALTER TABLE [dbo].[Fato003]
    ADD CONSTRAINT [FK_Fato003_Dim_Projeto] FOREIGN KEY ([id_projeto]) REFERENCES [dbo].[Dim_Projeto] ([id_projeto]);


GO
PRINT N'Criando Chave Estrangeira [dbo].[FK_Fato003_Dim_Tempo]...';


GO
ALTER TABLE [dbo].[Fato003]
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

GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Atualização concluída.';


GO
