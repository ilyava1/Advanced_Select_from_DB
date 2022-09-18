-- 1. количество исполнителей в каждом жанре
SELECT title, COUNT(musician_id) quantity FROM musicalgenres g
JOIN musiciansandgenres mg ON g.genre_id = mg.genre_id 
GROUP BY g.title 
ORDER BY quantity DESC;

-- 2. количество треков, вошедших в альбомы 2019-2020 годов
SELECT COUNT(*) from tracks
WHERE album_id IN (SELECT album_id from albums a WHERE year = 2019 OR year = 2020);
-- или
SELECT COUNT(*) from tracks t
INNER JOIN albums a ON t.album_id = a.album_id
WHERE a.year = 2019 OR a.year = 2020; 

-- 3. средняя продолжительность треков по каждому альбому
SELECT a.title, DATE_TRUNC('second', AVG(duration)) average_duration FROM albums a
JOIN tracks t ON t.album_id = a.album_id
GROUP BY a.title
ORDER BY average_duration DESC;

-- 4. все исполнители, которые не выпустили альбомы в 2020 году
SELECT nickname FROM musicians m
WHERE musician_id NOT IN (
	SELECT musician_id FROM musiciansandalbums ma
	JOIN albums a ON a.album_id = ma.album_id AND a.year = 2020
);

-- 5. названия сборников, в которых присутствует конкретный исполнитель (в примере ниже - АВВА)
SELECT DISTINCT col.title FROM collection col
JOIN collectionandtracks ct ON col.collection_id  = ct.collection_id 
JOIN tracks t ON ct.track_id = t.track_id 
JOIN albums a ON t.album_id = a.album_id 
JOIN musiciansandalbums ma ON a.album_id = ma.album_id 
JOIN musicians m ON ma.musician_id = m.musician_id 
WHERE m.nickname = 'ABBA';

-- 6. название альбомов, в которых присутствуют исполнители более 1 жанра
SELECT a.title FROM albums a
JOIN musiciansandalbums ma ON a.album_id = ma.album_id 
JOIN musicians m ON ma.musician_id = m.musician_id 
JOIN (SELECT mg.musician_id, COUNT(mg.genre_id) genres_qu FROM musiciansandgenres mg
GROUP BY musician_id) result ON m.musician_id = result.musician_id and genres_qu > 1;
--или
SELECT a.title FROM albums a
JOIN musiciansandalbums ma ON a.album_id = ma.album_id 
JOIN musicians m ON ma.musician_id = m.musician_id 
JOIN musiciansandgenres mg ON m.musician_id = mg.musician_id
GROUP BY a.title
HAVING COUNT(DISTINCT mg.genre_id)>1;

-- 7. наименование треков, которые не входят в сборники
SELECT t.title FROM tracks t 
WHERE t.track_id NOT IN (SELECT ct.track_id FROM collectionandtracks ct);

-- 8. наименование исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)
SELECT DISTINCT m.nickname FROM musicians m 
JOIN musiciansandalbums ma ON m.musician_id = ma.musician_id 
JOIN albums a ON ma.album_id = a.album_id 
JOIN tracks t ON a.album_id = t.album_id 
WHERE t.track_id IN (
	SELECT t.track_id FROM tracks t
	WHERE t.duration = (SELECT MIN(t.duration) FROM tracks t)
	);

-- 9. название альбомов, содержащих наименьшее количество треков
SELECT a.title FROM albums a 
WHERE album_id IN (
	SELECT tq.album_id FROM (
		SELECT a.album_id, COUNT(t.track_id) track_qua FROM albums a
		JOIN tracks t ON a.album_id = t.album_id
		GROUP BY a.album_id) tq
	WHERE tq.track_qua = (
	SELECT MIN(track_qua) tracks_on_album FROM (
		SELECT a.album_id, COUNT(t.track_id) track_qua FROM albums a 
		JOIN tracks t ON a.album_id = t.album_id
		GROUP BY a.album_id) track_quantity
	)
);
--или
SELECT a.title, COUNT(t.title) cnt FROM albums a
JOIN tracks t ON a.album_id = t.album_id 
GROUP BY a.title 
HAVING COUNT(t.title) = (
	SELECT COUNT(t.title) cnt FROM albums a
	JOIN tracks t ON a.album_id = t.album_id 
	GROUP BY a.title
	ORDER BY cnt ASC
	LIMIT 1
);