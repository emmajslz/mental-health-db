CREATE TABLE MENTAL_HEALTH_HUB.PUBLIC.DISORDER_METRICS(
    ID INT PRIMARY KEY,
    YEAR INT,
    PREVALENCE FLOAT,
    PREVALENCE_AGE_STANDARDIZED FLOAT,
    NUMBER_OF_CASES INT,
    COUNTRY_ID VARCHAR REFERENCES COUNTRY (COUNTRY_ID),
    DISORDER_ID VARCHAR REFERENCES DISORDER (DISORDER_ID)
);

CREATE TABLE MENTAL_HEALTH_HUB.PUBLIC.DISORDER_METRICS(
    ID INT PRIMARY KEY,
    YEAR INT,
    PREVALENCE FLOAT,
    AGE_INTERVAL VARCHAR,
    COUNTRY_ID VARCHAR REFERENCES COUNTRY (COUNTRY_ID),
    DISORDER_ID VARCHAR REFERENCES DISORDER (DISORDER_ID)
);