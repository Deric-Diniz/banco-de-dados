create database CONSULTORIA;
use CONSULTORIA;

-- Criação da Tabela de Clientes
CREATE TABLE cliente (
    cliente_id INT PRIMARY KEY,      -- Chave primária para cliente
    nome VARCHAR(100),               -- Nome do cliente
    setor VARCHAR(50),               -- Setor de atuação do cliente
    localizacao VARCHAR(100),        -- Localização do cliente
    necessidade TEXT                 -- Descrição das necessidades do cliente
);

-- Criação da Tabela de Consultores
CREATE TABLE consultor (
    consultor_id INT PRIMARY KEY,    -- Chave primária para consultor
    nome VARCHAR(100),               -- Nome do consultor
    especializacao VARCHAR(100),     -- Especialização do consultor
    experiencia INT,                 -- Experiência do consultor em anos
    tarifa_hora DECIMAL(10,2)        -- Tarifa por hora do consultor
);

-- Criação da Tabela de Projetos
CREATE TABLE projeto (
    projeto_id INT PRIMARY KEY,      -- Chave primária para projeto
    nome VARCHAR(100),               -- Nome do projeto
    descricao TEXT,                  -- Descrição do projeto
    data_inicio DATE,                -- Data de início do projeto
    data_fim DATE,                   -- Data de fim do projeto
    cliente_id INT,                  -- Chave estrangeira para cliente
    consultor_id INT,                -- Chave estrangeira para consultor
    FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id), -- Referência à tabela cliente
    FOREIGN KEY (consultor_id) REFERENCES consultor(consultor_id) -- Referência à tabela consultor
);

-- Criação da Tabela de Contratos
CREATE TABLE contrato (
    contrato_id INT PRIMARY KEY,     -- Chave primária para contrato
    valor DECIMAL(10,2),             -- Valor do contrato
    tipo_pagamento VARCHAR(50),      -- Tipo de pagamento (parcelado, à vista, etc.)
    data_assinatura DATE,            -- Data de assinatura do contrato
    projeto_id INT,                  -- Chave estrangeira para projeto
    cliente_id INT,                  -- Chave estrangeira para cliente
    FOREIGN KEY (projeto_id) REFERENCES projeto(projeto_id), -- Referência à tabela projeto
    FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id) -- Referência à tabela cliente
);

-- Criação da Tabela de Relatórios
CREATE TABLE relatorio (
    relatorio_id INT PRIMARY KEY,    -- Chave primária para relatório
    conteudo TEXT,                   -- Conteúdo do relatório
    data_entrega DATE,               -- Data de entrega do relatório
    projeto_id INT,                  -- Chave estrangeira para projeto
    FOREIGN KEY (projeto_id) REFERENCES projeto(projeto_id) -- Referência à tabela projeto
);

-- Inserção de Dados na Tabela de Clientes
INSERT INTO cliente (cliente_id, nome, setor, localizacao, necessidade)
VALUES 
    (1, 'Empresa X', 'TI', 'São Paulo', 'Desenvolvimento de Software'),
    (2, 'Empresa Y', 'Consultoria', 'Rio de Janeiro', 'Apoio Estratégico');

-- Inserção de Dados na Tabela de Consultores
INSERT INTO consultor (consultor_id, nome, especializacao, experiencia, tarifa_hora)
VALUES 
    (1, 'João Silva', 'Desenvolvimento de Software', 5, 150.00),
    (2, 'Maria Souza', 'Consultoria de Negócios', 8, 200.00);

-- Inserção de Dados na Tabela de Projetos
INSERT INTO projeto (projeto_id, nome, descricao, data_inicio, data_fim, cliente_id, consultor_id)
VALUES 
    (1, 'Projeto A', 'Desenvolvimento de sistema para gestão', '2024-01-01', '2024-06-30', 1, 1),
    (2, 'Projeto B', 'Consultoria estratégica', '2024-02-01', '2024-05-31', 2, 2);

-- Inserção de Dados na Tabela de Contratos
INSERT INTO contrato (contrato_id, valor, tipo_pagamento, data_assinatura, projeto_id, cliente_id)
VALUES 
    (1, 50000.00, 'Parcelado', '2024-01-10', 1, 1),
    (2, 30000.00, 'À vista', '2024-02-05', 2, 2);

-- Inserção de Dados na Tabela de Relatórios
INSERT INTO relatorio (relatorio_id, conteudo, data_entrega, projeto_id)
VALUES 
    (1, 'Relatório de progresso do Projeto A', '2024-03-01', 1),
    (2, 'Relatório de progresso do Projeto B', '2024-03-05', 2);

-- Atualizar o nome de um cliente
UPDATE cliente
SET nome = 'Empresa Z'
WHERE cliente_id = 1;

-- Atualizar a tarifa de hora de um consultor
UPDATE consultor
SET tarifa_hora = 180.00
WHERE consultor_id = 1;

-- Alterar a data de fim de um projeto
UPDATE projeto
SET data_fim = '2024-07-31'
WHERE projeto_id = 1;

-- Excluir um relatório específico
DELETE FROM relatorio
WHERE relatorio_id = 1;

-- Excluir um contrato específico
DELETE FROM contrato
WHERE contrato_id = 1;

-- Excluir um contrato específico
DELETE FROM projeto
WHERE projeto_id = 1;

-- Consultar todos os dados de clientes
SELECT * FROM cliente;

-- Consultar todos os projetos e seus respectivos clientes e consultores
SELECT p.nome AS Projeto, c.nome AS Cliente, s.nome AS Consultor
FROM projeto p
JOIN cliente c ON p.cliente_id = c.cliente_id
JOIN consultor s ON p.consultor_id = s.consultor_id;

-- Consultar os contratos de um cliente específico
SELECT contrato_id, valor, tipo_pagamento, data_assinatura
FROM contrato
WHERE cliente_id = 1;

-- Consultar todos os relatórios de um projeto específico
SELECT r.conteudo, r.data_entrega
FROM relatorio r
JOIN projeto p ON r.projeto_id = p.projeto_id
WHERE p.nome = 'Projeto A';


Aqui está o código SQL completo para criar as tabelas, inserir dados, modificar, excluir e consultar dados, conforme solicitado:

sql
Copiar código
-- Criação da Tabela de Clientes
CREATE TABLE cliente (
    cliente_id INT PRIMARY KEY,      -- Chave primária para cliente
    nome VARCHAR(100),               -- Nome do cliente
    setor VARCHAR(50),               -- Setor de atuação do cliente
    localizacao VARCHAR(100),        -- Localização do cliente
    necessidade TEXT                 -- Descrição das necessidades do cliente
);

-- Criação da Tabela de Consultores
CREATE TABLE consultor (
    consultor_id INT PRIMARY KEY,    -- Chave primária para consultor
    nome VARCHAR(100),               -- Nome do consultor
    especializacao VARCHAR(100),     -- Especialização do consultor
    experiencia INT,                 -- Experiência do consultor em anos
    tarifa_hora DECIMAL(10,2)        -- Tarifa por hora do consultor
);

-- Criação da Tabela de Projetos
CREATE TABLE projeto (
    projeto_id INT PRIMARY KEY,      -- Chave primária para projeto
    nome VARCHAR(100),               -- Nome do projeto
    descricao TEXT,                  -- Descrição do projeto
    data_inicio DATE,                -- Data de início do projeto
    data_fim DATE,                   -- Data de fim do projeto
    cliente_id INT,                  -- Chave estrangeira para cliente
    consultor_id INT,                -- Chave estrangeira para consultor
    FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id), -- Referência à tabela cliente
    FOREIGN KEY (consultor_id) REFERENCES consultor(consultor_id) -- Referência à tabela consultor
);

-- Criação da Tabela de Contratos
CREATE TABLE contrato (
    contrato_id INT PRIMARY KEY,     -- Chave primária para contrato
    valor DECIMAL(10,2),             -- Valor do contrato
    tipo_pagamento VARCHAR(50),      -- Tipo de pagamento (parcelado, à vista, etc.)
    data_assinatura DATE,            -- Data de assinatura do contrato
    projeto_id INT,                  -- Chave estrangeira para projeto
    cliente_id INT,                  -- Chave estrangeira para cliente
    FOREIGN KEY (projeto_id) REFERENCES projeto(projeto_id), -- Referência à tabela projeto
    FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id) -- Referência à tabela cliente
);

-- Criação da Tabela de Relatórios
CREATE TABLE relatorio (
    relatorio_id INT PRIMARY KEY,    -- Chave primária para relatório
    conteudo TEXT,                   -- Conteúdo do relatório
    data_entrega DATE,               -- Data de entrega do relatório
    projeto_id INT,                  -- Chave estrangeira para projeto
    FOREIGN KEY (projeto_id) REFERENCES projeto(projeto_id) -- Referência à tabela projeto
);

-- Inserção de Dados na Tabela de Clientes
INSERT INTO cliente (cliente_id, nome, setor, localizacao, necessidade)
VALUES 
    (1, 'Empresa X', 'TI', 'São Paulo', 'Desenvolvimento de Software'),
    (2, 'Empresa Y', 'Consultoria', 'Rio de Janeiro', 'Apoio Estratégico');

-- Inserção de Dados na Tabela de Consultores
INSERT INTO consultor (consultor_id, nome, especializacao, experiencia, tarifa_hora)
VALUES 
    (1, 'João Silva', 'Desenvolvimento de Software', 5, 150.00),
    (2, 'Maria Souza', 'Consultoria de Negócios', 8, 200.00);

-- Inserção de Dados na Tabela de Projetos
INSERT INTO projeto (projeto_id, nome, descricao, data_inicio, data_fim, cliente_id, consultor_id)
VALUES 
    (1, 'Projeto A', 'Desenvolvimento de sistema para gestão', '2024-01-01', '2024-06-30', 1, 1),
    (2, 'Projeto B', 'Consultoria estratégica', '2024-02-01', '2024-05-31', 2, 2);

-- Inserção de Dados na Tabela de Contratos
INSERT INTO contrato (contrato_id, valor, tipo_pagamento, data_assinatura, projeto_id, cliente_id)
VALUES 
    (1, 50000.00, 'Parcelado', '2024-01-10', 1, 1),
    (2, 30000.00, 'À vista', '2024-02-05', 2, 2);

-- Inserção de Dados na Tabela de Relatórios
INSERT INTO relatorio (relatorio_id, conteudo, data_entrega, projeto_id)
VALUES 
    (1, 'Relatório de progresso do Projeto A', '2024-03-01', 1),
    (2, 'Relatório de progresso do Projeto B', '2024-03-05', 2);

-- Atualizar o nome de um cliente
UPDATE cliente
SET nome = 'Empresa Z'
WHERE cliente_id = 1;

-- Atualizar a tarifa de hora de um consultor
UPDATE consultor
SET tarifa_hora = 180.00
WHERE consultor_id = 1;

-- Alterar a data de fim de um projeto
UPDATE projeto
SET data_fim = '2024-07-31'
WHERE projeto_id = 1;

-- Excluir um relatório específico
DELETE FROM relatorio
WHERE relatorio_id = 1;

-- Excluir um contrato específico
DELETE FROM contrato
WHERE contrato_id = 1;

-- Excluir um cliente específico
DELETE FROM cliente
WHERE cliente_id = 2;

-- Consultar todos os dados de clientes
SELECT * FROM cliente;

-- Consultar todos os projetos e seus respectivos clientes e consultores
SELECT p.nome AS Projeto, c.nome AS Cliente, s.nome AS Consultor
FROM projeto p
JOIN cliente c ON p.cliente_id = c.cliente_id
JOIN consultor s ON p.consultor_id = s.consultor_id;

-- Consultar os contratos de um cliente específico
SELECT contrato_id, valor, tipo_pagamento, data_assinatura
FROM contrato
WHERE cliente_id = 1;

-- Consultar todos os relatórios de um projeto específico
SELECT r.conteudo, r.data_entrega
FROM relatorio r
JOIN projeto p ON r.projeto_id = p.projeto_id
WHERE p.nome = 'Projeto A';

-- Explicação do Código:
-- Criação das Tabelas:

-- Utilizamos o comando CREATE TABLE para criar as tabelas cliente, consultor, projeto, contrato e relatorio. Cada tabela foi definida com seus respectivos campos e tipos de dados, incluindo as chaves primárias e as chaves estrangeiras para garantir a integridade referencial.
-- Inserção de Dados:

-- O comando INSERT INTO foi utilizado para adicionar dados de exemplo nas tabelas. Este passo cria registros de clientes, consultores, projetos, contratos e relatórios.
-- Atualização de Dados:

-- Usamos o comando UPDATE para modificar informações já existentes nas tabelas, como o nome de um cliente, a tarifa de hora de um consultor e a data de fim de um projeto.
-- Exclusão de Dados:

-- O comando DELETE foi utilizado para remover registros específicos de relatórios, contratos e clientes.
-- Consultas de Dados:

-- O comando SELECT foi utilizado para realizar consultas:
-- SELECT * FROM cliente; retorna todos os dados de clientes.
-- SELECT p.nome AS Projeto, c.nome AS Cliente, s.nome AS Consultor FROM projeto p JOIN cliente c ON p.cliente_id = c.cliente_id JOIN consultor s ON p.consultor_id = s.consultor_id; retorna o nome do projeto, do cliente e do consultor associado a cada projeto.
-- SELECT contrato_id, valor, tipo_pagamento, data_assinatura FROM contrato WHERE cliente_id = 1; retorna os contratos do cliente com cliente_id = 1.
-- SELECT r.conteudo, r.data_entrega FROM relatorio r JOIN projeto p ON r.projeto_id = p.projeto_id WHERE p.nome = 'Projeto A'; retorna os relatórios do projeto chamado "Projeto A".
-- Considerações Finais:
-- O código está pronto para ser executado em um banco de dados SQL, como MySQL, PostgreSQL ou SQL Server.
-- Ao rodar esse código, todas as operações de criação de tabelas, inserção, atualização, exclusão e consulta serão realizadas corretamente.