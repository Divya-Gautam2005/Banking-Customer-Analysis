USE BankingCustomerAnalysis;
GO

SELECT COUNT(*) AS TotalRows
FROM dbo.staging_banking;

SELECT ClientID, COUNT(*) AS RowCount1
FROM dbo.staging_banking
GROUP BY ClientID
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS NullClientIDs
FROM dbo.staging_banking
WHERE ClientID IS NULL;

SELECT COUNT(*) AS InvalidAges
FROM dbo.staging_banking
WHERE Age < 0 OR Age > 120;

SELECT COUNT(*) AS NegativeFinancialValues
FROM dbo.staging_banking
WHERE EstimatedIncome < 0
   OR SuperannuationSavings < 0
   OR CreditCardBalance < 0
   OR BankLoans < 0
   OR BankDeposits < 0
   OR CheckingAccounts < 0
   OR SavingAccounts < 0
   OR ForeignCurrencyAccount < 0
   OR BusinessLending < 0;

SELECT LoyaltyClassification, COUNT(*) AS CustomerCount
FROM dbo.staging_banking
GROUP BY LoyaltyClassification
ORDER BY CustomerCount DESC;

SELECT RiskWeighting, COUNT(*) AS CustomerCount
FROM dbo.staging_banking
GROUP BY RiskWeighting
ORDER BY RiskWeighting;
GO
