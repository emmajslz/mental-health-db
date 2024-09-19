-- populating the Social Economical Metrics table

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
    SELECT mental_health_hub.public.metric_seq.NEXTVAL, s.year, s.value, c.id AS country_id, 3 AS metric_id -- Use 3 for Internet Usage
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
    SELECT mental_health_hub.public.metric_seq.NEXTVAL, s.year, s.value, c.id AS country_id, 6 AS metric_id -- Use 6 for Suicide Count
    FROM MENTAL_HEALTH_HUB.DATASETS.GM_SUICIDE_COUNT s
    JOIN MENTAL_HEALTH_HUB.PUBLIC.Country c ON s.country = c.name
    WHERE NOT EXISTS (
        SELECT 1 
        FROM MENTAL_HEALTH_HUB.PUBLIC.Social_Economical_Metrics sem
        WHERE sem.year = s.year 
        AND sem.country_id = c.id 
        AND sem.metric_id = 6
    );

