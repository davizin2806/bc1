create schema EMPRESA;

use EMPRESA;

create table if not exists FORNECEDORES(
CONSTRAINT fk_forn FOREIGN KEY(FORNECEDORES)
references FORNCEDORES(id_forn);
id_forn int primary key,
nome_forn varchar(50) not null,
end_forn varchar(100) not null,
pais_forn varchar(50) not null,
tel_forn int,
contato_forn varchar(100) not null;
);

create table if not exists PRODUTOS(
CONSTRAINT fk_prod FOREIGN KEY(PRODUTOS)
REFERENCES PRODUTOS(id_prod),
id_prod int primary key,
nome_prod varchar(100) not null,
desc_prod text not null,
esptec_prod varchar(100) not null,
undmed_prod varchar(50) not null,
precou_prod float not null,
quant_prod int not null,
estoquemin_prod int not null,
local_prod varchar(100) not null;
);

create table if not exists PEDIDOS(
id_pedido int primary key,
data_pedido date not null,
hora_pedido time not null,
prev_pedido datetime not null,
status_pedido boolean not null;
);

create table if not exists RECEBIMENTOS(
data_receb date not null,
hora_receb time not null,
quant_prod_receb varchar(100) not null,
condicao_mat_receb text not null;
);

create table if not exists FILIAIS(
CONSTRAINT fk_filial FOREIGN KEY(FILIAIS)
REFERENCES FILIAIS(id_filial),
id_filial int primary key
nome_filial varchar(100) not null,
end_filial varchar(50) not null,
capac_arm_filial varchar(50) not null;
);

create table if not exists FORNECEDORES_PROD(
PEDIDOS int,
FORNECEDORES int,
primary key(PEDIDOS, PRODUTOS),
CONSTRAINT fk_pedido foreign key(pedidos)
references pedidos(id_pedido),
constraint fk_forn foreign key(fornecedores)
references fornecedores(id_forn);
);

create table if not exists PEDIDOS_PROD(
pedido int,
produto int,
primary key(pedido, produto),
constraint fk_pedido foreign key(pedidos)
references pedidos(id_pedido),
constraint fk_prod foreign key(produtos)
references produtos(id_prod);
);

create table if not exists PRODUTOS_FILI(
produtos int,
filial int
primary key(produtos, filiais),
constraint fk_prod foreign key(PRODUTOS)
references PRODUTOS(id_prod),
constraint fk_filial foreign key(FILIAIS)
references FILIAIS(id_filial);
);

