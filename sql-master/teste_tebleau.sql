USE test_felipe;
SELECT * FROM empresas;
SELECT * FROM socios;
SELECT * FROM transacoes;

SELECT 
    RIGHT(e.EnderecoEmpresa, 2) AS Estado,
    MONTH(t.DataTransacao) AS Mês,
    COUNT(t.IdTransacao) AS Quantidade,
    ROUND(SUM(t.ValorBrutoTransacao),2) AS Receita,
    t.BandeiraTransacao AS Cartão,
    t.ParcelasTransacao AS Parcelas
FROM
    empresas e
        JOIN
    transacoes t ON e.IdEmpresa = t.IdEmpresa
GROUP BY Estado, Mês, Cartão, Parcelas
ORDER BY Estado;