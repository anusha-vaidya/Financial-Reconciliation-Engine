with source as (

    select
        payout_id,
        cast(payout_date as date) as payout_date,
        cast(gross_amount as numeric) as gross_amount,
        cast(fee_amount as numeric) as fee_amount,
        cast(net_amount as numeric) as net_amount,
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

select * from cleaned;

