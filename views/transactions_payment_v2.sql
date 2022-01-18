drop view if exists transactions_payment_v1;
create view transactions_payment_v2 as
  with payment_v2_parsed as
    (select
      block,
      fields->>'fee' as fee,
      hash,
      type,
      fields->>'nonce' as nonce,
      fields->>'payer' as payer,
      row_to_json(json_populate_recordset(null::transactions_payment, (fields->>'payments')::json)) as payments_list
    from transactions
    where transactions.type = 'payment_v2') 

  select
    block,
    fee,
    hash,
    type,
    nonce,
    payments_list->>'payee' as payee,
    payer,
    (payments_list->>'amount')::bigint as amount
  from payment_v2_parsed;
