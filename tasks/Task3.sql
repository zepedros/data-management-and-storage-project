Select '01/2019-12/2020' as PeriodOfSales, SUM(Sales_Amount/(D.Discount_Percentage/100)) as TotalSales, Sum(Sales_Amount/(D.Discount_Percentage/100)/2) as YearlyAverage, Sum(Sales_Amount/(D.Discount_Percentage/100)/24) as MonthlyAverage
from invoice as i
Join Orders as o 
ON o.invoice_id = i.invoice_id
Join Discount as D 
On o.discount_ID = d.discount_ID
