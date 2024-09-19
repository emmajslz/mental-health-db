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

CREATE OR REPLACE TABLE MENTAL_HEALTH_HUB.PUBLIC.Mental_Health_Indicators(
    ID INT PRIMARY KEY,
    YEAR INT,
    VALUE VARCHAR(500),
CREATE TABLE MENTAL_HEALTH_HUB.PUBLIC.Mental_Health_Indicators(
    id INT PRIMARY KEY,
    year INT,
    value FLOAT,
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