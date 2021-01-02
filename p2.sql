create or replace function prog2(vendor_name text)
returns table(account text, customer_name text, province text)
AS $func$
BEGIN
return QUERY
select cust."Account", cust."Cname", cust."Province"
from "Customer" cust, "Vendor" vendor, "Transaction" trans
where (cust."Account" = trans."Account") AND (vendor."Vno" = trans."Vno")
and vendor."Vname" = vendor_name;
END
$func$  LANGUAGE plpgsql;