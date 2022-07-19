#Relatório de Vendas por Sabor

select * from tabela_de_produtos tdp

select * from itens_notas_fiscais inf

select * from notas_fiscais nf 

#Juntar as 3 tabelas e escolho os campos que eu vou precisar
select tdp.SABOR, nf.DATA_VENDA, inf.QUANTIDADE 
from tabela_de_produtos tdp
inner join itens_notas_fiscais inf ON tdp.CODIGO_DO_PRODUTO = inf.CODIGO_DO_PRODUTO
inner join notas_fiscais nf on inf.NUMERO = nf.NUMERO;

#Aplicar a função do ano, somar a quantidade e agrupar
#Quantidade vendida por sabor ano em 2016
select tdp.SABOR, year(nf.DATA_VENDA) as ANO, sum(inf.QUANTIDADE) as QUANTIDADE
from tabela_de_produtos tdp
inner join itens_notas_fiscais inf ON tdp.CODIGO_DO_PRODUTO = inf.CODIGO_DO_PRODUTO
inner join notas_fiscais nf on inf.NUMERO = nf.NUMERO
where year(nf.DATA_VENDA) = 2016
group by tdp.SABOR, year(nf.DATA_VENDA)


#Preciso descobrir o valor total das vendas em 2016, então retiro as informações do Sabor da coluan e do agrupamento
select year(nf.DATA_VENDA) as ANO, sum(inf.QUANTIDADE) as QUANTIDADE
from tabela_de_produtos tdp
inner join itens_notas_fiscais inf ON tdp.CODIGO_DO_PRODUTO = inf.CODIGO_DO_PRODUTO
inner join notas_fiscais nf on inf.NUMERO = nf.NUMERO
where year(nf.DATA_VENDA) = 2016
group by year(nf.DATA_VENDA)
order by sum(inf.QUANTIDADE) desc;


/*Preciso juntar as duas ultimas consultas para saber a porcentagem referente de cada produto que consegui na primeira consulta 
pelas vendas totais que consegui na segunda consulta*/
#QUANTIDADE DE PRODUTOS VENDIDOS EM 2016

select * from
(select tdp.SABOR, year(nf.DATA_VENDA) as ANO, sum(inf.QUANTIDADE) as QUANTIDADE
from tabela_de_produtos tdp
inner join itens_notas_fiscais inf ON tdp.CODIGO_DO_PRODUTO = inf.CODIGO_DO_PRODUTO
inner join notas_fiscais nf on inf.NUMERO = nf.NUMERO
where year(nf.DATA_VENDA) = 2016
group by tdp.SABOR, year(nf.DATA_VENDA)) as VENDAS_SABOR
inner join
(select year(nf.DATA_VENDA) as ANO, sum(inf.QUANTIDADE) as QUANTIDADE
from tabela_de_produtos tdp
inner join itens_notas_fiscais inf ON tdp.CODIGO_DO_PRODUTO = inf.CODIGO_DO_PRODUTO
inner join notas_fiscais nf on inf.NUMERO = nf.NUMERO
where year(nf.DATA_VENDA) = 2016
group by year(nf.DATA_VENDA)) as VENDA_TOTAL
on VENDAS_SABOR.ANO = VENDA_TOTAL.ANO


/*Depois que juntei as tabelas pego as colunas necessárias e faço o cálculo, e depois coloco em ordem decrescente*/



select VENDAS_SABOR.SABOR, VENDAS_SABOR.ANO, VENDAS_SABOR.QUANTIDADE, round((VENDAS_SABOR.QUANTIDADE/ VENDA_TOTAL.QUANTIDADE) * 100,2) as PARTICIPACAO from
(select tdp.SABOR, year(nf.DATA_VENDA) as ANO, sum(inf.QUANTIDADE) as QUANTIDADE
from tabela_de_produtos tdp
inner join itens_notas_fiscais inf ON tdp.CODIGO_DO_PRODUTO = inf.CODIGO_DO_PRODUTO
inner join notas_fiscais nf on inf.NUMERO = nf.NUMERO
where year(nf.DATA_VENDA) = 2016
group by tdp.SABOR, year(nf.DATA_VENDA)) as VENDAS_SABOR
inner join
(select year(nf.DATA_VENDA) as ANO, sum(inf.QUANTIDADE) as QUANTIDADE
from tabela_de_produtos tdp
inner join itens_notas_fiscais inf ON tdp.CODIGO_DO_PRODUTO = inf.CODIGO_DO_PRODUTO
inner join notas_fiscais nf on inf.NUMERO = nf.NUMERO
where year(nf.DATA_VENDA) = 2016
group by year(nf.DATA_VENDA)) as VENDA_TOTAL
on VENDAS_SABOR.ANO = VENDA_TOTAL.ANO
order by VENDAS_SABOR.QUANTIDADE desc


/* O mesmo relatório do que o de cima só que agora realizando o ranking por tamanho*/
SELECT VENDA_TAMANHO.TAMANHO, VENDA_TAMANHO.ANO, VENDA_TAMANHO.QUANTIDADE,
ROUND((VENDA_TAMANHO.QUANTIDADE/VENDA_TOTAL.QUANTIDADE) * 100, 2) AS PARTICIPACAO FROM 
(SELECT TP.TAMANHO, YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.TAMANHO, YEAR(NF.DATA_VENDA)) AS VENDA_TAMANHO
INNER JOIN 
(SELECT YEAR(NF.DATA_VENDA) AS ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM 
TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)) AS VENDA_TOTAL
ON VENDA_TAMANHO.ANO = VENDA_TOTAL.ANO
ORDER BY VENDA_TAMANHO.QUANTIDADE DESC