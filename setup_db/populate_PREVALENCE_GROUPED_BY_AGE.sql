-- Data Wrangling for Relationship Table DISORDER_METRICS

CREATE SEQUENCE id_sequence_prevalence_grouped START = 1 INCREMENT = 1;

-- Data for the Depressive Disorders
INSERT INTO mental_health_hub.public.Prevalence_Grouped_By_Age(
    SELECT 
        id_sequence_prevalence_grouped.NEXTVAL AS ID,
        p.year AS YEAR,
        p.prevalence AS PREVALENCE,
        p.age_interval AS AGE_INTERVAL,
        p.code AS country_id,
        1 AS disorder_id
    FROM (
        SELECT *
        FROM (
            SELECT year,code,CAST(age_5_to_14 AS NUMBER(38,7)) AS age_5_to_14, age_15_to_19, age_20_to_24, age_25_to_29, age_30_to_34, age_35_to_39, age_40_to_44, age_45_to_49, age_50_to_54, age_55_to_59, age_60_to_64, age_65_to_69, age_from_70
            FROM mental_health_hub.datasets.BY_DISORDER_PREVALENCE_BY_AGE_DEPRESSION
        ) AS adjusted_data
        UNPIVOT(
            prevalence FOR age_interval IN (
                age_5_to_14,
                age_15_to_19,
                age_20_to_24,
                age_25_to_29,
                age_30_to_34,
                age_35_to_39,
                age_40_to_44,
                age_45_to_49,
                age_50_to_54,
                age_55_to_59,
                age_60_to_64,
                age_65_to_69,
                age_from_70
            )
        )
    ) AS p
);

-- Data for the Anxiety Disorders
INSERT INTO mental_health_hub.public.Prevalence_Grouped_By_Age(
    SELECT 
        id_sequence_prevalence_grouped.NEXTVAL AS ID,
        p.year AS YEAR,
        p.prevalence AS PREVALENCE,
        p.age_interval AS AGE_INTERVAL,
        p.code AS country_id,
        2 AS disorder_id
    FROM (
        SELECT *
        FROM (
            SELECT year,code,CAST(ages_5_to_14 AS NUMBER(38,7)) AS ages_5_to_14, ages_15_to_19, ages_20_to_24, ages_25_to_29, ages_30_to_34, ages_35_to_39, ages_40_to_44, ages_45_to_49, ages_50_to_54, ages_55_to_59, ages_60_to_64, ages_65_to_69, ages_from_70
            FROM mental_health_hub.datasets.BY_DISORDER_PREVALENCE_BY_AGE_ANXIETY
        ) AS adjusted_data
        UNPIVOT(
            prevalence FOR age_interval IN (
                ages_5_to_14,
                ages_15_to_19,
                ages_20_to_24,
                ages_25_to_29,
                ages_30_to_34,
                ages_35_to_39,
                ages_40_to_44,
                ages_45_to_49,
                ages_50_to_54,
                ages_55_to_59,
                ages_60_to_64,
                ages_65_to_69,
                ages_from_70
            )
        )
    ) AS p
);

-- Data for the Bipolar Disorder
INSERT INTO mental_health_hub.public.Prevalence_Grouped_By_Age(
    SELECT 
        id_sequence_prevalence_grouped.NEXTVAL AS ID,
        p.year AS YEAR,
        p.prevalence AS PREVALENCE,
        p.age_interval AS AGE_INTERVAL,
        p.code AS country_id,
        3 AS disorder_id
    FROM (
        SELECT *
        FROM (
            SELECT year,code,CAST(age_5_to_14 AS NUMBER(38,8)) AS age_5_to_14, age_15_to_19, age_20_to_24, age_25_to_29, age_30_to_34, age_35_to_39, age_40_to_44, age_45_to_49, age_50_to_54, age_55_to_59, age_60_to_64, age_65_to_69, age_from_70
            FROM mental_health_hub.datasets.BY_DISORDER_PREVALENCE_BY_AGE_BIPOLAR
        ) AS adjusted_data
        UNPIVOT(
            prevalence FOR age_interval IN (
                age_5_to_14,
                age_15_to_19,
                age_20_to_24,
                age_25_to_29,
                age_30_to_34,
                age_35_to_39,
                age_40_to_44,
                age_45_to_49,
                age_50_to_54,
                age_55_to_59,
                age_60_to_64,
                age_65_to_69,
                age_from_70
            )
        )
    ) AS p
);

-- Data for Schizophrenia
INSERT INTO mental_health_hub.public.Prevalence_Grouped_By_Age(
    SELECT 
        id_sequence_prevalence_grouped.NEXTVAL AS ID,
        p.year AS YEAR,
        p.prevalence AS PREVALENCE,
        p.age_interval AS AGE_INTERVAL,
        p.code AS country_id,
        4 AS disorder_id
    FROM (
        SELECT *
        FROM (
            SELECT year,code,CAST(age_5_to_14 AS NUMBER(38,8)) AS age_5_to_14, CAST(age_15_to_19 AS NUMBER(38,8)) AS age_15_to_19, age_20_to_24, age_25_to_29, age_30_to_34, age_35_to_39, age_40_to_44, age_45_to_49, age_50_to_54, age_55_to_59, age_60_to_64, age_65_to_69, CAST(age_from_70 AS NUMBER(38,8)) AS age_from_70
            FROM mental_health_hub.datasets.BY_DISORDER_PREVALENCE_BY_AGE_SCHIZOPHRENIA
        ) AS adjusted_data
        UNPIVOT(
            prevalence FOR age_interval IN (
                age_5_to_14,
                age_15_to_19,
                age_20_to_24,
                age_25_to_29,
                age_30_to_34,
                age_35_to_39,
                age_40_to_44,
                age_45_to_49,
                age_50_to_54,
                age_55_to_59,
                age_60_to_64,
                age_65_to_69,
                age_from_70
            )
        )
    ) AS p
);