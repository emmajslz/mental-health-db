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
