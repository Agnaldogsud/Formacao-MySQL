#Relatório de Vendas

select * from itens_notas_fiscais inf;

select * from notas_fiscais nf;


select * from notas_fiscais nf 
inner join itens_notas_fiscais inf on nf.NUMERO = inf.NUMERO 


select nf.CPF, nf.DATA_VENDA, inf.QUANTIDADE from notas_fiscais nf 
inner join itens_notas_fiscais inf on nf.NUMERO = inf.NUMERO


select nf.CPF, date_format(nf.DATA_VENDA, '%Y-%m') as Mes_Ano, inf.QUANTIDADE from notas_fiscais nf 
inner join itens_notas_fiscais inf on nf.NUMERO = inf.NUMERO 

/*Consulta com vendas de Clientes por Mes*/
select nf.CPF, date_format(nf.DATA_VENDA, '%Y-%m') as Mes_Ano, 
sum(inf.QUANTIDADE) as Quantidade_Vendas from notas_fiscais nf 
inner join itens_notas_fiscais inf on nf.NUMERO = inf.NUMERO
group by nf.CPF, date_format(nf.DATA_VENDA, '%Y-%m');


/*Limite de compra por cliente */

SELECT X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE,
CASE 
    WHEN (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 THEN 'INVÁLIDA'
    ELSE 'VÁLIDA' 
END AS STATUS_VENDA
FROM (
SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO, 
SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS , 
MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN TABELA_DE_CLIENTES TC 
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')) X;

/*Nesta aula construímos um relatório que apresentou os clientes que tiveram vendas inválidas. 
Complemente este relatório listando somente os que tiveram vendas inválidas e calculando a diferença 
entre o limite de venda máximo e o realizado, em percentuais.*/

SELECT X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE,
CASE WHEN (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 THEN 'INVÁLIDA'
ELSE 'VÁLIDA' END AS STATUS_VENDA, (1 - (X.QUANTIDADE_LIMITE/X.QUANTIDADE_VENDAS)) * 100 AS PERCENTUAL
FROM (SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO
, SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS 
, MAX(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN TABELA_DE_CLIENTES TC 
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')) X
WHERE (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0;