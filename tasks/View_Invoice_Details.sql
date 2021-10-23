USE fancy_company;
CREATE VIEW INVOICE_DETAILS_VIEW  AS
SELECT 
        `I`.`Invoice_ID` AS `Invoice_Number`,
        `P`.`Product_Name` AS `Description`,
        `P`.`Product_Price` AS `Unit_Cost`,
        `OI`.`Quantity` AS `Quantity`,
        (`P`.`Product_Price` * `OI`.`Quantity`) AS `Amount`

FROM
        ((((`fancy_company`.`Invoice` `I`
        JOIN `fancy_company`.`Orders` `O` ON ((`I`.`Order_ID` = `O`.`Order_ID`)))
        JOIN `fancy_company`.`Order_Item` `OI` ON ((`O`.`Order_ID` = `OI`.`Order_ID`)))
        JOIN `fancy_company`.`SKU` `S` ON ((`OI`.`SKU_ID` = `S`.`SKU_ID`)))
        JOIN `fancy_company`.`Product` `P` ON ((`S`.`Product_ID` = `P`.`Product_ID`)));

SELECT * FROM INVOICE_DETAILS_VIEW;