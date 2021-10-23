select UA.User_Address_City as location, ROUND(Sum(Sales_Amount *((100-D.Discount_Percentage)/100)),2) as sales
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
