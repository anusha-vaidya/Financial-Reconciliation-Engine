{{ config(materialized='view') }}

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
    from {{ ref('payouts') }}
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
from cleaned

