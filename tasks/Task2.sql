-- *******************************************************QUERIES***********************************************************************************************************
-- Exercise 2 *************************************************************************************************************************************************************

SELECT concat(U.user_first_name," ", U.user_last_name) as Name, Round(Sum(I.sales_amount),2) as Revenue from User as U
Join orders as O on U.User_ID = O.Order_ID
Join invoice as I on O.Order_ID = I.Order_ID
GROUP BY U.User_First_Name, U.User_Last_Name, I.Sales_Amount
ORDER BY I.Sales_Amount desc
Limit 3;