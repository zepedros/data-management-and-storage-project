Select '01/2019-12/2020' as PeriodOfSales, SUM(Sales_Amount) as TotalSales, Sum(Sales_Amount/2) as YearlyAverage, Sum(Sales_Amount/24) as MonthlyAverage
from invoice