-- criação do banco de dados para o cenário do E-commerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table clients (
idClient int auto_increment primary key,
Fname varchar(10),
Minit char(3),
Lname varchar(20),
CPF char(11) not null,
Address varchar(30),
constraint unique_cpf_cliet unique(CPF)
);

alter table clients auto_increment = 1;

-- criar tebela produto
-- size = dimensão do produto
create table product (
idProduct int auto_increment primary key,
Pname varchar(10) not null,
classification_kids bool default false,
category enum('Eletrônico','Vestimenta','Brinquedo','Alimento','Móveis') not null,
avaliação float default 0,
size varchar(10)
);


-- Para ser continuado no desafio: termine de implementar a tabela e crie a conexão com as tabelas necessárias
-- além disso, reflita essa modificação no diagrama de esquema relacional
-- criar constraints relacionadas ao pagamento
create table payments(
idPayment int auto_increment primary key,
idclient int not null,
typePayment enum('Boleto','Cartão','Dois cartões') not null,
limitAvailable float,
foreign key (idClient) references clients(idClient) on delete cascade
);




-- criar tabela pedido
create table orders(
idOrder int auto_increment primary key,
idOrderClient int,
orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
orderDescription varchar(255),
sendValue float default 10,
paymentCash bool default false,
constraint fk_orders_Client foreign key (idOrderClient) references Clients(idClient)
);



-- criar tabela estoque
create table ProductStorage(
idProdStorage int auto_increment primary key,
storageLocation varchar (255),
quantity int default 0
);



-- criar tabela fornecedor
create table supplier(
idSupplier int auto_increment primary key,
SocialNome varchar (255) not null,
CNPJ char (15) not null,
contact char (11) not null,
constraint unique_Supplier unique(CNPJ)
);




-- criar tabela vendedor
create table seller(
idSeller int auto_increment primary key,
SocialNome varchar (255) not null,
AbstName varchar (255),
CNPJ char (15),
CPF char (9),
location varchar (255),
contact char (11) not null,
constraint unique_cnpj_Seller unique(CNPJ),
constraint unique_cpf_Seller unique(CPF)
);

create table productSeller(
idPseller int,
idPproduct int,
prodQuantity int default 1,
primary key (idPseller, idPproduct),
constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);


create table productOrder(
idPOproduct int,
idPOorder int,
poQuantity int default 1,
poStatus enum('Disponível','Sem estoque') default 'Disponível',
primary key (idPOproduct, idPOorder),
constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
);




create table storageLocation(
idLproduct int,
idLstorage int,
location varchar (255) not null,
primary key (idLproduct, idLstorage),
constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);





create table productSupplier(
idPsSupplier int,
idPsProduct int,
quantity int not null,
primary key (idPsSupplier, idPsProduct),
constraint fk_product_supplier_supplier foreign key (idPsSupplier) references Supplier(idSupplier),
constraint fk_product_supplier_prodcut foreign key (idPsProduct) references product(idProduct)
);