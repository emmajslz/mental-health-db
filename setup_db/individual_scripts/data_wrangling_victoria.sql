
-- populating the metric table

CREATE SEQUENCE MENTAL_HEALTH_HUB.PUBLIC.metric_seq
    START WITH 1
    INCREMENT BY 1;

INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Metric (id, country_metric, type_of_value, source)
    VALUES 
        (MENTAL_HEALTH_HUB.PUBLIC.metric_seq.NEXTVAL, 'GDP', 'Value', 'Source1'),
        (MENTAL_HEALTH_HUB.PUBLIC.metric_seq.NEXTVAL, 'Income', 'Value', 'Source2'),
        (MENTAL_HEALTH_HUB.PUBLIC.metric_seq.NEXTVAL, 'Internet Usage', 'Value', 'Source3'),
        (MENTAL_HEALTH_HUB.PUBLIC.metric_seq.NEXTVAL, 'Life Expectancy', 'Value', 'Source4'),
        (MENTAL_HEALTH_HUB.PUBLIC.Metric_seq.NEXTVAL, 'Median Age', 'Value', 'Source5'),
        (MENTAL_HEALTH_HUB.PUBLIC.Metric_seq.NEXTVAL, 'Suicide Count', 'Count', 'Source6')
        (MENTAL_HEALTH_HUB.PUBLIC.metric_seq.NEXTVAL, 'Population', 'Value', 'Source7');
    
UPDATE MENTAL_HEALTH_HUB.PUBLIC.metric
SET source = 'https://www.gapminder.org/data/';


-- populating the Social economic table

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







