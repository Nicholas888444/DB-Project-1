CREATE DATABASE Bookstore;
USE Bookstore;
drop table authors;
drop table categories;
drop table books;
CREATE TABLE authors(
	author_id int,
    author_name varchar(100),
    birth_year year,
    primary key(author_id)
);

CREATE TABLE categories(
	category_id int,
    category_name varchar(50),
    primary key(category_id)
);

CREATE TABLE books(
	book_id int,
    title varchar(200),
    author_id int,
    category_id int,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    price decimal(10,2),
    publication_year year,
    primary key(book_id)
);

INSERT INTO authors VALUES (1, 'Stephen King', 2011);
INSERT INTO authors VALUES (2, 'Temporary Author', 1998);
INSERT INTO authors VALUES (3, 'Author Name', 1992);

INSERT INTO categories VALUES (1, 'Horror');
INSERT INTO categories VALUES (2, 'Science Fiction');
INSERT INTO categories VALUES (3, 'Fiction');

INSERT INTO books VALUES (1, 'The Tales of Computer Science', 1, 1, 19.90, 2024);
INSERT INTO books VALUES (2, 'It', 2, 2, 1000.20, 2000);
INSERT INTO books VALUES (3, 'Fake Book Near Me', 3, 3, 78.90, 1980);
INSERT INTO books VALUES (4, 'Google Chrome is For Nerds', 1, 3, 89.00, 2019);
INSERT INTO books VALUES (5, 'TikTok is Garbage', 2, 1, 1.00, 2018);

describe books;
select * from books;

UPDATE books SET price=99.99 WHERE book_id = 1;

INSERT INTO books VALUES (6, 'TikTok is Garbage', 5, 1, 1.00, 2018);
INSERT INTO books VALUES (6, 'TikTok is Garbage', 1, 5, 1.00, 2018);

UPDATE books SET author_id=6 WHERE author_id=1;

DELETE FROM authors WHERE author_id=1;

drop table books;
CREATE TABLE books(
	book_id int,
    title varchar(200),
    author_id int,
    category_id int,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id) on delete cascade,
    price decimal(10,2),
    publication_year year,
    primary key(book_id)
);

INSERT INTO books VALUES (1, 'The Tales of Computer Science', 1, 1, 19.90, 2024);
INSERT INTO books VALUES (2, 'It', 2, 2, 1000.20, 2000);
INSERT INTO books VALUES (3, 'Fake Book Near Me', 3, 3, 78.90, 1980);
INSERT INTO books VALUES (4, 'Google Chrome is For Nerds', 1, 3, 89.00, 2019);
INSERT INTO books VALUES (5, 'TikTok is Garbage', 2, 1, 1.00, 2018);

DELETE FROM categories WHERE category_id=1;
select * from books;