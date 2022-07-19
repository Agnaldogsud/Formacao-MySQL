select embalagem, max(PRECO_DE_LISTA) as MAIOR_PRECO from tabela_de_produtos tdp
group by EMBALAGEM 

select X.EMBALAGEM, X.PRECO_MAXIMO from
(select EMBALAGEM, max(PRECO_DE_LISTA) as PRECO_MAXIMO from tabela_de_produtos tdp 
group by EMBALAGEM) X
where X.PRECO_MAXIMO >= 10;

#criando uma view
create view VW_MAIORES_EMBALAGENS as
select embalagem, max(PRECO_DE_LISTA) as MAIOR_PRECO from tabela_de_produtos tdp
group by EMBALAGEM 

#utilizando a view na query com subselect
select X.embalagem , X.MAIOR_PRECO from
vw_maiores_embalagens X
where X.MAIOR_PRECO >= 10;


select A.NOME_DO_PRODUTO, A.EMBALAGEM, A.PRECO_DE_LISTA, X.MAIOR_PRECO
from tabela_de_produtos A inner join vw_maiores_embalagens X
on A.EMBALAGEM = X.embalagem 


select A.NOME_DO_PRODUTO, A.EMBALAGEM, A.PRECO_DE_LISTA, X.MAIOR_PRECO , ((A.PRECO_DE_LISTA / X.MAIOR_PRECO)-1) * 100 as PERCENTUAL
from tabela_de_produtos A inner join vw_maiores_embalagens X
on A.EMBALAGEM = X.embalagem 

 