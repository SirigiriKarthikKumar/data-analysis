SELECT * FROM data.`ecommerce shipping data`;

/* where */
SELECT * FROM data.`ecommerce shipping data` where customer_rating=4;
SELECT * FROM data.`ecommerce shipping data` where customer_rating<3;

/* order by*/
SELECT * FROM data.`ecommerce shipping data` order by prior_purchases ASC;
SELECT * FROM data.`ecommerce shipping data` order by prior_purchases DESC;

/*group by*/
SELECT warehouse_block,SUM(discount_offered) FROM data.`ecommerce shipping data` GROUP BY warehouse_block;

/* SUM*/
SELECT SUM(cost_of_the_product) FROM data.`ecommerce shipping data`;

/*AVG*/
SELECT AVG(cost_of_the_product) FROM data.`ecommerce shipping data`;

/*subqueries*/
SELECT warehouse_block,customer_rating,(SELECT avg(prior_purchases) FROM data.`ecommerce shipping data`)FROM data.`ecommerce shipping data`;

/* view*/
CREATE VIEW mode_of_shipment AS SELECT * FROM data.`ecommerce shipping data` WHERE customer_rating=3;

/* indexes */
CREATE INDEX myIndex ON data.`ecommerce shipping data` (gender);
