CREATE TABLE MENTAL_HEALTH_HUB.PUBLIC.metric(
    id INT,
    country_metric VARCHAR(100),
    type_of_value VARCHAR(100),
    source VARCHAR(100)
);

CREATE TABLE MENTAL_HEALTH_HUB.PUBLIC.social_economical_metrics(
    id INT,
    year INT,
    value FLOAT,
    FOREIGN KEY (country_id) REFERENCES country(id), 
    FOREIGN KEY (metric_id) REFERENCES metric(id)
);

CREATE TABLE MENTAL_HEALTH_HUB.PUBLIC.disorder(
    id INT,
    name VARCHAR(100),
    symptoms TEXT
); 
