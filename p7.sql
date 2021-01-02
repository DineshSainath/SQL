create or replace function prog7()
returns table(cust_name text, new_balance numeric)
as $func$
BEGIN
return QUERY
select "Cname", "Cbalance" + (("Cbalance" - "Crlimit") *10 / 100)
from "Customer"
where "Cbalance" > "Crlimit";
END
$func$  LANGUAGE plpgsql;