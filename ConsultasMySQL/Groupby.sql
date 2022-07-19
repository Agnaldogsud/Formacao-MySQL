use sucos_vendas

#group by

select Estado, Bairro, SUM(LIMITE_DE_CREDITO) as Limite
from tabela_de_clientes tdc
where cidade = 'Rio de Janeiro'
group by ESTADO, BAIRRO 
order by Bairro;