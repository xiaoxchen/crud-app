-- -----------------------------------------------------
-- Table client
-- -----------------------------------------------------
CREATE TABLE client (
  id integer NOT NULL PRIMARY KEY IDENTITY,
  client_name VARCHAR(45) NOT NULL,
  website_url VARCHAR(2083) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  mailing_address_id int FOREIGN KEY REFERENCES mailing_address(id)
);