{{ config(materialized='table') }}

select
    *
from {{ ref('fct_reconciliation_summary') }}
where reconciliation_status = 'unmatched'
  and bank_amount is not null
  and ledger_amount is null
  and payout_id is null
