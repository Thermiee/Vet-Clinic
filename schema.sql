/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INTEGER,
    name varchar(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg FLOAT,
    PRIMARY KEY (id)
);