-- Queries dados
use ecommerce;


-- 1. Quantos pedidos foram feitos por cada cliente?
SELECT idOrderClient, COUNT(idOrder) AS total_pedidos FROM orders GROUP BY idOrderClient;

-- 2. Algum vendedor também é fornecedor?
SELECT s.idSeller, s.SocialNome FROM seller s INNER JOIN supplier sup ON s.CNPJ = sup.CNPJ;

-- 3. Relação de produtos, fornecedores e estoques
SELECT p.Pname, s.SocialNome, ps.quantity, st.storageLocation, st.quantity
FROM product p 
JOIN productSupplier ps ON p.idProduct = ps.idPsProduct
JOIN supplier s ON ps.idPsSupplier = s.idSupplier
JOIN storageLocation sl ON p.idProduct = sl.idLproduct
JOIN productStorage st ON sl.idLstorage = st.idProdStorage;

-- 4. Relação de nomes dos fornecedores e nomes dos produtos
SELECT s.SocialNome, p.Pname FROM product p
JOIN productSupplier ps ON p.idProduct = ps.idPsProduct
JOIN supplier s ON ps.idPsSupplier = s.idSupplier;

-- 5. Exibir produtos com estoque abaixo de 10 unidades
SELECT p.Pname, st.quantity FROM product p
JOIN storageLocation sl ON p.idProduct = sl.idLproduct
JOIN productStorage st ON sl.idLstorage = st.idProdStorage
WHERE st.quantity < 10;

