DROP DATABASE IF EXISTS dealerships;

CREATE DATABASE IF NOT EXISTS dealerships;

USE dealerships;

# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #

create table dealerships (
dealership_id int auto_increment primary key,
name varchar(50),
address varchar(50),
phone varchar(12)
);

create table vehicles (
vin int primary key,
year int,
make varchar(50),
model varchar(50),
vehicle_type varchar(50),
color varchar(50),
odometer int,
price double,
sold boolean
);

create table inventory(
dealership_id int, 
vin int
);

create table sales_contracts (
id int auto_increment primary key,
sales_tax double,
recording_fee double,
processing_fee double,
finance Boolean,
vehicle_vin int,
foreign key (vehicle_vin) references vehicles(vin)
);

create table lease_contract (
id int auto_increment primary key,
expected_ending_value double,
lease_fee double,
vehicle_vin int,
foreign key (vehicle_vin) references vehicles(vin)
);

# ---------------------------------------------------------------------- #
#                populate dealerships                                    #
# ---------------------------------------------------------------------- #

insert into dealerships (name, address, phone) 
values 
('D & B Used Cars', '111 Old Benbrook Rd', '817-555-5555'),
('Star Motors', '222 Main St', '214-555-1234'),
('Elite Autos', '333 Elm Dr', '972-555-6789'),
('Budget Wheels', '444 Pine Ave', '469-555-2468'),
('Luxury Rides', '555 Oak Blvd', '817-555-1357');

# ---------------------------------------------------------------------- #
#                populate vehicles                                       #
# ---------------------------------------------------------------------- #

insert into vehicles (vin, year, make, model, vehicle_type, color, odometer, price, sold)
values
(1000001, 2015, 'Toyota', 'Camry', 'Sedan', 'White', 65000, 15500.00, FALSE),
(1000002, 2020, 'Honda', 'Civic', 'Sedan', 'Black', 25000, 20000.00, FALSE),
(1000003, 2018, 'Ford', 'F-150', 'Truck', 'Blue', 45000, 28000.00, TRUE),
(1000004, 2019, 'Chevrolet', 'Tahoe', 'SUV', 'Silver', 55000, 35000.00, FALSE),
(1000005, 2016, 'Nissan', 'Altima', 'Sedan', 'Red', 75000, 14000.00, TRUE),
(1000006, 2021, 'Tesla', 'Model 3', 'Electric', 'White', 15000, 45000.00, FALSE),
(1000007, 2017, 'Jeep', 'Wrangler', 'SUV', 'Green', 62000, 27000.00, TRUE),
(1000008, 2022, 'BMW', 'X5', 'SUV', 'Black', 10000, 60000.00, FALSE),
(1000009, 2014, 'Chevrolet', 'Malibu', 'Sedan', 'Gray', 85000, 11000.00, TRUE),
(1000010, 2018, 'Dodge', 'Charger', 'Sedan', 'Blue', 48000, 25000.00, FALSE);

# ---------------------------------------------------------------------- #
#                populate inventory                                      #
# ---------------------------------------------------------------------- #
INSERT INTO inventory (dealership_id, vin)
VALUES
(1, 1000001),
(1, 1000002),
(2, 1000003),
(2, 1000004),
(3, 1000005),
(3, 1000006),
(4, 1000007),
(4, 1000008),
(5, 1000009),
(5, 1000010);

# ---------------------------------------------------------------------- #
#                populate sales_contracts                                #
# ---------------------------------------------------------------------- #

INSERT INTO sales_contracts (sales_tax, recording_fee, processing_fee, finance, vehicle_vin)
VALUES
(1200.00, 85.00, 150.00, TRUE, 1000001),
(1800.00, 95.00, 175.00, FALSE, 1000002),
(2200.00, 90.00, 160.00, TRUE, 1000005),
(2500.00, 100.00, 200.00, FALSE, 1000009),
(3000.00, 120.00, 250.00, TRUE, 1000010);

# ---------------------------------------------------------------------- #
#                populate lease_contract                                 #
# ---------------------------------------------------------------------- #

INSERT INTO lease_contract (expected_ending_value, lease_fee, vehicle_vin)
VALUES
(12000.00, 300.00, 1000003),
(15000.00, 350.00, 1000004),
(25000.00, 400.00, 1000006),
(27000.00, 450.00, 1000007),
(35000.00, 500.00, 1000008);
