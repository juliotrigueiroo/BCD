 -- Para ver se existe 
DROP DATABASE IF EXISTS db_loja;

-- Criei o banco de dados 
CREATE DATABASE IF NOT EXISTS db_loja;

-- O "use" para usar o banco de dados
USE db_loja;

-- Criei o banco de dados, e coloquei os atributos 
CREATE TABLE IF NOT EXISTS tb_vendas (
id_nf INT,
id_item INT,
cod_prod INT,
valor_unit DECIMAL(4,2),
quantidade INT,
desconto INT
);

-- enserir o valor de cada atributo 
INSERT INTO tb_vendas ( id_nf, id_item, cod_prod, valor_unit, quantidade, desconto) VALUES
    (1,1,1,25.00,10,5),
    (1, 2, 2, 13.50, 3, NULL),
    (1, 3, 3, 15.00, 2, NULL),
    (1, 4,4,10.00,1,NULL),
    (1,5,5,30.00,1,NULL),
    (2,1,3,15.00,4,NULL),
    (2,2,4,10.00,5,NULL),
    (2,3,5,30.00,7,NULL),
    (3,1,1,25.00,5,NULL),
    (3,2,4,10.00,4,NULL),
    (3,3,5,30.00,5,NULL),
    (3,4,2,13.50,7,NULL),
    (4,1,5,30.00,10,15),
    (4,2,4,10.00,12,5),
    (4,3,1,25.00,13,5),
    (5,1,3,15.00,3,NULL),
    (5,2,5,30.00,6,null),
    (6,1,1,25.00,22,15),
    (6,2,3,15.00,25,20),
    (7,1,1,25.00,10,3),
    (7,3,3,15.00,10,4),
    (7,4,5,30.0,10,1);
    
-- Ex1
    SELECT * FROM TB_VENDAS;
    
    SELECT ID_NF as nota, ID_ITEM, COD_PROD, VALOR_UNIT 
    FROM tb_vendas
    WHERE desconto IS NULL;
  
-- Ex2
	Select ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)) as "VALOR VENDIDO"
	from TB_VENDAS
	where DESCONTO IS NOT NULL;

-- Ex3
	UPDATE tb_vendas
	SET desconto = 0 
    WHERE desconto IS NULL;
    
-- Ex4    
    SELECT id_nf, id_item, cod_prod, quantidade * valor_unit as valor_total, desconto,  valor_unit - (valor_unit*(desconto/100)) AS "valor vendido"
FROM tb_vendas;

-- Ex5
	SELECT ID_NF, SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOTAL    
    FROM TB_VENDAS
    GROUP BY ID_NF;
    
-- Ex6
	SELECT ID_NF, SUM(VALOR_UNIT - (VALOR_UNIT * (DESCONTO / 100))) AS VALOR_VENDIDO
FROM tb_vendas
GROUP BY ID_NF
ORDER BY VALOR_VENDIDO DESC;

-- Exercicio 7

SELECT COD_PROD, SUM(QUANTIDADE) AS QUANTIDADE
FROM tb_vendas
GROUP BY COD_PROD
ORDER BY QUANTIDADE DESC;

-- Exercicio 8

SELECT ID_NF, COD_PROD, sum(QUANTIDADE) AS
quantidade
FROM tb_vendas
WHERE QUANTIDADE > 10
GROUP BY ID_NF, COD_PROD;

-- Exercicio 9

SELECT ID_NF, SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOTAL
FROM tb_vendas
GROUP BY ID_NF
HAVING VALOR_TOTAL > 500
ORDER BY VALOR_TOTAL DESC;

-- Exercicio 10

SELECT COD_PROD, AVG(DESCONTO) AS MEDIA
FROM tb_vendas
GROUP BY COD_PROD;

-- Exercicio 11

SELECT COD_PROD, MIN(DESCONTO) AS MENOR, MAX(DESCONTO) AS MAIOR, AVG(DESCONTO) AS MEDIA
FROM tb_vendas
GROUP BY COD_PROD;

-- Exercicio 12

SELECT ID_NF, COUNT(ID_ITEM) AS QTD_ITENS
FROM tb_vendas
GROUP BY ID_NF
HAVING COUNT(ID_ITEM);
