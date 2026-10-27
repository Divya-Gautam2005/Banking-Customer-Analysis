# Banking Customer Analysis

An end-to-end banking customer analytics project combining SQL Server data warehousing, Python exploratory data analysis (EDA), and a Power BI dashboard.

## Project Overview

This project explores banking customer attributes and financial measures to support analysis of customer segments, deposits, loans, risk weighting, loyalty classification, and income bands. It includes a SQL-based staging-to-warehouse workflow, a Python notebook for exploratory analysis, and a Power BI report.

## Project Components

- **SQL Server:** Database and staging-table setup, data-quality checks, dimensional warehouse creation, data loading, and analytical queries.
- **Data warehouse:** `DimDate`, `DimLocation`, `DimBranch`, `DimGender`, `DimCustomer`, and `FactBankingSnapshot`.
- **Python / Jupyter Notebook:** Exploratory analysis in `eda/BankEDA.ipynb`.
- **Power BI:** Dashboard report in `powerbi/Banking Dashboard.pbix`.
- **Source data:** Banking customer dataset in `data/Banking.csv`.
- **Dashboard images:** Screenshots in `Images/`.

## Repository Structure

```text
Banking-Customer-Analysis/
├── data/
│   └── Banking.csv
├── eda/
│   └── BankEDA.ipynb
├── Images/
│   ├── Image1.png
│   ├── Image2.png
│   ├── Image3.png
│   └── Image4.png
├── powerbi/
│   └── Banking Dashboard.pbix
├── sql/
│   ├── 00_create_database_and_staging.sql
│   ├── load_staging.sql
│   ├── 01_data_quality.sql
│   ├── 02_create_warehouse.sql
│   ├── 03_load_warehouse.sql
│   └── 04_analysis.sql
├── .gitignore
└── README.md
```

## SQL Workflow

Run the SQL scripts in SQL Server Management Studio (SSMS) in this order:

1. `sql/00_create_database_and_staging.sql` — creates the `BankingCustomerAnalysis` database and `staging_banking` table.
2. Import `data/Banking.csv` into a source table named `dbo.BankingImport`, matching the column names expected by `sql/load_staging.sql`.
3. `sql/load_staging.sql` — converts source fields and loads records into the staging table.
4. `sql/01_data_quality.sql` — checks row counts, duplicate or null client IDs, invalid ages, negative financial values, loyalty classes, and risk weighting.
5. `sql/02_create_warehouse.sql` — creates dimension and fact tables.
6. `sql/03_load_warehouse.sql` — loads the dimensions and `FactBankingSnapshot`.
7. `sql/04_analysis.sql` — runs analysis queries for deposits by income band, loans by risk weighting, loyalty classifications, top depositors, and overall fact metrics.

> **Important:** `load_staging.sql` expects `dbo.BankingImport` to exist and to have source columns such as `Client_ID`, `Joined_Bank`, and `Bank_Deposits`. Import the CSV with matching column names before running it. The warehouse creation script drops and recreates the listed warehouse tables, so use it carefully if you have existing data.

## Python EDA

Open `eda/BankEDA.ipynb` in Jupyter Notebook or VS Code with the Jupyter extension. Install the notebook's required Python packages if prompted. Update file paths if your local environment requires it.

## Power BI Dashboard

Open `powerbi/Banking Dashboard.pbix` using Power BI Desktop. If the report asks for a data source path, point it to the project dataset or to the data source used when the report was built, then refresh the model.

## Tools and Technologies

- Microsoft SQL Server / T-SQL
- Dimensional data warehousing (fact and dimension tables)
- Python and Jupyter Notebook
- Power BI Desktop
- CSV data

## Analytical Areas

- Customer segmentation by income band and loyalty classification
- Banking deposits and loans
- Risk-weighting distribution
- Customer profile and account-related financial measures
- Data quality validation and warehouse-level analysis

## How to Use

1. Clone or download this repository.
2. Follow the SQL workflow above to prepare the staging table and warehouse.
3. Run the EDA notebook.
4. Open the Power BI report and refresh or reconnect its data source if required.

## Notes

- Results depend on the provided dataset and the report's configured data source.
- The SQL scripts use the database name `BankingCustomerAnalysis`.
- Do not commit credentials, private connection strings, or sensitive customer information. Confirm that you are permitted to publish the dataset before making the repository public.

