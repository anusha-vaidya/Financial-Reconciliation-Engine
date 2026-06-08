with bank_ledger as (
    select reconciliation_status, account_id
    from {{ ref('int_reconciliation_bank_ledger') }}
),
payouts as (
    select payout_status, account_id
    from {{ ref('int_reconciliation_payouts') }}
)

select
    account_id,
    count(case when reconciliation_status = 'matched' then 1 end) as matched_count,
    count(case when reconciliation_status = 'mismatch' then 1 end) as mismatch_count,
    count(case when reconciliation_status = 'missing_in_ledger' then 1 end) as missing_ledger_count,
    count(case when payout_status = 'settled' then 1 end) as settled_payouts,
    count(case when payout_status = 'variance' then 1 end) as payout_variances
from bank_ledger
left join payouts using (account_id)
group by account_id;
