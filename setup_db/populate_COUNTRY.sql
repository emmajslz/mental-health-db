-- Insert data for Country entity
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Country(
    SELECT c.id AS ID,
           c.country AS COUNTRY,
           c.continent AS CONTINENT
    FROM mental_health_hub.datasets.CONTINENTS_MAPPED_COUNTRIES c
    WHERE len(c.id) <=3
);