-- *******************************************************QUERIES***********************************************************************************************************
-- Exercise 2 *************************************************************************************************************************************************************

USE fancy_company; 
SELECT concat(U.User_First_Name," ", U.User_Last_Name) as Name, Round(SUM(I.Sales_Amount*((100-D.Discount_Percentage)/100)),2) as Revenue
FROM Orders as O
JOIN User  as U On O.User_ID = U.User_ID
JOIN Invoice as  I On O.Invoice_ID = I.Invoice_ID
LEFT JOIN  Discount as D On O.Discount_ID = D.Discount_ID
GROUP BY Name
ORDER BY Revenue DESC
LIMIT 3;