/*
1. In Postgres/BigQuery, create a database/schema that can house your data
*/
CREATE DATABASE Movie_Stream;


/*
2. Write CREATE statements for each of your ERD tables. Save all the statements in one .sql file. 
Make sure to separate different statements with a ; . 
Also, make sure your code specifies PK and FK constraints.
3. Execute your CREATE statements on the platform of your choice (Postgres or BigQuery). 
If you choose BigQuery, you need to comment out the PK/FK constraint specifications.
*/
CREATE TABLE Actors(
	actor_id VARCHAR(200) PRIMARY KEY,
	fname VARCHAR(250),
	lname VARCHAR(500),
	fullname VARCHAR(500),
	birth_year int,
	death_year int
);

/*
4. Import all your found datasets into your database; one table per dataset.
*/
/*4.1 Create a schema for your datasets*/
CREATE SCHEMA datasets;

/*4.2 Create a table in the datasets schema per dataset found*/
CREATE TABLE datasets.name_basics(
	nconst VARCHAR(250), --(string)alphanumeric unique identifier of the name/person
	primaryName VARCHAR(250), --(string) name by which the person is most often credited
	birthYear INT, -- in YYYY format
	deathYear INT, -- in YYYY format if applicable, else '\N'
	primaryProfession VARCHAR(500), --(array of strings) the top-3 professions of the person
	knownForTitles VARCHAR(500)--(array of tconsts)  titles the person is known for
);
/*4.3 import your data using the import wizard using the guide posted on Canvas*/
/*
5. Perform data wrangling by writing SELECT statements to 
create a result set suitable for each of your database tables.
*/
SELECT nconst,
	substring(primaryName
				  ,1
				  ,CASE WHEN position(' ' IN primaryName)=0 
			  			THEN length(primaryName) 
			  			ELSE position(' ' IN primaryName)-1 
			  		END
				 ) as fname,
	substring(primaryName,position(' ' IN primaryName)+1,length(primaryName)) as lname,
	primaryName,
	birthYear,
	deathYear
FROM datasets.name_basics
LIMIT 10;

/*
6. To fill in your designed and created tables, write INSERT statements that 
take in the above SELECT statements.
*/
INSERT INTO Actors(
	SELECT nconst,
		substring(primaryName
				  ,1
				  ,CASE WHEN position(' ' IN primaryName)=0 THEN length(primaryName) ELSE position(' ' IN primaryName)-1 END
				 ) as fname,
		substring(primaryName,position(' ' IN primaryName)+1,length(primaryName)) as lname,
		primaryName,	
		birthYear,
		deathYear
	FROM datasets.name_basics
);

/*
7. Finally query each filled table by writing a SELECT * FROM Table_Name LIMIT 10 . Take screenshots of your query and returned results. Use this templateLinks to an external site. to save your screenshots into a file. Download a .pdf version of the completed file. Please make sure to include a snapshot of your ERD diagram. Feel free to enhance and update your previously submitted ERD diagram.
*/
SELECT * FROM Actors LIMIT 10;