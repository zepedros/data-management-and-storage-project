select ua.User_Address_City as location, Sum(sales_amount) as sales
from user_address as ua
inner join user as u
on u.User_ID = ua.User_ID
inner join orders as o
on u.user_id = o.user_id
inner join invoice as i
on o.order_Id = i.order_id
Group by ua.user_Address_city; 