--CREATE TABLE users(
--	id SERIAL PRIMARY KEY,
--	name VARCHAR(100) NOT NULL
--);
--
--CREATE TABLE books(
--	id SERIAL PRIMARY KEY,
--	name VARCHAR(80) NOT NULL,
--	author_id INTEGER NOT NULL REFERENCES users(id)
--);
--
--INSERT INTO users (name) VALUES ('Jamie');
--
--INSERT INTO books (name, author_id) VALUES ('Harry Potter', 1);
----
--DROP TABLE books;
----
--DROP TABLE users;

DROP DATABASE IF EXISTS todo_app;

DROP USER IF EXISTS michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app;

DROP TABLE IF EXISTS tasks;

CREATE TABLE tasks (
    id SERIAL PRIMARY KEY NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NULL,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP NULL,
    completed BOOLEAN NULL
);

ALTER TABLE tasks 
DROP COLUMN completed;

ALTER TABLE tasks 
ADD completed_at TIMESTAMP DEFAULT NULL;

ALTER TABLE tasks
ALTER COLUMN updated_at SET DEFAULT now();

INSERT INTO tasks (title, description) VALUES ('Study SQL', 'Complete this exercise');

INSERT INTO tasks (title, description) VALUES ('Study PostgreSQL', 'Read all the documentation');

SELECT title
FROM tasks
WHERE completed_at IS NULL;

UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL';

SELECT title, description
FROM tasks
WHERE completed_at IS NULL;

SELECT *
FROM tasks
ORDER BY created_at DESC;

INSERT INTO tasks (title, description) VALUES ('mistake 1', 'a test entry');

INSERT INTO tasks (title, description) VALUES ('mistake 2', 'another test entry');

INSERT INTO tasks (title, description) VALUES ('third mistake', 'another test entry');

SELECT title
FROM tasks
WHERE title LIKE '%mistake%';

DELETE FROM tasks
WHERE title = 'mistake 1';

SELECT title, description
FROM tasks
WHERE title LIKE '%mistake%';

DELETE FROM tasks
WHERE title LIKE '%mistake%';

SELECT *
FROM tasks
ORDER BY title ASC;