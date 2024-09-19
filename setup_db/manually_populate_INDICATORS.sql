--Set up for the indicator table
CREATE SEQUENCE mental_health_hub.public.indicator_seq
    START WITH 1
    INCREMENT BY 1;


-- Insert data for Indicator entity
INSERT INTO mental_health_hub.public.Indicator (id, mental_health_indicator, type_of_value)
    VALUES 
        (mental_health_hub.public.indicator_seq.NEXTVAL, 'Death Rate', 'Rate per 100,000 People'),
        (mental_health_hub.public.indicator_seq.NEXTVAL, 'Mental Health Units in General Hospital', 'Units per 100,000 People'),
        (mental_health_hub.public.indicator_seq.NEXTVAL, 'Pyschiatrists in Mental Health', 'Psychiatrists per 100,000 People'),
        (mental_health_hub.public.indicator_seq.NEXTVAL, 'Policy Regarding Mental Health', 'Yes/No Values');
