--1st
SELECT Client_id,
       MAX(Report_date) as Report_date,
       SUM(CASE WHEN Txn_type = 'debit' THEN Txn_amount ELSE 0 END) AS Debit_amount,
       SUM(CASE WHEN Txn_type = 'credit' THEN Txn_amount ELSE 0 END) AS Credit_amount,
       VSP_number AS Last_VSP
FROM VSP_oper_table
GROUP BY Client_id;

--2nd
SELECT Client_id,
       MONTH(Report_date) as Report_date,
       COUNT(Report_date)/(SELECT COUNT(Report_date) FROM VSP_oper_table WHERE TXN_type = 'debit') as Ratio
FROM VSP_oper_table
WHERE TXN_type = 'debit'
GROUP BY Client_id, MONTH(Report_date);