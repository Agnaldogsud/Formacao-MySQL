select count(*) from tabela_de_clientes tdc  


select CPF, count(*) from notas_fiscais nf 
group by CPF

#traz todos cliente com compras
select distinct A.CPF, A.Nome, B.CPF from tabela_de_clientes A
inner join notas_fiscais B on A.CPF = B.CPF

#traz todos os clientes mesmo sem ter comprado
select distinct A.CPF, A.Nome, B.CPF from tabela_de_clientes A
left join notas_fiscais B on A.CPF = B.CPF
where B.CPF is null