create or replace function prog4()
returns table(account text, customer_name text, amount numeric, vendor_name text)
as $func$
BEGIN
return QUERY
select cust."Account", cust."Cname", trans."Amount", vendor."Vname"
from "Customer" cust
join  "Transaction" trans on cust."Account" = trans."Account"
join "Vendor" vendor on vendor."Vno" = trans."Vno"
where trans."T_Date" = (select MAX(trans."T_Date") from "Transaction" trans where cust."Account" = trans."Account");   
raise info 'No Transaction';
END;
$func$  LANGUAGE plpgsql;

