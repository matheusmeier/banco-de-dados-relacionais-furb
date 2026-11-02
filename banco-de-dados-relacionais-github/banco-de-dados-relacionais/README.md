# Banco de Dados Relacionais — Estudos em SQL

Repositório acadêmico com exercícios desenvolvidos durante os estudos de Banco de Dados na graduação em Ciência de Dados da FURB.

Os arquivos apresentam práticas de criação e estruturação de bancos de dados relacionais utilizando SQL, com foco no **MySQL**.

## Conteúdo

### 1. Modelagem e DDL

Scripts voltados à criação de bancos de dados e tabelas, definição de chaves primárias e estrangeiras e estruturação de relacionamentos.

- **Petshop (`petshop.sql`):** estrutura de um banco de dados para um petshop, incluindo espécies, raças, clientes, animais, produtos, notas fiscais e itens de nota fiscal.
- **Veículos (`veiculos.sql`):** estrutura de um banco de dados de veículos, incluindo proprietários, localidades, marcas, modelos, combustíveis, acessórios e cores.

### 2. Comandos DML

- **`comandos-dml.sql`:** exercícios de manipulação e consulta de dados, incluindo `INSERT`, `UPDATE`, `DELETE` e `SELECT`, além de alterações na estrutura das tabelas com `ALTER TABLE`.

## Estrutura do repositório

```text
banco-de-dados-relacionais/
├── README.md
├── .gitignore
├── 01-modelagem-e-ddl/
│   ├── petshop/
│   │   └── petshop.sql
│   └── veiculos/
│       └── veiculos.sql
└── 02-comandos-dml/
    └── comandos-dml.sql
```

## Tecnologias

- SQL
- MySQL
- MySQL Workbench

## Como executar

1. Instale ou abra uma ferramenta compatível com MySQL, como o MySQL Workbench.
2. Abra o arquivo `.sql` desejado.
3. Conecte-se a uma instância do MySQL.
4. Execute o script.

**Importante:** cada exercício cria seu próprio banco de dados (`petshop`, `base_veiculos` ou `aula_comandos_DML`). Os scripts são independentes; execute-os separadamente. Como utilizam comandos `CREATE DATABASE` sem `IF NOT EXISTS`, a execução repetida poderá gerar erro caso o banco já exista.

## Observações

Este repositório reúne exercícios e práticas acadêmicas. Os scripts têm finalidade educacional e representam etapas do aprendizado de modelagem relacional, DDL e DML.
