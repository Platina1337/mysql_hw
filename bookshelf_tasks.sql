-- 1.
SELECT authors.name 
FROM authors 
JOIN authors_books ON authors_books.authors_id = authors.id
group by authors.name
order by count(authors_books.authors_id) DESC
limit 1;
-- 2. 
SELECT  books.title, books.year 
FROM books
where books.year IS NOT NULL
order by books.year ASC 
limit 5;
-- 3.
SELECT COUNT(books.title) as amount
FROM books 
JOIN shelves ON books.shelves_id = shelves.id
where shelves.title LIKE "Полка в кабинете"
group by books.shelves_id;
-- 4.
SELECT books.title, authors.name, books.year 
FROM books
JOIN shelves ON books.shelves_id = shelves.id
JOIN authors_books ON authors_books.books_id = books.id
JOIN authors ON authors_books.authors_id = authors.id
where shelves.title LIKE "Полка в спальне"
ORDER by books.title;

-- 5. 
SELECT distinct books.title, books.year 
FROM authors_books
JOIN authors ON authors_books.authors_id = authors.id
JOIN books ON authors_books.books_id = books.id
where authors.name LIKE "Лев Толстой";

-- 6.
SELECT books.title, authors.name 
FROM authors_books
JOIN authors ON authors_books.authors_id = authors.id
JOIN books ON authors_books.books_id = books.id
Where authors.name LIKE "А%";

-- 7.
SELECT books.title, authors.name, shelves.title 
FROM books
JOIN shelves ON books.shelves_id = shelves.id
JOIN authors_books ON authors_books.books_id = books.id
JOIN authors ON authors_books.authors_id = authors.id
where shelves.title LIKE "%Верхняя%" or "%Нижняя%"
ORDER by authors.name;

-- 8. 
UPDATE books
SET books.friends_id = 1
WHERE id = 9;

-- 9.
INSERT INTO books (title, year, shelves_id) 
values ("Краткие ответы на большие вопросы", "2020", "1");

INSERT INTO authors (name)
values ("Стивен Хокинг");

INSERT INTO authors_books (books_id, authors_id)
values ("176","145");
