#Consultas Usando Like

select * from tabela_de_produtos tdp 
where SABOR like '%Ma�a%';


select * from tabela_de_produtos tdp 
where SABOR like '%Ma�a%' and EMBALAGEM ='PET';

select * from tabela_de_clientes tdc 
where NOME like '%Mattos%'