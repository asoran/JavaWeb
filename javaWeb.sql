-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  Dim 25 mars 2018 à 23:49
-- Version du serveur :  10.1.30-MariaDB
-- Version de PHP :  7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `javaWeb`
--

-- --------------------------------------------------------

--
-- Structure de la table `cd`
--

CREATE TABLE `cd` (
  `idDocc` int(11) NOT NULL,
  `longueur` int(20) NOT NULL,
  `quality` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cd`
--

INSERT INTO `cd` (`idDocc`, `longueur`, `quality`) VALUES
(1, 120, 'Blueray'),
(2, 9330, 'DVD-Rip');

-- --------------------------------------------------------

--
-- Structure de la table `docs`
--

CREATE TABLE `docs` (
  `idDoc` int(11) NOT NULL,
  `typeDoc` int(11) NOT NULL,
  `titre` varchar(30) NOT NULL,
  `auteur` varchar(30) NOT NULL,
  `taken` int(11) UNSIGNED DEFAULT NULL,
  `idRef` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `docs`
--

INSERT INTO `docs` (`idDoc`, `typeDoc`, `titre`, `auteur`, `taken`, `idRef`) VALUES
(1, 1, 'Harry Potter', 'Daouya', NULL, 1),
(2, 1, 'Hermione', 'Altan', NULL, 2),
(3, 2, 'The greatest showman', 'Daouya', NULL, 1),
(4, 3, 'Le Labyrinthe', 'Altan', NULL, 1),
(5, 2, 'La vie de Guillaume rourou', 'Altan', 5, 2),
(6, 3, 'Test de PDF', 'Daouya', 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `idDocc` int(11) NOT NULL,
  `dateParution` varchar(30) NOT NULL,
  `editeur` varchar(30) NOT NULL,
  `genre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`idDocc`, `dateParution`, `editeur`, `genre`) VALUES
(1, '12/12/12', 'Quelquun', 'roman'),
(2, '12/12/12', 'Quelquun', 'aventure');

-- --------------------------------------------------------

--
-- Structure de la table `pdf`
--

CREATE TABLE `pdf` (
  `idDocc` int(11) NOT NULL,
  `taille` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pdf`
--

INSERT INTO `pdf` (`idDocc`, `taille`) VALUES
(1, 12),
(2, 322);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `idUser` int(11) NOT NULL,
  `login` varchar(10) NOT NULL,
  `mdp` varchar(10) NOT NULL,
  `typeUser` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`idUser`, `login`, `mdp`, `typeUser`) VALUES
(1, 'bui', 'bui', 'biblio'),
(2, 'charfi', 'charfi', 'biblio'),
(3, 'daouya', 'daouya', 'user'),
(4, 'ouziri', 'ouziri', 'user'),
(5, 'altan', 'soran', 'user');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cd`
--
ALTER TABLE `cd`
  ADD PRIMARY KEY (`idDocc`);

--
-- Index pour la table `docs`
--
ALTER TABLE `docs`
  ADD PRIMARY KEY (`idDoc`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`idDocc`);

--
-- Index pour la table `pdf`
--
ALTER TABLE `pdf`
  ADD PRIMARY KEY (`idDocc`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cd`
--
ALTER TABLE `cd`
  MODIFY `idDocc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `docs`
--
ALTER TABLE `docs`
  MODIFY `idDoc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `livre`
--
ALTER TABLE `livre`
  MODIFY `idDocc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `pdf`
--
ALTER TABLE `pdf`
  MODIFY `idDocc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
