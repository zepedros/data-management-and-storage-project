-- *******************************************************QUERIES***********************************************************************************************************
-- Exercise 2 *************************************************************************************************************************************************************


SELECT concat(U.user_first_name," ", U.user_last_name) as Name, ROUND(SUM(i.sales_amount* ( 1 - ( d.discount_percentage / 100 ) )),2) as Revenue
 From orders as o
 Join user  as u On o.user_id = u.user_id
 Join invoice as  i On o.invoice_id = i.invoice_id
 Join Discount as D On o.discount_ID = d.discount_ID
 GROUP BY Name
 ORDER BY Revenue DESC
 LIMIT 3;
