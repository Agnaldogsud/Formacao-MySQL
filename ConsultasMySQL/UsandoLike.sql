#Consultas Usando Like

select * from tabela_de_produtos tdp 
where SABOR like '%Maça%';


select * from tabela_de_produtos tdp 
where SABOR like '%Maça%' and EMBALAGEM ='PET';

select * from tabela_de_clientes tdc 
where NOME like '%Mattos%'