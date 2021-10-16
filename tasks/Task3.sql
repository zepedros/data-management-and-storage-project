Select '01/2019-12/2020' as PeriodOfSales, Round(SUM(Sales_Amount),2) as TotalSales, Round(Sum(Sales_Amount/2),2) as YearlyAverage, Round(AVG(Sales_Amount/23),2) as MonthlyAverage
from invoice
