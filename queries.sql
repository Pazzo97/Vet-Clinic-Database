/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = 'true' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kgs > 10.5;
SELECT * FROM animals WHERE neutered = 'true';
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kgs >= '10.4' AND weight_kgs <= '17.3';

BEGIN;
UPDATE animals SET species = 'unspecified';

ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species != 'digimon';
COMMIT;


DELETE FROM animals;
ROLLBACK;


BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT UPDATE_WEIGHT;
UPDATE animals SET weight_kgs = weight_kgs * -1;
ROLLBACK TO UPDATE_ANIMAL_WEIGHT;
UPDATE animals SET weight_kgs = weight_kgs * -1 WHERE weight_kgs < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(name) FROM animals WHERE escape_attempts > 0;
SELECT AVG(weight_kgs) FROM animals;
SELECT name, escape_attempts FROM animals WHERE escape_attempts = (select MAX(escape_attempts) FROM animals);
SELECT species, MIN(weight_kgs), MAX(weight_kgs) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-31' GROUP BY species; 