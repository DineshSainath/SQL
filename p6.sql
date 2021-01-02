create or replace function prog6()
returns table(vendor_name text, charges numeric, new_balance numeric)
AS $func$
BEGIN
return QUERY
select "Vname", ("Vbalance" * 4 / 100) AS "Fee Charged",
("Vbalance" - ("Vbalance" * 4 / 100)) AS "New Balance"
from "Vendor";
END
$func$  LANGUAGE plpgsql;