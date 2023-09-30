/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';

SELECT * FROM animals
WHERE name LIKE '%mon';

SELECT name
FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name
FROM animals
WHERE neutered = TRUE
AND escape_attempts < 3;

SELECT date_of_birth
FROM animals
WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts
FROM animals
WHERE weight > 10.5;

SELECT *
FROM animals
WHERE neutered = TRUE;

SELECT *
FROM animals
WHERE name != 'Gabumon';

SELECT *
FROM animals
WHERE weight >= 10.4 AND weight <= 17.3;



-- Start a transaction
BEGIN;

UPDATE animals
SET species = 'unspecified';


SELECT * FROM animals;

-- Rollback the transaction to revert the changes
ROLLBACK;

-- Verify that the "species" column has reverted to its original state
SELECT * FROM animals;

BEGIN;

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

SELECT * FROM animals;

update animals
set species = 'pokemon'
where species is null;

SELECT * FROM animals;

-- Commit the transaction to make the changes permanent
COMMIT;

BEGIN;


DELETE FROM animals;

ROLLBACK;

SELECT * FROM animals;

-- Start a transaction
BEGIN;


DELETE FROM animals
WHERE date_of_birth > '2022-01-01';


SAVEPOINT my_savepoint;


UPDATE animals
SET weight = weight * -1;


ROLLBACK TO my_savepoint;


UPDATE animals
SET weight = weight * -1
WHERE weight < 0;


COMMIT;

SELECT * FROM animals;
