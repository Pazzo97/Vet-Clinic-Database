/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
  id      		  	SERIAL PRIMARY KEY,
  name    			  VARCHAR(250),
  date_of_birth   DATE,
  escape_attempts INT,
  neutered     		BOOLEAN,
  weight_kgs			  DECIMAL,
  species_id			  INT,
  owners_id			  INT,
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


CREATE TABLE vets(
  id          serial PRIMARY KEY,
  name               varchar(25),
  age                int,
  date_of_graduation date
);

CREATE TABLE specializations(
  species_id int,
  vet_id     int,
  PRIMARY KEY (species_id, vet_id),
  CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species (id),
  CONSTRAINT fk_vets FOREIGN KEY (vet_id) REFERENCES vets (id)
);

CREATE TABLE visits(
  id serial PRIMARY KEY,
  animal_id     int,
  vet_id        int,
  date_of_visit date,
  CONSTRAINT fk_animal FOREIGN KEY (animal_id) REFERENCES animals (id),
  CONSTRAINT fk_vets FOREIGN KEY (vet_id) REFERENCES vets (id)
);


ALTER TABLE owners
ADD COLUMN email VARCHAR(120);

CREATE INDEX animal_id_asc ON visits (animal_id ASC);
CREATE INDEX vet_id_asc ON visits (vet_id ASC);
CREATE INDEX owner_email_asc ON owners(email ASC);