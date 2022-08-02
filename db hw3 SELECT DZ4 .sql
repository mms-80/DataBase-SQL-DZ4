SELECT title, count(executor_id) FROM genres g
JOIN executors_genres eg ON g.id = eg.genre_id
GROUP BY title
ORDER BY count(executor_id) DESC
;

SELECT year_of_release  , count(album_id) FROM albums a
JOIN tracks t  ON a.id = t.album_id
WHERE year_of_release BETWEEN 2000 and 2022
GROUP BY year_of_release 
;

SELECT year_of_release , avg(duration) FROM albums a
JOIN tracks t ON a.id = t.album_id  
GROUP BY year_of_release
;

SELECT nickname, year_of_release FROM executors e 
JOIN executors_albums ea ON ea.id = e.id 
JOIN albums a ON ea.album_id = a.id 
WHERE year_of_release != 2020
;

SELECT c.title FROM collection c 
JOIN collections_tracks ct ON c.id = ct.collection_id 
JOIN tracks t ON ct.collection_id = t.album_id 
JOIN albums a ON t.album_id = a.id 
JOIN executors_albums ea ON a.id = ea.executor_id 
JOIN executors e ON ea.executor_id  = e.id  
WHERE e.nickname = 'Руки вверх'
;

SELECT a.title FROM albums a 
JOIN executors_albums ea ON a.id = ea.executor_id  
JOIN executors e ON ea.executor_id  = e.id 
JOIN executors_genres eg ON e.id = eg.executor_id 
GROUP BY a.title
HAVING count(eg.executor_id) > 1
;

SELECT t.title FROM tracks t 
FULL JOIN collections_tracks ct ON t.id = ct.tracks_id 
WHERE ct.tracks_id IS NULL
;

SELECT e.nickname, t.duration FROM executors e 
JOIN executors_albums ea ON e.id = ea.executor_id 
JOIN albums a ON ea.executor_id = a.id 
JOIN tracks t ON a.id = t.id
WHERE t.duration = (
	SELECT MIN(duration) FROM tracks t) 
;

SELECT a.title, count(t.album_id)  FROM albums a 
JOIN tracks t ON a.id = t.album_id   
GROUP BY a.title 
HAVING COUNT(t.album_id) = (
	SELECT COUNT(t.album_id) FROM tracks t
	GROUP BY t.album_id
	ORDER BY COUNT(t.album_id)
	LIMIT 1)
;