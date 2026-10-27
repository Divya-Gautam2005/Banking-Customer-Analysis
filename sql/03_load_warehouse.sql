USE BankingCustomerAnalysis;
GO

INSERT INTO dbo.DimDate (DateKey, FullDate, [Year], [Quarter], [Month], MonthName)
SELECT DISTINCT
    CONVERT(INT, CONVERT(CHAR(8), JoinedBank, 112)),
    JoinedBank,
    YEAR(JoinedBank),
    DATEPART(QUARTER, JoinedBank),
    MONTH(JoinedBank),
    DATENAME(MONTH, JoinedBank)
FROM dbo.staging_banking
WHERE JoinedBank IS NOT NULL;
GO

INSERT INTO dbo.DimLocation (LocationID)
SELECT DISTINCT LocationID
FROM dbo.staging_banking
WHERE LocationID IS NOT NULL;
GO

INSERT INTO dbo.DimBranch (BRId)
SELECT DISTINCT BRId
FROM dbo.staging_banking
WHERE BRId IS NOT NULL;
GO

INSERT INTO dbo.DimGender (GenderID)
SELECT DISTINCT GenderId
FROM dbo.staging_banking
WHERE GenderId IS NOT NULL;
GO

INSERT INTO dbo.DimCustomer
(
    ClientID, Name, Age, BankingContact, Nationality, Occupation,
    FeeStructure, LoyaltyClassification, EstimatedIncome, IncomeBand,
    LocationKey, BranchKey, GenderKey
)
SELECT
    s.ClientID,
    s.Name,
    s.Age,
    s.BankingContact,
    s.Nationality,
    s.Occupation,
    s.FeeStructure,
    s.LoyaltyClassification,
    s.EstimatedIncome,
    CASE
        WHEN s.EstimatedIncome <= 100000 THEN 'Low'
        WHEN s.EstimatedIncome <= 300000 THEN 'Mid'
        ELSE 'High'
    END,
    l.LocationKey,
    b.BranchKey,
    g.GenderKey
FROM dbo.staging_banking s
LEFT JOIN dbo.DimLocation l ON l.LocationID = s.LocationID
LEFT JOIN dbo.DimBranch b ON b.BRId = s.BRId
LEFT JOIN dbo.DimGender g ON g.GenderID = s.GenderId;
GO

INSERT INTO dbo.FactBankingSnapshot
(
    CustomerKey, DateKey, AmountOfCreditCards, CreditCardBalance,
    BankLoans, BankDeposits, CheckingAccounts, SavingAccounts,
    ForeignCurrencyAccount, BusinessLending, PropertiesOwned,
    RiskWeighting, SuperannuationSavings, IAId
)
SELECT
    c.CustomerKey,
    CONVERT(INT, CONVERT(CHAR(8), s.JoinedBank, 112)),
    s.AmountOfCreditCards,
    s.CreditCardBalance,
    s.BankLoans,
    s.BankDeposits,
    s.CheckingAccounts,
    s.SavingAccounts,
    s.ForeignCurrencyAccount,
    s.BusinessLending,
    s.PropertiesOwned,
    s.RiskWeighting,
    s.SuperannuationSavings,
    s.IAId
FROM dbo.staging_banking s
JOIN dbo.DimCustomer c
    ON c.ClientID = s.ClientID
   AND ISNULL(c.Name, '') = ISNULL(s.Name, '')
LEFT JOIN dbo.DimDate d
    ON d.DateKey = CONVERT(INT, CONVERT(CHAR(8), s.JoinedBank, 112));
GO
