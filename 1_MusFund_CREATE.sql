CREATE TABLE if not EXISTS Musicians (
musician_id SERIAL PRIMARY KEY,
nickname VARCHAR(40) not NULL
);

CREATE TABLE if not EXISTS MusicalGenres (
genre_id SERIAL PRIMARY KEY,
title VARCHAR(40) not NULL
);

CREATE TABLE if not EXISTS MusiciansAndGenres (
musician_id INTEGER NOT NULL REFERENCES Musicians,
genre_id INTEGER NOT NULL REFERENCES MusicalGenres,
PRIMARY key (musician_id, genre_id)
);

CREATE TABLE if not EXISTS Albums (
album_id SERIAL PRIMARY KEY,
title VARCHAR(40) not null,
year integer check (year > 1900 and year < 2023)
);

CREATE TABLE if not EXISTS MusiciansAndAlbums (
musician_id INTEGER NOT NULL REFERENCES Musicians,
album_id INTEGER NOT NULL REFERENCES Albums,
PRIMARY key (musician_id, album_id)
);

CREATE TABLE if not EXISTS Tracks (
track_id SERIAL PRIMARY KEY,
album_id INTEGER NOT NULL REFERENCES Albums,
title VARCHAR(60) NOT NULL,
duration time NOT NULL
);

CREATE TABLE if not EXISTS Collection (
collection_id SERIAL PRIMARY KEY,
title VARCHAR(40) not null,
year integer check (year > 1900 and year < 2023)
);

CREATE TABLE if not EXISTS CollectionAndTracks (
collection_id INTEGER NOT NULL REFERENCES Collection,
track_id INTEGER NOT NULL REFERENCES Tracks,
PRIMARY key (collection_id, track_id)
);