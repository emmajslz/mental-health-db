-- populating the metric table

CREATE SEQUENCE MENTAL_HEALTH_HUB.PUBLIC.metric_seq
    START WITH 1
    INCREMENT BY 1;

INSERT INTO MENTAL_HEALTH_HUB.PUBLIC.Metric (id, country_metric, type_of_value, source)
    VALUES 
        (MENTAL_HEALTH_HUB.PUBLIC.metric_seq.NEXTVAL, 'GDP', 'Value', 'Source1'),
        (MENTAL_HEALTH_HUB.PUBLIC.metric_seq.NEXTVAL, 'Income', 'Value', 'Source2'),
        (MENTAL_HEALTH_HUB.PUBLIC.metric_seq.NEXTVAL, 'Internet Usage', 'Value', 'Source3'),
        (MENTAL_HEALTH_HUB.PUBLIC.metric_seq.NEXTVAL, 'Life Expectancy', 'Value', 'Source4'),
        (MENTAL_HEALTH_HUB.PUBLIC.Metric_seq.NEXTVAL, 'Median Age', 'Value', 'Source5'),
        (MENTAL_HEALTH_HUB.PUBLIC.Metric_seq.NEXTVAL, 'Suicide Count', 'Count', 'Source6');
