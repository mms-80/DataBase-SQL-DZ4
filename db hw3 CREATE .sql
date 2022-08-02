CREATE TABLE IF NOT EXISTS genres (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60)
);

CREATE TABLE IF NOT EXISTS executors (
	id SERIAL PRIMARY KEY,
	nickname VARCHAR(60)
);

CREATE TABLE IF NOT EXISTS albums (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60),
	year_of_release INTEGER
);

CREATE TABLE IF NOT EXISTS tracks (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60),
	duration INTEGER,
	album_id INTEGER REFERENCES albums(id)
);

CREATE TABLE IF NOT EXISTS collection (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60),
	year_of_release INTEGER
);

CREATE TABLE IF NOT EXISTS executors_genres (
	id SERIAL PRIMARY KEY,
	executor_id INTEGER REFERENCES executors(id),
	genre_id INTEGER REFERENCES genres(id)
);

CREATE TABLE IF NOT EXISTS executors_albums (
	id SERIAL PRIMARY KEY,
	album_id INTEGER REFERENCES albums(id),
	executor_id INTEGER REFERENCES executors(id) 
);

CREATE TABLE IF NOT EXISTS collections_tracks (
	id SERIAL PRIMARY KEY,
	tracks_id INTEGER REFERENCES tracks(id),
	collection_id INTEGER REFERENCES collection(id)
);
