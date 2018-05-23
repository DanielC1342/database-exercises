USE codeup_test_db;

-- Albums after 1991
DELETE FROM albums WHERE release_date > 1991;

-- Albums with genre 'Disco'
DELETE FROM albums WHERE genre LIKE 'Disco';

-- Albums by Whitney Houston
DELETE FROM albums WHERE artist LIKE 'Metallica';