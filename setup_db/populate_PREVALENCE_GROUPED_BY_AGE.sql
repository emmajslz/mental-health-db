-- Data Wrangling for Relationship Table DISORDER_METRICS

CREATE SEQUENCE id_sequence_prevalence_grouped START = 1 INCREMENT = 1;

-- Data for the Depressive Disorders
INSERT INTO mental_health_hub.public.Prevalence_Grouped_By_Age(
    SELECT 
        id_sequence_prevalence_grouped.NEXTVAL AS ID,
        p.year AS YEAR,
        p.age_5_to_14 AS PREVALENCE,
        -- p.interval1, interval2 AS AGE_INTERVAL,
        p.code AS country_id,
        1 AS disorder_id
    FROM mental_health_hub.datasets.BY_DISORDER_PREVALENCE_BY_AGE_DEPRESSION p
        FULL JOIN mental_health_hub.datasets.BY_DISORDER_ESTIMATED_CASES e ON p.code = e.code AND p.year = e.year
);