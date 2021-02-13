drop table if exists account cascade;
create table account (
    a_account_id integer,
    a_name text,
    a_class text,
    a_employees integer
);

insert into account (a_account_id, a_name, a_class, a_employees) values
    ( 1, 'ABC', 'A', 10),
    ( 2, 'DEF', 'B', 12),
    ( 3, 'GHI', 'A', 22),
    ( 4, 'JKL', 'B', 33);

drop table if exists event cascade;
create table event (
    e_event_id integer,
    e_date date,
    e_account_id integer
);

insert into event (e_event_id, e_date, e_account_id) values
    ( 1, '2021-01-01', 1),
    ( 2, '2021-01-15', 2),
    ( 3, '2021-01-21', 2),
    ( 4, '2021-02-01', 1),
    ( 5, '2021-02-15', 3),
    ( 6, '2021-02-17', 2),
    ( 7, '2021-02-19', 4),
    ( 8, '2021-03-01', 5),
    ( 9, '2021-03-02', 5);

drop table if exists calender cascade;
create table calender (
    c_date date,
    c_month integer
);

insert into calender (c_date, c_month) values
('2021-01-01', 1),
('2021-01-02', 1),
('2021-01-03', 1),
('2021-01-04', 1),
('2021-01-05', 1),
('2021-01-06', 1),
('2021-01-07', 1),
('2021-01-08', 1),
('2021-01-09', 1),
('2021-01-15', 1),
('2021-01-21', 1),
('2021-02-01', 2),
('2021-02-15', 2),
('2021-02-17', 2),
('2021-02-19', 2),
('2021-03-01', 3),
('2021-03-02', 3);

drop view if exists joined cascade;
create view joined as
(
select
    *
from
    account
    full outer join event on account.a_account_id = event.e_account_id
    full outer join calender on event.e_date = calender.c_date
);

select
    *
from
    joined
;

select
    c_month,
    a_class,
    sum(a_employees)
from
    (
    select
        distinct on (a_account_id, c_month, a_class)
        *
    from
        joined
    ) as target
group by
    c_month, a_class
order by
    c_month, a_class
;


select
    c_month,
    sum(a_employees)
from
    (
        select
            distinct on (a_account_id, c_month)
            *
        from
            joined
    ) as target
group by
    c_month
order by
    c_month
;

select
    a_class,
    sum(a_employees)
from
    (
        select
            distinct on (a_account_id, a_class)
            *
        from
            joined
    ) as target
group by
    a_class
order by
    a_class
;


-- EOF
-- DROP TABLE
-- CREATE TABLE
-- INSERT 0 4
-- DROP TABLE
-- CREATE TABLE
-- INSERT 0 9
-- DROP TABLE
-- CREATE TABLE
-- INSERT 0 17
-- DROP VIEW
-- CREATE VIEW
--  a_account_id | a_name | a_class | a_employees | e_event_id |   e_date   | e_account_id |   c_date   | c_month 
-- --------------+--------+---------+-------------+------------+------------+--------------+------------+---------
--             1 | ABC    | A       |          10 |          1 | 2021-01-01 |            1 | 2021-01-01 |       1
--               |        |         |             |            |            |              | 2021-01-02 |       1
--               |        |         |             |            |            |              | 2021-01-03 |       1
--               |        |         |             |            |            |              | 2021-01-04 |       1
--               |        |         |             |            |            |              | 2021-01-05 |       1
--               |        |         |             |            |            |              | 2021-01-06 |       1
--               |        |         |             |            |            |              | 2021-01-07 |       1
--               |        |         |             |            |            |              | 2021-01-08 |       1
--               |        |         |             |            |            |              | 2021-01-09 |       1
--             2 | DEF    | B       |          12 |          2 | 2021-01-15 |            2 | 2021-01-15 |       1
--             2 | DEF    | B       |          12 |          3 | 2021-01-21 |            2 | 2021-01-21 |       1
--             1 | ABC    | A       |          10 |          4 | 2021-02-01 |            1 | 2021-02-01 |       2
--             3 | GHI    | A       |          22 |          5 | 2021-02-15 |            3 | 2021-02-15 |       2
--             2 | DEF    | B       |          12 |          6 | 2021-02-17 |            2 | 2021-02-17 |       2
--             4 | JKL    | B       |          33 |          7 | 2021-02-19 |            4 | 2021-02-19 |       2
--               |        |         |             |          8 | 2021-03-01 |            5 | 2021-03-01 |       3
--               |        |         |             |          9 | 2021-03-02 |            5 | 2021-03-02 |       3
-- (17 rows)
-- 
--  c_month | a_class | sum 
-- ---------+---------+-----
--        1 | A       |  10
--        1 | B       |  12
--        1 |         |    
--        2 | A       |  32
--        2 | B       |  45
--        3 |         |    
-- (6 rows)
-- 
--  c_month | sum 
-- ---------+-----
--        1 |  22
--        2 |  77
--        3 |    
-- (3 rows)
-- 
--  a_class | sum 
-- ---------+-----
--  A       |  32
--  B       |  45
--          |    
-- (3 rows)
-- 
