select distinct bairro from tabela_de_clientes tdc

select distinct bairro from tabela_de_vendedores tdv 


select distinct bairro from tabela_de_clientes tdc
union
select distinct bairro from tabela_de_vendedores tdv 


select distinct bairro from tabela_de_clientes tdc
union all
select distinct bairro from tabela_de_vendedores tdv 


select distinct bairro, nome, 'Cliente' from tabela_de_clientes tdc
union
select distinct bairro, nome, 'Vendedor' from tabela_de_vendedores tdv