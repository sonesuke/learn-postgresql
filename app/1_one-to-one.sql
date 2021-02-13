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
    ( 2, 'B'),
    ( 3, 'C'),
    ( 4, 'D');

select
    *
from
    table_a
    full outer join table_b on table_a.a_id = table_b.b_id
;

select
    *
from
    table_b
    full outer join table_a on table_a.a_id = table_b.b_id
;


-- EOF
-- DROP TABLE
-- CREATE TABLE
-- INSERT 0 4
-- DROP TABLE
-- CREATE TABLE
-- INSERT 0 4
--  a_id | a_value | b_id | b_value 
-- ------+---------+------+---------
--     1 | A       |    1 | A
--     2 | B       |    2 | B
--     3 | C       |    3 | C
--     4 | D       |    4 | D
-- (4 rows)
-- 
--  b_id | b_value | a_id | a_value 
-- ------+---------+------+---------
--     1 | A       |    1 | A
--     2 | B       |    2 | B
--     3 | C       |    3 | C
--     4 | D       |    4 | D
-- (4 rows)
-- 
