CREATE TABLE MENTAL_HEALTH_HUB.PUBLIC.Country(
    id INT PRIMARY KEY, 
    name VARCHAR(500),
    continent VARCHAR(500)
); 

CREATE TABLE MENTAL_HEALTH_HUB.PUBLIC.Indicator(
    id INT PRIMARY KEY, 
    mental_health_indicator VARCHAR(500),
    type_of_value VARCHAR(500)
); 

CREATE TABLE MENTAL_HEALTH_HUB.PUBLIC.metric(
    id INT,
    country_metric VARCHAR(100),
    type_of_value VARCHAR(100),
    source VARCHAR(100)
);

CREATE TABLE MENTAL_HEALTH_HUB.PUBLIC.disorder(
    id INT,
    name VARCHAR(100),
    symptoms TEXT
); 
