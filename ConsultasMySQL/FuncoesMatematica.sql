
#arredonda pra cima
select ceiling(12.3333) as resultado

#arredonda pro mais próximo
select round(12.7777) as resultado

#arredonda pra baixo
select floor(12.7777) as resultado

#Número aleatório
select rand() as resultado

#arredondar conta usando o round
select numero, quantidade, preco, QUANTIDADE * PRECO as Faturamento
from itens_notas_fiscais inf 

select numero, quantidade, preco, round(QUANTIDADE * PRECO, 2) as Faturamento
from itens_notas_fiscais inf 


#Na tabela de notas fiscais temos o valor do imposto. Já na tabela de itens temos a quantidade e o faturamento. 
#Calcule o valor do imposto pago no ano de 2016 arredondando para o menor inteiro.

select * from notas_fiscais nf

select * from itens_notas_fiscais inf

select year(data_venda), floor(SUM(IMPOSTO *(QUANTIDADE * PRECO))) as Total
from notas_fiscais A
inner join itens_notas_fiscais B on A.NUMERO = B.NUMERO
where year(DATA_VENDA) = 2016
group by year(DATA_VENDA)
