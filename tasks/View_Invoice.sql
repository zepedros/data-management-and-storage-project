USE fancy_company;

Select I.Invoice_ID AS 'Invoice Number', I.Created_At as 'Date of issue', DATE(DATE_ADD(I.created_at, INTERVAL 5 DAY)) AS 'Term',concat(U.User_First_Name,' ', U.User_Last_Name) as 'Client Name', UA.User_Address_Streetname AS 'Street Address', UA.User_Address_City as 'City', UA.User_Address_Postalcode as 'Postal Code', UA.User_Adress_Country as 'Country', I.Sales_Amount AS 'Subtotal', (I.Sales_Amount*0.19)  AS 'Tax', (I.Sales_Amount*1.19) - (I.Sales_Amount*1.19* (D.Discount_Percentage/100)) as 'Total', D.Discount_Percentage AS 'Discount %'
from Orders AS O
JOIN Invoice AS I
ON O.Order_ID = I.Order_ID
LEFT JOIN Discount as D 
ON O.Discount_ID = D.Discount_ID
LEFT JOIN User AS U
ON U.User_ID = O.User_ID
LEFT JOIN User_Address AS UA
ON U.User_ID = UA.User_ID;