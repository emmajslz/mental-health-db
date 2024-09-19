--country entity setup prior to running a continent API in python

SELECT DISTINCT dp.code AS ID,
                dp.entity AS COUNTRY,
FROM MENTAL_HEALTH_HUB.DATASETS.BY_DISORDER_PREVALENCE dp 
    FULL JOIN INDICATOR_MH_POLICY e ON dp.entity = e.entity 
    WHERE dp.code IS NOT NULL  
    AND dp.entity NOT LIKE '%IHME GBD%' 

--Set up for the indicator table
CREATE SEQUENCE mental_health_hub.public.indicator_seq
    START WITH 1
    INCREMENT BY 1;


-- Insert data for Indicator entity
INSERT INTO mental_health_hub.public.Indicator (id, mental_health_indicator, type_of_value)
    VALUES 
        (mental_health_hub.public.indicator_seq.NEXTVAL, 'Death Rate', 'Rate per 100,000 People'),
        (mental_health_hub.public.indicator_seq.NEXTVAL, 'Mental Health Units in General Hospital', 'Units per 100,000 People'),
        (mental_health_hub.public.indicator_seq.NEXTVAL, 'Pyschiatrists in Mental Health', 'Psychiatrists per 100,000 People'),
        (mental_health_hub.public.indicator_seq.NEXTVAL, 'Policy Regarding Mental Health', 'Yes/No Values');


-- Insert data for Country entity
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Country(
    SELECT c.id AS ID,
           c.country AS COUNTRY,
           c.continent AS CONTINENT
    FROM mental_health_hub.datasets.CONTINENTS_MAPPED_COUNTRIES c
    WHERE len(c.id) <=3
);

-- Insert data from Indicator_MH_policy
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Mental_Health_Indicators (
    SELECT indicator_seq.NEXTVAL AS ID,
           y.year AS YEAR, 
           y.policy AS VALUE, 
           c.id AS country_id, 
           1 AS indicator_id
FROM MENTAL_HEALTH_HUB.DATASETS.INDICATOR_MH_POLICY y
    FULL JOIN MENTAL_HEALTH_HUB.PUBLIC.Country c ON y.entity = c.name
);

-- Insert data for Indicator_MH_Units_Hospital
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Mental_Health_Indicators (
    SELECT indicator_seq.NEXTVAL AS ID,
           y.year AS YEAR, 
           y.mental_health_units AS VALUE, 
           c.id AS country_id, 
           2 AS indicator_id
FROM MENTAL_HEALTH_HUB.DATASETS.INDICATOR_MH_UNITS_HOSPITAL y
    FULL JOIN MENTAL_HEALTH_HUB.PUBLIC.Country c ON y.entity = c.name
);

-- Insert data for Indicator_Psychiatry_Hospital
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Mental_Health_Indicators (
    SELECT indicator_seq.NEXTVAL AS ID,
           y.year AS YEAR, 
           y.psychiatry AS VALUE, 
           c.id AS country_id, 
           3 AS indicator_id
FROM MENTAL_HEALTH_HUB.DATASETS.Indicator_Psychiatry_Hospital y
    FULL JOIN MENTAL_HEALTH_HUB.PUBLIC.Country c ON y.entity = c.name
);

-- Insert data for Indicator_Death_Rate
INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Mental_Health_Indicators (
    SELECT indicator_seq.NEXTVAL AS ID,
           y.year AS YEAR, 
           y.death_rate_all_ages AS VALUE, 
           c.id AS country_id, 
           4 AS indicator_id
FROM MENTAL_HEALTH_HUB.DATASETS.Indicator_Death_Rate y
    FULL JOIN MENTAL_HEALTH_HUB.PUBLIC.Country c ON y.entity = c.name
);



