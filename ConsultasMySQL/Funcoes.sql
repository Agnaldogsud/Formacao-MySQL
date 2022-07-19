#Funções no SQL

select ltrim('    Olá') as Resultado


select rtrim('Olá    ') as Resultado 


select trim('     Olá    ') as Resultado 


select concat('Olá',' ','Tudo bem','?') as Resultado 


select upper('olá tudo bem?') as Resultado 


select substring('olá, tudo bem?', 6, 4) as Resultado 


#Função concatenando nome e CPF
select concat(NOME, ' (',CPF, ')') as Resultado from tabela_de_clientes tdc  


# Faça uma consulta listando o nome do cliente e o endereço completo (Com rua, bairro, cidade e estado).

select concat(NOME, ' - ', ENDERECO_1, ' ', ENDERECO_2, ' ', ' - ',BAIRRO, ' - ', CIDADE,' - ',ESTADO)
from tabela_de_clientes tdc  

