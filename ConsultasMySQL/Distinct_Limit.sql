use sucos_vendas

#DISTINCT
select distinct  Embalagem, Tamanho, SABOR	32 
from tabela_de_produtos tdp
where sabor = 'Laranja'

select distinct BAIRRO
from tabela_de_clientes tdc
where CIDADE = 'Rio de Janeiro'

#LIMIT
select * from tabela_de_produtos tdp

select * from tabela_de_produtos tdp limit 5;

#Tira a quantidade do primeiro número e pega a quantidade dos números depois da virgula
select * from tabela_de_produtos tdp limit 2,3;


#Primeiras vendas do dia 01/01/2017

select * from notas_fiscais nf
where DATA_VENDA = "2017-01-01"
limit 10