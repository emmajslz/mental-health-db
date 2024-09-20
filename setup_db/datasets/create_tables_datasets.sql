----------------------------------------------------------------------------------------------------
-- BY DISORDER -------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

-- Estimated cases
-- mental-illness-estimated-cases.csv
CREATE OR REPLACE TABLE MENTAL_HEALTH_HUB.DATASETS.BY_DISORDER_ESTIMATED_CASES (
	ENTITY VARCHAR(500),
	CODE VARCHAR(500),
	YEAR INT,
	ANXIETY INT,
	DEPRESSION INT,
	SCHIZOPHRENIA INT,
	BIPOLAR INT,
	ED INT
);

-- Prevalence
-- mental-illnesses-prevalence.csv
CREATE OR REPLACE TABLE MENTAL_HEALTH_HUB.DATASETS.BY_DISORDER_PREVALENCE (
	ENTITY VARCHAR(500),
	CODE VARCHAR(500),
	YEAR INT,
	SCHIZOPHRENIA INT,
	DEPRESSION INT,
	ANXIETY INT,
	BIPOLAR INT,
	ED INT
);

-- Prevalence Grouped By Age - Anxiety
-- depressive-disorders-prevalence-by-age.csv
CREATE OR REPLACE TABLE MENTAL_HEALTH_HUB.DATASETS.BY_DISORDER_PREVALENCE_BY_AGE_ANXIETY (
	ENTITY VARCHAR(500),
	CODE VARCHAR(500),
	YEAR NUMBER(38,0),
	AGES_5_TO_14 INT,
	AGES_15_TO_19 INT,
	AGES_20_TO_24 INT,
	AGES_25_TO_29 INT,
	AGES_30_TO_34 INT,
	AGES_35_TO_39 INT,
	AGES_40_TO_44 INT,
	AGES_45_TO_49 INT,
	AGES_50_TO_54 INT,
	AGES_55_TO_59 INT,
	AGES_60_TO_64 INT,
	AGES_65_TO_69 INT,
	AGES_FROM_70 INT,
	ALL_AGES INT,
	AGE_STANDARDIZED INT
);

-- Prevalence Grouped By Age - Bipolar
-- bipolar-disorder-prevalence-by-age.csv
CREATE OR REPLACE TABLE MENTAL_HEALTH_HUB.DATASETS.BY_DISORDER_PREVALENCE_BY_AGE_BIPOLAR (
	ENTITY VARCHAR(500),
	CODE VARCHAR(500),
	YEAR NUMBER(38,0),
	AGE_5_TO_14 INT,
	AGE_15_TO_19 INT,
	AGE_20_TO_24 INT,
	AGE_25_TO_29 INT,
	AGE_30_TO_34 INT,
	AGE_35_TO_39 INT,
	AGE_40_TO_44 INT,
	AGE_45_TO_49 INT,
	AGE_50_TO_54 INT,
	AGE_55_TO_59 INT,
	AGE_60_TO_64 INT,
	AGE_65_TO_69 INT,
	AGE_FROM_70 INT,
	ALL_AGES INT,
	AGE_STANDARDIZED INT
);

-- Prevalence Grouped By Age - Depression
-- bipolar-disorder-prevalence-by-age.csv
CREATE OR REPLACE TABLE MENTAL_HEALTH_HUB.DATASETS.BY_DISORDER_PREVALENCE_BY_AGE_DEPRESSION (
	ENTITY VARCHAR(500),
	CODE VARCHAR(500),
	YEAR INT,
	AGE_5_TO_14 INT,
	AGE_15_TO_19 INT,
	AGE_20_TO_24 INT,
	AGE_25_TO_29 INT,
	AGE_30_TO_34 INT,
	AGE_35_TO_39 INT,
	AGE_40_TO_44 INT,
	AGE_45_TO_49 INT,
	AGE_50_TO_54 INT,
	AGE_55_TO_59 INT,
	AGE_60_TO_64 INT,
	AGE_65_TO_69 INT,
	AGE_FROM_70 INT,
	ALL_AGES INT,
	AGE_STANDARDIZED INT
);

-- Prevalence Grouped By Age - Schizophrenia
-- schizophrenia-prevalence-by-age.csv
CREATE OR REPLACE TABLE MENTAL_HEALTH_HUB.DATASETS.BY_DISORDER_PREVALENCE_BY_AGE_SCHIZOPHRENIA (
	ENTITY VARCHAR(500),
	CODE VARCHAR(500),
	YEAR INT,
	AGE_5_TO_14 INT,
	AGE_15_TO_19 INT,
	AGE_20_TO_24 INT,
	AGE_25_TO_29 INT,
	AGE_30_TO_34 INT,
	AGE_35_TO_39 INT,
	AGE_40_TO_44 INT,
	AGE_45_TO_49 INT,
	AGE_50_TO_54 INT,
	AGE_55_TO_59 INT,
	AGE_60_TO_64 INT,
	AGE_65_TO_69 INT,
	AGE_FROM_70 INT,
	ALL_AGES INT,
	AGE_STANDARDIZED INT
);

----------------------------------------------------------------------------------------------------
-- MENTAL HEALTH INDICATORS and others -------------------------------------------------------------
----------------------------------------------------------------------------------------------------

-- Death Rates
-- death-rates-from-mental-and-substance-disorders-by-age-who.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.INDICATOR_DEATH_RATE (
	ENTITY VARCHAR(500),
	CODE VARCHAR(500),
	YEAR INT,
	DEATH_RATE_AGE_0_TO_4 INT,
	DEATH_RATE_AGE_5_TO_14 INT,
	DEATH_RATE_AGE_15_TO_49 INT,
	DEATH_RATE_AGE_50_TO_69 INT,
	DEATH_RATE_AGE_FROM_70 INT,
	DEATH_RATE_ALL_AGES INT
);

-- Mental Health Policy
-- stand-alone-policy-or-plan-for-mental-health.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.INDICATOR_MH_POLICY (
	ENTITY VARCHAR(500),
	CODE VARCHAR(500),
	YEAR INT,
	POLICY BOOLEAN
);

-- Mental Health Units
-- mental-health-units-in-general-hospitals.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.INDICATOR_MH_UNITS_HOSPITAL (
	ENTITY VARCHAR(500),
	CODE VARCHAR(500),
	YEAR INT,
	MENTAL_HEALTH_UNITS INT
);

-- Psychiatrists working in Mental Health
-- psychiatrists-working-in-the-mental-health-sector.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.INDICATOR_PSYCHIATRY_HOSPITAL (
	ENTITY VARCHAR(500),
	CODE VARCHAR(500),
	YEAR INT,
	PSYCHIATRY INT
);

----------------------------------------------------------------------------------------------------
-- CONTINENTS MAPPED TO COUNTRIES ------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

-- Country mapped to continent
-- countries_continents.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.CONTINENTS_MAPPED_COUNTRIES (
	ID VARCHAR(500),
	COUNTRY VARCHAR(500),
	CONTINENT VARCHAR(500)
);

----------------------------------------------------------------------------------------------------
-- GAPMINDER ADDITIONAL DATA -----------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

-- GDP per Capita
-- gdp_pcap.csv
-- t_gdp.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.GM_GDP (
	COUNTRY VARCHAR(500),
	YEAR INT,
	VALUE INT
);

-- Income
-- mincpcap_cppp.csv
-- t_income.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.GM_INCOME (
	COUNTRY VARCHAR(500),
	YEAR INT),
	VALUE INT
);

-- Internet Usage
-- internet_users.csv
-- t_internet2.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.GM_INTERNET (
	COUNTRY VARCHAR(500),
	YEAR INT,
	VALUE VARCHAR(500)
);

-- Life Expectancy
-- lex.csv
-- t_life_exp.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.GM_LIFE_EXP (
	COUNTRY VARCHAR(500),
	YEAR INT,
	VALUE INT
);

-- Median Age
-- median_age_years.csv
-- t_med_age.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.GM_MED_AGE (
	COUNTRY VARCHAR(500),
	YEAR INT,
	VALUE INT
);

-- Suicide Count
-- suicide_total_deaths.csv
-- t_suicide_count.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.GM_SUICIDE_COUNT (
	COUNTRY VARCHAR(500),
	YEAR INT,
	VALUE VARCHAR(500)
);
