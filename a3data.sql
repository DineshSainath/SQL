CREATE TABLE "Vendor"
(
  "Vno" text NOT NULL,
  "Vname" text,
  "City" text,
  "Vbalance" numeric,
  PRIMARY KEY ("Vno")
);

CREATE TABLE "Customer"
(
  "Account" text NOT NULL,
  "Cname" text,
  "Province" text,
  "Cbalance" numeric,
  "Crlimit" integer,
  PRIMARY KEY ("Account")
);

CREATE TABLE "Transaction"
(
  "Tno" text NOT NULL,
  "Vno" text,
  "Account" text,
  "T_Date" date,
  "Amount" numeric,
  PRIMARY KEY ("Tno"),
  CONSTRAINT "Transaction_Account_fkey" FOREIGN KEY ("Account")
      REFERENCES "Customer" ("Account"),
  CONSTRAINT "Transaction_Vno_fkey" FOREIGN KEY ("Vno")
      REFERENCES "Vendor" ("Vno")
);