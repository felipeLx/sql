USE test_felipe;
SELECT DISTINCT YEAR(DataTransacao) AS anos
FROM transacoes;

SELECT ROUND(SUM(ValorBrutoTransacao),2) AS total_vendas
FROM transacoes;

SELECT COUNT(ValorBrutoTransacao) AS quantidade_vendas
FROM transacoes;

SELECT ROUND(AVG(ValorBrutoTransacao),2) AS total_vendas
FROM transacoes;

SELECT ROUND(AVG(ValorBrutoTransacao),2) AS total_vendas
FROM transacoes;

SELECT 
	MONTH(DataTransacao) AS mes,
	ROUND(MIN(ValorBrutoTransacao),2) AS menor_venda
FROM transacoes
GROUP BY mes
ORDER BY menor_venda ASC;

SELECT 
	WEEKDAY(DataTransacao) AS dia_semana,
    ROUND(MAX(ValorBrutoTransacao),2) AS maior_qtd
FROM transacoes
GROUP BY dia_semana
ORDER BY maior_qtd DESC;

SELECT 
	WEEKDAY(DataTransacao) AS dia_semana,
    COUNT(ValorBrutoTransacao) AS max_vendas
FROM transacoes
GROUP BY dia_semana
ORDER BY max_vendas DESC;

SELECT 
	WEEKDAY(DataTransacao) AS dia_semana,
    COUNT(ValorBrutoTransacao) AS min_vendas
FROM transacoes
GROUP BY dia_semana
ORDER BY min_vendas;

SELECT 
	e.NomeEmpresa,
    ROUND(SUM(t.ValorBrutoTransacao),2) as total_vendas
FROM 
	empresas e
	JOIN
    transacoes t ON e.IdEmpresa = t.IdEmpresa
    WHERE DataTransacao LIKE ('%-04-%')
GROUP BY e.NomeEmpresa
ORDER BY total_vendas DESC;

SELECT 
	e.NomeEmpresa,
    ROUND(SUM(t.ValorBrutoTransacao),2) as total_vendas
FROM 
	empresas e
	JOIN
    transacoes t ON e.IdEmpresa = t.IdEmpresa
    WHERE t.DataTransacao LIKE ('%-07%') AND e.EnderecoEmpresa LIKE ('%/ ES')
GROUP BY e.NomeEmpresa
ORDER BY total_vendas DESC;

SELECT * FROM transacoes;
SELECT * FROM empresas;

SELECT BandeiraTransacao, SUM(ValorBrutoTransacao) AS quantidade_vendas
FROM transacoes
WHERE ParcelasTransacao = 12
GROUP BY BandeiraTransacao;


SELECT ParcelasTransacao, SUM(ValorBrutoTransacao) AS quantidade_vendas
FROM transacoes
WHERE BandeiraTransacao = 'ELO'
GROUP BY ParcelasTransacao
ORDER BY ParcelasTransacao;

SELECT SUM(ValorBrutoTransacao) AS quantidade_vendas
FROM transacoes
WHERE BandeiraTransacao = 'Master' AND ParcelasTransacao=7;

