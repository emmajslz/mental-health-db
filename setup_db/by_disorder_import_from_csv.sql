-- example of snowflake automatic code

CREATE TABLE "MENTAL_HEALTH_HUB"."DATASETS"."BY_DISORDER_PREVALENCE_BY_AGE_DEPRESSION" ( Entity VARCHAR , Code VARCHAR , Year NUMBER(38, 0) , age_5_to_14 NUMBER(38, 8) , age_15_to_19 NUMBER(38, 7) , age_20_to_24 NUMBER(38, 7) , age_25_to_29 NUMBER(38, 7) , age_30_to_34 NUMBER(38, 7) , age_35_to_39 NUMBER(38, 7) , age_40_to_44 NUMBER(38, 7) , age_45_to_49 NUMBER(38, 7) , age_50_to_54 NUMBER(38, 7) , age_55_to_59 NUMBER(38, 7) , age_60_to_64 NUMBER(38, 7) , age_65_to_69 NUMBER(38, 7) , age_from_70 NUMBER(38, 7) , all_ages NUMBER(38, 7) , age_standardized NUMBER(38, 7) ); 

CREATE TEMP FILE FORMAT "MENTAL_HEALTH_HUB"."DATASETS"."temp_file_format_2024-09-17T21:40:46.263Z"
	TYPE=CSV
    SKIP_HEADER=1
    FIELD_DELIMITER=','
    TRIM_SPACE=TRUE
    FIELD_OPTIONALLY_ENCLOSED_BY='"'
    REPLACE_INVALID_CHARACTERS=TRUE
    DATE_FORMAT=AUTO
    TIME_FORMAT=AUTO
    TIMESTAMP_FORMAT=AUTO; 

COPY INTO "MENTAL_HEALTH_HUB"."DATASETS"."BY_DISORDER_PREVALENCE_BY_AGE_DEPRESSION" 
FROM (SELECT $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18
	FROM '@"MENTAL_HEALTH_HUB"."DATASETS"."__snowflake_temp_import_files__"') 
FILES = ('2024-09-17T21:40:26.003Z/depressive-disorders-prevalence-by-age.csv') 
FILE_FORMAT = '"MENTAL_HEALTH_HUB"."DATASETS"."temp_file_format_2024-09-17T21:40:46.263Z"' 
ON_ERROR=CONTINUE 
