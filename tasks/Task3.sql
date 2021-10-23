Select '01/2019-12/2020' as PeriodOfSales, ROUND(SUM(Sales_Amount*((100-d.discount_percentage)/100)),2) as TotalSales, ROUND(Sum(Sales_Amount*((100-d.discount_percentage)/100)/2),2) as YearlyAverage, ROUND(Sum(Sales_Amount*((100-d.discount_percentage)/100)/24),2) as MonthlyAverage
from invoice as i
Join Orders as o 
ON o.invoice_id = i.invoice_id
Join Discount as D 
On o.discount_ID = d.discount_ID;
