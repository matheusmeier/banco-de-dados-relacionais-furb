-- =====================================================
-- BANCO DE DADOS: BASE_VEICULOS
-- Exercício de modelagem e criação de tabelas
-- SGBD: MySQL
-- =====================================================

CREATE DATABASE base_veiculos;

USE base_veiculos;


-- =====================================================
-- 1. CRIAÇÃO DAS TABELAS
-- =====================================================

CREATE TABLE combustivel (
    cd_combustivel INTEGER,
    ds_combustivel VARCHAR(30)
);

CREATE TABLE marca (
    cd_marca INTEGER,
    ds_marca VARCHAR(30)
);

CREATE TABLE modelo (
    cd_modelo INTEGER,
    cd_marca INTEGER,
    ds_modelo VARCHAR(30)
);

CREATE TABLE localidade (
    cd_localidade INTEGER,
    nm_localidade VARCHAR(50),
    sg_uf CHAR(2)
);

CREATE TABLE proprietario (
    cd_proprietario INTEGER,
    cd_localidade INTEGER,
    nm_proprietario VARCHAR(50),
    ds_logradouro VARCHAR(50),
    ds_complemento VARCHAR(50),
    ds_bairro VARCHAR(50),
    nr_telefone VARCHAR(15),
    ds_email VARCHAR(50)
);

CREATE TABLE veiculo (
    nr_placa CHAR(7),
    cd_proprietario INTEGER,
    cd_modelo INTEGER,
    nr_ano_fab INTEGER,
    nr_ano_mod INTEGER,
    qt_km_rodado INTEGER,
    qt_portas INTEGER,
    ds_observacao VARCHAR(100)
);

CREATE TABLE veiculo_combustivel (
    cd_combustivel INTEGER,
    nr_placa CHAR(7)
);


-- =====================================================
-- 2. DEFINIÇÃO DAS CHAVES PRIMÁRIAS
-- =====================================================

ALTER TABLE localidade
ADD PRIMARY KEY (cd_localidade);

ALTER TABLE marca
ADD PRIMARY KEY (cd_marca);

ALTER TABLE modelo
ADD PRIMARY KEY (cd_modelo);

ALTER TABLE veiculo
ADD PRIMARY KEY (nr_placa);

ALTER TABLE combustivel
ADD PRIMARY KEY (cd_combustivel);

ALTER TABLE proprietario
ADD PRIMARY KEY (cd_proprietario);

ALTER TABLE veiculo_combustivel
ADD PRIMARY KEY (nr_placa, cd_combustivel);


-- =====================================================
-- 3. DEFINIÇÃO DAS CHAVES ESTRANGEIRAS
-- =====================================================

-- Relacionamento entre proprietário e localidade

ALTER TABLE proprietario
ADD FOREIGN KEY (cd_localidade)
REFERENCES localidade (cd_localidade);


-- Relacionamento entre modelo e marca

ALTER TABLE modelo
ADD FOREIGN KEY (cd_marca)
REFERENCES marca (cd_marca);


-- Relacionamentos da tabela veículo

ALTER TABLE veiculo
ADD FOREIGN KEY (cd_modelo)
REFERENCES modelo (cd_modelo),
ADD FOREIGN KEY (cd_proprietario)
REFERENCES proprietario (cd_proprietario);


-- Relacionamentos da tabela veículo e combustível

ALTER TABLE veiculo_combustivel
ADD FOREIGN KEY (cd_combustivel)
REFERENCES combustivel (cd_combustivel),
ADD FOREIGN KEY (nr_placa)
REFERENCES veiculo (nr_placa);


-- =====================================================
-- 4. CRIAÇÃO DAS TABELAS DE ACESSÓRIOS
-- =====================================================

CREATE TABLE acessorio (
    cd_acessorio INT,
    ds_acessorio VARCHAR(50),
    PRIMARY KEY (cd_acessorio)
);

CREATE TABLE veiculo_acessorio (
    nr_placa CHAR(7),
    cd_acessorio INT,
    PRIMARY KEY (nr_placa, cd_acessorio),
    FOREIGN KEY (nr_placa)
        REFERENCES veiculo (nr_placa),
    FOREIGN KEY (cd_acessorio)
        REFERENCES acessorio (cd_acessorio)
);


-- =====================================================
-- 5. CRIAÇÃO DA TABELA DE CORES
-- =====================================================

CREATE TABLE cor (
    cd_cor INT,
    ds_cor VARCHAR(30),
    PRIMARY KEY (cd_cor)
);


-- Adição da coluna de cor à tabela veículo

ALTER TABLE veiculo
ADD COLUMN cd_cor INT;

-- Definição da chave estrangeira para a tabela cor

ALTER TABLE veiculo
ADD FOREIGN KEY (cd_cor)
REFERENCES cor (cd_cor);


-- =====================================================
-- FIM DO SCRIPT
-- =====================================================
