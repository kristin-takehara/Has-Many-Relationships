-- ### SQL 1-n Relationships and Joins Exercise in PostgreSQL
-- ## Setup schema and relationships
\c KRISTINTAKEHARA;
DROP DATABASE has_many_blogs;
DROP USER has_many_user;

-- -- -- 1. Create a new postgres user named `has_many_user`

CREATE USER has_many_user;

-- 1. Create a new database named `has_many_blogs` owned by `has_many_user`

CREATE DATABASE has_many_blogs
OWNER has_many_user;

 \c has_many_blogs;
-- 1. Before each create table statement, add a drop table if exists statement.
-- 1. In `has_many_blogs.sql` Create the tables (including any PKs, Indexes, and Constraints that you may need) to fulfill the requirements of the **has_many_blogs schema** below.

DROP TABLE IF EXISTS users, posts, comments;


CREATE TABLE users (
id            serial        not null    PRIMARY KEY,
username      varchar(90)   null        default null,
first_name    varchar(90)   null        default null,
last_name     varchar(90)   null        default null,
created_at    timestamptz   not null    DEFAULT now(),
updated_at    timestamptz   not null    DEFAULT now()
);

-- DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
id            serial        not null    PRIMARY KEY,
title         varchar(180)  null        default null,
url           varchar(510)  null        default null,
content       text          null        default null,
created_at    timestamptz   not null    DEFAULT now(),
updated_at    timestamptz   not null    DEFAULT now(),
user_id       serial        references  users(id)
);

-- DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
id            serial        not null    PRIMARY KEY,
body          varchar(510)  null        DEFAULT null,
created_at    timestamptz   not null    DEFAULT now(),
updated_at    timestamptz   not null    DEFAULT now(),
post_id       serial        references  posts(id),
user_id       serial        references  users(id)
);

-- -- -- 1. Create the necessary FKs needed to relate the tables according to the **relationship table** below.
-- -- -- 1. Run the provided `scripts/blog_data.sql`
\i scripts/blog_data.sql;