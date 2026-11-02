-- =====================================================
-- BANCO DE DADOS: aula_comandos_DML
-- Exercícios de DDL e DML
-- SGBD: MySQL
-- =====================================================

CREATE DATABASE aula_comandos_DML;

USE aula_comandos_DML;


-- =====================================================
-- 1. CRIAÇÃO DAS TABELAS
-- =====================================================

CREATE TABLE categoria (
    cd_categoria INT AUTO_INCREMENT,
    nm_categoria VARCHAR(50) NOT NULL,
    PRIMARY KEY (cd_categoria)
);

CREATE TABLE produto (
    cd_produto INT PRIMARY KEY,
    cd_categoria INT,
    nm_produto VARCHAR(50),
    qt_estoque INT DEFAULT 0,
    vl_venda DECIMAL(8,2) CHECK (vl_venda > 0.00),
    FOREIGN KEY (cd_categoria) REFERENCES categoria(cd_categoria)
);


-- =====================================================
-- 2. OPERAÇÕES COM A TABELA CATEGORIA
-- =====================================================

-- Inserção de categorias

INSERT INTO categoria
VALUES (10, 'Categoria 10');

INSERT INTO categoria (nm_categoria)
VALUES ('Categoria YY');


-- Alteração da estrutura da tabela

ALTER TABLE categoria
MODIFY COLUMN nm_categoria VARCHAR(30) NULL;


-- Inserção de valor nulo

INSERT INTO categoria (nm_categoria)
VALUES (NULL);


-- Adição de restrição UNIQUE

ALTER TABLE categoria
ADD CONSTRAINT categoria_nm_categoria_uk UNIQUE (nm_categoria);


-- Exclusão de registros

DELETE FROM categoria
WHERE nm_categoria IS NULL;


-- Consulta da estrutura e dos registros

DESC categoria;

SELECT * FROM categoria;


-- =====================================================
-- 3. OPERAÇÕES COM A TABELA PRODUTO
-- =====================================================

-- Alteração da coluna para geração automática de códigos

ALTER TABLE produto
MODIFY COLUMN cd_produto INT AUTO_INCREMENT;


-- Inserção de produtos

INSERT INTO produto (nm_produto)
VALUES
    ('Produto 100'),
    ('Produto 101'),
    ('Produto 102'),
    ('Produto 103'),
    ('Produto 104'),
    ('Produto 105');


-- Inserção de produto com estoque nulo

INSERT INTO produto (nm_produto, qt_estoque)
VALUES ('Produto 106', NULL);


-- Inserção de produto com valor de venda

INSERT INTO produto (nm_produto, vl_venda)
VALUES ('Produto Z', 0.01);


-- Atualização de registros com valor de venda nulo

UPDATE produto
SET cd_categoria = 10
WHERE vl_venda IS NULL;


-- Atualização de registros com valor de venda não nulo

UPDATE produto
SET cd_categoria = 11
WHERE vl_venda IS NOT NULL;


-- Atualização de todos os registros da tabela

UPDATE produto
SET cd_categoria = 11;


-- Alteração da coluna para impedir valores nulos

ALTER TABLE produto
MODIFY COLUMN cd_categoria INT NOT NULL;


-- Atualização de informações de um produto específico

UPDATE produto
SET
    nm_produto = 'Produto Y Top',
    qt_estoque = 1000,
    vl_venda = 1.99,
    cd_categoria = 10
WHERE cd_produto = 102;


-- Consulta da estrutura e dos registros

DESC produto;

SELECT * FROM produto;
