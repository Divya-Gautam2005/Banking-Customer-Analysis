USE BankingCustomerAnalysis;
GO

IF OBJECT_ID('dbo.FactBankingSnapshot', 'U') IS NOT NULL DROP TABLE dbo.FactBankingSnapshot;
IF OBJECT_ID('dbo.DimCustomer', 'U') IS NOT NULL DROP TABLE dbo.DimCustomer;
IF OBJECT_ID('dbo.DimDate', 'U') IS NOT NULL DROP TABLE dbo.DimDate;
IF OBJECT_ID('dbo.DimLocation', 'U') IS NOT NULL DROP TABLE dbo.DimLocation;
IF OBJECT_ID('dbo.DimBranch', 'U') IS NOT NULL DROP TABLE dbo.DimBranch;
IF OBJECT_ID('dbo.DimGender', 'U') IS NOT NULL DROP TABLE dbo.DimGender;
GO

CREATE TABLE dbo.DimDate
(
    DateKey INT PRIMARY KEY,
    FullDate DATE NOT NULL,
    [Year] INT NOT NULL,
    [Quarter] INT NOT NULL,
    [Month] INT NOT NULL,
    MonthName NVARCHAR(20) NOT NULL
);

CREATE TABLE dbo.DimLocation
(
    LocationKey INT IDENTITY(1,1) PRIMARY KEY,
    LocationID INT NULL
);

CREATE TABLE dbo.DimBranch
(
    BranchKey INT IDENTITY(1,1) PRIMARY KEY,
    BRId INT NULL
);

CREATE TABLE dbo.DimGender
(
    GenderKey INT IDENTITY(1,1) PRIMARY KEY,
    GenderID INT NULL
);

CREATE TABLE dbo.DimCustomer
(
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
    ClientID NVARCHAR(20) NULL,
    Name NVARCHAR(150) NULL,
    Age INT NULL,
    BankingContact NVARCHAR(100) NULL,
    Nationality NVARCHAR(100) NULL,
    Occupation NVARCHAR(100) NULL,
    FeeStructure NVARCHAR(100) NULL,
    LoyaltyClassification NVARCHAR(100) NULL,
    EstimatedIncome DECIMAL(18,2) NULL,
    IncomeBand NVARCHAR(20) NULL,
    LocationKey INT NULL,
    BranchKey INT NULL,
    GenderKey INT NULL
);

CREATE TABLE dbo.FactBankingSnapshot
(
    BankingSnapshotKey INT IDENTITY(1,1) PRIMARY KEY,
    CustomerKey INT NOT NULL,
    DateKey INT NOT NULL,
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
    SuperannuationSavings DECIMAL(18,2) NULL,
    IAId INT NULL
);
GO
