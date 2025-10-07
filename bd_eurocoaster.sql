-- Table pays
CREATE TABLE pays (
    pays_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(30) NOT NULL
);


-- Table villes
CREATE TABLE villes (
    ville_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(30) NOT NULL,
    fk_pays_id INT REFERENCES pays(pays_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);


-- Table parcs
CREATE TABLE parcs (
    parc_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    fk_ville_id INT REFERENCES villes(ville_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    date_ouverture INT,
    superficie INT
);


-- Table frequentations
CREATE TABLE frequentations (
    annee YEAR,
    fk_parc_id INT REFERENCES parcs(parc_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (annee, fk_parc_id),
    nombre_visiteur INT
);


-- Table constructeurs
CREATE TABLE constructeurs (
    constructeur_id INT PRIMARY KEY,
    nom VARCHAR(30),
    fk_ville_id INT REFERENCES villes(ville_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    adresse VARCHAR(100),
    url_site_web VARCHAR(100),
    url_facebook VARCHAR(100),
    url_instagram VARCHAR(100),
    url_linked_in VARCHAR(100),
    date_creation YEAR
);


-- Table elements
CREATE TABLE elements (
    element_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50)
);


-- Table roallercoasters
CREATE TABLE roallercoasters (
    roallercoaster_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    structure ENUM('acier', 'bois') NOT NULL,
    type ENUM('sit down','standup','inverted','suspended','wing','bobsled','flying') DEFAULT NULL,
    date_ouverture YEAR,
    hauteur DECIMAL(4,1),
    fk_constructeur_id INT REFERENCES constructeurs(constructeur_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    fk_parc_id INT REFERENCES parcs(parc_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);


-- Table compositions
CREATE TABLE compositions (
    fk_roallercoaster_id INT REFERENCES roallercoasters(roallercoaster_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    fk_element_id INT REFERENCES elements(element_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    PRIMARY KEY (fk_roallercoaster_id, fk_element_id),
    nombre INT
);


INSERT INTO pays (pays_id, nom) VALUES
(1, 'Allemagne'), (2, 'Autriche'), (3, 'Belgique'), (4, 'Danemark'), (5, 'Espagne'), (6, 'Finlande'),
(7, 'France'), (8, 'Hongrie'), (9, 'Irlande'), (10, 'Italie'), (11, 'Norvège'), (12, 'Pays de Galles'),
(13, 'Pays-Bas'), (14, 'Pologne'), (15, 'Royaume-Uni'), (16, 'Suède'), (17, 'Turquie'), (18, 'Portugal'),
(19, 'Suisse'), (20, 'États Unis'), (21, 'Japon'), (22, 'Liechtenstein');

INSERT INTO villes (ville_id, nom, fk_pays_id) VALUES
(1, 'Bad Wörishofen', 1), (2, 'Bottrop', 1), (3, 'Brühl', 1), (4, 'Friesoythe-Thüle', 1), (5, 'Geiselwind', 1), (6, 'Hassloch', 1), (7, 'Leipzig', 1), (8, 'Lengenfeld', 1),
(9, 'Loifling', 1), (10, 'Rust', 1), (11, 'Salzhemmendorf', 1), (12, 'Sierksdorf', 1), (13, 'Wustermark', 1), (14, 'St. Margarethen', 2), (15, 'Vienne', 2), (16, 'Adinkerke-De Panne', 3),
(17, 'Lichtaart', 3), (18, 'Wavre', 3), (19, 'Ypres', 3), (20, 'Århus', 4), (21, 'Copenhague', 4), (22, 'Holme-Olstrup', 4), (23, 'Klampenborg', 4), (24, 'Nimtofte', 4),
(25, 'Nykøbing', 4), (26, 'Benidorm', 5), (27, 'Madrid', 5), (28, 'Salou', 5), (29, 'San Martín de la Vega', 5), (30, 'Helsinki', 6), (31, 'Kauhava', 6), (32, 'Tampere', 6),
(33, 'Bocasse', 7), (34, 'Dolancourt', 7), (35, 'Jeanménil', 7), (36, 'Maizières-les-Metz', 7), (37, 'Marne la Vallée', 7), (38, 'Merlimont', 7), (39, 'Plailly', 7), (40, 'Plumelin', 7),
(41, 'Saint-Paul', 7), (42, 'Saint-Pierre-du-Perray', 7), (43, 'Budapest', 8), (44, 'Ashbourne', 9), (45, 'Belpasso', 10), (46, 'Castagneto Carducci', 10), (47, 'Castelnuovo del Garda', 10), (48, 'Fasano', 10),
(49, 'Jesolo', 10), (50, 'Rimini', 10), (51, 'Savio', 10), (52, 'Treviso', 10), (53, 'Valmontone', 10), (54, 'Vinterbro', 11), (55, 'Narberth', 12), (56, 'Biddinghuizen', 13),
(57, 'Hellendoorn', 13), (58, 'Kaatsheuvel', 13), (59, 'La Haye', 13), (60, 'Sevenum', 13), (61, 'Rzgów', 14), (62, 'Zator', 14), (63, 'Alton', 15), (64, 'Blackpool', 15),
(65, 'Brean', 15), (66, 'Chertsey', 15), (67, 'Chessington', 15), (68, 'Drayton Bassett', 15), (69, 'Great Yarmouth', 15), (70, 'Ingoldmells', 15), (71, 'Lowestoft', 15), (72, 'Romsey', 15),
(73, 'Skegness', 15), (74, 'Southend On Sea', 15), (75, 'Gothenburg', 16), (76, 'Stockholm', 16), (77, 'Antalya', 17), (78, 'Tuzla', 17), (79, 'Quarteira', 18), (80, 'Reisbach', 1),
(81, 'Rome', 10), (82, 'Lipperswil', 19), (83, 'Wassenaar', 13), (84, 'Cleebronn', 1), (85, 'Vias', 7), (86, 'Blokhus', 4), (87, 'Salou', 5), (88, 'Malton', 15),
(89, 'Jeanménil', 7), (90, 'Geiselwind', 1), (91, 'Lengenfeld', 1), (92, 'Gävle', 16), (94, 'Soltau', 1), (95, 'Lillehammer', 11), (96, 'Séville', 5), (97, 'Jaderberg', 1),
(98, 'Wustermark', 1), (99, 'Kolmården', 16), (100, 'Milizac', 7), (101, 'Dompierre-sur-Besbre', 7), (102, 'Chorzów', 14), (103, 'Agde', 7), (104, 'Torzym', 14), (105, 'Kayseri', 17),
(106, 'Lazise', 10), (107, 'Marseillan', 7), (108, 'Monteux', 7), (109, 'Kaisersbach', 1), (110, 'Slagharen', 13), (111, 'Benidorm', 5), (112, 'Barcelone', 5), (113, 'Istanbul', 17),
(114, 'Les Avenières', 7), (115, 'Sankt Jakob in Haus', 2), (116, 'Deggendorf', 1), (117, 'München', 1), (118, 'Münsterhausen', 1), (119, 'Rasdorf', 1), (120, 'Waldkirch', 1), (121, 'West Chester', 20),
(122, 'Atlanta', 20), (123, 'Baltimore', 20), (124, 'Cincinnati ', 20), (125, 'Clearfield', 20), (126, 'Hayden', 20), (127, 'La Selva Beach', 20), (128, 'Logan', 20), (129, 'Sunbury', 20),
(130, 'Altavilla Vicentina', 10), (131, 'Suzzara', 10), (132, 'Trevise', 10), (133, 'Schaan', 22), (134, 'Vlodrop', 13), (135, 'Weert', 13), (136, 'Altendorf', 19), (137, 'Monthey', 19),
(138, 'Sankt Jakob in Haus', 2);

INSERT INTO parcs (parc_id, nom, fk_ville_id, date_ouverture, superficie) VALUES
(1, 'Skyline Park', 1, 1999, 20), (2, 'Movie Park Germany', 2, 1967, 45), (3, 'Phantasialand', 3, 1967, 28), (4, 'Tier- und Freizeitpark Thüle', 4, 1965, 25),
(5, 'Freizeit-Land Geiselwind', 5, 1969, 45), (6, 'Holiday Park', 6, 1971, 45), (7, 'Belantis', 7, 2003, 27), (8, 'Freizeitpark Plohn', 8, 1996, 30),
(9, 'Churpfalzpark', 9, 1971, 30), (10, 'Europa Park', 10, 1975, 95), (11, 'Rasti-Land', 11, 1973, 15), (12, 'Hansa-Park', 12, 1973, 46),
(13, 'Karls Erlebnis-Dorf Elstal', 13, 2014, 25), (14, 'Familypark', 14, 1968, 14), (15, 'Wiener Prater', 15, 1766, 60), (16, 'Plopsaland De Panne', 16, 1935, 10),
(17, 'Bobbejaanland', 17, 1961, 55), (18, 'Walibi Belgium', 18, 1975, 64), (19, 'Bellewaerde Park', 19, 1954, 50), (20, 'Tivoli Friheden', 20, 1958, 15),
(21, 'Tivoli Gardens', 21, 1843, 8), (22, 'BonBon-Land', 22, 1992, 25), (23, 'Bakken', 23, 1583, 30), (24, 'Djurs Sommerland', 24, 1981, 50),
(25, 'Sommerland Sjælland', 25, 1985, 30), (26, 'Terra Mítica', 26, 2000, 100), (27, 'Parque de Atracciones de Madrid', 27, 1969, 45), (28, 'PortAventura Park', 28, 1995, 119), (29, 'Parque Warner Madrid', 29, 2002, 55),
(30, 'Linnanmäki', 30, 1950, 10), (31, 'PowerPark', 31, 2002, 50), (32, 'Särkänniemi Amusement Park', 32, 1966, 20), (33, 'Parc du Bocasse', 33, 1967, 20),
(34, 'Nigloland', 34, 1987, 40), (35, 'Fraispertuis City', 35, 1966, 50), (36, 'Walygator Grand Est', 36, 1989, 70), (37, 'Disneyland Paris - Disneyland Park', 37, 1992, 194),
(38, 'Bagatelle', 38, 1955, 6), (39, 'Parc Astérix', 39, 1989, 50), (40, 'Kingoland', 40, 2014, 18), (41, 'Parc Saint Paul', 41, 1983, 30),
(42, 'Winnoland', 42, 2008, 8), (43, 'Waterland', 43, 2001, 35), (44, 'Emerald Park', 44, 2010, 11), (45, 'Etnaland', 45, 2001, 90),
(46, 'Cavallino Matto', 46, 1967, 12), (47, 'Cavallino Matto', 46, 1967, 12), (48, 'Gardaland', 47, 1975, 45), (49, 'Zoosafari Fasanolandia', 48, 1973, 50),
(50, 'New Jesolandia', 49, 2004, 12), (51, 'Fiabilandia', 50, 1976, 10), (52, 'Mirabilandia', 51, 1992, 85), (53, 'Osteria Ai Pioppi', 52, 1969, 8),
(54, 'MagicLand', 53, 2011, 25), (55, 'TusenFryd', 54, 1988, 50), (56, 'Oakwood Theme Park', 55, 1987, 25), (57, 'Walibi Holland', 56, 1971, 68),
(58, 'Avonturenpark Hellendoorn', 57, 1936, 25), (59, 'Efteling', 58, 1952, 72), (60, 'Drievliet Family Park', 59, 1938, 15), (61, 'Toverland', 60, 2001, 90),
(62, 'Mandoria', 61, 2021, 20), (63, 'Energylandia', 62, 2014, 90), (64, 'Alton Towers', 63, 1980, 200), (65, 'Pleasure Beach Resort', 64, 1896, 12),
(66, 'Brean Theme Park', 65, 1970, 10), (67, 'Thorpe Park', 66, 1979, 100), (68, 'Chessington World of Adventures', 67, 1931, 55), (69, 'Drayton Manor', 68, 1949, 30),
(70, 'Great Yarmouth Pleasure Beach', 69, 1910, 6), (71, 'Fantasy Island', 70, 1995, 5), (72, 'Pleasurewood Hills', 71, 1983, 10), (73, 'Paultons Park', 72, 1983, 65),
(74, "Botton's Pleasure Beach", 73, 1927, 4), (75, 'Adventure Island', 74, 1918, 7), (76, 'Liseberg', 75, 1923, 30), (77, 'Gröna Lund', 76, 1883, 8),
(78, 'Land of Legends Theme Park', 77, 2016, 63), (79, 'Korsan Adasi', 78, 2015, 20), (80, 'Aquashow Family Park', 79, 1999, 11), (81, 'Bayern-Park', 80, 1985, 40),
(82, 'Cinecittà World', 81, 2014, 24), (83, 'Conny-Land', 82, 1983, 18), (84, 'Duinrell', 83, 1935, 40), (85, 'Erlebnispark Tripsdrill', 84, 1929, 77),
(86, 'Fabrikus World', 85, 1985, 6), (87, 'Fårup Sommerland', 86, 1975, 90), (88, 'Ferrari Land', 87, 2017, 7), (89, 'Flamingo Land', 88, 1959, 150),
(90, 'Fraispertuis City', 89, 1966, 6), (91, 'Freizeit-Land Geiselwind', 90, 1969, 50), (92, 'Freizeitpark Plohn', 91, 1996, 25), (93, 'Furuvik', 92, 1900, 32),
(95, 'Heide Park Resort', 94, 1978, 85), (96, 'Hunderfossen Eventyrpark', 95, 1984, 15), (97, 'Isla Mágica', 96, 1997, 21), (98, 'Jaderpark', 97, 1996, 20),
(99, 'Karls Erlebnis-Dorf Elstal', 98, 2014, 15), (100, 'Kolmården', 99, 1965, 150), (101, 'La Récré des 3 Curés', 100, 1989, 15), (102, 'Le Pal', 101, 1973, 50),
(103, 'Legendia Slaskie Wesole Miasteczko', 102, 1959, 26), (104, 'Lunapark', 103, 2005, NULL), (105, 'Majaland Kownaty', 104, 2018, 10), (106, 'Mazaka Land', 105, 2021, NULL),
(107, 'Movieland Park', 106, 2002, 20), (108, "Parc d'Attractions Marseillan-Plage", 107, 1979, 3), (109, 'Parc Spirou Provence', 108, 2018, 8), (110, 'Schwaben Park', 109, 1972, 40),
(111, 'Slagharen Themepark & Resort', 110, 1963, 50), (112, 'Terra Mítica', 111, 2000, 100), (113, 'Tibidabo', 112, 1901, 7), (114, 'Vialand', 113, 2013, 60), (115, 'Walibi Rhône-Alpes', 114, 1979, 35),
(116, 'Freizeitpark Familienland', 138, 2000, NULL);

INSERT INTO frequentations (annee, fk_parc_id, nombre_visiteur) VALUES
('2023', 1, 250000), ('2023', 2, 1000000), ('2023', 3, 2000000), ('2023', 4, 300000), ('2023', 5, 600000), ('2023', 6, 1500000), ('2023', 7, 500000), ('2023', 8, 350000),
('2023', 9, 200000), ('2023', 10, 6000000), ('2023', 11, 200000), ('2023', 12, 2000000), ('2023', 13, 300000), ('2023', 14, 1000000), ('2023', 15, 2000000), ('2023', 16, 2000000),
('2023', 17, 800000), ('2023', 18, 1500000), ('2023', 19, 500000), ('2023', 20, 200000), ('2023', 21, 4000000), ('2023', 22, 300000), ('2023', 23, 1300000), ('2023', 24, 600000),
('2023', 25, 300000), ('2023', 26, 1000000), ('2023', 27, 1800000), ('2023', 28, 3500000), ('2023', 29, 2000000), ('2023', 30, 1000000), ('2023', 31, 200000), ('2023', 32, 4000000),
('2023', 33, 300000), ('2023', 34, 1200000), ('2023', 35, 1000000), ('2023', 36, 500000), ('2023', 37, 15000000), ('2023', 38, 400000), ('2023', 39, 2500000), ('2023', 40, 150000),
('2023', 41, 350000), ('2023', 42, 100000), ('2023', 43, 100000), ('2023', 44, 200000), ('2023', 45, 600000), ('2023', 46, 450000), ('2023', 47, 450000), ('2023', 48, 3500000),
('2023', 49, 350000), ('2023', 50, 150000), ('2023', 51, 350000), ('2023', 52, 2000000), ('2023', 53, 80000), ('2023', 54, 300000), ('2023', 55, 600000), ('2023', 56, 500000),
('2023', 57, 1500000), ('2023', 58, 600000), ('2023', 59, 5000000), ('2023', 60, 200000), ('2023', 61, 1500000), ('2023', 62, 250000), ('2023', 63, 4000000), ('2023', 64, 3000000),
('2023', 65, 6000000), ('2023', 66, 350000), ('2023', 67, 2000000), ('2023', 68, 1500000), ('2023', 69, 1000000), ('2023', 70, 350000), ('2023', 71, 500000), ('2023', 72, 450000),
('2023', 73, 1000000), ('2023', 74, 250000), ('2023', 75, 1000000), ('2023', 76, 3000000), ('2023', 77, 1200000), ('2023', 78, 1500000), ('2023', 79, 250000), ('2023', 80, NULL),
('2023', 81, NULL), ('2023', 82, NULL), ('2023', 83, NULL), ('2023', 84, NULL), ('2023', 85, NULL), ('2023', 86, NULL), ('2023', 87, NULL), ('2023', 88, NULL), ('2023', 89, NULL),
('2023', 90, NULL), ('2023', 91, NULL), ('2023', 92, NULL), ('2023', 93, NULL), ('2023', 95, NULL), ('2023', 96, NULL), ('2023', 97, NULL), ('2023', 98, NULL), ('2023', 99, NULL),
('2023', 100, NULL), ('2023', 101, NULL), ('2023', 102, NULL), ('2023', 103, NULL), ('2023', 104, NULL), ('2023', 105, NULL), ('2023', 106, NULL), ('2023', 107, NULL),
('2023', 108, NULL), ('2023', 109, NULL), ('2023', 110, NULL), ('2023', 111, NULL), ('2023', 112, NULL), ('2023', 113, NULL), ('2023', 114, NULL), ('2023', 115, NULL);

INSERT INTO constructeurs (constructeur_id, nom, fk_ville_id, adresse, url_site_web, url_facebook, url_linked_in, url_instagram, date_creation) VALUES
(1, 'Bolliger & Mabillard', 137, 'Chemin des Dailles 31', 'https://www.bolliger-mabillard.com/', '', NULL, NULL, '1988'),
(2, 'Custom Coasters International', 121, ' 8461 Cincinnati-Columbus Road', NULL, ' ', NULL, NULL, NULL),
(3, 'Gerstlauer Amusement Rides Gmb', 118, 'Industriestrasse 17 ', 'http://www.gerstlauer-rides.de/', 'https://www.facebook.com/gerstlauer/', 'https://instagram.com/gerstlauer_amusement_rides/', NULL, '1981'),
(4, 'Gravitykraft Corporation', 124, NULL, 'http://www.gravitykraft.com/', '', NULL, NULL, NULL),
(5, 'Great Coasters International', 129, NULL, NULL, 'https://www.facebook.com/GreatCoasters/', 'https://instagram.com/greatcoastersinternational/', 'https://www.linkedin.com/company/great-coasters-international-inc', '1994'),
(6, 'Intamin Amusement Rides', 133, 'Landstrasse 126', 'http://www.intaminworldwide.com/', 'https://www.facebook.com/Intamin-224867948218/', NULL, NULL, '1967'),
(7, 'Mack Rides GmbH & Co KG', 120, 'Mauermattenstraße 4', 'http://www.mack-rides.com/', 'https://www.facebook.com/mackrides/', NULL, NULL, NULL),
(8, 'Maurer Rides GmbH', 117, 'Frankfurter Ring 193', 'https://maurer-rides.de/', '', NULL, NULL, NULL),
(9, 'Rocky Mountain Construction', 126, '11470 Carisa Court', 'http://www.rockymtnconstruction.com/', 'https://www.facebook.com/Rocky-Mountain-Construction-154373424599786/', 'https://twitter.com/RockyMtnConst', NULL,
'2001'),
(10, 'Vekoma', 134, 'Schaapweg 18', 'https://www.vekoma.com/', 'https://www.facebook.com/vekoma.rides.manufacturing/', 'https://instagram.com/vekoma.rides.manufacturing/', 'https://www.linkedin.com/company/vekoma-rides-
manufacturing', '1926'),
(11, 'Zamperla', 130, 'Monte Grappa 15/17', 'http://www.zamperla.com/', 'https://www.facebook.com/zamperlarides/', 'https://instagram.com/zamperlarides/', 'https://www.linkedin.com/company/zamperla-group', '1966'),
(12, 'Schwarzkopf', 118, NULL, NULL, '', NULL, NULL, '1945'),
(13, 'Premier Rides', 123, '1007 East Pratt Street', 'http://www.premier-rides.com/', 'https://www.facebook.com/Premier.Rides.Inc/', 'https://instagram.com/premierridesinc/', 'https://www.linkedin.com/company/premier-rides-inc-',
'1994'),
(14, 'D.H. Morgan Manufacturing Inc.', 127, NULL, NULL, '', NULL, NULL, '2001'),
(15, 'Roller Coaster Corporation of ', 122, NULL, NULL, '', NULL, NULL, '2005'),
(16, 'Arrow Dynamics', 125, NULL, NULL, '', NULL, NULL, '1945'),
(17, 'EOS Rides', 132, 'Via Antelao 2', NULL, 'https://www.facebook.com/eosrides/', NULL, NULL, '2000'),
(18, 'Wiegand', 119, 'Landstrasse 12 - 14', 'http://www.wiegandslide.com/', 'https://www.facebook.com/wiegandslide/', 'https://instagram.com/wiegand_slide/', NULL, '1963'),
(19, 'S&S Worldwide', 128, '350 West 2500 North', 'https://www.s-s.com/', 'https://www.facebook.com/sandsworldwide/', 'https://instagram.com/sandsworldwide/', NULL, '1994'),
(20, 'Zierer', 116, 'Josef-Wallner-Straße 5', 'http://www.zierer.com/', 'https://www.facebook.com/zierer/', 'https://instagram.com/ziererrides/', NULL, '1930'),
(21, 'Togo', NULL, NULL, 'http://www.tohgo.co.jp/', '', NULL, NULL, '1935'),
(22, 'Pinfari', 131, 'Via Curtatone e Montanara 30/a', 'http://www.pinfari.com/', '', NULL, NULL, NULL),
(23, 'BHS', NULL, NULL, NULL, '', NULL, NULL, NULL),
(24, 'Valdemar Lebech', NULL, NULL, NULL, '', NULL, NULL, NULL),
(25, 'KumbaK The Amusement Engineers', 135, 'Havenweg 12', 'http://www.kumbak.nl/', 'https://www.facebook.com/pages/', NULL, NULL, '2002'),
(26, 'Ride Engineers Switzerland', 136, 'Ride Engineers Switzerland', 'http://ride-engineers.com/', 'https://www.facebook.com/rideengineersswitzerland/', NULL, 'https://www.linkedin.com/company/ride-engineers-switzerland', '2016');

INSERT INTO elements (element_id, nom) VALUES
(1, 'Banana Roll'), (2, 'Barrel Roll'), (3, 'Barrel Roll Downdrop'), (4, 'Batwing'), (5, 'Bent Cuban Eight'),
(6, 'Block Brake'), (7, 'Booster Wheel Lift Hill'), (8, 'Bowtie'), (9, 'Butterfly'), (10, 'Cable Car'),
(11, 'Cable Lift Hill'), (12, 'Catch Car Lift Hill'), (13, 'Catch Car Vertical Lift'), (14, 'Chain Lift Hill'), (15, 'Cobra Loop'),
(16, 'Cobra Roll'), (17, 'Compressed Air Launch'), (18, 'Corkscrew'), (19, 'Cuban Eight'), (20, 'Cutback'),
(21, 'Dark/Show Section'), (22, 'Demonic Knot'), (23, 'Dive Drop'), (24, 'Dive Loop'), (25, 'Diving Turn'),
(26, 'Dog Tongue'), (27, 'Double Barrel Roll'), (28, 'Double Corkscrew'), (29, 'Double Dip'), (30, 'Double Down'),
(31, 'Double Heartline Roll'), (32, 'Double In-Line Twist'), (33, 'Double Inverting Stall'), (34, 'Drachen Fire Dive Drop'), (35, 'Electric Spiral Lift'),
(36, 'Electric Winch Launch'), (37, 'Elevator Lift'), (38, 'Ferris Wheel Lift'), (39, 'Finnish Loop'), (40, 'Fly To Lie'),
(41, 'Flying Snake Dive'), (42, 'Flywheel Launch'), (43, 'Hanging Lift'), (44, 'Heartline Roll'), (45, 'Helix'),
(46, 'High Five'), (47, 'Hill'), (48, 'Horseshoe'), (49, 'Horseshoe Helix'), (50, 'Hydraulic Launch'),
(51, 'Immelmann'), (52, 'In-Line Twist'), (53, 'Inclined Dive Loop'), (54, 'Inclined Loop'), (55, 'Inclined Rollback'),
(56, 'Inside Raven Turn'), (57, 'Interlocking Corkscrews'), (58, 'Jr. Immelmann'), (59, 'Jr. Scorpion Tail'), (60, 'Kickflip'),
(61, 'Lagoon Roll'), (62, 'Lie To Fly'), (63, 'Lift Hill'), (64, 'LIM Boost'), (65, 'LIM Launch'),
(66, 'LIM Launch (multi-pass)'), (67, 'LSM Boost'), (68, 'LSM Boost (multi-pass)'), (69, 'LSM Launch'), (70, 'LSM Launch (multi-pass)'),
(71, 'LSM Launch (rolling)'), (72, 'LSM Lift Hill'), (73, 'Maxx Dive Loop'), (74, 'Negative-G Stall Loop'), (75, 'Non Inverting Cobra Roll'),
(76, 'Non Inverting Loop'), (77, 'Norwegian Loop'), (78, 'Outside Raven Turn'), (79, 'Outward Banked Airtime Hill'), (80, 'Over-Banked Curve'),
(81, 'Over-Banked Inversion'), (82, 'Pretzel Knot'), (83, 'Pretzel Loop'), (84, 'Quad Heartline Roll'), (85, 'Reverse Sidewinder'), (86, 'Roll Out'),
(87, 'Roll Over'), (88, 'Rollover Camelback'), (89, 'Saxophone'), (90, 'Scorpion Tail'),
(91, 'Sea Serpent'), (92, 'Sidewinder'), (93, 'Ski Lift'), (94, 'Sky Loop'), (95, 'Slide Drop'),
(96, 'Spiral Lift'), (97, 'Spiral Rollback'), (98, 'Splash Down'), (99, 'Splash Effect'), (100, 'Splash Track'),
(101, 'Stalled Dive Loop'), (102, 'Stalled Immelmann'), (103, 'Stengel Dive'), (104, 'Step-Up Under Flip'), (105, 'Stinger Curve'),
(106, 'Stinger Lift'), (107, 'Switch Track'), (108, 'Tilt Track'), (109, 'Tire Propelled Boost'), (110, 'Tire Propelled Launch'),
(111, 'Tire Propelled Launch (multi-pass)'), (112, 'Tire Propelled Launch (rolling)'), (113, 'Tongue'), (114, 'Top Gun Stall'), (115, 'Top Hat - Inside'),
(116, 'Top Hat - Outside'), (117, 'Trick Track'), (118, 'Triple Corkscrew'), (119, 'Triple Dip'), (120, 'Triple Heartline Roll'),
(121, 'Tunnel'), (122, 'Turntable'), (123, 'Twisted Horseshoe Roll'), (124, 'Twisted In-Line Rollback'), (125, 'Twisted Vertical Rollback'),
(126, 'Vertical Bounce Track'), (127, 'Vertical Chain Lift Hill'), (128, 'Vertical Drop Track'), (129, 'Vertical Rollback'), (130, 'Vertical Spiral'),
(131, 'Water Channel'), (132, 'Weight Drop Launch'), (133, 'Windcatcher Tower'), (134, 'Wing Over'), (135, 'Wraparound Corkscrew'),
(136, 'Zero-G Roll'), (137, 'Zero-G Roll (variant)'), (138, 'Zero-G Stall'), (139, 'Zero-G Winder'), (140, 'Vertical Loop');

INSERT INTO roallercoasters (roallercoaster_id, nom, structure, type, date_ouverture, hauteur, fk_constructeur_id, fk_parc_id) VALUES
(1, 'Abismo', 'acier', 'sit down', '2006', 46.2, 8, 27), (2, 'Abyssus', 'acier', 'sit down', '2021', 38.5, 10, 63), (3, 'Alpina Blitz', 'acier', 'sit down', '2014', 33.0, 7, 34), (4, 'Altair', 'acier', 'sit down', '2014', 33.0, 6, 82), (5, 'Anaconda', 'bois', 'sit down', '1989', 36.0, 14, 36), (6, 'Anubis: The Ride', 'acier', 'sit down', '2009', 34.0, 3, 16),
(7, 'Apocalypse', 'acier', 'sit down', '2012', 22.9, 10, 104), (8, 'Atlantica SuperSplash', 'acier', 'sit down', '2005', 30.0, 7, 10), (9, 'Avengers Assemble: Flight Force', 'acier', 'sit down', '2002', 24.4, 10, 37), (10, 'Balagos', 'acier', 'sit down', '1905', 25.0, 10, 58), (11, 'Balder', 'bois', 'sit down', '2003', 36.0, 6, 76), (12, 'Bandit', 'bois', 'sit down', '1999', 27.8, 15, 2),
(13, 'Baron 1898', 'acier', 'sit down', '2015', 30.0, 1, 59), (14, 'Batman Gotham City Escape', 'acier', 'sit down', '2023', 45.0, 6, 29), (15, 'Big Bang', 'acier', 'sit down', '2013', 22.0, 12, 116), (16, 'Big Loop', 'acier', 'sit down', '1905', 30.0, 10, 95), (17, 'Big One', 'acier', 'sit down', '1994', 64.9, 16, 65), (18, 'Big Thunder Mountain', 'acier', 'sit down', '1992', 22.0, 10, 37),
(19, 'Black Mamba', 'acier', 'inverted', '2006', 26.0, 1, 3), (20, 'blue fire Megacoaster', 'acier', 'sit down', '2009', 38.0, 7, 10), (21, 'Blue Tornado', 'acier', 'inverted', '1998', 33.3, 10, 48), (22, 'Bobbahn', 'acier', 'bobsled', '1994', 27.0, 7, 95), (23, 'Boomerang', 'acier', 'sit down', '1992', 35.5, 10, 15), (24, 'Boomerang', 'acier', 'sit down', '1984', 35.5, 10, 19),
(25, 'Boomerang', 'acier', 'sit down', '1992', 35.5, 10, 36), (26, 'Boomerang', 'acier', 'sit down', '2017', 23.0, 10, 63), (27, 'Cheetah Hunt', 'acier', 'sit down', '2013', 23.0, 17, 106), (28, 'Coaster Express', 'bois', 'sit down', '2002', 36.6, 15, 29), (29, 'Cobra', 'acier', 'sit down', '2001', 35.5, 10, 18), (30, 'Cobra', 'acier', 'sit down', '2005', 35.5, 10, 31),
(31, 'Cobra', 'acier', 'sit down', '2010', 42.0, 10, 83), (32, 'Colorado Adventure', 'acier', 'sit down', '1996', 26.0, 10, 3), (33, 'Colossos - Kampf der Giganten', 'bois', 'sit down', '2001', 50.0, 6, 95), (34, 'Colossus', 'acier', 'sit down', '2002', 30.0, 6, 67), (35, 'Condor', 'acier', 'inverted', '1994', 31.0, 10, 57), (36, 'Cú Chulainn', 'bois', 'sit down', '2015', 32.0, 4, 44),
(37, 'Dæmonen', 'acier', 'sit down', '2004', 28.0, 1, 21), (38, 'Dawson Duel', 'acier', 'sit down', '2017', 25.0, 18, 19), (39, 'Desmo Race', 'acier', 'sit down', '2019', 22.0, 8, 52), (40, 'Diabolik', 'acier', 'inverted', '2015', 40.0, 10, 107), (41, 'Divertical', 'acier', 'sit down', '2012', 50.0, 6, 52), (42, 'DrageKongen', 'acier', 'inverted', '2017', 30.0, 6, 24),
(43, 'Dragon Khan', 'acier', 'sit down', '1995', 45.1, 1, 28), (44, 'Dreamcatcher', 'acier', 'suspended', '1987', 25.0, 10, 17), (45, 'Dynamite', 'acier', 'sit down', '2019', 44.0, 7, 92), (46, 'El Toro', 'bois', 'sit down', '2009', 24.5, 5, 92), (47, 'Eldorado', 'acier', 'sit down', '2013', 21.0, 19, 45), (48, 'Euro Mir', 'acier', 'sit down', '1997', 28.0, 7, 10),
(49, 'Eurofigther', 'acier', 'sit down', '2011', 25.0, 3, 49), (50, 'EuroLoop', 'acier', 'sit down', '2004', 30.0, 10, 86), (51, 'Eurosat - CanCan Coaster', 'acier', 'sit down', '1989', 25.5, 7, 10), (52, 'Expedition GeForce', 'acier', 'sit down', '2001', 53.0, 6, 6), (53, 'Falcon', 'acier', 'sit down', '2009', 22.0, 3, 84), (54, 'Fenix', 'acier', 'wing', '2018', 40.0, 1, 61),
(55, 'Fianna Force', 'acier', 'inverted', '2024', 31.0, 10, 44), (56, 'Fireball', 'acier', 'sit down', '2017', 23.0, 10, 93), (57, 'Fjord Explorer', 'acier', 'sit down', '2024', 27.0, 7, 102), (58, 'Fluch des Kraken', 'acier', 'sit down', '1905', 35.5, 10, 91), (59, 'Flucht von Novgorod', 'acier', 'sit down', '2009', 40.0, 3, 12), (60, 'Flug der Dämonen', 'acier', 'wing', '2014', 40.0, 1, 95),
(61, 'Fønix', 'acier', 'sit down', '2022', 40.0, 10, 87), (62, 'Force One', 'acier', 'sit down', '2010', 22.0, 20, 110), (63, 'Formula', 'acier', 'sit down', '2016', 24.8, 10, 63), (64, 'Freestyle', 'acier', 'standup', '2015', 26.8, 21, 46), (65, 'Freischütz', 'acier', 'sit down', '2011', 24.0, 8, 81), (66, 'Fury', 'acier', 'sit down', '2019', 43.0, 3, 17),
(67, 'Generator', 'acier', 'sit down', '1988', 35.5, 10, 115), (68, 'Gesengte Sau', 'acier', 'sit down', '2020', 24.0, 3, 15), (69, 'Gold Rush', 'acier', 'sit down', '2017', 33.0, 3, 111), (70, 'Goliath', 'acier', 'sit down', '2002', 46.8, 6, 57), (71, 'Gotham', 'acier', 'sit down', '2021', 24.0, 22, 108), (72, 'Goudurix', 'acier', 'sit down', '1989', 36.0, 10, 39),
(73, 'Hals-über-Kopf', 'acier', 'inverted', '2020', 30.0, 10, 85), (74, 'Heidi The Ride', 'bois', 'sit down', '2017', 22.0, 5, 16), (75, 'Helix', 'acier', 'sit down', '2014', 41.0, 7, 76), (76, 'Huracan', 'acier', 'sit down', '2010', 32.0, 3, 7), (77, 'Hype', 'acier', 'sit down', '2017', 45.7, 13, 32), (78, 'Hyper Coaster', 'acier', 'sit down', '2018', 61.0, 7, 78),
(79, 'Hyperia', 'acier', 'sit down', '2024', 71.9, 7, 67), (80, 'Hyperion', 'acier', 'sit down', '2018', 77.0, 6, 63), (81, 'Icon', 'acier', 'sit down', '2018', 27.0, 7, 65), (82, 'Il Tempo Extra Gigante', 'acier', 'sit down', '2014', 25.0, 20, 96), (83, 'Inferno', 'acier', 'wing', '2007', 25.0, 6, 112), (84, 'Infusion', 'acier', 'inverted', '2007', 33.3, 10, 65),
(85, 'Insane', 'acier', 'wing', '2009', 33.0, 6, 77), (86, 'Iron Claw', 'acier', 'inverted', '2001', 33.3, 10, 2), (87, 'iSpeed', 'acier', 'sit down', '2009', 55.0, 6, 52), (88, 'Jaguar', 'acier', 'inverted', '1997', 33.3, 10, 97), (89, 'Joris en de Draak', 'bois', 'sit down', '2010', 22.1, 5, 59), (90, 'Junker', 'acier', 'sit down', '2015', 40.0, 3, 31),
(91, 'K2', 'acier', 'sit down', '2018', 24.0, 10, 99), (92, 'Karacho', 'acier', 'sit down', '2013', 30.0, 3, 85), (93, 'Katun', 'acier', 'inverted', '2000', 50.0, 1, 52), (94, 'Kirnu', 'acier', 'wing', '2007', 25.0, 6, 30), (95, 'Kondaa', 'acier', 'sit down', '2021', 50.0, 6, 18), (96, 'Krake', 'acier', 'sit down', '2011', 41.0, 1, 95),
(97, 'Krampus Expédition', 'acier', 'sit down', '2021', 28.0, 7, 34), (98, 'Kumali', 'acier', 'inverted', '2006', 35.9, 10, 89), (99, 'Lech Coaster', 'acier', 'sit down', '2017', 40.0, 10, 103), (100, 'Light Explorers', 'acier', 'sit down', '2021', 24.2, 10, 63), (101, 'Lisebergbanan', 'acier', 'sit down', '1987', 45.0, 20, 76), (102, 'Loopen', 'acier', 'sit down', '1988', 21.0, 10, 55),
(103, 'Lost Gravity', 'acier', 'sit down', '2016', 32.0, 7, 57), (104, 'Loup-Garou', 'bois', 'sit down', '2001', 28.0, 10, 18), (105, 'Luna', 'acier', 'sit down', '2023', 33.5, 10, 76), (106, 'Mammut', 'bois', 'sit down', '2008', 30.0, 10, 85), (107, 'Megafobia', 'bois', 'sit down', '1996', 25.9, 2, 56), (108, 'Millennium', 'acier', 'sit down', '1999', 45.7, 10, 71),
(109, 'Monster', 'acier', 'inverted', '2010', 40.0, 1, 36), (110, 'Monster', 'acier', 'inverted', '2021', 34.0, 1, 77), (111, 'Montanha Russa', 'acier', 'sit down', '2006', 23.5, 7, 80), (112, 'Mumbo Jumbo', 'acier', 'sit down', '2009', 30.0, 19, 89), (113, 'Muntanya Russa', 'acier', 'sit down', '2008', 25.0, 10, 113), (114, 'Mystic', 'acier', 'sit down', '2019', 31.0, 3, 115),
(115, 'Nefeskesen', 'acier', 'sit down', '2014', 50.0, 6, 114), (116, 'Nemesis Inferno', 'acier', 'inverted', '2003', 29.0, 1, 67), (117, 'Nessie', 'acier', 'sit down', '1980', 26.0, 12, 12), (118, 'Nid des Marsupilamis', 'acier', 'sit down', '2019', 28.5, 3, 109), (119, 'Oblivion - The Black Hole', 'acier', 'sit down', '2015', 42.5, 1, 48), (120, 'Odyssey', 'acier', 'inverted', '2002', 50.9, 10, 71),
(121, 'Olympia Looping', 'acier', 'sit down', '2024', 32.5, 23, 15), (122, 'OzIris', 'acier', 'inverted', '2012', 40.0, 1, 39), (123, 'Pégase Express', 'acier', 'sit down', '2017', 21.0, 3, 39), (124, 'Piraten', 'acier', 'sit down', '2008', 31.0, 6, 24), (125, 'Pitts Special', 'acier', 'sit down', '2020', 43.5, 3, 31), (126, 'Poseidon', 'acier', 'sit down', '2000', 23.0, 7, 10),
(127, 'Psyké Underground', 'acier', 'sit down', '1982', 42.0, 12, 18), (128, 'Pulsar', 'acier', 'sit down', '2016', 45.0, 7, 18), (129, 'Python', 'acier', 'sit down', '1981', 29.0, 10, 59), (130, 'Quest', 'acier', 'sit down', '2024', 25.0, 10, 44), (131, 'Rage', 'acier', 'sit down', '2007', 22.0, 3, 75), (132, 'Raik', 'acier', 'sit down', '2016', 25.0, 10, 3),
(133, 'Raptor', 'acier', 'wing', '2011', 33.0, 1, 48), (134, 'RC Racer', 'acier', 'sit down', '2010', 25.0, 6, 37), (135, 'Red Fire', 'acier', 'sit down', '2015', 55.0, 6, 79), (136, 'Red Force', 'acier', 'sit down', '2017', 112.0, 6, 88), (137, 'Ride to Happiness', 'acier', 'sit down', '2021', 33.0, 7, 16), (138, 'Rita', 'acier', 'sit down', '2005', 21.0, 6, 64),
(139, 'Roller Coaster', 'bois', 'sit down', '1932', 21.3, 10, 70), (140, 'Roller Coaster Mayan', 'acier', 'inverted', '2015', 33.3, 10, 63), (141, 'Rutschebanen', 'bois', 'sit down', '1914', 22.0, 24, 23), (142, 'Saven', 'acier', 'sit down', '2020', 24.2, 10, 87), (143, 'Saw - The Ride', 'acier', 'sit down', '2009', 30.5, 3, 67), (144, 'Schwur des Kärnan', 'acier', 'sit down', '2015', 73.0, 3, 12),
(145, 'Shadows of Arkham', 'acier', 'inverted', '2002', 32.0, 1, 29), (146, 'Shaman', 'acier', 'sit down', '1985', 30.0, 10, 48), (147, 'Shambhala', 'acier', 'sit down', '2012', 76.0, 1, 28), (148, 'Shock', 'acier', 'sit down', '2011', 35.0, 8, 54), (149, 'Sik', 'acier', 'sit down', '2022', 33.0, 6, 89), (150, 'Silver Star', 'acier', 'sit down', '2002', 73.0, 1, 10),
(151, 'Skatteøen', 'acier', 'sit down', '2011', 28.0, 7, 24), (152, 'Sky Scream', 'acier', 'sit down', '2014', 45.7, 13, 6), (153, 'Sky Wheel', 'acier', 'sit down', '2004', 46.2, 8, 1), (154, 'Speed', 'acier', 'sit down', '2018', 50.0, 6, 63), (155, 'Speed Monster', 'acier', 'sit down', '2006', 31.0, 6, 55), (156, 'Speed of Sound', 'acier', 'sit down', '2000', 35.5, 10, 57),
(157, 'Speed: No Limits', 'acier', 'sit down', '2006', 35.0, 3, 56), (158, 'Stampida', 'bois', 'sit down', '1997', 25.6, 2, 28), (159, 'Star Wars Hyperspace Mountain: Rebel Mission', 'acier', 'sit down', '1995', 32.0, 10, 37), (160, 'Stealth', 'acier', 'sit down', '2006', 62.5, 6, 67), (161, 'Storm', 'acier', 'sit down', '2013', 32.0, 7, 45), (162, 'Storm - The Dragon Legend', 'acier', 'inverted', '2023', 33.5, 3, 55),
(163, 'Stunt Fall', 'acier', 'inverted', '2002', 54.0, 10, 29), (164, 'Superman / la Atracción de Acero', 'acier', 'sit down', '2002', 50.0, 1, 29), (165, 'SuperSplash', 'acier', 'sit down', '1905', 29.0, 7, 55), (166, 'Swarm', 'acier', 'wing', '2012', 38.7, 1, 67), (167, 'Taiga', 'acier', 'sit down', '2019', 52.0, 6, 30), (168, 'Tarántula', 'acier', 'sit down', '2005', 25.5, 8, 27),
(169, 'Taron', 'acier', 'sit down', '2016', 30.0, 6, 3), (170, 'Thunderbird', 'bois', 'sit down', '2006', 25.0, 5, 31), (171, 'Tiki-Waka', 'acier', 'sit down', '2018', 21.0, 3, 18), (172, 'Timber Drop', 'acier', 'sit down', '2011', 29.3, 4, 90), (173, 'Titánide', 'acier', 'inverted', '2003', 33.3, 10, 112), (174, 'Tonnerre 2 Zeus', 'bois', 'sit down', '1997', 29.9, 2, 39),
(175, 'Tornado', 'acier', 'inverted', '1999', 29.9, 6, 27), (176, 'Tornado', 'acier', 'inverted', '2001', 25.0, 6, 32), (177, 'Toutatis', 'acier', 'sit down', '2023', 51.0, 6, 39), (178, 'Toxic Garden', 'acier', 'inverted', '1999', 33.3, 10, 95), (179, 'Triops', 'acier', 'inverted', '2012', 40.0, 10, 38), (180, 'Troy', 'bois', 'sit down', '2007', 31.9, 5, 61),
(181, 'Twist', 'acier', 'sit down', '2011', 22.0, 7, 102), (182, 'Typhoon', 'acier', 'sit down', '2004', 25.7, 3, 17), (183, 'Typhoon Coaster', 'acier', 'sit down', '2016', 43.0, 6, 78), (184, 'Ukko', 'acier', 'sit down', '2011', 46.2, 8, 30), (185, 'Untamed', 'acier', 'sit down', '2019', 36.5, 9, 57), (186, 'Valkyria', 'acier', 'sit down', '2018', 47.0, 1, 76),
(187, 'Vampire', 'acier', 'inverted', '1999', 33.3, 10, 18), (188, 'Vertika', 'acier', 'sit down', '2020', 27.0, 3, 101), (189, 'Vild-Svinet', 'acier', 'sit down', '2003', 21.9, 3, 22), (190, 'Vilda Musen', 'acier', 'sit down', '2003', 21.0, 3, 77), (191, 'Vindfald', 'acier', 'sit down', '2024', 23.0, 3, 20), (192, 'Vliegende Hollander', 'acier', 'sit down', '2007', 22.5, 25, 59),
(193, 'Volare', 'acier', 'flying', '2004', 21.0, 11, 15), (194, 'Volldampf', 'acier', 'sit down', '2020', 22.0, 10, 85), (195, 'Voltron', 'acier', 'sit down', '2024', 32.5, 7, 10), (196, 'Vuoristorata', 'bois', 'sit down', '1951', 22.9, 24, 30), (197, 'Wakala', 'acier', 'sit down', '2020', 21.0, 3, 19), (198, 'Wave', 'acier', 'sit down', '1994', 36.6, 6, 69),
(199, 'Werewolf', 'bois', 'sit down', '2019', 22.0, 5, 105), (200, 'Wilde Hilde', 'acier', 'sit down', '2018', 21.0, 26, 110), (201, 'Wildfire', 'bois', 'sit down', '2016', 56.0, 9, 100), (202, 'Wipeout', 'acier', 'sit down', '2007', 35.5, 10, 72), (203, 'Wodan Timbur Coaster', 'bois', 'sit down', '2012', 40.0, 5, 10), (204, 'Xpress: Platform 13', 'acier', 'sit down', '2000', 25.8, 10, 57),
(205, 'Zadra', 'acier', 'sit down', '2019', 62.8, 9, 63), (206, 'Ziegelblitz', 'acier', 'sit down', '2024', 21.0, 3, 98);

INSERT INTO compositions (fk_roallercoaster_id, fk_element_id, nombre) VALUES
(3, 14, 1), (6, 6, 1), (6, 24, 1), (6, 44, 1), (6, 51, 1), (6, 71, 1), (13, 14, 1), (13, 21, 1), (13, 45, 1), (13, 51, 1),
(13, 121, 1), (13, 136, 1), (14, 18, 2), (14, 67, 2), (14, 69, 1), (14, 85, 1), (14, 107, 1), (14, 116, 1), (14, 129, 1), (14, 138, 1),
(19, 14, 1), (19, 18, 2), (19, 58, 1), (19, 136, 1), (19, 140, 1), (20, 6, 1), (20, 21, 1), (20, 52, 1), (20, 69, 1), (20, 123, 1),
(20, 140, 1), (54, 14, 1), (54, 21, 1), (54, 23, 1), (54, 45, 1), (54, 51, 1), (54, 136, 1), (72, 4, 1), (72, 9, 1), (72, 14, 1),
(72, 28, 1), (72, 140, 1), (95, 14, 1), (95, 47, 1), (95, 75, 1), (95, 79, 1), (114, 24, 1), (114, 107, 1), (114, 116, 1), (114, 124, 1),
(114, 127, 1), (114, 136, 1), (122, 14, 1), (122, 24, 1), (122, 51, 1), (122, 136, 2), (122, 140, 1), (137, 1, 1), (137, 44, 1), (137, 67, 1),
(137, 69, 1), (137, 104, 1), (137, 136, 1), (137, 140, 1), (147, 6, 1), (147, 14, 1), (147, 99, 1), (147, 121, 1), (159, 7, 1), (159, 18, 1),
(159, 36, 1), (159, 92, 1), (159, 113, 1), (169, 67, 1), (169, 69, 1), (174, 14, 1), (174, 45, 1), (174, 121, 2), (177, 2, 1), (177, 68, 1),
(177, 71, 1), (177, 116, 1), (177, 129, 1), (177, 138, 2), (185, 2, 1), (185, 14, 1), (185, 33, 1), (185, 81, 1), (185, 104, 1), (195, 6, 1),
(195, 18, 3), (195, 21, 1), (195, 24, 1), (195, 51, 1), (195, 59, 1), (195, 64, 1), (195, 70, 1), (195, 72, 1), (195, 115, 1), (195, 116, 1),
(195, 122, 1), (195, 126, 1), (195, 138, 1), (205, 14, 1), (205, 137, 2), (205, 138, 1);


-- Requete 1
SELECT 
    villes.nom AS VILLE, 
    pays.nom AS PAYS
FROM 
    villes
INNER JOIN pays ON villes.fk_pays_id = pays.pays_id;

-- Requete 2
SELECT 
    parcs.nom AS PARC, 
    villes.nom AS VILLE, 
    pays.nom AS PAYS
FROM 
    villes
INNER JOIN pays ON villes.fk_pays_id = pays.pays_id
INNER JOIN parcs ON villes.ville_id = parcs.fk_ville_id;

-- Requete 3
SELECT 
    