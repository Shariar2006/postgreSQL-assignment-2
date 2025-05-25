-- Active: 1747525858163@@127.0.0.1@5432@conservation_db@public

-- create rangers table
CREATE Table rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    region VARCHAR(50)
);

-- create species table
CREATE Table species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50),
    scientific_name VARCHAR(50),
    discovery_date DATE,
    conservation_status VARCHAR(30)
);

-- insert species table data
INSERT INTO
    species (
        common_name,
        scientific_name,
        discovery_date,
        conservation_status
    )
VALUES (
        'Snow leopard',
        'Panthera uncia',
        '1775-01-01',
        'Endangered'
    );

-- create sightings table
CREATE Table sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER REFERENCES rangers (ranger_id) on delete CASCADE,
    species_id INTEGER REFERENCES species (species_id) on delete CASCADE,
    sighting_time DATE,
    location VARCHAR(30),
    notes VARCHAR(255)
);

SELECT * FROM sightings;