-- DATABASE DEFINITION

CREATE TABLE Providers (
    id int AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE Products (
    id int AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    provider_id int NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(provider_id) REFERENCES Providers(id)
);

CREATE TABLE Employees (
    id bigint,
    name varchar(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE Sales (
    id int AUTO_INCREMENT,
    customer_id int, -- It's not a foreign key
    customer_id_type varchar(30),
    employee_id int,
    product_id int,
    deleted boolean,
    PRIMARY KEY(id),
    FOREIGN KEY(employee_id) REFERENCES Employees(id),
    FOREIGN KEY(product_id) REFERENCES Products(id)
);

-- INITIAL DATA

INSERT INTO Providers (name) VALUES ("Nestle");
INSERT INTO Providers (name) VALUES ("Alpina");
INSERT INTO Providers (name) VALUES ("Colombina");
INSERT INTO Providers (name) VALUES ("Familia S.A.");
INSERT INTO Providers (name) VALUES ("Unilever");
INSERT INTO Providers (name) VALUES ("TecnoQuimica");

INSERT INTO Products (name, provider_id) VALUES ("Galletas Saltinas", 1);
INSERT INTO Products (name, provider_id) VALUES ("Leche el rodeo", 1);
INSERT INTO Products (name, provider_id) VALUES ("Arequipe", 2);
INSERT INTO Products (name, provider_id) VALUES ("Queso mozarella", 2);
INSERT INTO Products (name, provider_id) VALUES ("Bom Bom Bum", 3);
INSERT INTO Products (name, provider_id) VALUES ("Galletas waffer", 3);
INSERT INTO Products (name, provider_id) VALUES ("Servilletas", 4);
INSERT INTO Products (name, provider_id) VALUES ("Pañal Pequeñin", 4);
INSERT INTO Products (name, provider_id) VALUES ("Jabon Rexona", 5);
INSERT INTO Products (name, provider_id) VALUES ("Shampoo Sedal", 5);
INSERT INTO Products (name, provider_id) VALUES ("Vick VapoRub", 6);
INSERT INTO Products (name, provider_id) VALUES ("Blanqueador Clorox", 6);

INSERT INTO Employees VALUES (123456, "Jhon Doe");

INSERT INTO
    Sales (
        customer_id,
        customer_id_type,
        employee_id,
        product_id
    )
VALUES
    (1111, "cc", 123456, 8);

INSERT INTO
    Sales (
        customer_id,
        customer_id_type,
        employee_id,
        product_id
    )
VALUES
    (2222, "ti", 123456, 6);

INSERT INTO
    Sales (
        customer_id,
        customer_id_type,
        employee_id,
        product_id
    )
VALUES
    (3333, "ce", 123456, 3);

INSERT INTO
    Sales (
        customer_id,
        customer_id_type,
        employee_id,
        product_id
    )
VALUES
    (1111, "cc", 123456, 10);

INSERT INTO
    Sales (
        customer_id,
        customer_id_type,
        employee_id,
        product_id
    )
VALUES
    (4444, "ti", 123456, 6);

INSERT INTO
    Sales (
        customer_id,
        customer_id_type,
        employee_id,
        product_id
    )
VALUES
    (5555, "ce", 123456, 4);

INSERT INTO
    Sales (
        customer_id,
        customer_id_type,
        employee_id,
        product_id
    )
VALUES
    (6666, "cc", 123456, 10);

INSERT INTO
    Sales (
        customer_id,
        customer_id_type,
        employee_id,
        product_id
    )
VALUES
    (2222, "ti", 123456, 6);

INSERT INTO
    Sales (
        customer_id,
        customer_id_type,
        employee_id,
        product_id
    )
VALUES
    (3333, "ce", 123456, 4);

INSERT INTO
    Sales (
        customer_id,
        customer_id_type,
        employee_id,
        product_id
    )
VALUES
    (1111, "cc", 123456, 5);

INSERT INTO
    Sales (
        customer_id,
        customer_id_type,
        employee_id,
        product_id
    )
VALUES
    (2222, "ti", 123456, 1);

INSERT INTO
    Sales (
        customer_id,
        customer_id_type,
        employee_id,
        product_id
    )
VALUES
    (3333, "ce", 123456, 4);

INSERT INTO
    Sales (
        customer_id,
        customer_id_type,
        employee_id,
        product_id
    )
VALUES
    (1111, "cc", 123456, 10);

INSERT INTO
    Sales (
        customer_id,
        customer_id_type,
        employee_id,
        product_id
    )
VALUES
    (2222, "ti", 123456, 2);

INSERT INTO
    Sales (
        customer_id,
        customer_id_type,
        employee_id,
        product_id
    )
VALUES
    (3333, "ce", 123456, 7);

-- TEST QUERIES

-- PHYSICAL DELETE
DELETE FROM Sales WHERE id = 2;
-- LOGICAL DELETE
UPDATE Sales SET deleted = true WHERE id = 5;

-- MODIFY PRODUCTS
UPDATE Products SET name = "Pañuelos", provider_id = 4,  WHERE id = 5;
UPDATE Products SET name = "Nescafe", provider_id = 1,  WHERE id = 3;
UPDATE Products SET name = "Nucita", provider_id = 3  WHERE id = 1;
