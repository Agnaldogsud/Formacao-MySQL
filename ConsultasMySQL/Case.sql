use sucos_vendas

select * from tabela_de_produtos tdp


select NOME_DO_PRODUTO, PRECO_DE_LISTA,
case 
	when PRECO_DE_LISTA >= 12 then 'Produto Caro'
 	when PRECO_DE_LISTA >= 7 and PRECO_DE_LISTA < 12 then 'Produto em conta'
	else 'Produto Barato'
end as STATUS_PRECO
from tabela_de_produtos tdp;


select EMBALAGEM,
case 
	when PRECO_DE_LISTA >= 12 then 'Produto Caro'
 	when PRECO_DE_LISTA >= 7 and PRECO_DE_LISTA < 12 then 'Produto em conta'
	else 'Produto Barato'
end as STATUS_PRECO, avg(PRECO_DE_LISTA) as PRECO_MEDIO
from tabela_de_produtos tdp
group by embalagem, case 
	when PRECO_DE_LISTA >= 12 then 'Produto Caro'
 	when PRECO_DE_LISTA >= 7 and PRECO_DE_LISTA < 12 then 'Produto em conta'
	else 'Produto Barato'
end


#Veja o ano de Nascimento dos clientes e classifique-os como: Nascidos antes de 1990 são velhos, 
#nascidos entre 1990 e 1995 são jovens e nascidos depois de de 1995 são crianças. 
#Liste o nome do cliente e esta classificação

select NOME,
case
	when year(DATA_DE_NASCIMENTO) < 1990 then 'Velho'
	when year(DATA_DE_NASCIMENTO) >= 1990 and year(DATA_DE_NASCIMENTO) <= 1995 then 'Jovem'
	else 'Criança'
end as Clientes_Idade
from tabela_de_clientes tdc