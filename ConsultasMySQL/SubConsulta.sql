#traz todos os bairros dos vendedores
select distinct bairro from tabela_de_vendedores tdv 

#traz todos os bairros dos vendedores que tem clientes esctevendo o nome do bairsso
select * from tabela_de_clientes tdc where bairro in ('Tijuca', 'Jardins', 'Copacabana', 'Santo Amaro')

#traz todos os bairros dos vendedores que tem clientes com subquery
select * from tabela_de_clientes tdc where bairro in (select distinct bairro from tabela_de_vendedores tdv)

select X.EMBALAGEM, X.PRECO_MAXIMO from
(select EMBALAGEM, max(PRECO_DE_LISTA) as PRECO_MAXIMO from tabela_de_produtos tdp 
group by EMBALAGEM) X
where X.PRECO_MAXIMO >= 10;


#Qual seria a consulta usando subconsulta que seria equivalente a:

  SELECT CPF, COUNT(*) FROM notas_fiscais
  WHERE YEAR(DATA_VENDA) = 2016
  GROUP BY CPF
  HAVING COUNT(*) > 2000
  
  #usando Subconsulta
  select X.CPF, X.CONTADOR from
  (select CPF, count(*) as contador from notas_fiscais nf
  where year(DATA_VENDA) = 2016
  group by CPF) X 
  where CONTADOR >= 2000
  

