CREATE TABLE metric(
    metric_id INT
    country_metric VARCHAR(100)
    type_of_value VARCHAR(100)
    source VARCHAR(100)
)

CREATE TABLE social_economical_metrics(
    soc_eco_id INT
    year INT
    gdp_per_capita INT
    life_expectancy FLOAT
    population INT
    suicude_total_death FLOAT
    daily_income FLOAT
    internet_users FLOAT
    median_age FLOAT
    FOREIGN KEY (country_id) REFERENCES country(country_id) 
    FOREIGN KEY (metric_id) REFERENCES metric(metric_id)
)

CREATE TABLE disorder(
    disorder_id INT
    name VARCHAR(100)
    symptoms TEXT
)