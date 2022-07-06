/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
  id      		  	SERIAL PRIMARY KEY,
  name    			  VARCHAR(250),
  date_of_birth   DATE,
  escape_attempts INT,
  neutered     		BOOLEAN,
  weight_kgs			  DECIMAL,
  species         VARCHAR(250)
);

CREATE TABLE owners(
  id SERIAL      PRIMARY KEY,
  full_name      VARCHAR(250),
  age INT
);

CREATE TABLE species(
  id SERIAL PRIMARY KEY,
  name VARCHAR(250)
);


ALTER TABLE animals 
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id)
REFERENCES species(id);

ALTER TABLE animals
ADD CONSTRAINT fk_owners
FOREIGN KEY (owners_id)
REFERENCES owners(id);
