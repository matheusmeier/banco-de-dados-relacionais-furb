-- =====================================================
-- BANCO DE DADOS: PETSHOP
-- Exercício de modelagem e criação de tabelas
-- SGBD: MySQL
-- =====================================================

CREATE DATABASE petshop;

USE petshop;


-- =====================================================
-- 1. TABELAS DE ESPÉCIES E RAÇAS
-- =====================================================

CREATE TABLE especie (
    cd_especie INT,
    nm_especie VARCHAR(30),
    PRIMARY KEY (cd_especie)
);

CREATE TABLE raca (
    cd_raca INT,
    nm_raca VARCHAR(50),
    cd_especie INT,
    PRIMARY KEY (cd_raca),
    FOREIGN KEY (cd_especie)
        REFERENCES especie(cd_especie)
);


-- =====================================================
-- 2. TABELAS DE MUNICÍPIO E ENDEREÇO
-- =====================================================

CREATE TABLE municipio (
    cd_municipio INT,
    nm_municipio VARCHAR(50),
    sg_uf CHAR(2),
    PRIMARY KEY (cd_municipio)
);

CREATE TABLE endereco (
    cd_endereco INT,
    ds_logradouro VARCHAR(50),
    ds_complemen VARCHAR(50),
    nm_bairro VARCHAR(30),
    nr_cep CHAR(8),
    cd_municipio INT,
    PRIMARY KEY (cd_endereco),
    FOREIGN KEY (cd_municipio)
        REFERENCES municipio(cd_municipio)
);


-- =====================================================
-- 3. TABELAS DE CLIENTES E ANIMAIS
-- =====================================================

CREATE TABLE cliente (
    cd_cliente INT,
    nm_cliente VARCHAR(50),
    nr_telefone VARCHAR(15),
    ds_email VARCHAR(50),
    dt_nascimento DATE,
    cd_endereco INT,
    PRIMARY KEY (cd_cliente),
    FOREIGN KEY (cd_endereco)
        REFERENCES endereco(cd_endereco)
);

CREATE TABLE animal (
    cd_animal INT,
    nm_animal VARCHAR(50),
    ds_animal VARCHAR(50),
    dt_nascimento DATE,
    tp_porte CHAR(1),
    cd_raca INT,
    cd_cliente INT,
    PRIMARY KEY (cd_animal),
    FOREIGN KEY (cd_raca)
        REFERENCES raca(cd_raca),
    FOREIGN KEY (cd_cliente)
        REFERENCES cliente(cd_cliente)
);


-- =====================================================
-- 4. TABELA DE CATEGORIAS
-- =====================================================

CREATE TABLE categoria (
    cd_categoria INT,
    ds_categoria VARCHAR(50),
    PRIMARY KEY (cd_categoria)
);


-- =====================================================
-- 5. TABELAS DE PRODUTOS E NOTAS FISCAIS
-- =====================================================

CREATE TABLE produto (
    cd_produto INT,
    nm_produto VARCHAR(50),
    ds_produto VARCHAR(50),
    vl_custo DECIMAL(8,2),
    vl_venda DECIMAL(8,2),
    qt_estoque INT,
    cd_categoria INT,
    PRIMARY KEY (cd_produto),
    FOREIGN KEY (cd_categoria)
        REFERENCES categoria(cd_categoria)
);

CREATE TABLE nota_fiscal (
    nr_nota_fiscal INT,
    dt_emissao DATE,
    cl_total DECIMAL(8,2),
    cd_cliente INT,
    PRIMARY KEY (nr_nota_fiscal),
    FOREIGN KEY (cd_cliente)
        REFERENCES cliente(cd_cliente)
);


-- =====================================================
-- 6. TABELA DE ITENS DA NOTA FISCAL
-- =====================================================

CREATE TABLE item_nota_fiscal (
    nr_nota_fiscal INT,
    cd_produto INT,
    qt_produto INT,
    vl_produto DECIMAL(8,2),
    PRIMARY KEY (nr_nota_fiscal, cd_produto),
    FOREIGN KEY (nr_nota_fiscal)
        REFERENCES nota_fiscal(nr_nota_fiscal),
    FOREIGN KEY (cd_produto)
        REFERENCES produto(cd_produto)
);
