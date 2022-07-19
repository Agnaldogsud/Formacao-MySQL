#Consultas lógicas AND, OR, NOT, IN >= <=

select * from tabela_de_produtos tdp 
where sabor = 'Manga' or TAMANHO = '470 ml';

select * from tabela_de_produtos tdp 
where sabor = 'Manga' and TAMANHO = '470 ml';

select * from tabela_de_produtos tdp 
where not(sabor = 'Manga' or TAMANHO = '470 ml');

#in
select * from tabela_de_produtos tdp 
where SABOR in ("Laranja","Manga");

select * from tabela_de_clientes tdc 
where CIDADE in ("Rio de Janeiro","São Paulo") and IDADE >= 20

select * from tabela_de_clientes tdc 
where CIDADE in ("Rio de Janeiro","São Paulo") and (IDADE >= 20 and IDADE <=22)