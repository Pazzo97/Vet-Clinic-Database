/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kgs) VALUES ('Agumon', '2020-02-03', 0, 'true', 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kgs) VALUES ('Gabumon', '2018-11-15', 2, 'true', 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kgs) VALUES ('Pikachu', '2021-01-07', 1, 'false', 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kgs) VALUES ('Devimon', '2017-05-12', 5, 'true', 11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kgs) VALUES ('Charmander', '2020-02-08', 0, 'false', -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kgs) VALUES ('Plantmon', '2021-11-15', 2, 'true', -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kgs) VALUES ('Squirtle', '1993-04-02', 3, 'false', -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kgs) VALUES ('Angemon', '2005-06-12', 1, 'true', -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kgs) VALUES ('Boarmon', '2005-06-07', 7, 'true', 20.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kgs) VALUES ('Blossomon', '1998-11-13', 3, 'true', 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kgs) VALUES ('Ditto', '2022-05-14', 4, 'true', 22);


INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwel', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);


INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digmon');


UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

UPDATE animals SET owners_id = 1 WHERE id = 1;
UPDATE animals SET owners_id = 2 WHERE id = 2 or id = 3;
UPDATE animals SET owners_id = 3 WHERE id = 6 or id = 4;
UPDATE animals SET owners_id = 4 WHERE id = 7 or id = 5 or id = 10;
UPDATE animals SET owners_id = 5 WHERE id = 8 or id = 9;