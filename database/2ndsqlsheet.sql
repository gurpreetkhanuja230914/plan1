CREATE TABLE users (
    id serial PRIMARY KEY,
    profile JSONB
);
insert into users(profile) values ('{"name":"gp","age":"18","hobby":{"1":"dancing","2":"reading"}}');

insert into users(profile) values ('{"name":"gurpreet","age":"18","hobby":{"1":"singing","2":"reading"}}');
select profile from users;
SELECT profile ->> 'name' AS teacher_name
FROM users;
SELECT profile ->> 'age' AS teacher_age
FROM users;
select profile from users where profile ->> 'name'= 'gp';   
CREATE TABLE mailing_list (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    CHECK (
        first_name !~ '\s'
        AND last_name !~ '\s'
    )
);
CREATE DOMAIN contact_name AS
   VARCHAR NOT NULL CHECK (value !~ '\s');
CREATE TABLE mailing (
    id serial PRIMARY KEY,
    first_name contact_name,
    last_name contact_name,
    email VARCHAR NOT NULL
); 
insert into mailing_list ("first_name","last_name","email") values ('','','gurpreet@gmail.com');
select * from mailing_list;
insert into mailing ("first_name","last_name","email") values (null,null,'gurpreet@gmail.com');
INSERT INTO mailing (first_name, last_name, email)
VALUES('Jame','Doe','[[email protected]](../cdn-cgi/l/email-protection.html)');
CREATE TYPE film_summary AS (
    film_id INT,
    title VARCHAR,
    release_year SMALLINT
);
CREATE OR REPLACE FUNCTION get_film_summary (f_id INT)
    RETURNS film_summary AS
$$
SELECT
    film_id,
    title,
    release_year
FROM
    film
WHERE
    film_id = f_id ;
$$
LANGUAGE SQL;
create table film (film_id int ,title varchar(20), release_year smallint);
insert into film (film_id,title,release_year) values (12,'RRR',2022),(14,'KGF2',2021);
SELECT * FROM get_film_summary (12);
CREATE TYPE priority AS ENUM('low','medium','high');
CREATE TABLE requests(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    priority PRIORITY NOT NULL,
    request_date DATE NOT NULL
);
INSERT INTO requests(title, priority, request_date)
VALUES
   ('Create an enum tutorial in PostgreSQL', 'high', '2019-01-01'),
   ('Review the enum tutorial', 'medium', '2019-01-01'),
   ('Publish the PostgreSQL enum tutorial', 'low', '2019-01-01')
;
SELECT *
FROM requests
ORDER BY priority;


INSERT INTO requests(title, priority, request_date)
VALUES
   ('Revise the enum tutorial', 'urgent', '2019-01-02');

CREATE TABLE person(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    info XML
);
INSERT INTO person (info)
VALUES (
    XMLPARSE(DOCUMENT '<?xml version="1.0" encoding="UTF-8"?>
    <person>
        <name>John Doe</name>
        <age>35</age>
        <city>San Francisco</city>
    </person>')
);
SELECT (xpath('/person/age/text()', info))[1]::text::integer AS age
FROM person;
CREATE TABLE products(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    properties JSONB
);
INSERT INTO products(name, properties)
VALUES('Ink Fusion T-Shirt','{"color": "white", "size": ["S","M","L","XL"]}')
RETURNING *;
CREATE TABLE contacts(
   id SERIAL PRIMARY KEY,
   name VARCHAR(255) NOT NULL,
   phones JSONB
);
INSERT INTO contacts(name, phones)
VALUES
   ('John Doe','["408-111-2222", "408-111-2223","647674748"]'),
   ('Jane Doe','["212-111-2222", "212-111-2223","49489489"]');
SELECT
  name,
  phones ->> 2 "work phone"
FROM
  contacts;