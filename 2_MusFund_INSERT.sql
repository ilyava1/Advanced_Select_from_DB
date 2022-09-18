-- запрос для наполнения таблицы жанров
INSERT INTO musicalgenres(title)
VALUES 
	('Rock'),	
	('Blues'),
	('Jazz'),
	('Pop'),
	('Techno');

-- запрос для наполнения таблицы музыкантов
INSERT INTO musicians(nickname)
VALUES 
	('Led Zeppelin'),
	('ABBA'),
	('Technotronic'),
	('BBKing'),
	('Ihor Butman'),
	('ACDC'),
	('Beyonce'),
	('Two unlimited');

-- запрос для наполнения таблицы альбомов
INSERT INTO albums(title, year)
VALUES 
	('Houses of the Holy', 1973),
	('Presence', 1976),
	('Waterloo', 1974),
	('The visitors', 2020),
	('Pump up the jam', 1989),
	('Deuces wild', 1997),
	('Nostalgy', 2018),
	('Hi voltage', 1975),
	('Black in black', 1980),
	('Dangerously in love', 2019),
	('No limits!', 1993),
	('Get Ready!', 1992),
	('Real Things', 1994);

-- запрос для наполнения таблицы трэков
INSERT INTO tracks(album_id, title, duration)
VALUES 
	(1, 'Dyer maker', '0:04:23'),
	(1, 'No quarter', '0:07:00'),
	(1, 'The ocean', '0:04:21'),	
	(2, 'Achiless last stand', '0:10:30'),
	(2, 'For your life', '0:06:21'),
	(2, 'Nobodys fault but mine', '0:06:16'),
	(3, 'King Kong song', '0:03:30'),
	(3, 'Wotch out', '0:03:30'),
	(4, 'Head over hills', '0:03:56'),
	(4, 'I let the music speak', '0:05:53'),
	(5, 'Take it slow', '0:05:06'),
	(6, 'Rock me baby', '0:06:38'),
	(7, 'My nostalgy', '0:08:35'),
	(8, 'My show business', '0:04:46'),
	(9, 'Hells bells', '0:05:16'),
	(10, 'Crazy in love', '0:03:30'),	
	(11, 'Twilight Zone', '0:04:05');

-- запрос для наполнения таблицы коллекций
INSERT INTO collection(title, year)
VALUES 
	('Bonfire', 1997),
	('Blacktracks', 2018),
	('Remasters', 1992),
	('Mothership', 2019),
	('18 Hits', 2005),
	('Nomber ones', 2020);

-- запрос для наполнения таблицы коллекций-и-трэков
INSERT INTO collectionandtracks(collection_id, track_id)
VALUES 
	(1, 14),
	(2, 15),
	(3, 1),
	(3, 2),
	(4, 2),
	(4, 3),
	(4, 4),
	(5, 9),
	(5, 7),
	(6, 8),
	(6, 10);

-- запрос для наполнения таблицы музыкантов-и-альбомов
INSERT INTO musiciansandalbums(musician_id, album_id)
VALUES 
	(1, 1),
	(1, 2),
	(2, 3),
	(2, 4),
	(3, 5),
	(4, 6),
	(5, 7),
	(6, 8),
	(6, 9),
	(7, 10),
	(8, 11);

-- запрос для наполнения таблицы музыкантов-и-жанров
INSERT INTO musiciansandgenres(musician_id, genre_id)
VALUES 
	(1, 1),
	(2, 4),
	(3, 5),
	(4, 2),
	(1, 2),
	(4, 3),
	(5, 3),
	(6, 1),
	(7, 4),
	(8, 5),
	(8, 4);
