/* ------ MSDS691 Deliverable 3 ------------ */
/*
Group number: 32
Team members: Chelyah Miller, Emma Juan Salazar, Victoria Blante
*/

/*
Metrics Outline:
1. 5_year_measure: Increase of each country’s prevalence of each disorder(or we can pick one) in the last 5 years (as a percentage)
2. 10_year_measure: Increase of each country’s prevalence of each disorder(or we can pick one) in the last 10 years (as a percentage)
3. Avg_Corr_Metric_Prevalence: Correlation between all social and ecomonic metrics and prevalence for each country
4. Income_Prevalence: Correlation betwen income and prevalence
5. Life_Expectancy_Prevalence: Correlation betwen life expectancy and prevalence
6. Median_Age_Prevalence: Correlation between suicide count and prevalence
7. Death_Rate_Prevalence: Correlation between death rate and prevalence
8. Psychiatrists_Prevalence: Correlation between death rate and prevalence
9. Policy_Prevalence: Correlation between mental health policy and prevalence
*/

/*------- Queries ------------*/
/*5_year_measure: Increase of each country’s prevalence of each disorder(or we can pick one) in the last 5 years (as a percentage)*/
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


/*10_year_measure: Increase of each country’s prevalence of each disorder(or we can pick one) in the last 10 years (as a percentage)*/
WITH prevalence_over_10 AS (
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
FROM prevalence_over_10
WHERE year BETWEEN 2014 AND 2019
GROUP BY country_id, disorder_id
ORDER BY country_id, disorder_id;


/*Avg_Corr_Metric_Prevalence: Correlation between all social and ecomonic metrics and prevalence for each country */
WITH yearly_correlation AS (
     SELECT sem.year year, 
            dsm.country_id country_id,
            CORR(sem.value, dsm.prevalence_age_standardized) AS correlation_coefficient 
    FROM Social_economical_metrics sem
         LEFT JOIN Disorder_metrics dsm USING(country_id)
    WHERE sem.year BETWEEN 1995 AND 2019
    GROUP BY sem.year, dsm.country_id
)
SELECT country_id, 
       AVG(correlation_coefficient) avg_correlation
FROM yearly_correlation
GROUP BY country_id
ORDER BY country_id;


/*Income_Prevalence: Correlation betwen income and prevalence*/
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


/*Life_Expectancy_Prevalence: Correlation betwen life expectancy and prevalence*/
WITH yearly_correlation AS (
     SELECT sem.year year, 
            dsm.country_id country_id,
            CORR(sem.value, dsm.prevalence_age_standardized) AS correlation_coefficient 
    FROM Social_economical_metrics sem
         LEFT JOIN Disorder_metrics dsm USING(country_id)
    WHERE sem.metric_id = 4 AND sem.year BETWEEN 1995 AND 2019
    GROUP BY sem.year, dsm.country_id
)
SELECT country_id, 
       AVG(correlation_coefficient) avg_correlation
FROM yearly_correlation
GROUP BY country_id
ORDER BY country_id;


/*Median_Age_Prevalence: Correlation between suicide count and prevalence*/
WITH yearly_correlation AS (
     SELECT sem.year year, 
            dsm.country_id country_id,
            CORR(sem.value, dsm.prevalence_age_standardized) AS correlation_coefficient 
    FROM Social_economical_metrics sem
         LEFT JOIN Disorder_metrics dsm USING (country_id)
    WHERE sem.metric_id = 5 AND sem.year BETWEEN 1995 AND 2019
    GROUP BY sem.year, dsm.country_id
)
SELECT country_id, 
       AVG(correlation_coefficient) avg_correlation
FROM yearly_correlation
GROUP BY country_id
ORDER BY country_id;


/*[Death_Rate_Prevalence]: [Correlation between death rate and prevalence]*/
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









