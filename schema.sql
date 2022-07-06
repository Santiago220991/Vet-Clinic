/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY, 
    name TEXT, 
    date_of_birth DATE, 
    escape_attempts INT, 
    neutered BOOLEAN, 
    weight_kg DECIMAL, 
    PRIMARY KEY (id)
);

ALTER TABLE animals ADD species TEXT;

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY, 
    full_name TEXT, 
    age INT, 
    PRIMARY KEY (id)
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY, 
    name TEXT, 
    PRIMARY KEY (id)
);

ALTER TABLE animals DROP species;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners (id);

CREATE TABLE vets (id INT GENERATED ALWAYS AS IDENTITY, name TEXT, age INT, date_of_graduation DATE, PRIMARY KEY(id));
CREATE TABLE specializations (species_id INT, vets_id INT);
ALTER TABLE specializations ADD FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE specializations ADD FOREIGN KEY (vets_id) REFERENCES vets (id);
CREATE TABLE visits (name_id INT, vets_id INT);
ALTER TABLE visits ADD FOREIGN KEY (name_id) REFERENCES animals (id); 
ALTER TABLE visits ADD FOREIGN KEY (vets_id) REFERENCES vets (id);
ALTER TABLE visits ADD date_of_visit DATE;
