

with source as (
    select
        transaction_id,
        transaction_date,
        amount,
        currency,
        description,
        account_id,
        transaction_type
    from main."bank_transactions"
),

cleaned as (
    select
        transaction_id,
        transaction_date,
        amount,
        currency,
        description,
        account_id,
        lower(transaction_type) as transaction_type
    from source
)

select
    transaction_id,
    transaction_date,
    amount,
    currency,
    description,
    account_id,
    transaction_type
from cleaned