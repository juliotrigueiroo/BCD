-- Criando um Banco de Dadod
CREATE DATABASE db_LivrariaSenai; 

-- Usando Banco de Dados
use db_LivrariaSenai;

create table tb_cliente(
id_cliente int primary key  NOT NULL AUTO_INCREMENT,
nome varchar (45)NOT NULL UNIQUE,
cpf varchar (11),
rg varchar (11), 
email varchar(45)
);

create table tb_cliente_telefone(
id_cliente_telefone int primary key null auto_increment,
telefone varchar(15),
CLIENTE_id_cliente int,
foreign key (CLIENTE_id_cliente) references tb_cliente(id_cliente)
);

create table tb_clienteEndereco(
id_Endereco int primary key not null auto_increment,
rua varchar(45),
numero int,
cidade varchar(45),
estado varchar(45),
CLIENTE_id_cliente int,
foreign key (CLIENTE_id_cliente) references tb_clientes(id_clientes)
);

create table tb_pedido(
id_pedido int primary key not null auto_increment,
valor decimal(10,2)
datas date,
CLIENTE_id_cliente int,
foreign key (CLIENTE_id_cliente)










