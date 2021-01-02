create or replace function prog8(trans_no text, vendor_no text, acc text, amount numeric)
returns table(trans_num text, vendor_num text, account text, cust_name text, cust_balance numeric, vendor_name text, vendor_balance numeric)
AS $func$
BEGIN
insert into "Transaction"("Tno", "Vno", "Account", "T_Date", "Amount")
	values (trans_no, vendor_no, acc, CURRENT_TIMESTAMP, amount);
update "Vendor" set "Vbalance" = ("Vbalance" + amount) where "Vno" = vno;
update "Customer" set "Cbalance" = ("Cbalance" + amount) where "Account" = acc;
return QUERY
select trans."Tno", trans."Vno", trans."Account", cust."Cname", cust."Cbalance", vendor."Vname", vendor."Vbalance"
from "Transaction" trans
join "Customer" cust on trans."Account" = cust."Account"
join "Vendor" vendor on trans."Vno" = vendor."Vno";
END
$func$  LANGUAGE plpgsql;
