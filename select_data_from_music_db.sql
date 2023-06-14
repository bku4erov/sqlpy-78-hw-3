--------------------------------------------------------------
--Задание 2
--------------------------------------------------------------

--Название и продолжительность самого длительного трека
SELECT
	track_name,
	duration
FROM
	track
WHERE
	duration = (
		SELECT
			max(duration)
		FROM
			track
	);

--Название треков, продолжительность которых не менее 3,5 минут
SELECT
	track_name
FROM
	track
WHERE
	-- 3,5 мин * 60 сек = 210 сек
	duration >= 210;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT
	collection_name
FROM
	collection
WHERE
	release_year BETWEEN 2018 AND 2020;

--Исполнители, чьё имя состоит из одного слова
SELECT
	artist_name
FROM
	artist
WHERE
	array_length(
		string_to_array(
			regexp_replace(artist_name, '\W+', ' ', 'g'),
			' '
		),
		1
	) = 1;

--Название треков, которые содержат слово «мой» или «my»
SELECT
	track_name
FROM
	track
WHERE 
	'my' = ANY(
		string_to_array(
			regexp_replace(lower(track_name), '\W+', ' ', 'g'),
			' '
		)
	)
	OR 'мой' = ANY(
		string_to_array(
			regexp_replace(lower(track_name), '\W+', ' ', 'g'),
			' '
		)
	);

	
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
	g.genre_name;

--Количество треков, вошедших в альбомы 2019–2020 годов
SELECT
	count(*)
FROM
	track t
INNER JOIN album a ON
	t.album_id = a.album_id
WHERE
	a.release_year BETWEEN 2019 AND 2020;

--Средняя продолжительность треков по каждому альбому
SELECT
	a.album_name,
	avg(t.duration) track_avg_duration
FROM
	track t
INNER JOIN album a ON
	t.album_id = a.album_id
GROUP BY
	a.album_name ;

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
	);

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
	artist_name = 'Пикник';

	
--------------------------------------------------------------
--Задание 4
--------------------------------------------------------------
	
--Названия альбомов, в которых присутствуют исполнители более чем одного жанра
WITH artist_of_multiple_genre AS (
	SELECT
		ag.artist_id
	FROM
		artist_genre ag
	GROUP BY
		ag.artist_id
	HAVING
		count(ag.genre_id) > 1
)
SELECT
	DISTINCT a.album_name
FROM
	album a
INNER JOIN album_artist aa ON
	a.album_id = aa.album_id
WHERE
	aa.artist_id IN (
		SELECT
			*
		FROM
			artist_of_multiple_genre
	);

--Наименования треков, которые не входят в сборники
SELECT
	t.track_name
FROM
	track t
WHERE
	t.track_id NOT IN (
		SELECT
			track_id
		FROM
			collection_track ct
	);

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько
SELECT
	a.artist_name
FROM
	artist a
INNER JOIN album_artist aa ON
	a.artist_id = aa.artist_id
INNER JOIN album a2 ON
	aa.album_id = a2.album_id
INNER JOIN track t ON
	a2.album_id = t.album_id
WHERE
	t.duration = (
		SELECT
			min(t.duration)
		FROM
			track t
	);

--Названия альбомов, содержащих наименьшее количество треков
WITH album_track_cnt AS (
	SELECT
		t.album_id ,
		count(t.track_id) track_cnt
	FROM
		track t
	GROUP BY
		t.album_id
)
SELECT
	a.album_name
FROM
	album a
INNER JOIN album_track_cnt atc ON
	a.album_id = atc.album_id
WHERE
	atc.track_cnt = (
		SELECT
			min(track_cnt)
		FROM
			album_track_cnt
	);