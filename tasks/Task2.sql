-- *******************************************************QUERIES***********************************************************************************************************
-- Exercise 2 *************************************************************************************************************************************************************

USE fancy_company; 
SELECT concat(U.user_first_name," ", U.user_last_name) as Name, Round(SUM(i.sales_amount*((100-d.discount_percentage)/100)),2) as Revenue
FROM Orders as O
JOIN user  as u On o.user_id = u.user_id
JOIN invoice as  i On o.invoice_id = i.invoice_id
LEFT JOIN  Discount as D On o.discount_ID = d.discount_ID
GROUP BY Name
ORDER BY Revenue DESC
LIMIT 3;