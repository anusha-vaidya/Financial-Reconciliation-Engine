
  
    
    
    create  table main."metrics_reconciliation_overview"
    as
        

with summary as (
    select
        reconciliation_status,
        count(*) as record_count,
        sum(
            coalesce(bank_amount, 0) +
            coalesce(ledger_amount, 0) +
            coalesce(net_amount, 0)
        ) as total_amount
    from main."fct_reconciliation_summary"
    group by reconciliation_status
),

daily as (
    select
        date(transaction_date) as date,
        reconciliation_status,
        count(*) as record_count
    from main."fct_reconciliation_summary"
    group by date(transaction_date), reconciliation_status
)

select
    'overall' as metric_type,
    reconciliation_status,
    record_count,
    total_amount,
    null as date
from summary

union all

select
    'daily' as metric_type,
    reconciliation_status,
    record_count,
    null as total_amount,
    date
from daily

  