Select '01/2019-12/2020' as PeriodOfSales, ROUND(SUM(Sales_Amount*((100-D.Discount_Percentage)/100)),2) as TotalSales, ROUND(Sum(Sales_Amount*((100-D.Discount_Percentage)/100)/2),2) as YearlyAverage, ROUND(Sum(Sales_Amount*((100-D.Discount_Percentage)/100)/24),2) as MonthlyAverage
from Invoice as I
Join Orders as O 
ON O.Invoice_ID = I.Invoice_ID
Join Discount as D 
On O.Discount_ID = D.Discount_ID;
