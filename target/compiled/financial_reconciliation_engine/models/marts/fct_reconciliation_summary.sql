

with combined as (

    select
        transaction_id,
        transaction_date,
        bank_amount,
        ledger_amount,
        account_id,
        entry_id,
        entry_type,
        reference_id,
        null as payout_id,
        null as payout_date,
        null as gross_amount,
        null as fee_amount,
        null as net_amount,
        null as currency,
        case
            when ledger_amount is not null then 'matched'
            else 'unmatched'
        end as reconciliation_status
    from main."int_reconciliation_bank_ledger"

    union all

    select
        transaction_id,
        transaction_date,
        bank_amount,
        ledger_amount,
        account_id,
        entry_id,
        entry_type,
        reference_id,
        payout_id,
        payout_date,
        gross_amount,
        fee_amount,
        net_amount,
        currency,
        case
            when transaction_id is not null then 'matched'
            else 'unmatched'
        end as reconciliation_status
    from main."int_reconciliation_payouts"

)

select *
from combined