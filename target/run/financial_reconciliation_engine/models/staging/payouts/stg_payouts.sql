
    
    create view main."stg_payouts" as
    

with source as (
    select
        payout_id,
        payout_date,
        gross_amount,
        fee_amount,
        net_amount,
        currency,
        account_id,
        transaction_id
    from main."payouts"
),

cleaned as (
    select
        payout_id,
        payout_date,
        gross_amount,
        fee_amount,
        net_amount,
        currency,
        account_id,
        transaction_id
    from source
)

select
    payout_id,
    payout_date,
    gross_amount,
    fee_amount,
    net_amount,
    currency,
    account_id,
    transaction_id
from cleaned;