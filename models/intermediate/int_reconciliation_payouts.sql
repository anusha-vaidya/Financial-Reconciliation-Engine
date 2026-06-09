with bank as (
    select
        transaction_id,
        transaction_date,
        amount,
        account_id
    from {{ ref('stg_bank_transactions') }}
),

payouts as (
    select
        payout_id,
        payout_date,
        net_amount,
        account_id,
        transaction_id
    from {{ ref('stg_payouts') }}
),

joined as (
    select
        p.payout_id,
        p.payout_date,
        b.transaction_date,
        p.net_amount,
        b.amount as bank_amount,
        p.account_id,
        case
            when abs(p.net_amount - b.amount) < 0.01 then 'settled'
            else 'variance'
        end as payout_status
    from payouts p
    left join bank b
        on p.transaction_id = b.transaction_id
        and p.account_id = b.account_id
)

select * from joined;
