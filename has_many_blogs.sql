-- ### SQL 1-n Relationships and Joins Exercise in PostgreSQL
-- ## Setup schema and relationships
\c KRISTINTAKEHARA;
DROP DATABASE has_many_blogs;
DROP USER has_many_user;

-- -- -- 1. Create a new postgres user named `has_many_user`

CREATE USER has_many_user;

-- 1. Create a new database named `has_many_blogs` owned by `has_many_user`

CREATE DATABASE has_many_blogs WITH OWNER has_many_user;

 \c has_many_blogs;
-- 1. Before each create table statement, add a drop table if exists statement.
-- 1. In `has_many_blogs.sql` Create the tables (including any PKs, Indexes, and Constraints that you may need) to fulfill the requirements of the **has_many_blogs schema** below.


CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username character varying(90),
  first_name character varying(90),
  last_name character varying(90),
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

-- DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title character varying(180),
  url character varying(510),
  content text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  user_id INTEGER references users (id)
);

-- DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  body character varying(510),
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  user_id INTEGER references users (id),
  post_id INTEGER references posts (id)
);

-- -- -- 1. Create the necessary FKs needed to relate the tables according to the **relationship table** below.
-- -- -- 1. Run the provided `scripts/blog_data.sql`
\i scripts/blog_data.sql;