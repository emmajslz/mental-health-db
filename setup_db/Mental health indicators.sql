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

CREATE TABLE MENTAL_HEALTH_HUB.PUBLIC.Mental_Health_Indicators(
    ID INT PRIMARY KEY,
    YEAR INT,
    VALUE FLOAT,
    country_id INT REFERENCES Country(country_id),
    indicator_id INT REFERENCES Indicator(indicator_id)
)