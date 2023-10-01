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


-- Next steps

INSERT INTO vets (name, age, date_of_graduation)
VALUES
    ('William Tatcher', 45, '2000-04-23'),
    ('Maisy Smith', 26, '2019-01-17'),
    ('Stephanie Mendez', 64, '1981-05-04'),
    ('Jack Harkness', 38, '2008-06-08');
	


INSERT INTO specializations (vet_id, species_id)
VALUES (
	(SELECT id FROM vets WHERE name = 'William Tatcher'),
	(SELECT id FROM species WHERE name = 'Pokemon')
)

INSERT INTO specializations (vet_id, species_id)
VALUES (
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    (SELECT id FROM species WHERE name = 'Digimon')
);

INSERT INTO specializations (vet_id, species_id)
VALUES (
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    (SELECT id FROM species WHERE name = 'Pokemon')
);

INSERT INTO specializations (vet_id, species_id)
VALUES (
    (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    (SELECT id FROM species WHERE name = 'Digimon')
);


BEGIN;
select * from visits;

-- Agumon visited William Tatcher on May 24th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Agumon'),
    (SELECT id FROM vets WHERE name = 'William Tatcher'),
    '2020-05-24'::date
);

-- Agumon visited Stephanie Mendez on Jul 22nd, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Agumon'),
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    '2020-07-22'::date
);

-- Gabumon visited Jack Harkness on Feb 2nd, 2021.
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Gabumon'),
    (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    '2021-02-02'::date
);

-- Pikachu visited Maisy Smith on Jan 5th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Pikachu'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    '2020-01-05'::date
);

-- Pikachu visited Maisy Smith on Mar 8th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Pikachu'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    '2020-03-08'::date
);

-- Pikachu visited Maisy Smith on May 14th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Pikachu'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    '2020-05-14'::date
);

-- Devimon visited Stephanie Mendez on May 4th, 2021.
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Devimon'),
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    '2021-05-04'::date
);

-- Charmander visited Jack Harkness on Feb 24th, 2021.
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Charmander'),
    (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    '2021-02-24'::date
);

-- Plantmon visited Maisy Smith on Dec 21st, 2019.
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Plantmon'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    '2019-12-21'::date
);

-- Plantmon visited William Tatcher on Aug 10th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Plantmon'),
    (SELECT id FROM vets WHERE name = 'William Tatcher'),
    '2020-08-10'::date
);

-- Plantmon visited Maisy Smith on Apr 7th, 2021.
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Plantmon'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    '2021-04-07'::date
);

-- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Squirtle'),
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    '2019-09-29'::date
);

-- Angemon visited Jack Harkness on Oct 3rd, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Angemon'),
    (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    '2020-10-03'::date
);

-- Angemon visited Jack Harkness on Nov 4th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Angemon'),
    (SELECT id FROM vets WHERE name = 'Jack Harkness'),
    '2020-11-04'::date
);

-- Boarmon visited Maisy Smith on Jan 24th, 2019.
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Boarmon'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    '2019-01-24'::date
);

-- Boarmon visited Maisy Smith on May 15th, 2019.
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Boarmon'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    '2019-05-15'::date
);

-- Boarmon visited Maisy Smith on Feb 27th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Boarmon'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    '2020-02-27'::date
);

-- Boarmon visited Maisy Smith on Aug 3rd, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Boarmon'),
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    '2020-08-03'::date
);

-- Blossom visited Stephanie Mendez on May 24th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Blossom'),
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
    '2020-05-24'::date
);

-- Blossom visited William Tatcher on Jan 11th, 2021.
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id FROM animals WHERE name = 'Blossom'),
    (SELECT id FROM vets WHERE name = 'William Tatcher'),
    '2021-01-11'::date
);

SELECT * FROM visits;

COMMIT;