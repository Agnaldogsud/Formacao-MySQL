#Fun��es no SQL

select ltrim('    Ol�') as Resultado


select rtrim('Ol�    ') as Resultado 


select trim('     Ol�    ') as Resultado 


select concat('Ol�',' ','Tudo bem','?') as Resultado 


select upper('ol� tudo bem?') as Resultado 


select substring('ol�, tudo bem?', 6, 4) as Resultado 


#Fun��o concatenando nome e CPF
select concat(NOME, ' (',CPF, ')') as Resultado from tabela_de_clientes tdc  


# Fa�a uma consulta listando o nome do cliente e o endere�o completo (Com rua, bairro, cidade e estado).

select concat(NOME, ' - ', ENDERECO_1, ' ', ENDERECO_2, ' ', ' - ',BAIRRO, ' - ', CIDADE,' - ',ESTADO)
from tabela_de_clientes tdc  

