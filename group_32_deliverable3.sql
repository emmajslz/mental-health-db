/* ------ MSDS691 Deliverable 3 ------------ */
/*
Group number: 32
Team members: Chelyah Miller, Emma Juan Salazar, Victoria Blante
*/

/* Our three initial questions were:

1. How does prevalence change over time?
Our first query will measure how the prevalence for each disorder and each country has evolved since 2014 compared to 2019.

2. How do social and economic factors impact prevalence?
The second query will tell us about the correlation between income and mental disorder prevalence for each country.

3. How does the country’s mental health system affect prevalence?
Since we do not have a lot of data about mental health units, psychiatrists, and policy, aggregating it would not be representative.
Our third query will give us the correlation between death rate and mental disorder prevalence for the 2000 decade and the 2010 decade.
*/

/*------- Queries ------------*/

/* Prevalence over time (5_year_measure):
Difference of each country’s prevalence (in %) for each disorder in the last 5 years (2014 to 2019)*/
WITH prevalence_over_5 AS (
    SELECT dsm_current.country_id, 
           dsm_current.disorder_id disorder_id,
           dsm_current.year,
           dsm_current.prevalence_age_standardized current_prevalence,
           dsm_previous.prevalence_age_standardized previous_prevalence,
           (dsm_current.prevalence_age_standardized - dsm_previous.prevalence_age_standardized) prevalence_difference,
           CASE
                WHEN dsm_previous.prevalence IS NOT NULL
                THEN (dsm_current.prevalence - dsm_previous.prevalence) / NULLIF(dsm_previous.prevalence, 0) * 100
            END prevalence_percent_change
    FROM Disorder_metrics dsm_current
         LEFT JOIN DISORDER_METRICS dsm_previous ON dsm_current.country_id = dsm_previous.country_id AND dsm_current.year = dsm_previous.year + 5)
SELECT country_id, 
       disorder_id, 
       MIN(year) initial_year,
       MIN(current_prevalence) initial_prevalence,
       MAX(year) final_year,
       MAX(current_prevalence) final_prevalence,
       (MAX(current_prevalence) - MIN(current_prevalence)) AS overall_prevalence_difference,
       CASE 
           WHEN MIN(current_prevalence) IS NOT NULL AND MIN(current_prevalence) != 0
           THEN (MAX(current_prevalence) - MIN(current_prevalence)) / MIN(current_prevalence) * 100
       END overall_prevalence_percent_change
FROM prevalence_over_5
WHERE year BETWEEN 2014 AND 2019
GROUP BY country_id, disorder_id
ORDER BY country_id, disorder_id;

/* Impact of Income in Prevalence:
Correlation betwen income and prevalence of mental disorders.*/
WITH yearly_correlation AS (
     SELECT sem.year year, 
            dsm.country_id country_id,
            CORR(sem.value, dsm.prevalence_age_standardized) AS correlation_coefficient 
    FROM Social_economical_metrics sem
         LEFT JOIN Disorder_metrics dsm USING(country_id)
    WHERE sem.metric_id = 2 AND sem.year BETWEEN 1995 AND 2019
    GROUP BY sem.year, dsm.country_id
)
SELECT c.name, 
       AVG(y.correlation_coefficient) avg_correlation
FROM yearly_correlation y
    LEFT JOIN country c ON c.id = y.country_id
GROUP BY c.name
ORDER BY c.name;


/* Death_Rate vs. Prevalence:
Correlation between death rate and mental disorder prevalence for the decades 2000 and 2010.*/
WITH death_vs_prevalence AS (
        SELECT
            i.country_id
            ,i.year
            ,(FLOOR(i.year / 10) * 10) AS decade
            ,dm.disorder_id
            ,dm.prevalence_age_standardized
            ,i.value::FLOAT AS death_rate
        FROM mental_health_indicators i
            LEFT JOIN disorder_metrics dm ON i.country_id = dm.country_id AND i.year = dm.year
        WHERE i.indicator_id = (SELECT id FROM Indicator WHERE mental_health_indicator LIKE '%Death Rate%')
)
, corr_coefficient AS (
    SELECT
        country_id
        ,decade
        ,disorder_id
        ,CORR(death_rate, prevalence_age_standardized) AS correlation_coefficient
    FROM death_vs_prevalence
    GROUP BY 1,2,3
)
SELECT
    c.name
    ,cc.decade
    ,d.name AS disorder
    ,ROUND(cc.correlation_coefficient,2) AS correlation_deathrate_prevalence
FROM corr_coefficient cc
    LEFT JOIN country c ON cc.country_id = c.id
    LEFT JOIN disorder d ON cc.disorder_id = d.id
ORDER BY 1,3,2









