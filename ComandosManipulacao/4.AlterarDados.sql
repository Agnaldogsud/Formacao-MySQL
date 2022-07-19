select * from produtos p

#alterando o preço de lista
update produtos set preco_lista = 5 where CODIGO = 1040107;

#alterando algumas informações do produto
update produtos set EMBALAGEM = "PET", TAMANHO = "1 Litro",
DESCRITOR = "Sabor da Montanha - 1 Litro - Uva" 
where CODIGO = 1040108;

#alterando todas as linhas de uma certa coluna
update produtos set PRECO_LISTA = PRECO_LISTA *1.10