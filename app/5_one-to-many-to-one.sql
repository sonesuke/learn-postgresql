drop table if exists table_a;
create table table_a (
    a_id integer,
    a_value text
);

insert into table_a (a_id, a_value) values
    ( 1, 'A'),
    ( 2, 'B'),
    ( 3, 'C'),
    ( 4, 'D');

drop table if exists table_b;
create table table_b (
    b_id integer,
    b_value text
);

insert into table_b (b_id, b_value) values
    ( 1, 'A'),
    ( 1, 'B'),
    ( 2, 'C'),
    ( 2, 'D'),
    ( 3, 'E'),
    ( 3, 'F'),
    ( 4, 'G');

drop table if exists table_c;
create table table_c (
    c_id integer,
    c_value text
);

insert into table_c (c_id, c_value) values
    ( 1, 'A'),
    ( 2, 'B'),
    ( 3, 'C'),
    ( 4, 'D');


select
    *
from
    table_a
    full outer join table_b on table_a.a_id = table_b.b_id
    full outer join table_c on table_c.c_id = table_b.b_id
;

select
    *
from
    table_c
    full outer join table_b on table_c.c_id = table_b.b_id
    full outer join table_a on table_a.a_id = table_b.b_id
;


-- EOF
-- DROP TABLE
-- CREATE TABLE
-- INSERT 0 4
-- DROP TABLE
-- CREATE TABLE
-- INSERT 0 7
-- DROP TABLE
-- CREATE TABLE
-- INSERT 0 4
--  a_id | a_value | b_id | b_value | c_id | c_value 
-- ------+---------+------+---------+------+---------
--     1 | A       |    1 | A       |    1 | A
--     1 | A       |    1 | B       |    1 | A
--     2 | B       |    2 | C       |    2 | B
--     2 | B       |    2 | D       |    2 | B
--     3 | C       |    3 | E       |    3 | C
--     3 | C       |    3 | F       |    3 | C
--     4 | D       |    4 | G       |    4 | D
-- (7 rows)
-- 
--  c_id | c_value | b_id | b_value | a_id | a_value 
-- ------+---------+------+---------+------+---------
--     1 | A       |    1 | A       |    1 | A
--     1 | A       |    1 | B       |    1 | A
--     2 | B       |    2 | C       |    2 | B
--     2 | B       |    2 | D       |    2 | B
--     3 | C       |    3 | E       |    3 | C
--     3 | C       |    3 | F       |    3 | C
--     4 | D       |    4 | G       |    4 | D
-- (7 rows)
-- 
