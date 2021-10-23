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
