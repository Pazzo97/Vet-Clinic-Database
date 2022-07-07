/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01'AND '2019-12-31';
SELECT name FROM animals WHERE neutered='true'AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name='Agumon'OR name='Pikachu';
SELECT name,
escape_attempts FROM animals WHERE weight_kgs>10.5;
SELECT * FROM animals WHERE neutered='true';
SELECT * FROM animals WHERE name <>'Gabumon';
SELECT * FROM animals WHERE weight_kgs>='10.4'AND weight_kgs <='17.3';

BEGIN;
UPDATE animals SET species='unspecified';

ROLLBACK;

BEGIN;
UPDATE animals SET species='digimon'WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon'WHERE species !='digimon';
COMMIT;


DELETE FROM animals;
ROLLBACK;


BEGIN;
DELETE FROM animals WHERE date_of_birth>'2022-01-01';
SAVEPOINT UPDATE_WEIGHT;
UPDATE animals SET weight_kgs=weight_kgs * -1;
ROLLBACK TO UPDATE_ANIMAL_WEIGHT;
UPDATE animals SET weight_kgs=weight_kgs * -1 WHERE weight_kgs < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(name) FROM animals WHERE escape_attempts>0;
SELECT AVG(weight_kgs) FROM animals;
SELECT name,
escape_attempts FROM animals WHERE escape_attempts=(SELECT MAX(escape_attempts) FROM animals);
SELECT species,
MIN(weight_kgs),
MAX(weight_kgs) FROM animals GROUP BY species;
SELECT species,
AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01'AND '2000-01-31'GROUP BY species;



SELECT * FROM animals INNER JOIN owners owner on owner.id=animals.owners_id WHERE owners_id=4;

SELECT * FROM animals INNER JOIN species specie on specie.id=animals.species_id WHERE species_id=1;

SELECT * FROM animals RIGHT JOIN owners owner on owner.id=animals.owners_id;

SELECT species.name,
COUNT(species_id) FROM animals JOIN species ON species_id=species.id WHERE species.name='Pokemon'OR species.name='Digimon'
GROUP BY species.name;

SELECT * FROM owners JOIN animals ON owners.id=animals.owners_id WHERE full_name='Jennifer Orwell'
AND species_id=2;

SELECT owners.full_name,
animals.name FROM owners JOIN animals ON owners.id=animals.owners_id WHERE full_name='Dean Winchester'
AND escape_attempts=0;

SELECT full_name,
COUNT(animals) as animals_owned FROM animals JOIN owners ON animals.owners_id=owners.id GROUP BY owners.full_name ORDER BY animals_owned DESC LIMIT 1;


SELECT animals.name FROM animals JOIN visits on animals.id=visits.animal_id JOIN vets on vets.id=visits.vet_id
WHERE vets.name='William Tatcher'
ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT count(DISTINCT animal_id) FROM visits JOIN vets v on v.id=visits.vet_id
WHERE v.name='Stephanie Mendez';

SELECT vets.name as name,
specialize.name as specialization FROM vets left JOIN specializations s on vets.id=s.vet_id left JOIN species specialize on specialize.id=s.species_id;

SELECT animals.name FROM animals JOIN visits v on animals.id=v.animal_id JOIN vets vet on vet.id=v.vet_id WHERE vet.name='Stephanie Mendez'
and v.date_of_visit>='2020-04-01'
and v.date_of_visit <='2020-08-30';

SELECT animals.name,
count(v.animal_id) as count FROM animals JOIN visits v on animals.id=v.animal_id GROUP BY animal_id,
animals.name ORDER BY count DESC LIMIT 1;

SELECT animals.name FROM animals JOIN visits v on animals.id=v.animal_id JOIN vets vet on vet.id=v.vet_id WHERE vet.name='Maisy Smith'
ORDER BY v.date_of_visit LIMIT 1;

SELECT animals.name as animal_name,
vet.name as vet_name,
v.date_of_visit as visit_date FROM animals JOIN visits v on animals.id=v.animal_id JOIN vets vet on vet.id=v.vet_id ORDER BY v.date_of_visit DESC LIMIT 1;

SELECT count(v) FROM animals JOIN visits v on animals.id=v.animal_id JOIN vets vet on vet.id=v.vet_id left JOIN specializations s on vet.id=s.vet_id WHERE s.vet_id is null;

SELECT s.name,
count(s.name) as count FROM animals JOIN species s on s.id=animals.species_id JOIN visits v on animals.id=v.animal_id JOIN vets vet on vet.id=v.vet_id WHERE vet.name='Maisy Smith'
GROUP BY s.name ORDER BY count DESC LIMIT 1;
