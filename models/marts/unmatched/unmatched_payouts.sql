{{ config(materialized='table') }}

select
    *
from {{ ref('fct_reconciliation_summary') }}
where reconciliation_status = 'unmatched'
  and payout_id is not null
  and bank_amount is null
