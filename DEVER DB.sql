-------QUESTAO NUMERO 1-------A
SELECT COUNT(*)  
FROM fato_vendas
WHERE id_cliente IS NULL

-------QUESTAO NUMERO 2------
SELECT COUNT (DISTINCT id_cliente)
FROM fato_vendas

-------QUESTAO NUMERO 3------(c)(a)
SELECT SUM(valor_total)
FROM fato_vendas
WHERE data_venda BETWEEN '2025-01-01' AND '2025-12-31'

-------QUESTAO NUMERO 4------(c)
SELECT DISTINCT marca
FROM dim_produto
WHERE categria = 'higiene'
ORDER BY marca

--------QUESTAO NUMERO 5------
SELECT AVG(valor_total)
FROM fato_vendas
WHERE canal = 'Aplicativo'

--------QUESTAO NUMERO 6------
SELECT COUNT(*)
FROM dim_produto
WHERE categoria = 'Bebidas' AND preco_tabela > 10

--------QUESTAO NUMERO 7------
SELECT (nome_produto,marca,preco_tabela)
FROM dim_produto
ORDER BY preco_tabela DESC ,nome_produto ASC
LIMIT 3

--------QUESTAO NUMERO 8-------
SELECT COUNT (DISTINCT categoria)
FROM dim_produto

SELECT DISTINCT categoria, nome_produto,
COUNT(nome_produto) AS qnt_produto
FROM dim_produto
GROUP BY DISTINCT categoria, nome_produto
ORDER BY qnt_produto DESC

--------questao 9-------------
SELECT DISTINCT categoria,
AVG(preco_tabela)  AS media_preco
FROM dim_produto
GROUP BY categoria
ORDER BY media_preco DESC

------QUESTAO 10-------
SELECT DISTINCT cidade,
COUNT (nome) AS qnt_gente
FROM dim_cliente
GROUP BY cidade
HAVING COUNT(*)>=60
ORDER BY cidade

----questao 11-----
SELECT COUNT (*)
FROM dim_cliente
WHERE email IS NULL

-------QUESTAO 12-----
SELECT COUNT(*)
FROM dim_cliente
WHERE sexo= 'F' AND data_nascimento BETWEEN '1990-01-01' AND '1999-12-31'

-----QUESTAO 13-----
SELECT COUNT(*)
FROM dim_cliente
WHERE nome LIKE 'Ana %'

----QUESTAO 14-----
SELECT UF,
COUNT(*)
FROM dim_loja
GROUP BY UF
HAVING  COUNT(*)>3

----QUESTAO 15-----
SELECT nome_loja, cidade, data_inauguracao  
FROM dim_loja
WHERE data_inauguracao< '2007-01-01'
ORDER BY data_inauguracao

-------QUESTAO 16-----
SELECT canal,
SUM(valor_total) as faturamento
FROM fato_vendas
WHERE data_venda BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY canal
ORDER BY faturamento DESC

-----QUESTAO 17-----
SELECT forma_pagamento, SUM(valor_total) AS faturamento
FROM fato_vendas
WHERE canal='Loja física'
GROUP BY canal, forma_pagamento
ORDER BY faturamento DESC

------QUESTAO 18------
SELECT nome_produto,
COUNT (id_produto) AS QNT
FROM dim_produto
GROUP BY  nome_produto
ORDER BY QNT DESC

-------QUESTAO 19------ ACHO QUE TA ERRADO
SELECT nome_loja, ID_VENDA,
SUM(valor_total) AS faturamento
FROM dim_loja, fato_vendas
WHERE data_venda BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY nome_loja, ID_VENDA
ORDER BY faturamento DESC

-------QUESTAO 20-------- PEGUEI AJUDA
SELECT
    id_loja,
    COUNT(*) AS quantidade_vendas
FROM fato_vendas
GROUP BY id_loja
HAVING COUNT(*) > 300
ORDER BY quantidade_vendas DESC;

-----QUESTAO 21----------
SELECT
	id_cliente,
	COUNT(*) AS qnt_venda
FROM fato_vendas
WHERE id_cliente IS NOT NULL
GROUP BY id_cliente
HAVING COUNT(*)>=70
ORDER BY qnt_venda DESC

-----QUESTAO 22------
SELECT COUNT(desconto) AS linhas_desconto, 
       ROUND(AVG (desconto),2) AS media_desconto
FROM fato_vendas
WHERE desconto > 0

-------QUESTAO 23------
SELECT MAX(valor_total) AS maior_valor,
		MIN(valor_total) AS menor_valor
FROM fato_vendas 
WHERE data_venda BETWEEN '2025-12-01' AND '2025-12-31'

----QUESTAO 24----
SELECT COUNT (id_venda),
	SUM(valor_total)
FROM fato_vendas
WHERE data_venda ='2025-12-24'

----QUESTAO 25------
SELECT id_venda,
QUANTIDADE,
PRECO_UNITARIO,
quantidade * preco_unitario AS valor_bruto,
desconto,
valor_total,
ROUND((((preco_unitario/valor_total)*100)),2) AS porcentual
FROM fato_vendas
ORDER BY porcentual desc,id_venda 
limit 10

