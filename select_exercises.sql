USE codeup_test_db;

SELECT * FROM albums WHERE artist = 'Pink Floyd';

SELECT artist, name, release_date FROM albums WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';

SELECT artist, name, genre FROM albums WHERE name = 'Nevermind';

SELECT artist, name, release_date FROM albums WHERE release_date >= 1990;

SELECT artist, name, sales FROM albums WHERE sales > 20.0;

SELECT artist, name, genre FROM albums WHERE genre LIKE 'Rock';