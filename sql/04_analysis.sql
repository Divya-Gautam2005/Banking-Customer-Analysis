USE BankingCustomerAnalysis;
GO

SELECT
    c.IncomeBand,
    COUNT(*) AS CustomerCount,
    AVG(f.BankDeposits) AS AverageDeposits,
    SUM(f.BankDeposits) AS TotalDeposits
FROM dbo.FactBankingSnapshot f
JOIN dbo.DimCustomer c ON c.CustomerKey = f.CustomerKey
GROUP BY c.IncomeBand
ORDER BY AverageDeposits;
GO

SELECT
    f.RiskWeighting,
    COUNT(*) AS CustomerCount,
    AVG(f.BankLoans) AS AverageLoans,
    SUM(f.BankLoans) AS TotalLoans
FROM dbo.FactBankingSnapshot f
GROUP BY f.RiskWeighting
ORDER BY f.RiskWeighting;
GO

SELECT
    c.LoyaltyClassification,
    COUNT(*) AS CustomerCount,
    AVG(f.BankDeposits) AS AverageDeposits,
    AVG(f.BankLoans) AS AverageLoans
FROM dbo.FactBankingSnapshot f
JOIN dbo.DimCustomer c ON c.CustomerKey = f.CustomerKey
GROUP BY c.LoyaltyClassification
ORDER BY AverageDeposits DESC;
GO

SELECT TOP 10
    c.ClientID,
    c.Name,
    c.IncomeBand,
    f.BankDeposits,
    f.BankLoans
FROM dbo.FactBankingSnapshot f
JOIN dbo.DimCustomer c ON c.CustomerKey = f.CustomerKey
ORDER BY f.BankDeposits DESC;
GO

SELECT
    COUNT(*) AS FactRows,
    COUNT(DISTINCT CustomerKey) AS CustomersInFact,
    SUM(BankDeposits) AS TotalDeposits,
    SUM(BankLoans) AS TotalLoans
FROM dbo.FactBankingSnapshot;
GO
