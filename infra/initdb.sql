CREATE DATABASE IF NOT EXISTS author_db DEFAULT CHARACTER SET = utf8;

USE author_db;

create table authors
(
    id   int          not null,
    name varchar(200) not null,
    constraint authors_pk primary key (id)
);

insert into authors (id, name)
values (1, 'John Doe'),
       (2, 'Jane Dowy');

create table books
(
    id        int          not null,
    author_id int          not null,
    name      varchar(200) not null,
    constraint books_pk primary key (id)
);

insert into books (id, author_id, name)
values (1, 1, 'John Book 1'),
       (2, 1, 'John Book 2'),
       (3, 1, 'John Book 3'),
       (4, 2, 'Jane Book 1'),
       (5, 2, 'Jane Book 2');
