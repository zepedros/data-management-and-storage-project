select ua.User_Address_City as location, Round(Sum(sales_amount/(D.Discount_Percentage/100))) as sales
from user_address as ua
inner join user as u
on u.User_ID = ua.User_ID
inner join orders as o
on u.user_id = o.user_id
inner join invoice as i
on o.order_Id = i.order_id
left join discount as d
on o.discount_ID = d.discount_ID
Group by ua.user_Address_city; 
