-- QUERIES
-- Select products sold by a customer id and id_type
SELECT
    Sales.id,
    customer_id,
    customer_id_type,
    product_id,
    Products.name AS product_name,
    provider_id,
    Providers.name AS provider_name,
    Employees.name AS employee
FROM
    Sales
    LEFT JOIN Products ON Sales.product_id = Products.id
    LEFT JOIN Providers ON Products.provider_id = Providers.id
    LEFT JOIN Employees ON Sales.employee_id = Employees.id
WHERE
    customer_id = 1111
    AND customer_id_type = "cc";

-- Select products by name and show its providers
SELECT
    Products.id AS product_id,
    Products.name AS product_name,
    Providers.id AS provider_id,
    Providers.name AS provider_name
FROM
    Products
    LEFT JOIN Providers ON Products.provider_id = Providers.id
WHERE
    Products.name = 'Queso mozarella';

-- Select products show how many have been sold and sort them.
SELECT
    Sales.id,
    customer_id,
    customer_id_type,
    product_id,
    Products.name AS product_name,
    provider_id,
    Providers.name AS provider_name,
    Employees.name AS employee,
    COUNT(*) AS sold_quantity
FROM
    Sales
    LEFT JOIN Products ON Sales.product_id = Products.id
    LEFT JOIN Providers ON Products.provider_id = Providers.id
    LEFT JOIN Employees ON Sales.employee_id = Employees.id
GROUP BY
    product_id
ORDER BY
    sold_quantity DESC;
