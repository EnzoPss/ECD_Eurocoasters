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
    parc_id INT AUTO_INCREMENT PRIMARY KEY
    nom VARCHAR(50)
    fk_ville_id INT REFERENCES villes(ville_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
    date_ouverture INT
    superficie INT
);


-- Table frequentations
CREATE TABLE frequentations (
    fk_parc_id INT REFERENCES parcs(parc_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
    PRIMARY KEY (annee, fk_parc_id)
    nombre_visiteur INT
);


-- Table constructeurs
CREATE TABLE constructeurs (
    constructeur_id INT PRIMARY KEY
    nom VARCHAR(30)
    fk_ville_id INT REFERENCES villes(ville_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
    adresse VARCHAR(100)
    url_site_web VARCHAR(100)
    url_facebook VARCHAR(100)
    url_instagram VARCHAR(100)
    url_linked_in VARCHAR(100)
    date_creation YEAR
);


-- Table elements
CREATE TABLE elements (
    element_id INT AUTO_INCREMENT PRIMARY KEY
    nom VARCHAR(50)
);


-- Table roallercoasters
CREATE TABLE roallercoasters (
    roallercoaster_id INT AUTO_INCREMENT PRIMARY KEY
    nom VARCHAR(50)
    structure ENUM('acier', 'bois') NOT NULL
    type ENUM('sit down','standup','inverted','suspended','wing','bobsled','flying') DEFAULT NULL
    date_ouverture YEAR
    hauteur DECIMAL(4.1)
    fk_constructeur_id INT REFERENCES constructeurs(constructeur_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
    fk_parc_id INT REFERENCES parcs(parc_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);


-- Table compositions
CREATE TABLE compositions (
    fk_roallercoaster_id INT REFERENCES roallercoasters(roallercoaster_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
    fk_element_id INT REFERENCES elements(element_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
    PRIMARY KEY (fk_rollercoaster_id, fk_element_id)
    nombre INT
);
