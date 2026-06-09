
    
    create view main."int_reconciliation_bank_ledger" as
    

with bank as (
    select
        transaction_id,
        transaction_date,
        amount as bank_amount,
        account_id,
        transaction_type
    from main."stg_bank_transactions"
),

ledger as (
    select
        ledger_entry_id,
        entry_date,
        amount as ledger_amount,
        account_id,
        entry_type,
        reference_id
    from main."stg_ledger_entries"
)

select
    bank.transaction_id as transaction_id,
    bank.transaction_date as transaction_date,
    bank.bank_amount as bank_amount,
    ledger.ledger_amount as ledger_amount,
    bank.account_id as account_id,
    ledger.ledger_entry_id as entry_id,
    ledger.entry_type as entry_type,
    ledger.reference_id as reference_id
from bank
left join ledger
    on bank.transaction_id = ledger.reference_id;