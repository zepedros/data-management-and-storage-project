USE fancy_company;

CREATE VIEW INVOICE_VIEW  AS
Select I.Invoice_ID AS 'Invoice Number', I.Created_At as 'Date of issue', DATE(DATE_ADD(I.created_at, INTERVAL 5 DAY)) AS 'Term',concat(U.User_First_Name,' ', U.User_Last_Name) as 'Client Name', UA.User_Address_Streetname AS 'Street Address', UA.User_Address_City as 'City', UA.User_Address_Postalcode as 'Postal Code', UA.User_Adress_Country as 'Country', I.Sales_Amount AS 'Subtotal', Round((I.Sales_Amount*0.19),2)  AS 'Tax', ROUND((I.Sales_Amount*1.19) - (I.Sales_Amount*1.19* (D.Discount_Percentage/100)),2) as 'Total', D.Discount_Percentage AS 'Discount %', C.Company_Name AS 'Company Name', CONCAT(C.Company_Postal_Code, ' ', C.Company_Street_Name, ' ', C.Company_Street_Number, ', ', C.Company_City,', ', C.Company_Country) AS 'Company Address', C.Company_Email, C.Company_Telephone
from Orders AS O
JOIN Invoice AS I
ON O.Order_ID = I.Order_ID
LEFT JOIN Discount as D 
ON O.Discount_ID = D.Discount_ID
LEFT JOIN User AS U
ON U.User_ID = O.User_ID
LEFT JOIN User_Address AS UA
ON U.User_ID = UA.User_ID
JOIN Company AS C;

select * from INVOICE_VIEW