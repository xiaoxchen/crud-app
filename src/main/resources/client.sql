-- -----------------------------------------------------
-- Table client
-- -----------------------------------------------------
CREATE TABLE client (
  id integer NOT NULL PRIMARY KEY IDENTITY,
  client_name VARCHAR(45) NOT NULL,
  website_url VARCHAR(2083) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  line_1 VARCHAR(255) NOT NULL,
  line_2 VARCHAR(255) NULL,
  line_3 VARCHAR(255) NULL,
  city VARCHAR(45) NOT NULL,
  state VARCHAR(45) NOT NULL,
  zipcode CHAR(5) NOT NULL
);