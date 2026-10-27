IF DB_ID('BankingCustomerAnalysis') IS NULL
    CREATE DATABASE BankingCustomerAnalysis;
GO

USE BankingCustomerAnalysis;
GO

IF OBJECT_ID('dbo.staging_banking', 'U') IS NOT NULL
    DROP TABLE dbo.staging_banking;
GO
CREATE TABLE dbo.staging_banking
(
    ClientID NVARCHAR(20) NULL,
    Name NVARCHAR(150) NULL,
    Age INT NULL,
    LocationID INT NULL,
    JoinedBank DATE NULL,
    BankingContact NVARCHAR(100) NULL,
    Nationality NVARCHAR(100) NULL,
    Occupation NVARCHAR(100) NULL,
    FeeStructure NVARCHAR(100) NULL,
    LoyaltyClassification NVARCHAR(100) NULL,
    EstimatedIncome DECIMAL(18,2) NULL,
    SuperannuationSavings DECIMAL(18,2) NULL,
    AmountOfCreditCards INT NULL,
    CreditCardBalance DECIMAL(18,2) NULL,
    BankLoans DECIMAL(18,2) NULL,
    BankDeposits DECIMAL(18,2) NULL,
    CheckingAccounts DECIMAL(18,2) NULL,
    SavingAccounts DECIMAL(18,2) NULL,
    ForeignCurrencyAccount DECIMAL(18,2) NULL,
    BusinessLending DECIMAL(18,2) NULL,
    PropertiesOwned INT NULL,
    RiskWeighting INT NULL,
    BRId INT NULL,
    GenderId INT NULL,
    IAId INT NULL
);
GO

