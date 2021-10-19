SELECT Distinct ua.User_Address_City as Location
from user_address as ua
inner join user as u
on u.User_ID = ua.User_ID
inner join product_rating as pa
on u.user_id = pa.user_id
inner join orders as o
on o.user_id = u.user_id
where  u.user_ID IN ( Select paa.User_ID
from product_rating as paa)
AND  u.user_ID IN (SELECT oo.User_ID 
from orders as oo);
