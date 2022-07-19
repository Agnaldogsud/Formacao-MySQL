use sucos_vendas;

select * from tabela_de_clientes tdc

select CPF, NOME from tabela_de_clientes tdc

select CPF as Identificador, NOME as Cliente from tabela_de_clientes tdc


select * from tabela_de_produtos tdp 

#usando o where
select * from tabela_de_produtos tdp
where CODIGO_DO_PRODUTO = '1000889';

select * from tabela_de_produtos tdp 
where SABOR = 'Laranja'

select * from tabela_de_produtos tdp 
where EMBALAGEM ='PET'

select * from tabela_de_produtos tdp 
where PRECO_DE_LISTA = 19.51;

#Between
select * from tabela_de_produtos tdp 
where PRECO_DE_LISTA between 19.50 and 19.52;
