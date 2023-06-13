--SET search_path TO hw2, public;

--------------------------------------------------------------
--Задание 2
--------------------------------------------------------------

--Название и продолжительность самого длительного трека
SELECT track_name, duration 
FROM track
WHERE duration = (SELECT max(duration) FROM track);

--Название треков, продолжительность которых не менее 3,5 минут
SELECT track_name
FROM track
WHERE duration >= 210; -- 3,5 мин * 60 сек = 210 сек

--Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT collection_name 
FROM collection 
WHERE release_year BETWEEN 2018 AND 2020;

--Исполнители, чьё имя состоит из одного слова
SELECT artist_name
FROM artist
WHERE array_length(string_to_array(artist_name, ' '), 1) = 1;

--Название треков, которые содержат слово «мой» или «my»
SELECT track_name
FROM track
WHERE 
	'my' = ANY(string_to_array(lower(track_name), ' '))
	OR 'мой' = ANY(string_to_array(lower(track_name), ' '))

--------------------------------------------------------------
--Задание 3
--------------------------------------------------------------
--Количество исполнителей в каждом жанре
SELECT
	g.genre_name,
	count(ag.artist_id) artist_cnt
FROM
	genre g
INNER JOIN artist_genre ag ON
	g.genre_id = ag.genre_id
GROUP BY
	g.genre_name

--Количество треков, вошедших в альбомы 2019–2020 годов
SELECT
	count(*)
FROM
	track t
INNER JOIN album a ON
	t.album_id = a.album_id
WHERE
	a.release_year BETWEEN 2019 AND 2020

--Средняя продолжительность треков по каждому альбому
SELECT
	a.album_name,
	avg(t.duration) track_avg_duration
FROM
	track t
INNER JOIN album a ON
	t.album_id = a.album_id
GROUP BY
	a.album_name 

--Все исполнители, которые не выпустили альбомы в 2020 году
SELECT
	a.artist_name
FROM
	artist a
WHERE
	artist_id NOT IN (
		SELECT
			aa.artist_id
		FROM
			album a2
		INNER JOIN album_artist aa ON
			a2.album_id = aa.album_id
		WHERE
			a2.release_year = 2020
	)

--Названия сборников, в которых присутствует конкретный исполнитель
SELECT
	c.collection_name
FROM
	collection c
INNER JOIN collection_track ct ON
	c.collection_id = ct.collection_id
INNER JOIN track t ON
	ct.track_id = t.track_id
INNER JOIN album a ON
	t.album_id = a.album_id
INNER JOIN album_artist aa ON
	a.album_id = aa.album_id
INNER JOIN artist a2 ON
	aa.artist_id = a2.artist_id
WHERE
	artist_name = 'Пикник'