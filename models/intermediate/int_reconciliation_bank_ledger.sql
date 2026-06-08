with bank as (
    select
        transaction_id,
        transaction_date,
        amount,
        account_id,
        transaction_type
    from {{ ref('stg_bank_transactions') }}
),

ledger as (
    select
        reference_id,
        entry_date,
        amount,
        account_id,
        entry_type
    from {{ ref('stg_ledger_entries') }}
),

joined as (
    select
        b.transaction_id,
        b.transaction_date,
        l.entry_date,
        b.amount as bank_amount,
        l.amount as ledger_amount,
        b.account_id,
        case
            when abs(b.amount - l.amount) < 0.01 then 'matched'
            when l.reference_id is null then 'missing_in_ledger'
            else 'mismatch'
        end as reconciliation_status
    from bank b
    left join ledger l
        on b.transaction_id = l.reference_id
        and b.account_id = l.account_id
)

select * from joined;
