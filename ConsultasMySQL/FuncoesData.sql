#mostrar data e tempo no momento

select current_timestamp() 

select current_time()

select curdate() 


#Mostrar o dia mês e ano da data selecionado e o nome
select day(current_timestamp())

select month(current_timestamp()) 

select monthname(current_timestamp()) 


#diferença de datas até hoje
select datediff(current_timestamp(), '2022-01-01') as resultado

select datediff(current_timestamp(), '1996-04-15')as resultado 


#Tempo anterior da data de hoje 
select current_timestamp() as Dia_de_Hoje,  date_sub(current_timestamp(), interval 5 day) as Resultado  


select distinct DATA_VENDA, dayname(DATA_VENDA) as DIA, monthname(DATA_VENDA) as MES, year(DATA_VENDA) as ANO from notas_fiscais nf 

#Crie uma consulta que mostre o nome e a idade atual dos clientes.
SELECT NOME, TIMESTAMPDIFF (YEAR, DATA_DE_NASCIMENTO, CURDATE()) AS    IDADE
FROM  tabela_de_clientes

