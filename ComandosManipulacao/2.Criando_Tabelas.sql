#Criação das tabelas

use vendas_sucos

create database vendas_sucos;

create table PRODUTOS
	(CODIGO varchar(10) not null,
	DESCRITOR varchar(100) null,
	SABOR varchar(50) null,
	TAMANHO varchar(50) null,
	EMBALAGEM varchar(50) null,
	PRECO_LISTA float null,
primary key (CODIGO));

create table VENDEDORES
	(MATRICULA varchar(5) not null,
	NOME varchar(100) null,
	BAIRRO varchar(50) null,
	COMISSAO float null,
	DATA_ADMISSAO date null,
	FERIAS bit(1) null,
	primary key (MATRICULA)
);

create table NOTAS
	(NUMERO varchar(5) not null,
	DATA_VENDA date null,
	CPF varchar(11) not null,
	MATRICULA varchar(5) not null,
	IMPOSTO float null,
	primary key (NUMERO)
);


alter table NOTAS add constraint FK_CLIENTES
foreign key (CPF) REFERENCES CLIENTES(CPF);

create table CLIENTES
	(CPF varchar(11) not null,
	NOME varchar(100) null,
	ENDERECO varchar(150) null,
	BAIRRO varchar(50) null,
	CIDADE varchar(50) null,
	ESTADO varchar(50),
	CEP varchar(8) null,
	DATA_NASCIMENTO date null,
	IDADE int(11) null,
	SEXO varchar(1) null,
	LIMITE_CREDITO float null,
	VOLUME_COMPRA float null,
	PRIMEIRA_COMPRA bit(1),
	primary key (CPF)
);


#CASO NÃO TENHA CRIADO A CHAVE PRIMARIA ANTES



#alter table VENDAS add constraint FK_VENDEDORES
#foreign key (MATRICULA) REFERENCES VENDEDORES(MATRICULA);

CREATE TABLE `itens_notas` (
  `NUMERO` varchar(5) NOT NULL,
  `CODIGO_PRODUTO` varchar(10) NOT NULL,
  `QUANTIDADE` int(32) DEFAULT NULL,
  `PRECO` float DEFAULT NULL,
  PRIMARY KEY (`NUMERO`),
  KEY `CODIGO_PRODUTO` (`CODIGO_PRODUTO`),
  CONSTRAINT `itens_notas_ibfk_1` FOREIGN KEY (`NUMERO`) REFERENCES `notas` (`NUMERO`),
  CONSTRAINT `itens_notas_ibfk_2` FOREIGN KEY (`CODIGO_PRODUTO`) REFERENCES `produtos` (`CODIGO`)
)

alter table vendas rename Notas;



#EXEMPLO DE ALTERAÇÃO DE TABELA
#alter table VENDEDORES rename column DATA_ADMISSAO to DATA_ADIMISSAO