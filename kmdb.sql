-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy.
-- - Movie data includes the movie title, year released, MPAA rating,
--   and studio.
-- - There are many studios, and each studio produces many movies, but
--   a movie belongs to a single studio.
-- - An actor can be in multiple movies.
-- - Everything you need to do in this assignment is marked with TODO!
-- - Note rubric explanation for appropriate use of external resources.

-- User stories
--
-- - As a guest, I want to see a list of movies with the title, year released,
--   MPAA rating, and studio information.
-- - As a guest, I want to see the movies which a single studio has produced.
-- - As a guest, I want to see each movie's cast including each actor's
--   name and the name of the character they portray.
-- - As a guest, I want to see the movies which a single actor has acted in.
-- * Note: The "guest" user role represents the experience prior to logging-in
--   to an app and typically does not have a corresponding database table.


-- Deliverables
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
-- - Insertion of "Batman" sample data into tables.
-- - Selection of data, so that something similar to the sample "report"
--   below can be achieved.

-- Rubric
--
-- 1. Domain model - 6 points
-- - Think about how the domain model needs to reflect the
--   "real world" entities and the relationships with each other. 
--   Hint #1: It's not just a single table that contains everything in the 
--   expected output. There are multiple real world entities and
--   relationships including at least one many-to-many relationship.
--   Hint #2: Do NOT name one of your models/tables “cast” or “casts”; this 
--   is a reserved word in sqlite and will break your database! Instead, 
--   think of a better word to describe this concept; i.e. the relationship 
--   between an actor and the movie in which they play a part.
-- 2. Execution of the domain model (CREATE TABLE) - 4 points
-- - Follow best practices for table and column names
-- - Use correct data column types (i.e. TEXT/INTEGER)
-- - Use of the `model_id` naming convention for foreign key columns
-- 3. Insertion of data (INSERT statements) - 4 points
-- - Insert data into all the tables you've created
-- - It actually works, i.e. proper INSERT syntax
-- 4. "The report" (SELECT statements) - 6 points
-- - Write 2 `SELECT` statements to produce something similar to the
--   sample output below - 1 for movies and 1 for cast. You will need
--   to read data from multiple tables in each `SELECT` statement.
--   Formatting does not matter.
-- 5. Using external resources for help with the assignment (including colleagues, AI, internet search, etc):
-- - Engineers look to colleagues and the internet all the time when building software.
--   You are welcome to do the same. However, the solution you submit must utilize
--   the skills and strategies covered in class. Alternate solutions which do not demonstrate
--   an understanding of the approaches used in class will receive significant deductions.
--   Any concern should be raised with faculty prior to assignment due date.

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Warner Bros.
-- The Dark Knight        2008           PG-13  Warner Bros.
-- The Dark Knight Rises  2012           PG-13  Warner Bros.

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO!

-- Create new tables, according to your domain model
-- TODO!

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!

-- The SQL statement for the movies output
-- TODO!

-- The SQL statement for the cast output
-- TODO!


DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS actors;

CREATE TABLE movies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    year_released INTEGER,
    mpaa_rating TEXT,
    studio_info TEXT
);

CREATE TABLE actors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    movies_id INTEGER,
    character_played TEXT
);

INSERT INTO movies(
    title,
    year_released,
    mpaa_rating,
    studio_info
)
VALUES(
    "Batman Begins",
    2005,
    "PG-13",
    "Warner Bros."
);

INSERT INTO movies(
    title,
    year_released,
    mpaa_rating,
    studio_info
)

VALUES(
    "The Dark Knight",
    2008,
    "PG-13",
    "Warner Bros."
);

INSERT INTO movies(
    title,
    year_released,
    mpaa_rating,
    studio_info
)

    VALUES(
    "The Dark Knight Rises",
    2012,
    "PG-13",
    "Warner Bros."
    );

INSERT INTO actors(
    name,
    movies_id,
    character_played
)   

VALUES
    ("Christian Bale", 1, "Bruce Wayne"),
    ("Michael Caine", 1, "Alfred"),
    ("Liam Neeson", 1, "Ra's Al Ghul"),
    ("Katie Holmes", 1,"Rachel Dawes"),
    ("Gary Oldman", 1, "Commissioner Gordon"),
    ("Christian Bale", 2, "Bruce Wayne"),
    ("Heath Ledger", 2, "Joker"),
    ("Aaron Eckhart", 2, "Harvey Dent"),
    ("Michael Caine", 2, "Alfred"),
    ("Maggie Gyllenhaal", 2, "Rachel Dawes"),
    ("Christian Bale", 3, "Bruce Wayne"),
    ("Gary Oldman", 3, "Commissioner Gordon"),
    ("Tom Hardy", 3, "Bane"),
    ("Joseph Gordon-Levitt", 3, "John Blake"),
    ("Anne Hathaway", 3, "Selina Kyle")
    ;

-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

SELECT title, year_released, mpaa_rating, studio_info
FROM movies
ORDER BY year_released ASC;


-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""


SELECT movies.title, actors.name, actors.character_played
FROM movies
INNER JOIN actors ON actors.movies_id = movies.id;

