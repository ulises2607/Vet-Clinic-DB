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


--

-- How many animals are there?
SELECT COUNT(*) AS total_animals
FROM animals;  -- 10

-- How many animals have never tried to escape?
SELECT COUNT(*) AS animals_never_tried_to_escape
FROM animals
WHERE escape_attempts = 0; -- 2


-- What is the average weight of animals?
SELECT AVG(weight) AS average_weight
FROM animals;  --15.5500000000000000

--Who escapes the most, neutered or not neutered animals?
SELECT neutered, COUNT(*) AS escape_count
FROM animals
WHERE escape_attempts > 0
GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight) AS min_weight, MAX(weight) AS max_weight
FROM animals
GROUP BY species;


-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) AS average_escape_attempts
FROM animals
WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000
GROUP BY species;


-- Queries for the three tables

SELECT * FROM animals
INNER JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT * FROM animals
INNER JOIN species
ON animals.species_id = species.id
WHERE species.name = 'Pokemon';


SELECT owners.full_name AS owner_name, animals.name AS animal_name from owners
INNER JOIN animals
ON animals.owner_id = owners.id
GROUP BY owners.full_name, animals.name;


SELECT COUNT(*) AS total_animals, species.name as animal_type
FROM animals
INNER JOIN species
ON animals.species_id = species.id
GROUP BY species.name;


SELECT animals.name, owners.full_name from animals
INNER JOIN species
ON animals.species_id = species.id
INNER JOIN owners
ON animals.owner_id = owners.id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT animals.name from animals
INNER JOIN owners
ON animals.owner_id = owners.id
WHERE animals.escape_attempts = 0 and owners.full_name = 'Dean Winchester';

SELECT owners.full_name AS owner_name, COUNT(animals.id) AS animal_count
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY animal_count DESC
LIMIT 1;

-- NEXT STEPS

-- Who was the last animal seen by William Tatcher?
SELECT animals.name
FROM visits
JOIN animals ON visits.animal_id = animals.id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.visit_date DESC
LIMIT 1;


-- How many different animals did Stephanie Mendez see?

SELECT COUNT(DISTINCT visits.animal_id)
FROM visits
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez';

select * from visits;


-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name AS speciality
FROM vets
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON specializations.species_id = species.id;


-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT a.name
FROM visits v
INNER JOIN animals a ON v.animal_id = a.id
INNER JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Stephanie Mendez'
AND v.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT a.name
FROM visits v
INNER JOIN animals a ON v.animal_id = a.id
GROUP BY a.name
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT a.name
FROM visits v
INNER JOIN animals a ON v.animal_id = a.id
INNER JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Maisy Smith'
ORDER BY v.visit_date ASC
LIMIT 1;


-- Details for the most recent visit: animal information, vet information, and date of visit.
SELECT animals.name, animals.date_of_birth, animals.escape_attempts, animals.neutered, animals.weight,
vets.name, vets.age, vets.date_of_graduation,
visits.visit_date
FROM visits
INNER JOIN animals
ON visits.animal_id = animals.id
INNER JOIN vets
ON visits.vet_id = vets.id
ORDER BY visits.visit_date DESC
LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*)
FROM visits v
INNER JOIN animals a ON v.animal_id = a.id
INNER JOIN vets vt ON v.vet_id = vt.id
LEFT JOIN specializations sp ON vt.id = sp.vet_id AND a.species_id = sp.species_id
WHERE sp.vet_id IS NULL;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(*) AS visit_count
FROM visits
INNER JOIN animals on visits.animal_id = animals.id
INNER JOIN vets on visits.vet_id = vets.id
INNER JOIN species on animals.species_id = species.id
WHERE  vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY visit_count DESC;
