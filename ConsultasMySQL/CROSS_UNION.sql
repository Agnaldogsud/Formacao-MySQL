select * from tabela_de_vendedores tdv 

select * from tabela_de_clientes tdc 

select A.BAIRRO, A.NOME, B.BAIRRO, B.NOME, DE_FERIAS from tabela_de_vendedores A 
inner join tabela_de_clientes B on A.BAIRRO = B.BAIRRO



select A.BAIRRO, A.NOME, B.BAIRRO, B.NOME, DE_FERIAS from tabela_de_vendedores A 
left join tabela_de_clientes B on A.BAIRRO = B.BAIRRO 


select A.BAIRRO, A.NOME, B.BAIRRO, B.NOME, DE_FERIAS from tabela_de_vendedores A 
right join tabela_de_clientes B on A.BAIRRO = B.BAIRRO 

#Cross join (Analise combinat�ria)
select A.BAIRRO, A.NOME, B.BAIRRO, B.NOME, DE_FERIAS from tabela_de_vendedores A ,tabela_de_clientes B;

#MYSQL n�o suporta o Full join
select A.BAIRRO, A.NOME, B.BAIRRO, B.NOME, DE_FERIAS from tabela_de_vendedores A 
full join tabela_de_clientes B on A.BAIRRO = B.BAIRRO 