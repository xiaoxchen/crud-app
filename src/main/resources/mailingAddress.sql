-- -----------------------------------------------------
-- Table mailing_address
-- -----------------------------------------------------
CREATE TABLE mailing_address (
  id integer NOT NULL PRIMARY KEY IDENTITY,
  line_1 VARCHAR(255) NOT NULL,
  line_2 VARCHAR(255) NULL,
  line_3 VARCHAR(255) NULL,
  city VARCHAR(45) NOT NULL,
  state VARCHAR(45) NULL,
  zipcode VARCHAR(45) NULL,
  country VARCHAR(45) NOT NULL,
);