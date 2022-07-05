/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered=true and escape_attempts <3;
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered=true;
SELECT * FROM animals WHERE name!='Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

SELECT COUNT(name) FROM animals;
SELECT COUNT(name) FROM animals WHERE escape_attempts=0;
SELECT AVG(weight_kg) FROM animals;
SELECT SUM(escape_attempts), neutered FROM animals GROUP BY neutered;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT name, full_name FROM animals INNER JOIN owners ON owner_id=owners.id WHERE full_name='Melody Pond';
SELECT animals.name, species.name FROM animals INNER JOIN species ON species_id=species.id WHERE species.name='Pokemon';
SELECT full_name, name FROM owners FULL JOIN animals ON owner_id=owners.id;
SELECT COUNT(animals.name), species.name FROM animals INNER JOIN species ON species_id=species.id GROUP BY species.name;
SELECT animals.name, full_name, species.name AS type FROM animals INNER JOIN owners ON owner_id=owners.id INNER JOIN species ON species_id=species.id WHERE full_name='Jennifer Orwell' AND species.name='Digimon';
SELECT animals.name, full_name, escape_attempts FROM animals INNER JOIN owners ON owner_id=owners.id WHERE full_name='Dean Winchester' and escape_attempts=0;
SELECT full_name, COUNT(name) AS counter FROM owners INNER JOIN animals ON owners.id=owner_id GROUP BY full_name ORDER BY counter DESC LIMIT 1;