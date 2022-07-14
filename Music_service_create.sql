
CREATE TABLE IF NOT EXISTS performers (
	id SERIAL PRIMARY KEY,
	nickname VARCHAR(60) NOT NULL		
);

CREATE TABLE IF NOT EXISTS genres (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS performers_genres (
	id SERIAL PRIMARY KEY,
	performer_id INTEGER NOT NULL REFERENCES performers(id),
	genre_id INTEGER NOT NULL REFERENCES genres(id),
	solution TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS albums (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	album_release_year DATE NOT NULL, 
	performer_id INTEGER NOT NULL REFERENCES performers(id),
	performer VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS tracks (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	length INTEGER NOT NULL, 
	album_id INTEGER NOT NULL REFERENCES albums(id)
);

CREATE TABLE IF NOT EXISTS mix_tapes (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	mix_tape_release_year DATE NOT NULL, 
	album_id INTEGER NOT NULL REFERENCES albums(id),
	track_id INTEGER NOT NULL REFERENCES tracks(id),
	solution TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS performers_albums (
	id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES albums(id),
	performer_id INTEGER NOT NULL REFERENCES performers(id),
	solution TEXT NOT NULL
);
