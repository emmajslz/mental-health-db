-- Data Wrangling for Relationship Table DISORDER_METRICS

CREATE SEQUENCE id_sequence START = 1 INCREMENT = 1;

-- Data for the Depressive Disorders
INSERT INTO mental_health_hub.public.Disorder_Metrics(
    SELECT 
        id_sequence.NEXTVAL AS ID,
        p.year AS YEAR,
        p.all_ages AS PREVALENCE,
        p.age_standardized AS PREVALENCE_AGE_STANDARDIZED,
        e.DEPRESSION AS NUMBER_OF_CASES,
        p.code AS country_id,
        1 AS disorder_id
    FROM mental_health_hub.datasets.BY_DISORDER_PREVALENCE_BY_AGE_DEPRESSION p
        FULL JOIN mental_health_hub.datasets.BY_DISORDER_ESTIMATED_CASES e ON p.code = e.code AND p.year = e.year
);

-- Data for the Anxiety Disorders
INSERT INTO mental_health_hub.public.Disorder_Metrics(
    SELECT 
        id_sequence.NEXTVAL AS ID,
        p.year AS YEAR,
        p.all_ages AS PREVALENCE,
        p.age_standardized AS PREVALENCE_AGE_STANDARDIZED,
        e.ANXIETY AS NUMBER_OF_CASES,
        p.code AS country_id,
        2 AS disorder_id
    FROM mental_health_hub.datasets.BY_DISORDER_PREVALENCE_BY_AGE_ANXIETY p
        FULL JOIN mental_health_hub.datasets.BY_DISORDER_ESTIMATED_CASES e ON p.code = e.code AND p.year = e.year
);

-- Data for the Bipolar Disorders
INSERT INTO mental_health_hub.public.Disorder_Metrics(
    SELECT 
        id_sequence.NEXTVAL AS ID,
        p.year AS YEAR,
        p.all_ages AS PREVALENCE,
        p.age_standardized AS PREVALENCE_AGE_STANDARDIZED,
        e.BIPOLAR AS NUMBER_OF_CASES,
        p.code AS country_id,
        3 AS disorder_id
    FROM mental_health_hub.datasets.BY_DISORDER_PREVALENCE_BY_AGE_BIPOLAR p
        FULL JOIN mental_health_hub.datasets.BY_DISORDER_ESTIMATED_CASES e ON p.code = e.code AND p.year = e.year
);

-- Data for Schizophrenia
INSERT INTO mental_health_hub.public.Disorder_Metrics(
    SELECT 
        id_sequence.NEXTVAL AS ID,
        p.year AS YEAR,
        p.all_ages AS PREVALENCE,
        p.age_standardized AS PREVALENCE_AGE_STANDARDIZED,
        e.SCHIZOPHRENIA AS NUMBER_OF_CASES,
        p.code AS country_id,
        4 AS disorder_id
    FROM mental_health_hub.datasets.BY_DISORDER_PREVALENCE_BY_AGE_SCHIZOPHRENIA p
        FULL JOIN mental_health_hub.datasets.BY_DISORDER_ESTIMATED_CASES e ON p.code = e.code AND p.year = e.year
);

-- Data for the Eating Disorders
INSERT INTO mental_health_hub.public.Disorder_Metrics(
    SELECT 
        id_sequence.NEXTVAL AS ID,
        p.year AS YEAR,
        NULL AS PREVALENCE,
        p.ED AS PREVALENCE_AGE_STANDARDIZED,
        e.ED AS NUMBER_OF_CASES,
        p.code AS country_id,
        5 AS disorder_id
    FROM mental_health_hub.datasets.BY_DISORDER_PREVALENCE p
        FULL JOIN mental_health_hub.datasets.BY_DISORDER_ESTIMATED_CASES e ON p.code = e.code AND p.year = e.year
);

