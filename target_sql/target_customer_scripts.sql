# In production you would almost certainly limit the replication user must be on the follower (slave) machine,
# to prevent other clients accessing the log from other machines. For example, 'replicator'@'follower.acme.com'.
#
# However, this grant is equivalent to specifying *any* hosts, which makes this easier since the docker host
# is not easily known to the Docker container. But don't do this in production.
#

# Create the database that we'll use to populate data and watch the effect in the binlog
CREATE DATABASE customer;
GRANT ALL PRIVILEGES ON customer.* TO 'mysqluser'@'%';

# Switch to this database
USE customer;


# Create table products 
CREATE TABLE products (
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description VARCHAR(512)
);
ALTER TABLE products AUTO_INCREMENT = 1;


# Create table customers ...
CREATE TABLE customers (
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  customer_ref VARCHAR(12) NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE KEY
) AUTO_INCREMENT=1;



# Create table addresses
CREATE TABLE addresses (
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  address_line_1 VARCHAR(255) NOT NULL, 
  street VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  state VARCHAR(255) NOT NULL,
  zip VARCHAR(255) NOT NULL,
  type enum('SHIPPING','BILLING','LIVING') NOT NULL,
  FOREIGN KEY address_customer (customer_id) REFERENCES customers(id)
) AUTO_INCREMENT = 1;



