use sucos_vendas

select ESTADO, SUM(LIMITE_DE_CREDITO) as SOMA_LIMITE from tabela_de_clientes tdc 
group by ESTADO


#Não da serto com where porque ainda não foi agrupado
select ESTADO, SUM(LIMITE_DE_CREDITO) as SOMA_LIMITE from tabela_de_clientes tdc 
where SOMA_LIMITE > 90000
group by ESTADO

#Having
select ESTADO, SUM(LIMITE_DE_CREDITO) as SOMA_LIMITE from tabela_de_clientes tdc 
group by ESTADO
having SUM(LIMITE_DE_CREDITO) > 900000


select EMBALAGEM, MAX(PRECO_DE_LISTA) as MAIOR_PRECO, MIN(PRECO_DE_LISTA) as MENOR_PRECO from tabela_de_produtos tdp
group by EMBALAGEM


select EMBALAGEM, MAX(PRECO_DE_LISTA) as MAIOR_PRECO, MIN(PRECO_DE_LISTA) as MENOR_PRECO from tabela_de_produtos tdp
group by EMBALAGEM
having SUM(PRECO_DE_LISTA) <= 80


select EMBALAGEM, MAX(PRECO_DE_LISTA) as MAIOR_PRECO, MIN(PRECO_DE_LISTA) as MENOR_PRECO from tabela_de_produtos tdp
group by EMBALAGEM
having SUM(PRECO_DE_LISTA) <= 80 and MAX(PRECO_DE_LISTA) >= 5;


#Clientes que fizeram mais compras em 2016
select CPF, COUNT(*) from notas_fiscais nf where year(DATA_VENDA) = 2016
group by CPF
having count(*) > 2000