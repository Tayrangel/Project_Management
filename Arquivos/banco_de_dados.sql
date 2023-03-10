CREATE SCHEMA DOCMANAGE;

CREATE TABLE FUNCIONARIO (
	id_funcionario int primary key auto_increment,
    nome_funcionario varchar(50) not null,
    email varchar(30) not null,
    telefone varchar(20) not null
);

CREATE TABLE CADASTRO (
	id_cadastro int primary key auto_increment,
    id_funcionario int not null,
    tipo_cadastro varchar(50) not null,
    data_cadastro date not null
);

CREATE TABLE ITEM_CADASTRO (
	id_item_cadastro int primary key auto_increment,
    id_cadastro int not null,
    id_documento int not null
);

CREATE TABLE DOCUMENTO (
	id_documento int primary key auto_increment,
    id_funcionario int not null,
    id_cliente int not null,
    titulo varchar(50) not null,
    categoria varchar(20) not null,
    descricao varchar(200),
    numero_paginas int not null,
    data_registro date not null
);

CREATE TABLE CLIENTE (
	id_cliente int primary key auto_increment,
    nome_cliente varchar(30) not null,
    email varchar(30) not null,
    telefone varchar(20) not null
);

CREATE TABLE ARMAZEM (
	id_armazem int primary key auto_increment,
	id_documento int not null,
    local_armazenamento varchar(20) not null,
    cod_prateleira varchar(20) not null,
    nome_caixa varchar(20) not null,
    nome_pasta varchar(20) not null,
    data_armazenamento date not null
);

ALTER TABLE ARMAZEM ADD CONSTRAINT ce_armazem_documento
foreign key (id_documento)
references DOCUMENTO (id_documento)
on delete no action
on update no action;

INSERT INTO CLIENTE (nome_cliente, email, telefone) VALUES
('João Silva', 'joao.silva@email.com', '(11) 1234-5678'),
('Maria Santos', 'maria.santos@email.com', '(21) 9876-5432'),
('Pedro Oliveira', 'pedro.oliveira@email.com', '(31) 4567-8901'),
('Lucas Souza', 'lucas.souza@email.com', '(41) 2345-6789'),
('Julia Pereira', 'julia.pereira@email.com', '(51) 3456-7890'),
('Gustavo Almeida', 'gustavo.almeida@email.com', '(62) 4567-8901'),
('Ana Ferreira', 'ana.ferreira@email.com', '(71) 5678-9012'),
('Paulo Nunes', 'paulo.nunes@email.com', '(81) 6789-0123'),
('Aline Costa', 'aline.costa@email.com', '(91) 7890-1234'),
('Thiago Rocha', 'thiago.rocha@email.com', '(98) 8901-2345');

INSERT INTO FUNCIONARIO (nome_funcionario, email, telefone) VALUES
('Carl Chandler', 'carl.chandler@email.com', '(17) 1253-5678'),
('Theresa Neal', 'theresa.neal@email.com', '(17) 9876-9732'),
('Angela Williams', 'angela.williams@email.com', '(11) 8867-8901'),
('Brianna Dean', 'brianna.dean@email.com', '(21) 2345-3589'),
('Amy Salas', 'amy.salas@email.com', '(17) 3456-7890');

INSERT INTO CADASTRO (id_funcionario, tipo_cadastro, data_cadastro) VALUES 
(2, 'DIGITALIZAÇÃO E ARMAZENAMENTO', '2022-01-01'),
(2, 'DIGITALIZAÇÃO E ARMAZENAMENTO', '2022-02-15'),
(3, 'DIGITALIZAÇÃO E ARMAZENAMENTO', '2022-02-15'),
(3, 'ARMAZENAMENTO', '2022-02-15'),
(5, 'DIGITALIZAÇÃO E ARMAZENAMENTO', '2022-03-10'),
(4, 'DIGITALIZAÇÃO E ARMAZENAMENTO', '2022-03-10'),
(4, 'ARMAZENAMENTO', '2022-03-10'),
(5, 'DIGITALIZAÇÃO E ARMAZENAMENTO', '2022-03-10');

INSERT INTO ITEM_CADASTRO (id_cadastro, id_documento) VALUES 
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 16),
(5, 17),
(5, 18),
(6, 19),
(7, 20),
(7, 21),
(8, 22),
(8, 23);

INSERT INTO DOCUMENTO (id_funcionario, id_cliente, titulo, categoria, descricao, numero_paginas, data_registro) VALUES
(2, 1, 'Relatório Anual de Vendas', 'Relatórios', 'Relatório contendo as informações de vendas anuais da empresa', 20, '2021-01-15'),
(2, 1, 'Carta de Apresentação de Proposta Comercial', 'Cartas', 'Carta de apresentação de proposta comercial para venda de serviços', 2, '2021-01-15'),
(2, 1, 'Relatório Mensal de Vendas Outubro', 'Relatórios', 'Relatório contendo as informações de vendas do mês da empresa', 10, '2021-01-15'),
(2, 1, 'Relatório Mensal de Vendas Novembro', 'Relatórios', 'Relatório contendo as informações de vendas do mês da empresa', 10, '2021-01-15'),
(2, 1, 'Relatório Mensal de Vendas Dezembro', 'Relatórios', 'Relatório contendo as informações de vendas do mês da empresa', 10, '2021-01-15'),
(2, 2, 'Nota de Débito Janeiro', 'Notas', 'Nota de débito para cobrança de serviços prestados', 1, '2022-05-20'),
(2, 2, 'Nota de Débito Abril', 'Notas', 'Nota de débito para cobrança de serviços prestados', 1, '2022-05-20'),
(2, 2, 'Nota de Débito Março', 'Notas', 'Nota de débito para cobrança de serviços prestados', 1, '2022-05-20'),
(3, 5, 'Manual de Boas Práticas', 'Manuais', 'Manual de boas práticas para manutenção de equipamentos', 30, '2021-10-20'),
(3, 7, 'Manual de Procedimentos de Recursos Humanos', 'Manuais', 'Manual de procedimentos de RH para contratação de novos funcionários', 40, '2022-04-15'),
(3, 7, 'Termo de Compromisso de Estágio', 'Termos', 'Termo de compromisso para estágio na área de TI', 3, '2021-03-10'),
(3, 7, 'Relatório de Desempenho de Funcionários', 'Relatórios', 'Relatório contendo informações sobre o desempenho dos funcionários', 15, '2021-06-20'),
(3, 7, 'Relatório de Auditoria Interna', 'Relatórios', 'Relatório de auditoria interna para avaliação dos processos da empresa', 25, '2022-01-10'),
(3, 7, 'Contrato de Prestação de Serviços', 'Contratos', 'Contrato para prestação de serviços de desenvolvimento de software', 10, '2021-06-01'),
(3, 7, 'Contrato de Prestação de Serviços', 'Contratos', 'Contrato para prestação de serviços de desenvolvimento de software', 10, '2021-05-01'),
(3, 7, 'Contrato de Prestação de Serviços', 'Contratos', 'Contrato para prestação de serviços de desenvolvimento de software', 10, '2021-07-01'),
(5, 8, 'Nota Fiscal Eletrônica Julho', 'Notas', 'Nota fiscal eletrônica para compra de material de escritório', 1, '2021-05-12'),
(5, 8, 'Nota Fiscal Eletrônica Agosto', 'Notas', 'Nota fiscal eletrônica para compra de material de escritório', 1, '2021-05-12'),
(4, 7, 'Contrato de Prestação de Serviços', 'Contratos', 'Contrato para prestação de serviços de desenvolvimento de software', 10, '2021-05-01'),
(4, 8, 'Nota Fiscal Eletrônica Maio', 'Notas', 'Nota fiscal eletrônica para compra de material de escritório', 1, '2021-05-12'),
(4, 8, 'Nota Fiscal Eletrônica Agosto', 'Notas', 'Nota fiscal eletrônica para compra de material de escritório', 1, '2021-05-12'),
(5, 3, 'Memorando Interno', 'Memorandos', 'Memorando interno para comunicação entre departamentos', 1, '2021-09-15'),
(5, 3, 'Manual de Operação de Software', 'Manuais', 'Manual de operação do software XYZ versão 2.0', 50, '2021-04-05');

INSERT INTO ARMAZEM (id_documento, local_armazenamento, cod_prateleira, nome_caixa, nome_pasta, data_armazenamento) VALUES
(1, 'Depósito 1', '001', 'Caixa 01', 'Pasta 01', '2022-01-01'),
(2, 'Depósito 1', '001', 'Caixa 01', 'Pasta 01', '2022-01-01'),
(3, 'Depósito 1', '001', 'Caixa 10', 'Pasta 01', '2022-01-01'),
(4, 'Depósito 1', '001', 'Caixa 11', 'Pasta 01', '2022-01-01'),
(5, 'Depósito 1', '001', 'Caixa 12', 'Pasta 01', '2022-01-01'),
(6, 'Depósito 1', '002', 'Caixa 01', 'Pasta 01', '2022-02-18'),
(7, 'Depósito 1', '002', 'Caixa 01', 'Pasta 02', '2022-02-18'),
(8, 'Depósito 1', '002', 'Caixa 01', 'Pasta 03', '2022-02-18'),
(9, 'Depósito 1', '005', 'Caixa 01', 'Pasta 01', '2022-02-15'),
(10, 'Depósito 2', '001', 'Caixa 50', 'Pasta 01', '2022-02-15'),
(11, 'Depósito 2', '001', 'Caixa 50', 'Pasta 01', '2022-02-15'),
(12, 'Depósito 2', '001', 'Caixa 50', 'Pasta 01', '2022-02-15'),
(13, 'Depósito 2', '001', 'Caixa 50', 'Pasta 01', '2022-02-15'),
(14, 'Depósito 2', '001', 'Caixa 51', 'Pasta 04', '2022-02-15'),
(15, 'Depósito 2', '001', 'Caixa 51', 'Pasta 05', '2022-02-15'),
(16, 'Depósito 2', '001', 'Caixa 51', 'Pasta 06', '2022-02-15'),
(17, 'Depósito 2', '008', 'Caixa 07', 'Pasta 07', '2022-03-17'),
(18, 'Depósito 2', '008', 'Caixa 07', 'Pasta 08', '2022-03-17'),
(19, 'Depósito 2', '001', 'Caixa 51', 'Pasta 07', '2022-03-10'),
(20, 'Depósito 2', '008', 'Caixa 07', 'Pasta 05', '2022-03-14'),
(21, 'Depósito 2', '008', 'Caixa 07', 'Pasta 08', '2022-03-14'),
(22, 'Depósito 1', '003', 'Caixa 09', 'Pasta 01', '2022-03-12'),
(23, 'Depósito 1', '003', 'Caixa 09', 'Pasta 01', '2022-03-12');