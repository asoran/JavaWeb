DROP TABLE docs;
CREATE TABLE docs (
	idDoc INTEGER NOT NULL,
	typeDoc INTEGER NOT NULL,
	titre varchar(30) NOT NULL,
	ateur varchar(30) NOT NULL,
	idRef INTEGER NOT NULL,
	PRIMARY KEY(idDoc)
);
--
-- Contenu de la table document
--

INSERT INTO docs (idDoc, typeDoc, titre, auteur) VALUES
(1, 1, 'Harry Potter', 'Altan', 1);
INSERT INTO docs (idDoc, typeDoc, titre, auteur) VALUES
(2, 1, ' Hernani', 'Altan', 2);
INSERT INTO docs (idDoc, typeDoc, titre, auteur) VALUES
(3, 2, 'The greatest showman', 'Altan', 1);
INSERT INTO docs (idDoc, typeDoc, titre, auteur) VALUES
(4, 3, 'Le Labyrinthe', 'Altan', 1);

-- --------------------------------------------------------

--
-- Structure de la table utilisateur
--
DROP TABLE users;
CREATE TABLE users (
	idUser INTEGER NOT NULL,
	login varchar(10) NOT NULL,
	mdp varchar(10) NOT NULL,
	typeUser VARCHAR(15) NOT NULL,
	PRIMARY KEY(idUser)
);
--
-- Contenu de la table utilisateur
--

INSERT INTO users (idUser, login, mdp, typeUser) VALUES
(1, 'bui', 'bui', 'biblio');
INSERT INTO users (idUser, login, mdp, typeUser) VALUES
(2, 'charfi', 'charfi', 'biblio');
INSERT INTO users (idUser, login, mdp, typeUser) VALUES
(3, 'daouya', 'daouya', 'user');
INSERT INTO users (idUser, login, mdp, typeUser) VALUES
(4, 'ouziri', 'ouziri', 'user');

-- --------------------------------------------------------

--
-- Structure de la table emprunt
--
DROP TABLE emprunt;
CREATE TABLE emprunt (
	idDoc INTEGER NOT NULL,
	idUser INTEGER NOT NULL,
	PRIMARY KEY(idDoc, idUser)
);
--
-- Contenu de la table emprunt
--
INSERT INTO emprunt VALUES(1, 1);
INSERT INTO emprunt VALUES(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table Livre
--
DROP TABLE livre;
CREATE TABLE livre(
	idDoc INTEGER NOT NULL,
	dateParution varchar(30) NOT NULL,
	editeur varchar(30) NOT NULL,
	genre varchar(30) NOT NULL,
	PRIMARY KEY(idDoc)
);
--
-- Contenu de la table 
--
INSERT INTO livre VALUES(1, '12/12/12', 'Quelquun', 'roman');
INSERT INTO livre VALUES(2, '12/12/12', 'Quelquun', 'compte');

--
-- Structure de la table CD
--
DROP TABLE cd;
CREATE TABLE cd(
	idDoc INTEGER NOT NULL,
	dateParution varchar(30) NOT NULL,
	editeur varchar(30) NOT NULL,
	genre varchar(30) NOT NULL,
	PRIMARY KEY(idDoc)
);
--
-- Contenu de la CD 
--
INSERT INTO cd VALUES(1, '12/12/12', 'Quelquun', 'roman');

--
-- Structure de la table PDF

DROP TABLE pdf;
CREATE TABLE pdf(
	idDoc INTEGER NOT NULL,
	dateParution varchar(30) NOT NULL,
	editeur varchar(30) NOT NULL,
	genre varchar(30) NOT NULL,
	PRIMARY KEY(idDoc)
);
--
-- Contenu de la PDF 
--
INSERT INTO pdf VALUES(1, '12/12/12', 'Quelquun', 'roman');


-- --------------------------------------------------------

--
-- Structure de la table 
--

--
-- Contenu de la table 
--




