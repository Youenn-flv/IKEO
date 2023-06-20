-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : mar. 20 juin 2023 à 12:21
-- Version du serveur : 8.0.33
-- Version de PHP : 8.1.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `IKEO`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id_client` int NOT NULL,
  `type` varchar(15) DEFAULT NULL,
  `raison_social` varchar(100) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `ville` varchar(30) DEFAULT NULL,
  `pays` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id_client`, `type`, `raison_social`, `adresse`, `ville`, `pays`) VALUES
(1, 'Magasin', 'Bo Meuble', 'Place Vendôme', 'Paris', 'France'),
(2, 'Magasin', 'Mobel', 'Porte de Brandebourg', 'Berlin', 'Allemagne'),
(4, 'Magasin', 'Tout A La Maison', 'Rue de la Bastille', 'Paris', 'France'),
(5, 'Magasin', 'Bo Meuble', 'Avenue des Trois Dragons', 'Barcelone', 'Espagne'),
(6, 'Central d\'achat', 'The World Compagny', 'Oxford street', 'Londres', 'Angleterre'),
(7, 'Magasin', 'The Best Greatest Beautifulest Furniture', 'Coven Garden', 'Londres', 'Angleterre'),
(8, 'Magasin', 'Tout à la maison', 'Place Terreaux', 'Lyon', 'France');

-- --------------------------------------------------------

--
-- Structure de la table `factures`
--

CREATE TABLE `factures` (
  `id_facture` int NOT NULL,
  `numero` varchar(6) DEFAULT NULL,
  `date_facture` date DEFAULT NULL,
  `id_client` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `factures`
--

INSERT INTO `factures` (`id_facture`, `numero`, `date_facture`, `id_client`) VALUES
(1, 'MSQ291', '2018-06-15', 1),
(2, 'MSQ292', '2018-06-23', 5),
(3, 'MSQ293', '2018-06-23', 6),
(4, 'MSQ294', '2018-06-28', 1),
(5, 'MSQ295', '2018-07-01', 4),
(6, 'MSQ296', '2018-07-04', 7),
(7, 'MSQ297', '2018-07-12', 2),
(8, 'MSQ298', '2018-08-28', 8);

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id_produit` int NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `refference` varchar(20) DEFAULT NULL,
  `descriptiont` text,
  `statut_abandonne` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id_produit`, `nom`, `refference`, `descriptiont`, `statut_abandonne`) VALUES
(1, 'Knutsen', 'OANT72', 'Table basse pour poser les bières', 0),
(2, 'Moen', 'OANT34', 'Chaise haute de bar', 1),
(3, 'Eide', 'OANT67', 'Porte-serviettes pour 100 serviettes', 0),
(4, 'Gulbrandsen', 'LXAL34', 'Lit nuage en lévitation', 0),
(5, 'Naess', 'LXAL56', 'Table 128 convives', 0),
(6, 'Lund', 'LXAL78', 'Bureau-cafetière électrique', 0),
(7, 'Dahl', 'LXAL12', 'Tiroir à ronds de serviette', 1),
(8, 'Ruud', 'OANT90', 'Bureau-lit combiné', 0),
(9, 'Apfelgluck', 'OANT12', 'Panier à chien (ou à chat)', 0);

-- --------------------------------------------------------

--
-- Structure de la table `produit_facture`
--

CREATE TABLE `produit_facture` (
  `id_produit` int DEFAULT NULL,
  `id_facture` int DEFAULT NULL,
  `quantite` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `produit_facture`
--

INSERT INTO `produit_facture` (`id_produit`, `id_facture`, `quantite`) VALUES
(1, 1, 20),
(2, 1, 30),
(3, 1, 10),
(8, 2, 25),
(4, 2, 32),
(3, 3, 80),
(5, 3, 70),
(6, 3, 60),
(4, 3, 60),
(9, 3, 120),
(7, 3, 90),
(1, 4, 10),
(2, 4, 10),
(6, 4, 30),
(1, 5, 25),
(7, 5, 34),
(2, 6, 40),
(5, 6, 38),
(6, 6, 54),
(4, 7, 20),
(5, 7, 34),
(6, 7, 45),
(5, 8, 18);

-- --------------------------------------------------------

--
-- Structure de la table `sites_produit`
--

CREATE TABLE `sites_produit` (
  `id_site` int DEFAULT NULL,
  `id_produit` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `sites_produit`
--

INSERT INTO `sites_produit` (`id_site`, `id_produit`) VALUES
(1, 1),
(2, 1),
(1, 2),
(2, 2),
(1, 3),
(3, 3),
(3, 4),
(1, 5),
(2, 5),
(3, 5),
(1, 6),
(3, 6),
(2, 7),
(3, 7),
(3, 8),
(3, 9);

-- --------------------------------------------------------

--
-- Structure de la table `site_de_production`
--

CREATE TABLE `site_de_production` (
  `id_site` int NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `ville` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `site_de_production`
--

INSERT INTO `site_de_production` (`id_site`, `nom`, `adresse`, `ville`) VALUES
(1, 'Harald', 'Quai Pipervika', 'Oslo'),
(2, 'Sverre', 'Rue Strangehagen', 'Bergen'),
(3, 'Olaf', 'Place Nidaros', 'Trondheim');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `factures`
--
ALTER TABLE `factures`
  ADD PRIMARY KEY (`id_facture`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id_produit`);

--
-- Index pour la table `produit_facture`
--
ALTER TABLE `produit_facture`
  ADD KEY `id_produit` (`id_produit`),
  ADD KEY `id_facture` (`id_facture`);

--
-- Index pour la table `sites_produit`
--
ALTER TABLE `sites_produit`
  ADD KEY `id_site` (`id_site`),
  ADD KEY `id_produit` (`id_produit`);

--
-- Index pour la table `site_de_production`
--
ALTER TABLE `site_de_production`
  ADD PRIMARY KEY (`id_site`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `factures`
--
ALTER TABLE `factures`
  MODIFY `id_facture` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id_produit` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `site_de_production`
--
ALTER TABLE `site_de_production`
  MODIFY `id_site` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `factures`
--
ALTER TABLE `factures`
  ADD CONSTRAINT `factures_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`);

--
-- Contraintes pour la table `produit_facture`
--
ALTER TABLE `produit_facture`
  ADD CONSTRAINT `produit_facture_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`),
  ADD CONSTRAINT `produit_facture_ibfk_2` FOREIGN KEY (`id_facture`) REFERENCES `factures` (`id_facture`);

--
-- Contraintes pour la table `sites_produit`
--
ALTER TABLE `sites_produit`
  ADD CONSTRAINT `sites_produit_ibfk_1` FOREIGN KEY (`id_site`) REFERENCES `site_de_production` (`id_site`),
  ADD CONSTRAINT `sites_produit_ibfk_2` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
