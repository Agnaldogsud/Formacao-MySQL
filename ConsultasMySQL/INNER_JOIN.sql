select * from tabela_de_vendedores tdv 

select * from notas_fiscais nf 


select * from tabela_de_vendedores V
inner join notas_fiscais N ON V.Matricula  = N.Matricula


select V.MATRICULA, V.NOME, Count(*) from tabela_de_vendedores V
inner join notas_fiscais N ON V.Matricula  = N.Matricula
group by V.Matricula, V.NOME


#Obtenha o faturamento anual da empresa. Leve em considereação que o valor financeiro das vendas 
#consiste em multiplicar a quantidade pelo preço


select year(Data_venda) as Ano, Sum(QUANTIDADE * PRECO) as Faturamento_Anual from itens_notas_fiscais I
inner join notas_fiscais N on I.NUMERO = N.NUMERO
group by year(Data_venda)