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

SELECT animals.name, vets.name, date_of_visit  FROM animals JOIN visits ON animals.id=name_id JOIN vets ON vets_id=vets.id WHERE vets.name='William Tatcher' ORDER BY date_of_visit DESC LIMIT 1;
SELECT vets.name, COUNT(DISTINCT animals.name) FROM animals JOIN visits ON animals.id=name_id JOIN vets ON vets.id=vets_id WHERE vets.name='Stephanie Mendez' GROUP BY vets.name;
SELECT vets.name, species.name FROM vets FULL JOIN specializations ON vets.id=vets_id FULL JOIN species ON species.id=species_id;
SELECT animals.name, vets.name, date_of_visit FROM animals JOIN visits ON animals.id=name_id JOIN vets ON vets.id=vets_id WHERE vets.name='Stephanie Mendez' AND date_of_visit BETWEEN '2020-04-01' AND '2020-10-30';
SELECT animals.name, COUNT(animals.name) FROM animals JOIN visits ON animals.id=name_id GROUP BY animals.name ORDER BY count DESC LIMIT 1;
SELECT animals.name, vets.name, date_of_visit FROM animals JOIN visits ON animals.id=name_id JOIN vets ON vets.id=vets_id WHERE vets.name='Maisy Smith' ORDER BY date_of_visit ASC LIMIT 1;
SELECT animals.name, vets.name, date_of_visit FROM animals JOIN visits ON animals.id=name_id JOIN vets ON vets.id=vets_id ORDER BY date_of_visit DESC LIMIT 1;
SELECT COUNT(*) FROM visits FULL JOIN animals ON animals.id = visits.name_id FULL JOIN vets ON visits.vets_id = vets.id FULL JOIN specializations ON specializations.vets_id = vets.id WHERE vets.name!='Stephanie Mendez' AND (specializations.species_id IS NULL OR specializations.species_id != animals.species_id);
SELECT species.name, COUNT(species.name) FROM visits JOIN animals ON animals.id = visits.name_id JOIN vets ON visits.vets_id = vets.id JOIN species ON species.id=species_id WHERE vets.name='Maisy Smith' GROUP BY species.name;

