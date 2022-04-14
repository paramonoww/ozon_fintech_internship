-- Я не придумал ничего лучше, чем джоинить таблицы по датам, учитывая тот факт, что обычно время перед праздниками
-- составляет не больше 3х дней, может быть не самое оптимальное решение, но до меня дошло только это :)

SELECT Client_id,
       Transactions.Report_date as Report_date,
       (Txn_amount / CCy_rate) as Dollars
FROM Transactions INNER JOIN Rates ON
                (Transactions.Report_date = Rates.Report_date or
                Transactions.Report_date = DATEADD(dd, 1, Rates.Report_date) or
                Transactions.Report_date = DATEADD(dd, 2, Rates.Report_date) or
                Transactions.Report_date = DATEADD(dd, 3, Rates.Report_date))
WHERE Ccy_code = 840;