----------------------------------------------------------------------------------------------------
-- BY DISORDER -------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

-- Estimated cases
-- mental-illness-estimated-cases.csv
CREATE OR REPLACE TABLE MENTAL_HEALTH_HUB.DATASETS.BY_DISORDER_ESTIMATED_CASES (
	ENTITY VARCHAR(16777216),
	CODE VARCHAR(16777216),
	YEAR NUMBER(38,0),
	ANXIETY NUMBER(38,6),
	DEPRESSION NUMBER(38,6),
	SCHIZOPHRENIA NUMBER(38,7),
	BIPOLAR NUMBER(38,7),
	ED NUMBER(38,7)
);

-- Prevalence
-- mental-illnesses-prevalence.csv
CREATE OR REPLACE TABLE MENTAL_HEALTH_HUB.DATASETS.BY_DISORDER_PREVALENCE (
	ENTITY VARCHAR(16777216),
	CODE VARCHAR(16777216),
	YEAR NUMBER(38,0),
	SCHIZOPHRENIA NUMBER(38,8),
	DEPRESSION NUMBER(38,7),
	ANXIETY NUMBER(38,7),
	BIPOLAR NUMBER(38,8),
	ED NUMBER(38,9)
);

-- Prevalence Grouped By Age - Anxiety
-- depressive-disorders-prevalence-by-age.csv
CREATE OR REPLACE TABLE MENTAL_HEALTH_HUB.DATASETS.BY_DISORDER_PREVALENCE_BY_AGE_ANXIETY (
	ENTITY VARCHAR(16777216),
	CODE VARCHAR(16777216),
	YEAR NUMBER(38,0),
	AGES_5_TO_14 NUMBER(38,8),
	AGES_15_TO_19 NUMBER(38,7),
	AGES_20_TO_24 NUMBER(38,7),
	AGES_25_TO_29 NUMBER(38,7),
	AGES_30_TO_34 NUMBER(38,7),
	AGES_35_TO_39 NUMBER(38,7),
	AGES_40_TO_44 NUMBER(38,7),
	AGES_45_TO_49 NUMBER(38,7),
	AGES_50_TO_54 NUMBER(38,7),
	AGES_55_TO_59 NUMBER(38,7),
	AGES_60_TO_64 NUMBER(38,7),
	AGES_65_TO_69 NUMBER(38,7),
	AGES_FROM_70 NUMBER(38,7),
	ALL_AGES NUMBER(38,7),
	AGE_STANDARDIZED NUMBER(38,7)
);

-- Prevalence Grouped By Age - Bipolar
-- bipolar-disorder-prevalence-by-age.csv
CREATE OR REPLACE TABLE MENTAL_HEALTH_HUB.DATASETS.BY_DISORDER_PREVALENCE_BY_AGE_BIPOLAR (
	ENTITY VARCHAR(16777216),
	CODE VARCHAR(16777216),
	YEAR NUMBER(38,0),
	AGE_5_TO_14 NUMBER(38,9),
	AGE_15_TO_19 NUMBER(38,8),
	AGE_20_TO_24 NUMBER(38,8),
	AGE_25_TO_29 NUMBER(38,8),
	AGE_30_TO_34 NUMBER(38,8),
	AGE_35_TO_39 NUMBER(38,8),
	AGE_40_TO_44 NUMBER(38,8),
	AGE_45_TO_49 NUMBER(38,8),
	AGE_50_TO_54 NUMBER(38,8),
	AGE_55_TO_59 NUMBER(38,8),
	AGE_60_TO_64 NUMBER(38,8),
	AGE_65_TO_69 NUMBER(38,8),
	AGE_FROM_70 NUMBER(38,8),
	ALL_AGES NUMBER(38,8),
	AGE_STANDARDIZED NUMBER(38,8)
);

-- Prevalence Grouped By Age - Depression
-- bipolar-disorder-prevalence-by-age.csv
CREATE OR REPLACE TABLE MENTAL_HEALTH_HUB.DATASETS.BY_DISORDER_PREVALENCE_BY_AGE_DEPRESSION (
	ENTITY VARCHAR(16777216),
	CODE VARCHAR(16777216),
	YEAR NUMBER(38,0),
	AGE_5_TO_14 NUMBER(38,8),
	AGE_15_TO_19 NUMBER(38,7),
	AGE_20_TO_24 NUMBER(38,7),
	AGE_25_TO_29 NUMBER(38,7),
	AGE_30_TO_34 NUMBER(38,7),
	AGE_35_TO_39 NUMBER(38,7),
	AGE_40_TO_44 NUMBER(38,7),
	AGE_45_TO_49 NUMBER(38,7),
	AGE_50_TO_54 NUMBER(38,7),
	AGE_55_TO_59 NUMBER(38,7),
	AGE_60_TO_64 NUMBER(38,7),
	AGE_65_TO_69 NUMBER(38,7),
	AGE_FROM_70 NUMBER(38,7),
	ALL_AGES NUMBER(38,7),
	AGE_STANDARDIZED NUMBER(38,7)
);

-- Prevalence Grouped By Age - Schizophrenia
-- schizophrenia-prevalence-by-age.csv
CREATE OR REPLACE TABLE MENTAL_HEALTH_HUB.DATASETS.BY_DISORDER_PREVALENCE_BY_AGE_SCHIZOPHRENIA (
	ENTITY VARCHAR(16777216),
	CODE VARCHAR(16777216),
	YEAR NUMBER(38,0),
	AGE_5_TO_14 NUMBER(38,10),
	AGE_15_TO_19 NUMBER(38,9),
	AGE_20_TO_24 NUMBER(38,8),
	AGE_25_TO_29 NUMBER(38,8),
	AGE_30_TO_34 NUMBER(38,8),
	AGE_35_TO_39 NUMBER(38,8),
	AGE_40_TO_44 NUMBER(38,8),
	AGE_45_TO_49 NUMBER(38,8),
	AGE_50_TO_54 NUMBER(38,8),
	AGE_55_TO_59 NUMBER(38,8),
	AGE_60_TO_64 NUMBER(38,8),
	AGE_65_TO_69 NUMBER(38,8),
	AGE_FROM_70 NUMBER(38,9),
	ALL_AGES NUMBER(38,8),
	AGE_STANDARDIZED NUMBER(38,8)
);

----------------------------------------------------------------------------------------------------
-- MENTAL HEALTH INDICATORS and others -------------------------------------------------------------
----------------------------------------------------------------------------------------------------

-- Death Rates
-- death-rates-from-mental-and-substance-disorders-by-age-who.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.INDICATOR_DEATH_RATE (
	ENTITY VARCHAR(16777216),
	CODE VARCHAR(16777216),
	YEAR NUMBER(38,0),
	DEATH_RATE_AGE_0_TO_4 NUMBER(38,11),
	DEATH_RATE_AGE_5_TO_14 NUMBER(38,12),
	DEATH_RATE_AGE_15_TO_49 NUMBER(38,8),
	DEATH_RATE_AGE_50_TO_69 NUMBER(38,9),
	DEATH_RATE_AGE_FROM_70 NUMBER(38,8),
	DEATH_RATE_ALL_AGES NUMBER(38,7)
);

-- Mental Health Policy
-- stand-alone-policy-or-plan-for-mental-health.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.INDICATOR_MH_POLICY (
	ENTITY VARCHAR(16777216),
	CODE VARCHAR(16777216),
	YEAR NUMBER(38,0),
	POLICY BOOLEAN
);

-- Mental Health Units
-- mental-health-units-in-general-hospitals.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.INDICATOR_MH_UNITS_HOSPITAL (
	ENTITY VARCHAR(16777216),
	CODE VARCHAR(16777216),
	YEAR NUMBER(38,0),
	MENTAL_HEALTH_UNITS NUMBER(38,5)
);

-- Psychiatrists working in Mental Health
-- psychiatrists-working-in-the-mental-health-sector.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.INDICATOR_PSYCHIATRY_HOSPITAL (
	ENTITY VARCHAR(16777216),
	CODE VARCHAR(16777216),
	YEAR NUMBER(38,0),
	PSYCHIATRY NUMBER(38,5)
);

----------------------------------------------------------------------------------------------------
-- CONTINENTS MAPPED TO COUNTRIES ------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

-- Country mapped to continent
-- countries_continents.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.CONTINENTS_MAPPED_COUNTRIES (
	ID VARCHAR(16777216),
	COUNTRY VARCHAR(16777216),
	CONTINENT VARCHAR(16777216)
);

----------------------------------------------------------------------------------------------------
-- GAPMINDER ADDITIONAL DATA -----------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

-- GDP per Capita
-- gdp_pcap.csv
-- t_gdp.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.GM_GDP (
	COUNTRY VARCHAR(16777216),
	YEAR NUMBER(38,0),
	VALUE NUMBER(38,0)
);

-- Income
-- mincpcap_cppp.csv
-- t_income.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.GM_INCOME (
	COUNTRY VARCHAR(16777216),
	YEAR NUMBER(38,0),
	VALUE NUMBER(38,3)
);

-- Internet Usage
-- internet_users.csv
-- t_internet2.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.GM_INTERNET (
	COUNTRY VARCHAR(16777216),
	YEAR NUMBER(38,0),
	VALUE VARCHAR(16777216)
);

-- Life Expectancy
-- lex.csv
-- t_life_exp.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.GM_LIFE_EXP (
	COUNTRY VARCHAR(16777216),
	YEAR NUMBER(38,0),
	VALUE NUMBER(38,1)
);

-- Median Age
-- median_age_years.csv
-- t_med_age.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.GM_MED_AGE (
	COUNTRY VARCHAR(16777216),
	YEAR NUMBER(38,0),
	VALUE NUMBER(38,1)
);

-- Suicide Count
-- suicide_total_deaths.csv
-- t_suicide_count.csv
create or replace TABLE MENTAL_HEALTH_HUB.DATASETS.GM_SUICIDE_COUNT (
	COUNTRY VARCHAR(16777216),
	YEAR NUMBER(38,0),
	VALUE VARCHAR(16777216)
);