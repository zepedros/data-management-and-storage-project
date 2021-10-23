-- *******************************************************QUERIES***********************************************************************************************************
-- Exercise 1 *************************************************************************************************************************************************************

USE fancy_company; 
SELECT concat(U.User_First_Name, ' ', U.User_Last_Name) as Name, O.Created_At AS Date, P.Product_Name
FROM Orders AS O, Order_Item AS OI, User AS U, Product AS P
WHERE O.Order_ID = OI.Order_ID AND O.User_ID = U.User_ID AND OI.Order_Item_ID = P.Product_ID
AND O.Created_At > '2019-02-28 11:10:00' AND O.Created_At < '2019-06-02 07:33:01';

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


-- Exercise 3 *************************************************************************************************************************************************************

USE fancy_company; 
Select '01/2019-12/2020' as PeriodOfSales, ROUND(SUM(Sales_Amount*((100-D.Discount_Percentage)/100)),2) as TotalSales, ROUND(Sum(Sales_Amount*((100-D.Discount_Percentage)/100)/2),2) as YearlyAverage, ROUND(Sum(Sales_Amount*((100-D.Discount_Percentage)/100)/24),2) as MonthlyAverage
from Invoice as I
Join Orders as O 
ON O.Invoice_ID = I.Invoice_ID
Join Discount as D 
On O.Discount_ID = D.Discount_ID;


-- Exercise 4 *************************************************************************************************************************************************************

USE fancy_company; 
select UA.User_Address_City as Location, ROUND(Sum(Sales_Amount *((100-D.Discount_Percentage)/100)),2) as Sales
from User as U
join User_Address as UA
on U.User_ID = UA.User_ID
join Orders as O
on U.User_ID = O.User_ID
 join Invoice as I
on O.Order_ID = I.Order_ID
 join Discount as D
on O.Discount_ID = D.Discount_ID
Group by UA.User_Address_City;

-- Exercise 5 *************************************************************************************************************************************************************

USE fancy_company; 
SELECT Distinct UA.User_Address_City as Location
from User_Address as UA
inner join User as U
on U.User_ID = UA.User_ID
inner join Product_Rating as PA
on U.User_ID = PA.User_ID
inner join Orders as O
on O.User_ID = U.User_ID
where  U.User_ID IN ( Select PAA.User_ID
from Product_Rating as PAA)
AND  U.User_ID IN (SELECT OO.User_ID 
from Orders as OO);
