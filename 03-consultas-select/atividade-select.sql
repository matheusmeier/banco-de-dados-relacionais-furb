-- Questão 1
SELECT *
FROM produto p
WHERE p.vl_venda > 100;

-- Questão 2
SELECT * 
FROM servico s
WHERE s.vl_servico < 50;

-- Questão 3
SELECT a.nm_animal "Nome"
	, a.ds_animal "Descrição"
 	, a.dt_nascimento "Data nascimento"
 	, a.tp_porte "Porte"
FROM animal a 
ORDER BY 3;

-- Questão 4
SELECT nf.nr_notal_fiscal "Número"
	, nf.vl_total "Valor total" 
FROM nota_fiscal nf
WHERE nf.dt_emissao BETWEEN '2024-09-01' AND '2024-09-30';

-- Questão 5
SELECT c.nm_cliente "Nome"
FROM cliente c
WHERE c.ds_email IS NULL;

-- Questão 6
SELECT *
FROM produto p
WHERE p.vl_venda > 9.99
 AND p.qt_estoque >= 100;
 
-- Questão 7
SELECT s.ds_servico "Nome"
		, s.vl_servico "Valor"
FROM servico s
ORDER BY s.vl_servico DESC;

-- Questão 8
SELECT *
FROM prestador_servico ps 
WHERE ps.nr_telefone LIKE '47%';

-- Questão 9
SELECT a.nm_animal "Nome"
		, a.dt_nascimento "Data nascimento"
FROM animal a 
WHERE a.tp_porte = 'G';

-- Questão 10
SELECT * 
FROM cliente c
WHERE c.nm_cliente LIKE '%silva%';

-- Questão 11
SELECT * FROM 
agendamento ag
WHERE ag.dt_agendamento BETWEEN '2024-10-01' 
	AND '2024-10-15';
	
-- Questão 12
SELECT * 
FROM cliente c 
WHERE c.dt_nascimento < '1980-01-01';

-- Questão 13
SELECT * 
FROM categoria cg 
WHERE cg.ds_categoria LIKE '%brinquedo%';

-- Questão 14 
SELECT * 
FROM cliente c 
WHERE c.ds_email LIKE '%@gmail.com%';

-- Questão 15
SELECT * 
FROM produto p 
WHERE p.qt_estoque >= 20 
	AND p.vl_venda < 100;
