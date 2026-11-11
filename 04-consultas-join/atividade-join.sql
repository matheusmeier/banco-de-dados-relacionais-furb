-- 1. Selecione os nomes dos clientes e os respectivos nomes dos animais cadastrados.
SELECT c.nm_cliente "Nome cliente", a.nm_animal "Nome animal"
FROM cliente c JOIN animal a ON (a.cd_cliente = c.cd_cliente);

-- 2. Liste os detalhes dos produtos e as descrições de suas categorias.
SELECT p.ds_produto "Descrição produto", c.ds_categoria "Descrição categoria"
FROM produto p JOIN categoria c ON (p.cd_categoria = c.cd_categoria);


-- 3. Mostre os agendamentos com as informações do prestador de serviço associado.
SELECT ps.nm_prestador "Nome prestador(a)", a.dt_agendamento "Data agendamento", a.hr_agendamento "Hora agendamento" 
FROM agendamento a JOIN prestador_servico ps ON (a.cd_prestador = ps.cd_prestador);

-- 4. Liste os serviços agendados e as descrições de cada serviço.
SELECT s.ds_servico "Descrição serviço" 
FROM servico s JOIN agendamento_servico a ON (a.cd_servico = s.cd_servico); 

-- 5. Selecione os nomes dos prestadores e os serviços que eles prestam.
SELECT ps.nm_prestador "Nome prestador(a)", s.ds_servico "Descrição serviço"
FROM prestador_servico ps
JOIN servico_prestador sp 
	ON (sp.cd_prestador = ps.cd_prestador)
JOIN servico s 
	ON (sp.cd_servico = s.cd_servico);

-- 6. Mostre as notas fiscais e os nomes dos clientes que as receberam.
SELECT nf.nr_notal_fiscal "Nro. nota fiscal", nf.dt_emissao "Data emissão", nf.vl_total "Valor total: R$", c.nm_cliente "Nome cliente"
FROM nota_fiscal nf JOIN cliente c ON (nf.cd_cliente = c.cd_cliente);

-- 7. Liste os itens de nota fiscal e os respectivos nomes dos produtos.
SELECT p.nm_produto "Nome produto", inf.qt_produto "Qntd. produto na NF", inf.vl_produto "Valor produto na NF" 
FROM nota_fiscal nf
JOIN item_nota_fiscal inf
	ON (inf.nr_notal_fiscal = nf.nr_notal_fiscal)
JOIN produto p 
	ON (inf.cd_produto = p.cd_produto);
	
-- 8. Selecione os nomes dos animais, suas raças e suas respectivas espécies.
SELECT a.nm_animal "Nome animal", r.nm_raca "Raça", e.nm_especie "Espécie"
FROM animal a
JOIN raca r
    ON (a.cd_raca = r.cd_raca)
JOIN especie e
    ON (r.cd_especie = e.cd_especie);


-- 9. Mostre os agendamentos e os nomes dos clientes e animais associados.
SELECT ag.nr_agendamento "Nro. agendamento", ag.dt_agendamento "Data agendamento", ag.hr_agendamento "Horário agendamento", c.nm_cliente "Nome cliente", a.nm_animal "Nome animal"
FROM agendamento ag
JOIN cliente c
	ON (ag.cd_cliente = c.cd_cliente)
JOIN animal a
	ON (ag.cd_animal = a.cd_animal);

-- 10. Liste os endereços dos clientes, mostrando o logradouro e o município.
SELECT e.ds_logradouro "Logradouro endereço", m.nm_municipio "Nome município"
FROM cliente c
JOIN endereco e
	ON (c.cd_endereco = e.cd_endereco)
JOIN municipio m
	ON (e.cd_municipio = m.cd_municipio); 
	
-- 11. Selecione os prestadores de serviço e os municípios em que seus endereços estão localizados.
SELECT ps.nm_prestador "Nome prestador(a)", m.nm_municipio "Município"
FROM prestador_servico ps
JOIN endereco e
	ON (ps.cd_endereco = e.cd_endereco)
JOIN municipio m
	ON (e.cd_municipio = m.cd_municipio);

-- 12. Mostre as notas fiscais e os produtos comprados, junto com as quantidades e valores.
SELECT nf.dt_emissao "Data emissão NF", p.nm_produto "Nome produto", inf.qt_produto "Qntd. comprada", inf.vl_produto "Valor produto"
FROM nota_fiscal nf
JOIN item_nota_fiscal inf
	ON (inf.nr_notal_fiscal = nf.nr_notal_fiscal)
JOIN produto p
	ON (inf.cd_produto = p.cd_produto);

-- 13. Liste os agendamentos e os serviços prestados, mostrando os valores totais dos serviços agendados.
SELECT ag.nr_agendamento "Nro. agendamento", s.ds_servico "Descrição serviço", ags.qt_servico * ags.vl_servico "Valor serviço: R$"
FROM agendamento_servico ags
JOIN agendamento ag 
    ON (ags.nr_agendamento = ag.nr_agendamento)
JOIN servico s 
    ON (ags.cd_servico = s.cd_servico);


-- 14. Selecione os prestadores de serviço que realizam serviços de valor superior a R$ 100,00.
SELECT ps.nm_prestador "Nome prestador(a)", s.ds_servico "Descrição serviço", s.vl_servico "Valor serviço: R$"
FROM servico_prestador sp
JOIN prestador_servico ps
	ON (sp.cd_prestador = ps.cd_prestador)
JOIN servico s
	ON (sp.cd_servico = s.cd_servico)
WHERE s.vl_servico > 100;


-- 15. Liste os animais, suas raças e as espécies a que pertencem, filtrando apenas as raças com nome "Poodle".
SELECT a.nm_animal "Nome animal", r.nm_raca "Raça animal", e.nm_especie "Espécie animal"
FROM raca r
JOIN animal a
	ON (a.cd_raca = r.cd_raca)
JOIN especie e
	ON (r.cd_especie = e.cd_especie)
WHERE r.nm_raca LIKE "Pood%";
