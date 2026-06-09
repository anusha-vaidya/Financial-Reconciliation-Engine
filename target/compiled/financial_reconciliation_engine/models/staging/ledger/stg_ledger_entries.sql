

with source as (
    select
        ledger_entry_id,
        entry_date,
        amount,
        currency,
        description,
        account_id,
        entry_type,
        reference_id
    from main."ledger_entries"
),

cleaned as (
    select
        ledger_entry_id,
        entry_date,
        amount,
        currency,
        description,
        account_id,
        lower(entry_type) as entry_type,
        reference_id
    from source
)

select
    ledger_entry_id,
    entry_date,
    amount,
    currency,
    description,
    account_id,
    entry_type,
    reference_id
from cleaned