-- *******************************************************QUERIES***********************************************************************************************************
-- Exercise 1 *************************************************************************************************************************************************************

SELECT concat(U.User_First_Name, ' ', U.User_Last_Name) as Name, O.Created_At AS Date, P.Product_Name
FROM Orders AS O, Order_Item AS OI, User AS U, Product AS P
WHERE O.Order_ID = OI.Order_ID AND O.User_ID = U.User_ID AND OI.Order_Item_ID = P.Product_ID
AND O.Created_At > '2019-02-28 11:10:00' AND O.Created_At < '2019-06-02 07:33:01';