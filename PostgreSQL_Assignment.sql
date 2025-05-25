-- Active: 1747525858163@@127.0.0.1@5432@conservation_db@public

-- create rangers table
CREATE Table rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
);

-- insert rangers data
INSERT INTO
    rangers (name, region)
VALUES (
        'Shariar',
        'Northern Hills'
    ),
    ('Nafis', 'River Delta'),
    (
        'Emon',
        'Mountain Range'
    );

-- create species table
CREATE Table species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(50) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(30) NOT NULL
);

-- insert species data
INSERT INTO
    species (
        common_name,
        scientific_name,
        discovery_date,
        conservation_status
    )
VALUES
 (
        'golden toad',
        'Incilius periglenes',
        '1958-01-01',
        'Endangered'
    ),
 (
        'Alaotra Grebe',
        'Tachybaptus rufolavatus',
        '1988-05-21',
        'Endangered'
    ),
 (
        'Mountain Mist Frog',
        'Litoria nyakalensis',
        '2004-01-01',
        'Endangered'
    )
    ;

-- create sightings table
CREATE Table sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER REFERENCES rangers (ranger_id) on delete CASCADE,
    species_id INTEGER REFERENCES species (species_id) on delete CASCADE,
    sighting_time TIMESTAMP,
    location VARCHAR(30) NOT NULL,
    notes VARCHAR(255)
);

-- insert sightings data
INSERT INTO
    sightings (
        species_id,
        ranger_id,
        location,
        sighting_time,
        notes
    )
VALUES 
    (
        5,
        4,
        'Snowfall pass Snowfall',
        '2025-05-18 21:40:01',
        'Juvenile seen'
    );

SELECT * FROM rangers;

SELECT * FROM species;

SELECT * FROM sightings;

-- problem 1
INSERT INTO
    rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');

-- problem 2
SELECT count(DISTINCT common_name) as unique_species_count FROM species;

-- problem 3
SELECT * FROM sightings
    WHERE location ILIKE('%Pass%');

-- problem 4
SELECT name, count(*) as total_sightings  FROM rangers
    JOIN sightings ON rangers.ranger_id = sightings.ranger_id
    GROUP BY name;

-- problem 5
SELECT common_name FROM species
    LEFT JOIN sightings ON species.species_id = sightings.species_id
    WHERE sightings.species_id IS NULL;

-- problem 6
SELECT common_name, sighting_time, name FROM sightings
JOIN rangers ON sightings.ranger_id = rangers.ranger_id
JOIN species ON sightings.species_id = species.species_id
 ORDER BY sighting_time DESC LIMIT 2;

-- problem 7
