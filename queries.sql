-- 1.Query all of the entries in the Genre table
SELECT * FROM genre;

-- 2.Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist (ArtistId, ArtistName, YearEstablished)
VALUES (29, "Thrice",  1998);

-- 3.Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album (AlbumId, Title, ReleaseDate, AlbumLength, Label, ArtistId,GenreId)
VALUES (24, "The Artist in the Ambulance", "07/22/2003", 3943, "Island Records", 29,  2)

-- 4.Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES (24, "Stare at the Sun", 323, "07/22/2003", 2, 29,  24)

INSERT INTO Song (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES (25, "All That's Left", 320, "07/22/2003", 2, 29,  24)

-- 5.Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added. Here is some more info on joins that might help.
--
-- Reminder: Direction of join matters. Try the following statements and see the difference in results.
-- SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
-- SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;
SELECT * FROM Album
LEFT JOIN Song
ON Album.AlbumId = Song.AlbumId
WHERE Song.SongId = 24 AND Album.Title = "The Artist in the Ambulance"

-- 6.Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT AlbumId AS "Album ID", COUNT(*) AS "Number of Songs"
FROM Song
GROUP BY AlbumId
ORDER BY "Number of Songs" DESC

-- 7.Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT ArtistId AS "Artist ID", COUNT(*) AS "Number of Songs"
FROM Song
GROUP BY ArtistId
ORDER BY "Number of Songs" DESC

-- 8.Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT GenreId AS "Genre", COUNT(*) AS "Number of Songs"
FROM Song
GROUP BY GenreId
ORDER BY "Number of Songs" DESC

-- 9.Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT Title, MAX (AlbumLength) AS "Album Length"
FROM Album
GROUP BY Title
ORDER BY "Album Length" DESC

-- 10.Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT Title, MAX (SongLength) AS "Song Length"
FROM Song
GROUP BY Title
ORDER BY "Song Length" DESC

-- 11.Modify the previous query to also display the title of the album.
SELECT Album.Title AS "Album", Song.Title AS "Song", MAX (SongLength) AS "Song Length"
FROM Song, Album
WHERE Song.AlbumId = Album.AlbumId
GROUP BY Song.Title
ORDER BY "Song Length" DESC
