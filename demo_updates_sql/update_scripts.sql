--INSERT rows into PRODUCTS table
INSERT INTO Products (id, name, description) VALUES ('5', 'Wireless Mouse', 'Wireless Mouse');
-- UPDATE a product
update products set description = 'LED Monitor' where id = 4;


--INSERT rows into CUSTOMER and GENERIC_KEY_VALUE tables
INSERT INTO customers (id, first_name, last_name, email) VALUES ('CU-9212', 'Rob', 'Miller', 'rob.miller@abc.com');



INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-9212', 'Customers', 'Address Line 1', '#221');
INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-9212', 'Customers', 'Address Line 2', 'Bay Street');
INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-9212', 'Customers', 'city', 'Southington');
INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-9212', 'Customers', 'state', 'Connecticut');
INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-9212', 'Customers', 'zip', '06489');


INSERT INTO customers (id, first_name, last_name, email) VALUES ('CU-1212', 'Glenn', 'Smith', 'glenn.smith@abc.com');

INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-1212', 'Customers', 'Address Line 1', '#7916');
INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-1212', 'Customers', 'Address Line 2', 'Vermont Avenue');
INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-1212', 'Customers', 'city', 'Apex');
INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-1212', 'Customers', 'state', 'North Carolina');
INSERT INTO Generic_Key_Value (id, id_type, key_col, key_val) VALUES ('CU-1212', 'Customers', 'zip', '27502');


--UPDATE ADDRESS in GENERIC_KEY_VALUE TABLE

update Generic_Key_Value set KEY_VAL = '678' where ID = 'CU-1230' and ID_TYPE = 'Customers' and key_col = 'Address Line 1';
update Generic_Key_Value set KEY_VAL = 'Elmwood St.' where ID = 'CU-1230' and ID_TYPE = 'Customers' and key_col = 'Address Line 2';
update Generic_Key_Value set KEY_VAL = 'Ridgewood' where ID = 'CU-1230' and ID_TYPE = 'Customers' and key_col = 'city';
update Generic_Key_Value set KEY_VAL = 'New Jersey' where ID = 'CU-1230' and ID_TYPE = 'Customers' and key_col = 'state';
update Generic_Key_Value set KEY_VAL = '07450' where ID = 'CU-1230' and ID_TYPE = 'Customers' and key_col = 'zip';




