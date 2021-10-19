use fancy_company;
CREATE VIEW INVOICE_VIEW
AS 
SELECT I.Invoice_ID AS 'Invoice Number', I.Created_At as 'Date of issue', concat(U.User_First_Name,' ', U.User_Last_Name) as 'Client Name', UA.User_Address_Streetname AS 'Street Address', UA.User_Address_City as 'City', UA.User_Address_Postalcode as 'Postal Code', UA.User_Adress_Country as 'Country', I.Sales_Amount - I.Tax_Amount AS 'Subtotal', I.Tax_Rate, I.Tax_Amount AS 'Tax', I.Sales_Amount as 'Total'
FROM invoice AS I, ORDERS AS O, user AS U, user_address AS UA
WHERE I.Order_ID = O.Order_ID AND U.User_ID = O.Order_ID AND U.User_ID = UA.User_ID;

-- SELECT * FROM INVOICE_VIEW



