create or replace function prog3(acc text, cust_name text, prov text, cust_balance numeric, credit_limit integer)
returns table(account text, c_name text, province text, c_balance numeric, cr_limit integer)
AS $func$
BEGIN
insert into "Customer"("Account", "Cname", "Province", "Cbalance", "Crlimit") 
	values (acc, cust_name, prov, cust_balance, credit_limit);
return QUERY
select * from "Customer";
END
$func$  LANGUAGE plpgsql;