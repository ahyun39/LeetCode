SELECT DATE_FORMAT(trans_date,'%Y-%m') month, country, COUNT(1) trans_count, COUNT(CASE WHEN state="approved" THEN 1 ELSE NULL END) approved_count, SUM(amount) trans_total_amount, SUM(CASE WHEN state="approved" THEN amount ELSE 0 END) approved_total_amount
FROM Transactions
GROUP BY 1, 2