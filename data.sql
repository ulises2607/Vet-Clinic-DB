/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight, neutered, escape_attempts)
VALUES ('Agumon', '2020-02-03', 10.23, TRUE, 0);

INSERT INTO animals (name, date_of_birth, weight, neutered, escape_attempts)
VALUES ('Gabumon', '2018-11-15', 8.00, TRUE, 2);

INSERT INTO animals (name, date_of_birth, weight, neutered, escape_attempts)
VALUES ('Pikachu', '2021-06-07', 15.04, FALSE, 1);

INSERT INTO animals (name, date_of_birth, weight, neutered, escape_attempts)
VALUES ('Devimon', '2017-06-12', 11.00, TRUE, 5);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight) VALUES
('Charmander', '2020-02-08', 0, false, -11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight) VALUES
('Plantmon', '2021-11-15', 2, true, -5.7);


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight) VALUES
('Squirtle', '1993-04-02', 3, false, -12.13);


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight) VALUES
('Angemon', '2005-06-12', 1, true, -45);


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight) VALUES
('Boarmon', '2005-06-07', 7, true, 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight) VALUES
('Blossom', '1998-10-13', 3, true, 17);


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight) VALUES
('Ditto', '2022-05-14', 4, true, 22);

-- Insert data into all the tables

INSERT INTO owners (full_name, age)
VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

select * from owners;

INSERT INTO species (name)
VALUES
	('Pokemon'),
	('Digimon')
	
SELECT * FROM species;

select * FROM animals
order by id;

SELECT * FROM animals
where name like '%mon'

BEGIN;

UPDATE animals
SET species_id = 2
WHERE name like '%mon'

UPDATE animals
SET species_id = 1
WHERE species_id is null;

COMMIT;

BEGIN;

UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';


UPDATE animals
SET owner_id = 2
WHERE name IN ('Gabumon', 'Pikachu');


UPDATE animals
SET owner_id = 3
WHERE name IN ('Devimon', 'Plantmon');


UPDATE animals
SET owner_id = 4
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');


UPDATE animals
SET owner_id = 5
WHERE name IN ('Angemon', 'Boarmon');

COMMIT;