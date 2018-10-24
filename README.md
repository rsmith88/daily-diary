# daily-diary

To create the testing environment:

CREATE DATABASE diary_test;
\c 'diary test'
CREATE TABLE diary_entries(id SERIAL PRIMARY KEY, title VARCHAR(25), entry VARCHAR(150), comments VARCHAR(1000), tags VARCHAR (150));
INSERT INTO diary_entries (title, entry, comments) VALUES ('test', 'test entry', 'test comment');
