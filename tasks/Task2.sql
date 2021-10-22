-- *******************************************************QUERIES***********************************************************************************************************
-- Exercise 2 *************************************************************************************************************************************************************


SELECT concat(U.user_first_name," ", U.user_last_name) as Name, Round(SUM(i.Sales_amount/(D.Discount_Percentage/100))) as Revenue
From orders as o
Join user  as u On o.user_id = u.user_id
Join invoice as  i On o.invoice_id = i.invoice_id
Join Discount as D On o.Discount_ID = d.discount_id
GROUP BY Name
ORDER BY Revenue DESC
LIMIT 3;
