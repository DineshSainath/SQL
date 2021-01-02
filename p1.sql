create or replace function prog1(customer_name text)
returns table(vendor_name text, t_date Date, amount numeric)
as $func$
BEGIN
return QUERY
select vendor."Vname", trans."T_Date", trans."Amount"
from "Vendor" vendor, "Transaction" trans, "Customer" cust
where (vendor."Vno" = trans."Vno") AND (cust."Account" = trans."Account")
and cust."Cname" = customer_name;
END
$func$  LANGUAGE plpgsql;