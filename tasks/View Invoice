USE fancy_company;
CREATE VIEW invoice_details_view  AS
SELECT 
        `i`.`Invoice_ID` AS `Invoice_Number`,
        `p`.`Product_Name` AS `Description`,
        `p`.`Product_Price` AS `Unit_Cost`,
        `oi`.`Quantity` AS `Quantity`,
        (`p`.`Product_Price` * `oi`.`Quantity`) AS `Amount`

FROM
        ((((`fancy_company`.`invoice` `i`
        JOIN `fancy_company`.`orders` `o` ON ((`i`.`Order_ID` = `o`.`Order_ID`)))
        JOIN `fancy_company`.`order_item` `oi` ON ((`o`.`Order_ID` = `oi`.`Order_ID`)))
        JOIN `fancy_company`.`sku` `s` ON ((`oi`.`SKU_ID` = `s`.`SKU_ID`)))
        JOIN `fancy_company`.`product` `p` ON ((`s`.`Product_ID` = `p`.`Product_ID`)));