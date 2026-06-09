

with payouts as (
    select
        payout_id,
        payout_date,
        gross_amount,
        fee_amount,
        net_amount,
        currency,
        account_id,
        transaction_id
    from main."stg_payouts"
)

select
    payouts.transaction_id as transaction_id,
    payouts.payout_date as transaction_date,
    null as bank_amount,
    null as ledger_amount,
    payouts.account_id as account_id,
    null as entry_id,
    null as entry_type,
    null as reference_id,
    payouts.payout_id as payout_id,
    payouts.payout_date as payout_date,
    payouts.gross_amount as gross_amount,
    payouts.fee_amount as fee_amount,
    payouts.net_amount as net_amount,
    payouts.currency as currency
from payouts