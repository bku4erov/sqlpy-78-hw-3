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