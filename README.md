# Financial-Reconciliation-Engine
A production‑style analytics engineering project that automates financial reconciliation across bank transactions, ledger entries, and payout records.
Built using dbt, modular SQL, and seeded datasets to simulate a real finance data pipeline.

# Project Overview
This project replicates how finance teams reconcile transactions across multiple systems.
It identifies mismatches, produces daily reconciliation metrics, and generates exception reports for unmatched entries.

The pipeline includes:
- Staging models for raw bank, ledger, and payout data
- Intermediate reconciliation logic
- A unified fact table
- A metrics layer summarizing matched vs unmatched activity
- Exception models for unmatched bank, ledger, and payout entries
This mirrors the structure used in real-world financial data engineering teams.

# How the Pipeline Works
1. Staging Layer
Cleans and standardizes raw inputs:
- Normalizes column names
- Casts data types
- Ensures consistent date formats

2. Intermediate Layer
Performs reconciliation logic:
- Joins bank ↔ ledger
- Joins ledger ↔ payouts
- Flags matched vs unmatched records

3. Fact Table
A unified table containing:
- transaction_id
- bank_amount
- ledger_amount
- payout_amount
- reconciliation_status

4. Metrics Layer
Provides:
- Overall matched/unmatched counts
- Total reconciled dollar value
- Daily reconciliation trends

5. Exception Reports
Three dedicated models:
- unmatched_bank_transactions
- unmatched_ledger_entries
- unmatched_payouts

These isolate records requiring manual review.

# How to execute:
- Install dbt for SQLite : pip install dbt-sqlite
        -  Verify installation with dbt --version
- dbt seed
- dbt run
