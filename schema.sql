/* Database schema to keep the structure of entire database. */


DROP TABLE IF EXISTS 
animals,
owners,
species,
vets,
visits,
species,
specialization

CASCADE;

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name varchar(100) NOT NULL,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg FLOAT
);

ALTER TABLE animals ADD species varchar(255);

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name varchar(100) NOT NULL,
    age INT
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name varchar(100) NOT NULL
);


ALTER TABLE animals DROP COLUMN id;  
ALTER TABLE animals ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT,
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id)
REFERENCES species (id);

ALTER TABLE animals ADD COLUMN owner_id INT,
ADD CONSTRAINT fk_owners
FOREIGN KEY (owner_id)
REFERENCES owners (id);

CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(65),
  age INT,
  date_of_graduation DATE,
  PRIMARY KEY(id)
);

CREATE TABLE specialization(
  species_id INT NOT NULL,
  vets_id INT NOT NULL,
  CONSTRAINT species_fk FOREIGN KEY (species_id) REFERENCES species(id),
  CONSTRAINT vets_id FOREIGN KEY (vets_id) REFERENCES vets(id)
);

CREATE TABLE visits(
  animals_id INT NOT NULL,
  vets_id INT NOT NULL,
  date_of_visit DATE NOT NULL,
  CONSTRAINT animals_fk2 FOREIGN KEY (animals_id) REFERENCES animals(id),
  CONSTRAINT vets_fk2 FOREIGN KEY (vets_id) REFERENCES vets(id)
);

/* Add an email column to your owners table */
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX animal_id_desc ON visits (animals_id DESC);

CREATE INDEX vet_id ON visits (vets_id);

CREATE INDEX email ON owners (email);