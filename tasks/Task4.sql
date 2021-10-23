select ua.User_Address_City as location, ROUND(Sum(sales_amount *((100-d.discount_percentage)/100)),2) as sales
from user as u
join user_address as ua
on u.User_ID = ua.User_ID
join orders as o
on u.user_id = o.user_id
 join invoice as i
on o.order_Id = i.order_id
 join discount as d
on o.discount_ID = d.discount_ID
Group by ua.user_Address_city;
