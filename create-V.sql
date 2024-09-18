CREATE TABLE metric(
    id INT,
    country_metric VARCHAR(100),
    type_of_value VARCHAR(100),
    source VARCHAR(100)
)

CREATE TABLE social_economical_metrics(
    id INT,
    year INT,
    gdp_per_capita INT,
    life_expectancy FLOAT,
    population INT,
    suicude_total_death FLOAT,
    daily_income FLOAT,
    internet_users FLOAT,
    median_age FLOAT,
    FOREIGN KEY (country_id) REFERENCES country(id), 
    FOREIGN KEY (metric_id) REFERENCES metric(id)
)

CREATE TABLE disorder(
    id INT,
    name VARCHAR(100),
    symptoms TEXT
) 