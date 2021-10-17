-- *******************************************************QUERIES***********************************************************************************************************
-- Exercise 2 *************************************************************************************************************************************************************


SELECT concat(U.user_first_name," ", U.user_last_name) as Name, Round(SUM(i.Sales_amount),2) as Revenue
From orders o
Join user u On o.user_id = u.user_id
Join invoice i On o.invoice_id = i.invoice_id
GROUP BY Name 
ORDER BY Revenue DESC
LIMIT 3;
