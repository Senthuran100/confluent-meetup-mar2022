
CREATE TABLE customers (id TEXT PRIMARY KEY, first_name varchar(255), last_name varchar(255), email varchar(255));

INSERT INTO customers (id, first_name, last_name, email) VALUES ('CU-1230', 'Mark', 'Taylor', 'mark.taylor@abc.com');
INSERT INTO customers (id, first_name, last_name, email) VALUES ('CU-9812', 'Bob', 'Smith', 'bob.smith@abc.com');
INSERT INTO customers (id, first_name, last_name, email) VALUES ('CU-8712', 'Martin', 'Fowler', 'martin.fowler@abc.com');


create table Generic_Key_Value(id TEXT, id_type varchar(50), key_col varchar(50), key_val varchar(255), PRIMARY KEY(id, id_type, key_col));

INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-1230', 'Customers', 'Address Line 1', 'Ap #867-859');
INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-1230', 'Customers', 'Address Line 2', 'Sit Rd');
INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-1230', 'Customers', 'city', 'Albany');
INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-1230', 'Customers', 'state', 'New York');
INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-1230', 'Customers', 'zip', '39531');

INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-9812', 'Customers', 'Address Line 1', 'P.O. Box 897');
INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-9812', 'Customers', 'Address Line 2', 'Daniel Street');
INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-9812', 'Customers', 'city', 'San Jose');
INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-9812', 'Customers', 'state', 'California');
INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-9812', 'Customers', 'zip', '89881');


INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-8712', 'Customers', 'Address Line 1', '#761');
INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-8712', 'Customers', 'Address Line 2', 'Low Street');
INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-8712', 'Customers', 'city', 'Jackonsville');
INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-8712', 'Customers', 'state', 'Florida');
INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-8712', 'Customers', 'zip', '59531');


create table Products(id INT primary key, name varchar(255), description varchar(512));


INSERT INTO Products (id, name, description) VALUES ('1', 'Wirelss Keyboard', 'Wirelss Keyboard');
INSERT INTO Products (id, name, description) VALUES ('2', 'Bluetooth Headset', 'Bluetooth Headset');
INSERT INTO Products (id, name, description) VALUES ('3', 'Optical Mouse', 'Optical Mouse');

INSERT INTO Products (id, name, description) VALUES ('4', 'Monitor', 'Monitor');


