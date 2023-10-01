/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INTEGER NOT NULL DEFAULT 0,
    neutered BOOLEAN NOT NULL DEFAULT FALSE,
    weight DECIMAL(6,2) NOT NULL DEFAULT 0.00
);

ALTER TABLE animals
ADD species VARCHAR(50);

-- Next section

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(60) NOT NULL,
    age INTEGER NOT NULL,
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INTEGER
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id)
REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owner_id INTEGER
ADD CONSTRAINT fk_owner
FOREIGN KEY (owner_id)
REFERENCES owners(id);

-- Next section

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    age INTEGER NOT NULL,
    date_of_graduation DATE NOT NULL,
);

CREATE TABLE visits (
    visit_id serial PRIMARY KEY,
    animal_id integer,
    vet_id integer,
    visit_date date,
    FOREIGN KEY (animal_id) REFERENCES animals (id),
    FOREIGN KEY (vet_id) REFERENCES vets (id)
);

CREATE TABLE specializations (
    vet_id integer,
    species_id integer,
    PRIMARY KEY (vet_id, species_id),
    FOREIGN KEY (vet_id) REFERENCES vets (id),
    FOREIGN KEY (species_id) REFERENCES species (id)
);




