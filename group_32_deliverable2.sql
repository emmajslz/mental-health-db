/*
1. Creating the Database
*/
CREATE DATABASE MENTAL_HEALTH_HUB;


/*
2. Write CREATE statements for each of your ERD tables.
*/

-- ENTITY TABLES
CREATE TABLE MENTAL_HEALTH_HUB.PUBLIC.Country(
    id VARCHAR(50) PRIMARY KEY, 
    name VARCHAR(500),
    continent VARCHAR(500)
); 

CREATE TABLE MENTAL_HEALTH_HUB.PUBLIC.Indicator(
    id INT PRIMARY KEY, 
    mental_health_indicator VARCHAR(500),
    type_of_value VARCHAR(500)
); 

CREATE TABLE MENTAL_HEALTH_HUB.PUBLIC.Metric(
    id INT PRIMARY KEY,
    country_metric VARCHAR(100),
    type_of_value VARCHAR(100),
    source VARCHAR(100)
);

CREATE TABLE MENTAL_HEALTH_HUB.PUBLIC.Disorder(
    id INT PRIMARY KEY,
    name VARCHAR(100),
    symptoms TEXT
); 

-- RELATIONSHIP TABLES
CREATE TABLE MENTAL_HEALTH_HUB.PUBLIC.Disorder_Metrics(
    id INT PRIMARY KEY,
    year INT,
    prevalence FLOAT,
    prevalence_age_standardized FLOAT,
    number_of_cases INT,
    country_id VARCHAR(50),
    disorder_id INT,
    FOREIGN KEY (country_id) REFERENCES MENTAL_HEALTH_HUB.PUBLIC.Country(id),
    FOREIGN KEY (disorder_id) REFERENCES MENTAL_HEALTH_HUB.PUBLIC.Disorder(id)
);

CREATE TABLE MENTAL_HEALTH_HUB.PUBLIC.Prevalence_Grouped_By_Age(
    id INT PRIMARY KEY,
    year INT,
    prevalence FLOAT,
    age_interval VARCHAR,
    country_id VARCHAR(50),
    disorder_id INT,
    FOREIGN KEY (country_id) REFERENCES MENTAL_HEALTH_HUB.PUBLIC.Country(id),
    FOREIGN KEY (disorder_id) REFERENCES MENTAL_HEALTH_HUB.PUBLIC.Disorder(id)
);

CREATE TABLE MENTAL_HEALTH_HUB.PUBLIC.Mental_Health_Indicators(
    id INT PRIMARY KEY,
    year INT,
    VALUE VARCHAR(500),
    country_id VARCHAR(50),
    indicator_id INT,
    FOREIGN KEY (country_id) REFERENCES MENTAL_HEALTH_HUB.PUBLIC.Country(id),
    FOREIGN KEY (indicator_id) REFERENCES MENTAL_HEALTH_HUB.PUBLIC.Indicator(id)
);

CREATE OR REPLACE TABLE MENTAL_HEALTH_HUB.PUBLIC.Social_Economical_Metrics (
    id INT PRIMARY KEY,
    year INT,
    value FLOAT,
    country_id VARCHAR(50),
    metric_id INT,
    FOREIGN KEY (country_id) REFERENCES MENTAL_HEALTH_HUB.PUBLIC.Country(id),
    FOREIGN KEY (metric_id) REFERENCES MENTAL_HEALTH_HUB.PUBLIC.Metric(id)
);

/*
3. Run create statements in platform of your choice:
Our platform is SNOWFLAKE. See database MENTAL_HEALTH_HUB.
*/

/*
4. Import all your found datasets into your database; one table per dataset.
*/
/* 4.1 Create a schema for your datasets */
CREATE SCHEMA datasets;

/* 4.2 Create a table in the datasets schema per dataset found */


/* 4.3 The data was imported with snowflake directly */

/*
5. Perform data wrangling by writing SELECT statements to 
create a result set suitable for each of your database tables.
*/
/*
6. To fill in your designed and created tables, write INSERT statements that 
take in the above SELECT statements.
*/

------------------------------------------------------------------------------------------------
-- INSERT statements with VALUES for simple entity tables:
------------------------------------------------------------------------------------------------
-- Disorder
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Disorder VALUES (1, 'Depressive Disorders', '');
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Disorder VALUES (2, 'Anxiety Disorders', '');
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Disorder VALUES (3, 'Bipolar Disorders', '');
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Disorder VALUES (4, 'Schizophrenia', '');
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Disorder VALUES (5, 'Eating Disorders', '');

UPDATE MENTAL_HEALTH_HUB.PUBLIC.disorder
SET symptoms = 'Persistent sad, anxious, or “empty” mood.
Feelings of hopelessness or pessimism.'
WHERE ID = 1

UPDATE MENTAL_HEALTH_HUB.PUBLIC.disorder
SET symptoms = 'Feeling nervous, restless or tense.
Having a sense of impending danger, panic or doom.'
WHERE ID = 2

UPDATE MENTAL_HEALTH_HUB.PUBLIC.disorder
SET symptoms = 'increased energy, excitement, impulsive behaviour, and agitation'
WHERE ID = 3

UPDATE MENTAL_HEALTH_HUB.PUBLIC.disorder
SET symptoms = 'delusions, hallucinations, disorganized speech, trouble with thinking and lack of motivation'
WHERE ID = 4

UPDATE MENTAL_HEALTH_HUB.PUBLIC.disorder
SET symptoms = 'Dramatic restriction of types or amount of food eaten'
WHERE ID = 5

-- Metric
CREATE SEQUENCE MENTAL_HEALTH_HUB.PUBLIC.metric_seq
    START WITH 1
    INCREMENT BY 1;

INSERT INTO mental_health_hub.public.Metric (id, country_metric, type_of_value, source)
    VALUES 
        (mental_health_hub.public.metric_seq.NEXTVAL, 'GDP', 'Value', 'Source1'),
        (mental_health_hub.public.metric_seq.NEXTVAL, 'Income', 'Value', 'Source2'),
        (mental_health_hub.public.metric_seq.NEXTVAL, 'Internet Usage', 'Value', 'Source3'),
        (mental_health_hub.public.metric_seq.NEXTVAL, 'Life Expectancy', 'Value', 'Source4'),
        (mental_health_hub.public.Metric_seq.NEXTVAL, 'Median Age', 'Value', 'Source5'),
        (mental_health_hub.public.Metric_seq.NEXTVAL, 'Suicide Count', 'Count', 'Source6')
        (MENTAL_HEALTH_HUB.PUBLIC.metric_seq.NEXTVAL, 'Population', 'Value', 'Source7');

UPDATE MENTAL_HEALTH_HUB.PUBLIC.metric
    SET source = 'https://www.gapminder.org/data/';

-- Indicator
INSERT INTO mental_health_hub.public.Indicator (id, mental_health_indicator, type_of_value)
    VALUES 
        (1, 'Death Rate', 'Rate per 100,000 People'),
        (2, 'Mental Health Units in General Hospital', 'Units per 100,000 People'),
        (3, 'Pyschiatrists in Mental Health', 'Psychiatrists per 100,000 People'),
        (4, 'Policy Regarding Mental Health', 'Yes/No Values');

------------------------------------------------------------------------------------------------
-- Data wrangling: INSERT statements that use SELECT statements to populate relationship tables.
------------------------------------------------------------------------------------------------

------- Disorder_Metrics -----------------------------------------------------------------------

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

------- Prevalence_Grouped_By_Age --------------------------------------------------------------

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

------- Social_Economical_Metrics --------------------------------------------------------------

-- Insert data for GM_GDP
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Social_Economical_Metrics (id, year, value, country_id, metric_id)
    SELECT mental_health_hub.public.metric_seq.NEXTVAL, s.year, s.value, c.id AS country_id, 1 AS metric_id 
    FROM MENTAL_HEALTH_HUB.DATASETS.GM_GDP s
    JOIN MENTAL_HEALTH_HUB.PUBLIC.Country c ON s.country = c.name;

INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Social_Economical_Metrics (id, year, value, country_id, metric_id)
    SELECT mental_health_hub.public.metric_seq.NEXTVAL, s.year, s.value, c.id AS country_id, 2 AS metric_id -- Use 2 for Income
    FROM MENTAL_HEALTH_HUB.DATASETS.GM_INCOME s
    JOIN MENTAL_HEALTH_HUB.PUBLIC.Country c ON s.country = c.name
    WHERE NOT EXISTS (
        SELECT 1 
        FROM MENTAL_HEALTH_HUB.PUBLIC.Social_Economical_Metrics sem
        WHERE sem.year = s.year 
        AND sem.country_id = c.id 
        AND sem.metric_id = 2
    );

-- Insert data for GM_INTERNET
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Social_Economical_Metrics (id, year, value, country_id, metric_id)
    SELECT mental_health_hub.public.metric_seq.NEXTVAL, s.year, 
           REGEXP_REPLACE(s.value, '[^0-9\.]', '')::NUMERIC AS value, 
           c.id AS country_id, 3 AS metric_id -- Use 3 for Internet Usage
    FROM MENTAL_HEALTH_HUB.DATASETS.GM_INTERNET s
    JOIN MENTAL_HEALTH_HUB.PUBLIC.Country c ON s.country = c.name
    WHERE NOT EXISTS (
        SELECT 1 
        FROM MENTAL_HEALTH_HUB.PUBLIC.Social_Economical_Metrics sem
        WHERE sem.year = s.year 
        AND sem.country_id = c.id 
        AND sem.metric_id = 3
    );

-- Insert data for GM_LIFE_EXP
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Social_Economical_Metrics (id, year, value, country_id, metric_id)
    SELECT mental_health_hub.public.metric_seq.NEXTVAL, s.year, s.value, c.id AS country_id, 4 AS metric_id -- Use 4 for Life Expectancy
    FROM MENTAL_HEALTH_HUB.DATASETS.GM_LIFE_EXP s
    JOIN MENTAL_HEALTH_HUB.PUBLIC.Country c ON s.country = c.name
    WHERE NOT EXISTS (
        SELECT 1 
        FROM MENTAL_HEALTH_HUB.PUBLIC.Social_Economical_Metrics sem
        WHERE sem.year = s.year 
        AND sem.country_id = c.id 
        AND sem.metric_id = 4
    );

-- Insert data for GM_MED_AGE
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Social_Economical_Metrics (id, year, value, country_id, metric_id)
    SELECT mental_health_hub.public.metric_seq.NEXTVAL, s.year, s.value, c.id AS country_id, 5 AS metric_id -- Use 5 for Median Age
    FROM MENTAL_HEALTH_HUB.DATASETS.GM_MED_AGE s
    JOIN MENTAL_HEALTH_HUB.PUBLIC.Country c ON s.country = c.name
    WHERE NOT EXISTS (
        SELECT 1 
        FROM MENTAL_HEALTH_HUB.PUBLIC.Social_Economical_Metrics sem
        WHERE sem.year = s.year 
        AND sem.country_id = c.id 
        AND sem.metric_id = 5
    );

-- Insert data for GM_SUICIDE_COUNT
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Social_Economical_Metrics (id, year, value, country_id, metric_id)
    SELECT mental_health_hub.public.metric_seq.NEXTVAL, s.year, 
           REGEXP_REPLACE(s.value, '[^0-9]', '')::NUMERIC AS value, 
           c.id AS country_id, 6 AS metric_id -- Use 6 for Suicide Count
    FROM MENTAL_HEALTH_HUB.DATASETS.GM_SUICIDE_COUNT s
    JOIN MENTAL_HEALTH_HUB.PUBLIC.Country c ON s.country = c.name
    WHERE NOT EXISTS (
        SELECT 1 
        FROM MENTAL_HEALTH_HUB.PUBLIC.Social_Economical_Metrics sem
        WHERE sem.year = s.year 
        AND sem.country_id = c.id 
        AND sem.metric_id = 6
    );

-- Insert data for GM_POPULATION
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Social_Economical_Metrics (id, year, value, country_id, metric_id)
    SELECT mental_health_hub.public.metric_seq.NEXTVAL, s.year, 
           REGEXP_REPLACE(s.value, '[^0-9]', '')::NUMERIC AS value, 
           c.id AS country_id, 7 AS metric_id -- Use 7 for Population
    FROM MENTAL_HEALTH_HUB.DATASETS.GM_POPULATION s
    JOIN MENTAL_HEALTH_HUB.PUBLIC.Country c ON s.country = c.name
    WHERE NOT EXISTS (
        SELECT 1 
        FROM MENTAL_HEALTH_HUB.PUBLIC.Social_Economical_Metrics sem
        WHERE sem.year = s.year 
        AND sem.country_id = c.id 
        AND sem.metric_id = 7
    );


------- Mental_Health_Indicators ---------------------------------------------------------------

CREATE SEQUENCE indicator_seq START = 1 INCREMENT = 1;

-- Data for Death Rate
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Mental_Health_Indicators (
    SELECT indicator_seq.NEXTVAL AS ID,
           y.year AS YEAR, 
           y.death_rate_all_ages AS VALUE, 
           c.id AS country_id, 
           1 AS indicator_id
    FROM MENTAL_HEALTH_HUB.DATASETS.Indicator_Death_Rate y
        FULL JOIN MENTAL_HEALTH_HUB.PUBLIC.Country c ON y.entity = c.name
);

-- Data for Mental Health Units In Hospitals
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Mental_Health_Indicators (
    SELECT indicator_seq.NEXTVAL AS ID,
           y.year AS YEAR, 
           y.mental_health_units AS VALUE, 
           c.id AS country_id, 
           2 AS indicator_id
    FROM MENTAL_HEALTH_HUB.DATASETS.INDICATOR_MH_UNITS_HOSPITAL y
        FULL JOIN MENTAL_HEALTH_HUB.PUBLIC.Country c ON y.entity = c.name
);

-- Data for Number of Psychiatrists
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Mental_Health_Indicators (
    SELECT indicator_seq.NEXTVAL AS ID,
           y.year AS YEAR, 
           y.psychiatry AS VALUE, 
           c.id AS country_id, 
           3 AS indicator_id
    FROM MENTAL_HEALTH_HUB.DATASETS.Indicator_Psychiatry_Hospital y
        FULL JOIN MENTAL_HEALTH_HUB.PUBLIC.Country c ON y.entity = c.name
);

-- Data for Mental Health Policy
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Mental_Health_Indicators (
    SELECT indicator_seq.NEXTVAL AS ID,
           y.year AS YEAR, 
           y.policy AS VALUE, 
           c.id AS country_id, 
           4 AS indicator_id
    FROM MENTAL_HEALTH_HUB.DATASETS.INDICATOR_MH_POLICY y
        FULL JOIN MENTAL_HEALTH_HUB.PUBLIC.Country c ON y.entity = c.name
);

------------------------------------------------------------------------------------------------
-- Data wrangling: INSERT statements that use SELECT statements to populate entity table COUNTRY
------------------------------------------------------------------------------------------------

-- Country
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Country(
    SELECT c.id AS ID,
           c.country AS COUNTRY,
           c.continent AS CONTINENT
    FROM mental_health_hub.datasets.CONTINENTS_MAPPED_COUNTRIES c
    WHERE len(c.id) <=3
);


/*
7. Finally query each filled table by writing a SELECT * FROM Table_Name LIMIT 10 .
Take screenshots of your query and returned results.
Use this templateLinks to an external site. to save your screenshots into a file.
Download a .pdf version of the completed file.
Please make sure to include a snapshot of your ERD diagram.
Feel free to enhance and update your previously submitted ERD diagram.
*/
SELECT * FROM Country LIMIT 10;
SELECT * FROM Indicator LIMIT 10;
SELECT * FROM Metric LIMIT 10;
SELECT * FROM Disorder LIMIT 10;
SELECT * FROM Disorder_Metrics LIMIT 10;
SELECT * FROM Prevalence_Grouped_By_Age LIMIT 10;
SELECT * FROM Mental_Health_Indicators LIMIT 10;
SELECT * FROM Social_Economical_Metrics LIMIT 10;
