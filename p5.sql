create or replace function prog5()
returns table(vendor_no text, vendor_name text, sum numeric)
as $func$
BEGIN
return QUERY
select trans."Vno", vendor."Vname", vendor."Vbalance" + SUM("Amount") AS "New Balance"
from  "Vendor" vendor
join "Transaction" trans on vendor."Vno" = trans."Vno"
group by trans."Vno", vendor."Vno";
END
$func$  LANGUAGE plpgsql;