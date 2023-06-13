--музыкальные жанры
INSERT INTO genre(genre_name)
VALUES ('рок');
INSERT INTO genre(genre_name)
VALUES ('хеви-метал');
INSERT INTO genre(genre_name)
VALUES ('рок-н-ролл');
INSERT INTO genre(genre_name)
VALUES ('бит');

--исполнители
INSERT INTO artist(artist_name)
VALUES ('Пикник');
INSERT INTO artist(artist_name)
VALUES ('Секрет');
INSERT INTO artist(artist_name)
VALUES ('Максим Леонидов');
INSERT INTO artist(artist_name)
VALUES ('Scorpions');

--жанры исполнителей
INSERT INTO artist_genre
VALUES (1, 1);
INSERT INTO artist_genre
VALUES (1, 3);
INSERT INTO artist_genre
VALUES (2, 1);
INSERT INTO artist_genre
VALUES (2, 3);
INSERT INTO artist_genre
VALUES (2, 4);
INSERT INTO artist_genre
VALUES (3, 1);
INSERT INTO artist_genre
VALUES (3, 3);
INSERT INTO artist_genre
VALUES (3, 4);
INSERT INTO artist_genre
VALUES (4, 2);

--альбомы
INSERT INTO album(album_name, release_year)
VALUES ('В руках великана', 2019);
INSERT INTO album(album_name, release_year)
VALUES ('Всё это и есть любовь', 2014);
INSERT INTO album(album_name, release_year)
VALUES ('Седьмое небо', 2021);
INSERT INTO album(album_name, release_year)
VALUES ('Humanity: Hour I', 2007);
INSERT INTO album(album_name, release_year)
VALUES ('Совместный альбом', 2020);

--исполнители, выпустившие альбомы
INSERT INTO album_artist(artist_id, album_id)
VALUES (1,1);
INSERT INTO album_artist
VALUES (2,2);
INSERT INTO album_artist
VALUES (3,3);
INSERT INTO album_artist
VALUES (4,4);
INSERT INTO album_artist
VALUES (1,5);
INSERT INTO album_artist
VALUES (3,5);

--треки
--треки альбома 'В руках великана'
INSERT INTO track(track_name, duration, album_id)
VALUES ('Счастливчик', 256, 1);
INSERT INTO track(track_name, duration, album_id)
VALUES ('В руках великана', 269, 1);
INSERT INTO track(track_name, duration, album_id)
VALUES ('Grand finale', 71, 1);
--треки альбома 'Всё это и есть любовь'
INSERT INTO track(track_name, duration, album_id)
VALUES ('Всё это и есть любовь', 217, 2);
INSERT INTO track(track_name, duration, album_id)
VALUES ('Серенада', 239, 2);
INSERT INTO track(track_name, duration, album_id)
VALUES ('Лети', 205, 2);
--треки альбома 'Седьмое небо'
INSERT INTO track(track_name, duration, album_id)
VALUES ('В твоём городе осень', 266, 3);
INSERT INTO track(track_name, duration, album_id)
VALUES ('Mon Amour', 174, 3);
--треки альбома 'Humanity: Hour I'
INSERT INTO track(track_name, duration, album_id)
VALUES ('The Game of Life', 244, 4);
INSERT INTO track(track_name, duration, album_id)
VALUES ('We Were Born to Fly', 239, 4);
INSERT INTO track(track_name, duration, album_id)
VALUES ('Humanity', 326, 4);
INSERT INTO track(track_name, duration, album_id)
VALUES ('When You Came into My Life', 284, 4);
--треки альбома 'Совместный альбом'
INSERT INTO track(track_name, duration, album_id)
VALUES ('Иероглиф (кавер)', 287, 5);
INSERT INTO track(track_name, duration, album_id)
VALUES ('Вниз по течению (кавер)', 315, 5);


--сборники
INSERT INTO collection(collection_name, release_year)
VALUES ('Легенды русского рока', 2020);
INSERT INTO collection(collection_name, release_year)
VALUES ('Rock Legends', 2019);
INSERT INTO collection(collection_name, release_year)
VALUES ('Сборник лучших песен', 2023);
INSERT INTO collection(collection_name, release_year)
VALUES ('The best of rock music', 2017);

--треки сборников
INSERT INTO collection_track(collection_id, track_id)
VALUES (1,2);
INSERT INTO collection_track
VALUES (1,4);
INSERT INTO collection_track
VALUES (1,7);
INSERT INTO collection_track
VALUES (2,9);
INSERT INTO collection_track
VALUES (2,11);
INSERT INTO collection_track
VALUES (3,2);
INSERT INTO collection_track
VALUES (3,4);
INSERT INTO collection_track
VALUES (3,8);
INSERT INTO collection_track
VALUES (3,12);
INSERT INTO collection_track
VALUES (4,11);
INSERT INTO collection_track
VALUES (4,12);
