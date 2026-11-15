
CREATE TABLE farm_locations (
    location_id INTEGER GENERATED ALWAYS AS IDENTITY,
    location_name VARCHAR(100) NOT NULL,
    description VARCHAR(255),

    CONSTRAINT pk_farm_locations
        PRIMARY KEY (location_id),

    CONSTRAINT uq_farm_locations_name
        UNIQUE (location_name)
);


SELECT
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_name = 'farm_locations'
ORDER BY ordinal_position;
