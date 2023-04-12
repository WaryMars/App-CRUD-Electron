-- phpMyAdmin SQL Dump
-- version 5.1.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql-wall-it.alwaysdata.net
-- Generation Time: Apr 12, 2023 at 09:14 AM
-- Server version: 10.6.11-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wall-it_wallidb`
--
CREATE DATABASE IF NOT EXISTS `wall-it_wallidb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `wall-it_wallidb`;

-- --------------------------------------------------------

--
-- Table structure for table `adresse_utilisateur`
--

CREATE TABLE `adresse_utilisateur` (
  `id` int(11) NOT NULL,
  `code_postal` varchar(50) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `pays` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adresse_utilisateur`
--

INSERT INTO `adresse_utilisateur` (`id`, `code_postal`, `ville`, `pays`) VALUES
(1, '97420', 'Petite Ile', 'La Réunion'),
(2, '97420', 'Petite Ile', 'La Réunion'),
(3, '97410', 'Saint Pierre', 'La Réunion'),
(4, '97410', 'Saint Pierre', 'La Réunion'),
(5, '97420', 'Petite Ile', 'La Réunion'),
(6, '18256', 'Marseille', 'France'),
(7, '97450', 'Saint Louis', 'La Réunion');

-- --------------------------------------------------------

--
-- Table structure for table `catalogue_tous`
--

CREATE TABLE `catalogue_tous` (
  `Nom de la catégorie` varchar(50) DEFAULT NULL,
  `Nom du produit` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `catalogue_tous1`
--

CREATE TABLE `catalogue_tous1` (
  `Nom de la catégorie` varchar(50) DEFAULT NULL,
  `Nom du produit` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `nom_categorie` varchar(50) NOT NULL,
  `description_categorie` varchar(50) DEFAULT NULL,
  `image_categorie` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `nom_categorie`, `description_categorie`, `image_categorie`) VALUES
(1, 'Boitiers', NULL, 'https://media.ldlc.com/r374/ld/products/00/05/44/67/LD0005446783_2.jpg'),
(2, 'Alimentations', NULL, 'https://media.ldlc.com/r374/ld/products/00/04/18/09/LD0004180936_2_0004293075.jpg'),
(3, 'Carte Mère', NULL, 'https://media.ldlc.com/r374/ld/products/00/05/65/78/LD0005657847_2.jpg'),
(4, 'Processeur', NULL, 'https://media.ldlc.com/r374/ld/products/00/05/80/46/LD0005804639_1_0005830337.jpg'),
(5, 'Carte Graphique', NULL, 'https://media.ldlc.com/r374/ld/products/00/05/97/11/LD0005971130.jpg'),
(6, 'Disque dur', NULL, 'https://media.ldlc.com/r374/ld/products/00/05/69/47/LD0005694752_1.jpg'),
(7, 'Barette de mémoire', NULL, 'https://media.ldlc.com/r374/ld/products/00/05/75/33/LD0005753383_1.jpg'),
(8, 'Refroidissement', NULL, 'https://media.ldlc.com/r374/ld/products/00/05/45/45/LD0005454525_2.jpg'),
(9, 'Carte réseau', NULL, 'https://media.ldlc.com/r374/ld/products/00/05/93/29/LD0005932954_1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `prix_total` int(11) NOT NULL,
  `date_commande` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `compte_bancaire`
--

CREATE TABLE `compte_bancaire` (
  `id` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `num_carte_bleu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fiche_technique`
--

CREATE TABLE `fiche_technique` (
  `id` int(11) NOT NULL,
  `id_prod_fiche_technique` int(11) NOT NULL,
  `nom_prod_ft` varchar(50) DEFAULT NULL,
  `marque` varchar(50) DEFAULT NULL,
  `modele` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `id_categorie_prod` int(11) NOT NULL,
  `id_commande_prod` int(11) DEFAULT NULL,
  `nom_prod` varchar(50) NOT NULL,
  `description_produit` varchar(500) DEFAULT NULL,
  `prix` decimal(7,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`id`, `id_categorie_prod`, `id_commande_prod`, `nom_prod`, `description_produit`, `prix`, `stock`, `image`) VALUES
(2, 1, NULL, 'test', 'The be quiet! Pure Base 500DX is a mid-tower case with a quiet design that allows you to assemble almost any configuration based on a mini-ITX, micro-ATX or ATX motherboard. The ARGB backlighting also adds a touch of gaming to the case.', '136.95', 9, 'https://media.ldlc.com/bo/images/fiches/bo%C3%AEtier_pc/be%20quiet/pure_base_500/bequiet_500dx.jpg'),
(4, 1, NULL, 'Fractal Design Meshify c tg (noir)', 'Intelligemment conçu, le boîtier Meshify C de Fractal Design s\'adresse avant tout à toutes les personnes recherchant un boîtier silencieux prêt à recevoir un système puissant et expansible de refroidissement par air ou par liquide mais également à ceux qui recherche un boîtier au look ravageur.', '139.96', 2, 'https://media.ldlc.com/r1600/ld/products/00/04/58/61/LD0004586193_2.jpg'),
(5, 1, NULL, 'Corsai Obsidian 1000D noir', 'Exceptionnel en tout point, le boîtier Corsair Obsidian 1000D \"super tour\" bénéficie d\'un design sublime et de fonctionnalités ultra-avancées. Il a l\'incroyable capacité d\'héberger deux systèmes simultanément et dispose d\'un éclairage RGB totalement contrôlable.', '899.95', 0, 'https://media.ldlc.com/bo/images/fiches/bo%C3%AEtier_pc/corsair/obsidian_1000d/corsair_obsidian_1000d_001.jpg'),
(6, 2, NULL, 'Corsair cv550 80 PLUS bronze', 'L\'alimentation Corsair CV550 80PLUS Bronze bénéficie d\'un câblage gainé noir pour s\'intégrer en toute discrétion dans votre boitier. Les alimentations de la gamme Corsair CV sont idéales pour votre nouvel ordinateur grâce à leur certification 80 PLUS Bronze qui permet de fournir des tensions stables', '59.95', 10, 'https://media.ldlc.com/r1600/ld/products/00/05/58/53/LD0005585368_2.jpg'),
(7, 2, NULL, 'Be quiet ! Pure power 11 600w cm 80 plus gold', 'L\'alimentation PC be quiet! Pure Power 11 600W CM 80PLUS Gold est une valeur sûre pour la conception de votre PC. Modulaire, silencieuse, fiable et efficace (80PLUS Gold), elle représente une solution de premier choix pour les intégrateurs, pour la conception d\'un PC multimédia ou d\'un PC Gamer.', '96.95', 19, 'https://media.ldlc.com/r1600/ld/products/00/05/11/82/LD0005118262_2.jpg'),
(8, 2, NULL, ' Corsair CX750f RGB 80 Plus bronze (noir)', 'Les blocs d\'alimentation entièrement modulaires Corsair CX-F RGB Series fournissent une alimentation 80 PLUS Bronze efficace et durable à votre système. Vous profitez également d\'un éclairage personnalisable dynamique grâce à un ventilateur RGB de 120 mm.', '109.94', 20, 'https://media.ldlc.com/r1600/ld/products/00/05/77/00/LD0005770065_1.jpg'),
(9, 2, NULL, 'Corsair atx1600i 80 plus titanium', 'L\'AX1600i de Corsair garantit une alimentation efficace 80 PLUS Titanium continue et ultra stable de 1600 W. Avec son fonctionnement silencieux et ses composants haut de gamme, vous découvrirez une alimentation puissante entièrement modulaire aux performances électriques de classe mondiale.', '699.95', 2, 'https://media.ldlc.com/bo/images/fiches/alimentation/corsair/ax1600i/texte1.jpg'),
(10, 2, NULL, 'COOLER MASTER XG850 PLUS PLATINIUM', 'L\'alimentation XG Plus Platinum de Cooler Master est certifiée 80 PLUS Platinum et offre des performances haut de gamme avec des exigences de température réduites. Ce bloc d\'alimentation offre un câblage 100% modulaire, un ventilateur silencieux de 135 mm et un mode de contrôle thermique avancé.', '254.95', 0, 'https://media.ldlc.com/r1600/ld/products/00/05/96/71/LD0005967155.jpg'),
(11, 4, NULL, 'AMD ryzen 3 3200G wraith stealh edition', 'Le processeur AMD Ryzen 3 3200G Wraith Stealth (3.6 GHz / 4 GHz) est basé sur l\'architecture Zen+ gravée en 12 nm. Cette deuxième génération Ryzen avec graphismes Radeon Vega 8 se dote de 4 coeurs, des fréquences revues à la hausse avec de base 3.6 GHz et jusqu\'à 4 GHz.', '149.95', 17, 'https://media.ldlc.com/r1600/ld/products/00/05/36/84/LD0005368402_2.jpg'),
(12, 4, NULL, 'intel core i7-12700K', 'Avec les processeurs Alder Lake, Intel signe une petite révolution dans le monde de l\'architecture x86 en adoptant une technologie hybride basée sur 2 types de coeurs différents assemblés au sein d\'une même puce : Les Performances-Cores et les Efficient-Cores.', '569.95', 9, 'https://media.ldlc.com/r1600/ld/products/00/05/90/01/LD0005900190_1.jpg'),
(13, 4, NULL, 'Intel core I5-13600Kf', 'Des jeux fluides et un PC qui ne ralentit pas. En offrant encore plus de puissance pour les programmes exigeants et les jeux et plus de coeurs pour les tâches de fond, les processeurs Intel Core de 13ème génération vous permettent de faire encore plus de choses et encore plus rapidement.', '375.96', 0, 'https://media.ldlc.com/r1600/ld/products/00/05/98/20/LD0005982085.jpg'),
(14, 4, NULL, 'amd ryzen 7 5800X', 'Le processeur AMD Ryzen 7 5800X est optimisé pour le jeu vidéo : 8 Cores, 16 Threads et GameCache 36 Mo. Sans parler des fréquences natives et boost qui atteignent des sommets pour vous permettre de profiter de vos jeux préférés dans les meilleures conditions.', '429.95', 19, 'https://media.ldlc.com/r1600/ld/products/00/05/74/60/LD0005746000_1.jpg'),
(15, 4, NULL, 'intel core i9-9900k ', 'Plus de Core, plus de cache et des fréquences Turbo ultra-élevées sont les atouts majeurs de la 9ème génération de processeur Intel Core Coffee Lake Refresh', '829.00', 10, 'https://media.ldlc.com/r1600/ld/products/00/05/04/92/LD0005049208_2.jpg'),
(16, 5, NULL, 'Amd radeon rx 6950 XT', 'Mettez toutes les chances de votre côté grâce aux cartes graphiques AMD Radeon RX 6950 XT, avec des technologies de pointe pour : améliorer les performances de jeu, proposer des graphismes à couper le souffle et garantir une fluidité d\'affichage optimale.', '1149.00', 10, 'https://www.amd.com/system/files/2022-04/1303168-AMD-Radeon-RX-6950-XT-angled-1260x709.png'),
(17, 5, NULL, 'ASROCK AMD RADEON RX 6600 challenger itx 8go', 'Basée sur l\'architecture AMD RDNA 2 et prenant en charge le ray tracing, la carte graphique ASRock AMD Radeon RX 6600 Challenger ITX 8GB vous propose de jouer dans les meilleures conditions avec des graphismes sublimes et une fluidité remarquable. C\'est LA carte graphique pour jouer en Full HD.', '679.95', 1, 'https://media.ldlc.com/r1600/ld/products/00/05/90/12/LD0005901247_1.jpg'),
(18, 5, NULL, 'Asus dual geforce rtx 370 o8g', 'La carte graphique ASUS GeForce RTX Dual 3070 O8G V2 (LHR) embarque 8 Go de mémoire vidéo de nouvelle génération GDDR6. Ce modèle overclocké d\'usine bénéficie de fréquences de fonctionnement élevées et d\'un système de refroidissement amélioré gage de fiabilité et de performances à long terme.', '699.95', 9, 'https://dlcdnwebimgs.asus.com/gain/af0aa3bc-5575-48bd-8b9a-2182830e80e6/'),
(19, 5, NULL, 'Nvidia Geforce gtx 1050 ti 4go', 'La carte graphique Gigabyte GeForce GTX 1050 Ti OC 4G est conçue pour permettre aux joueurs occasionnels ou assidus de profiter d\'un affichage fluide et rapide en Haute Définition. Profitez des derniers jeux PC avec un rendu graphique superbe sans vous ruiner. Concevez un PC Gaming peu onéreux et bénéficiant d\'un rapport performances / prix imbattable. ', '89.98', 0, 'https://media.ldlc.com/r1600/ld/products/00/04/01/32/LD0004013273_2.jpg'),
(20, 5, NULL, 'msi geforce rtx 3090 TI suprim x 24go', 'Jouez en 8K HDR et streamez comme un pro avec la carte graphique gaming ultra-haut de gamme NVIDIA GeForce RTX 3090 Ti. Le nouveau monstre de NVIDIA vous permettra de profiter au mieux des derniers jeux PC en ultra-haute résolution avec tous les détails au maximum.', '2049.95', 29, 'https://media.ldlc.com/r1600/ld/products/00/05/94/32/LD0005943242.jpg'),
(21, 3, NULL, 'Gygabyte Z690 gaming x', 'Basée sur le chipset Intel Z690 Express, la carte mère Gigabyte Z690 GAMING X DDR4 servira de base à votre PC Gaming équipé d\'un processeur performant et doté de fonctionnalités exclusives Gigabyte. Elle prend en charge les processeurs Intel Core 12ème génération.', '270.97', 10, 'https://media.ldlc.com/r1600/ld/products/00/05/90/37/LD0005903720_1.jpg'),
(22, 3, NULL, 'ASROCK A320M pro4-f', 'Basée sur le chipset AMD AM4, la carte mère ASRock A320M Pro4-F est conçue pour accueillir les processeurs AMD Ryzen. Elle permettra l\'assemblage d\'une configuration Multimédia ou bureautique à moindre coût tout étant équipée d\'un processeur performant et en conservant une taille réduite.', '77.95', 1, 'https://media.ldlc.com/r1600/ld/products/00/05/65/78/LD0005657847_2.jpg'),
(23, 3, NULL, 'ASROCK A520M phantom gaming 4', 'La carte mère ASRock A520M Phantom Gaming 4 est conçue pour accueillir les processeurs AMD Ryzen 3ème génération et supérieurs sur socket AM4. Elle permettra l\'assemblage d\'une configuration puissante et polyvalente capable de s\'acquitter de toutes les tâches.', '94.94', 0, 'https://media.ldlc.com/r1600/ld/products/00/05/74/98/LD0005749830_1.jpg'),
(24, 3, NULL, 'Asus tuf gaming b550-plus', 'Prête à accueillir les processeurs AMD Ryzen de 3ème génération (nom de Core Matisse), la carte mère ASUS TUF GAMING B550-PLUS est idéale pour concevoir un PC Gaming performant et équilibré. Le support du PCI-Express 4.0 vous emmène vers de nouveaux sommets.', '158.95', 20, 'https://media.ldlc.com/r1600/ld/products/00/05/68/67/LD0005686754_1.jpg'),
(25, 3, NULL, 'MSI MAG z TOMAHAWK', 'La carte mère MSI MAG Z490 TOMAHAWK a été pensée pour rappeler le monde militaire. Pour une expérience d\'utilisation optimale, elle propose un panneau E/S préinstallé et un dissipateur au format agrandi qui assure un refroidissement parfait. La carte mère Z490 Tomahawk est un modèle robuste et garant d\'une durée de vie prolongée, idéale pour les joueurs qui veulent dominer la partie.', '342.94', 8, 'https://media.ldlc.com/r150/ld/products/00/05/66/79/LD0005667929_2.jpg'),
(26, 1, NULL, 'be quiet! Pure Base 500 (Blanc) ', 'Le be quiet! Pure Base 500 est un boitier moyen tour avec une conception pensée pour le silence et qui vous permet d\'assembler presque toutes les configurations en se basant sur une carte mère mini-ITX, micro-ATX ou ATX grâce à son espace intérieur optimisé.', '109.95', 12, 'https://media.ldlc.com/r374/ld/products/00/05/46/05/LD0005460572_2.jpg'),
(27, 1, NULL, 'be quiet! Pure Base 500 Window (Blanc) ', 'Le be quiet! Pure Base 500 Window est un boitier moyen tour avec une conception pensée pour le silence et qui vous permet d\'assembler presque toutes les configurations en se basant sur une carte mère mini-ITX, micro-ATX ou ATX grâce à son espace intérieur optimisé.', '121.95', 3, 'https://media.ldlc.com/r374/ld/products/00/05/46/03/LD0005460377_2.jpg'),
(28, 1, NULL, 'Zalman S4 Plus', 'Sobre et élégant, le boîtier Zalman S4 Plus dévoile ses belles qualités en intégrant votre environnement quotidien. 8 emplacements pour ventilateur 120 mm, grille mesh, fenêtre en acrylique et volume interne optimal serviront votre config rêvée !', '59.95', 7, 'https://media.ldlc.com/r1600/ld/products/00/05/59/06/LD0005590629_2.jpg'),
(29, 1, NULL, 'Antec DF800 FLUX Noir ', 'Optimisez les performances de votre PC avec le boîtier Antec DF800 Flux et son refroidissement supérieur, son volume interne idéal et son design géométrique atypique. Equipé de 5 ventilateurs dont 3 exemplaires ARGB, ce modèle Moyen Tour vous assurera une expérience des plus agréables.', '119.95', 6, 'https://media.ldlc.com/r374/ld/products/00/05/95/58/LD0005955890.jpg'),
(30, 1, NULL, 'Aerocool Rift (blanc) ', 'Le boîtier Aerocool Rift est un boîtier moyen tour haute performance intégrant une fenêtre latérale en acrylique et des LEDs RGB en façade ainsi que 7 emplacements pour ventilateurs de 120 mm (dont 1 fourni) pou un refroidissement efficace en toutes circonstances !', '69.95', 2, 'https://media.ldlc.com/r374/ld/products/00/05/44/77/LD0005447767_2.jpg'),
(31, 2, NULL, 'Corsair CX750F RGB 80PLUS Bronze (Noir) ', 'Les blocs d\'alimentation entièrement modulaires Corsair CX-F RGB Series fournissent une alimentation 80 PLUS Bronze efficace et durable à votre système. Vous profitez également d\'un éclairage personnalisable dynamique grâce à un ventilateur RGB de 120 mm.', '109.95', 8, 'https://media.ldlc.com/r374/ld/products/00/05/77/00/LD0005770064_1.jpg'),
(32, 2, NULL, 'be quiet! Pure Power 11 FM 750W 80PLUS Gold ', 'La Pure Power 11 FM 750W signée Be Quiet ! propose une certification 80+ Gold, une modularité complète, un fonctionnement silencieux et la fiabilité avec son convertisseur DC/DC. Que vous souhaitiez assembler un système hautement silencieux, mettre à niveau votre PC ou construire un système gaming.', '122.95', 10, 'https://media.ldlc.com/r374/ld/products/00/05/82/46/LD0005824643_1.jpg'),
(33, 2, NULL, 'be quiet! Straight Power 11 850W 80PLUS Platinum ', 'L\'alimentation modulaire be quiet! Straight Power 11 Platinum offre un fonctionnement silencieux sans compromis au niveau de la qualité. Certifiée 80PLUS Platinum, elle offre un très haut rendement énergétique. Un choix idéal pour les configurations silencieuses et les configurations gaming.', '189.95', 2, 'https://media.ldlc.com/r374/ld/products/00/05/57/78/LD0005577820_2_0005577852.jpg'),
(34, 2, NULL, 'Thermaltake Smart RGB 500W ', 'Dotée de la certification 80 PLUS 230V, l\'alimentation Thermaltake Smart RGB 500W est un modèle qui intègre un ventilateur RGB silencieux pour un refroidissement efficace et une touche esthétique très agréable. L\'alimentation Smart RGB se placera comme un acteur majeur de votre PC.', '54.95', 6, 'https://media.ldlc.com/r374/ld/products/00/04/83/19/LD0004831946_2.jpg'),
(35, 2, NULL, 'Corsair CX750F RGB 80PLUS Bronze (Blanc) ', 'Corsair CX750F RGB 80PLUS Bronze (Blanc) ', '109.95', 15, 'https://media.ldlc.com/r374/ld/products/00/05/77/01/LD0005770115_1.jpg'),
(36, 3, NULL, 'ASRock Fatal1ty B450 Gaming K4 ', 'Basée sur le chipset AMD B450, la carte mère ASRock Fatal1ty B450 Gaming K4 est conçue pour accueillir les processeurs AMD Ryzen. Elle permettra l\'assemblage d\'une configuration Gaming équipée d\'un processeur performant et dotée de fonctionnalités exclusives ASRock.', '107.95', 3, 'https://media.ldlc.com/r374/ld/products/00/04/96/99/LD0004969968_2.jpg'),
(37, 3, NULL, 'ASUS TUF GAMING B560-PLUS WIFI ', 'La carte mère ASUS TUF GAMING B560-PLUS WIFI est conçue pour accueillir les processeurs Intel de 10ème & 11ème génération sur socket LGA 1200. Elle permettra l\'assemblage d\'une configuration gaming en proposant une connectivité PCIe 4.0 et USB 3.1.', '169.95', 6, 'https://media.ldlc.com/r374/ld/products/00/05/80/67/LD0005806766_1.jpg'),
(38, 3, NULL, 'ASUS TUF GAMING B450-PLUS II ', 'La carte mère ASUS TUF GAMING B450-PLUS II est idéale pour concevoir un PC basé sur un processeur AM4 Ryzen 1000/2000/3000 ou Athlon 200/3000. Votre PC sera performant et capable de tout faire : Multimédia, bureautique et même Jeux vidéo !', '113.95', 4, 'https://media.ldlc.com/r374/ld/products/00/05/76/78/LD0005767897_1.jpg'),
(39, 3, NULL, 'MSI MAG B560 TORPEDO', 'La MSI MAG B560 TORPEDO est conçue pour accueillir les processeurs Intel de 10ème génération et 11ème génération sur socket LGA 1200. Elle permettra l\'assemblage d\'une configuration puissante et polyvalente capable de s\'acquitter de toutes les tâches.', '205.95', 7, 'https://media.ldlc.com/r374/ld/products/00/05/81/85/LD0005818569_1.jpg'),
(40, 5, NULL, 'Gigabyte GeForce RTX 4090 XTREME WATERFORCE 24G ', 'La carte graphique NVIDIA GeForce RTX 4090 offre une rapidité extrême pour les joueurs comme pour les créateurs. Avec des performances hors norme et des capacités graphiques améliorées par Intelligence Artificielle, ce nouveau monstre de puissance vous permettra de plonger au coeur de l\'action.', '2499.95', 3, 'https://media.ldlc.com/r374/ld/products/00/05/98/48/LD0005984833.jpg'),
(41, 5, NULL, 'ASRock AMD Radeon RX 6650 XT Phantom Gaming D 8GB', 'Mettez toutes les chances de votre côté grâce aux cartes graphiques AMD Radeon RX 6650 XT, avec des technologies de pointe pour : améliorer les performances de jeu, proposer des graphismes à couper le souffle et garantir une fluidité d\'affichage optimale.', '599.95', 15, 'https://media.ldlc.com/r374/ld/products/00/05/95/22/LD0005952253.jpg'),
(42, 5, NULL, 'ASUS ROG STRIX GeForce RTX 3070 Ti O8G', 'La carte graphique ASUS GeForce ROG STRIX RTX 3070 Ti O8G GAMING embarque 8 Go de mémoire vidéo de nouvelle génération GDDR6X. Ce modèle overclocké d\'usine bénéficie de fréquences de fonctionnement élevées et d\'un système de refroidissement amélioré gage de fiabilité et de performances à long terme.', '869.95', 12, 'https://media.ldlc.com/r374/ld/products/00/05/84/19/LD0005841930_1.jpg'),
(43, 5, NULL, 'ASUS ROG Strix LC GeForce RTX 3090 Ti OC Edition', 'Jouez en 8K HDR et streamez comme un pro avec la carte graphique gaming ultra-haut de gamme NVIDIA GeForce RTX 3090 Ti. Le nouveau monstre de NVIDIA vous permettra de profiter au mieux des derniers jeux PC en ultra-haute résolution avec tous les détails au maximum.', '1799.95', 3, 'https://media.ldlc.com/r374/ld/products/00/05/94/45/LD0005944563.jpg'),
(44, 6, NULL, 'Seagate BarraCuda 1 To (ST1000DM010) ', 'Optez pour une grande capacité de stockage avec le disque dur Seagate BarraCuda 1 To. Cette gamme domine le marché en proposant les meilleures capacités pour les ordinateurs de bureau et périphériques mobiles. Ces disques conviennent parfaitement aux mises à niveau et à tous les budgets.', '59.95', 16, 'https://media.ldlc.com/r374/ld/products/00/05/49/47/LD0005494731_2.jpg'),
(45, 6, NULL, 'Seagate BarraCuda 6 To (ST6000DM003)', 'Optez pour une grande capacité de stockage avec le disque dur Seagate BarraCuda 6 To. Cette gamme domine le marché en proposant les meilleures capacités pour les ordinateurs de bureau et périphériques mobiles. Ces disques conviennent parfaitement aux mises à niveau et à tous les budgets.', '169.95', 12, 'https://media.tenor.com/u9XnPveDa9AAAAAM/rick-rickroll.gif'),
(46, 6, NULL, 'Samsung SSD 980 M.2 PCIe NVMe 1 To', 'Le disque SSD 980 1 To de Samsung permet de transcender les performances et la réactivité de votre machine. Bénéficiant de vitesses de transfert élevées et d\'une excellente endurance, le Samsung 980 au format M.2 2280 s\'appuie sur l\'interface PCI-E 3.0 x4 ainsi que sur la technologie NVMe.', '99.95', 11, 'https://media.ldlc.com/r374/ld/products/00/05/79/93/LD0005799307_1.jpg'),
(47, 6, NULL, 'Crucial BX500 500 Go ', 'Le SSD Crucial BX500 500 Go dispose d\'une bonne capacité de stockage et une technologie mémoire NAND 3D Micron pour un coût abordable. Il est conçu pour les particuliers qui recherchent à mettre à niveau leur PC, pour leur permettre de gagner en vitesse et en réactivité.', '52.96', 9, 'https://media.ldlc.com/r374/ld/products/00/05/00/24/LD0005002489_2_0005969488.jpg'),
(48, 6, NULL, 'Samsung SSD 980 PRO M.2 PCIe NVMe 1 To ', 'Le disque SSD 980 PRO 1 To de Samsung permet de métamorphoser les performances et la réactivité de votre machine. Bénéficiant de vitesses stratosphériques et d\'une endurance très élevée, le Samsung 980 PRO s\'appuie sur l\'interface PCI-E 4.0 x4 ainsi que sur la technologie NVMe 1.3c.', '154.96', 5, 'https://media.ldlc.com/r374/ld/products/00/05/73/74/LD0005737471_1.jpg'),
(49, 6, NULL, 'Samsung SSD 870 QVO 2 To ', 'Grande fiabilité, capacité de stockage de 1 à 8 To, vitesses supérieures, le disque SSD 870 QVO signé Samsung affirme son potentiel une fois installé dans votre ordinateur ! Porté par la technologie V-NAND et le contrôleur MKX basé sur l\'algorithme ECC, ce modèle se montre fiable et performant.', '209.00', 6, 'https://media.ldlc.com/r374/ld/products/00/05/69/47/LD0005694761_1.jpg'),
(50, 7, NULL, 'Textorm 16 Go (2x 8 Go) DDR4 2666 MHz CL19 ', 'La RAM Textorm 16 Go (2x 8 Go) DDR4 2666 MHz CL19 est idéale pour l\'intégration ou pour réaliser un upgrade PC. Cette mémoire vive abordable et performante fonctionne à une tension nominale de 1.2 Volts et est équipée de radiateurs pour une meilleure dissipation de la chaleur.', '75.95', 6, 'https://media.ldlc.com/r374/ld/products/00/05/75/36/LD0005753605_1.jpg'),
(51, 7, NULL, 'Corsair Vengeance LPX 32 GoDDR4 3200 MHz CL16 ', 'Avec la nouvelle gamme de mémoires PC haut de gamme Vengeance LPX Series, Corsair propose des solutions stables et performantes pour les plateformes nouvelle génération avec en prime un fort potentiel d\'overclocking.', '149.00', 20, 'https://media.ldlc.com/r374/ld/products/00/05/31/99/LD0005319901_2.jpg'),
(52, 7, NULL, 'Kingston FURY Beast 16 Go DDR4 3200 MHz CL16 ', 'La mémoire PC Kingston FURY Beast DDR4 apporte une puissante augmentation des performances pour les jeux, l\'édition vidéo et le rendu avec des vitesses allant jusqu\'à 3733 MHz. Cette mise à niveau rentable est disponible à des vitesses de 2666 MHz à 3733 MHz avec des latences CL15 à 19.', '79.94', 15, 'https://media.ldlc.com/r374/ld/products/00/05/86/98/LD0005869812_1.jpg'),
(54, 7, NULL, 'Corsair Vengeance RGB RS 16 Go DDR4 3200 MHz CL16 ', 'La mémoire RAM DDR4 Corsair Vengeance RGB RS renforce l\'esthétique de votre PC tout en offrant des performances exceptionnelles. Un PCB personnalisé offre une qualité de signal élevée pour des performances et une stabilité exceptionnelles sur les dernières cartes mères Intel et AMD DDR4.', '195.94', 19, 'https://media.ldlc.com/r374/ld/products/00/05/87/36/LD0005873659_1.jpg'),
(55, 7, NULL, 'G.Skill RipJaws 5 16 Go DDR4 3600 MHz CL18 ', 'La nouvelle gamme G.Skill RipJaws 5 propose des solutions aux performances incroyables. Ces kits optimiseront les performances des plateformes de nouvelle génération, avec en prime, un fort potentiel d\'overclocking.', '84.96', 21, 'https://media.ldlc.com/r374/ld/products/00/03/19/09/LD0003190951_2_0003191072_0003446197_0003446278_0003446318_0003446418_0005467318_0005467328.jpg'),
(56, 8, NULL, 'be quiet! Dark Rock 4 ', 'Le Dark Rock 4 de Be Quiet! est la nouvelle itération du constructeur Allemande de son fer de lance en matière de ventirad. Au menu de cette nouvelle version, plus de performances, un montage facilité tout cela dans un silence de fonctionnement toujours aussi impeccable avec un SilentWings 135mm.', '78.95', 5, 'https://media.ldlc.com/r374/ld/products/00/04/87/26/LD0004872697_2.jpg'),
(57, 8, NULL, 'be quiet! Dark Rock Slim ', 'Le Dark Rock Slim de be quiet! offre des performances de refroidissement exceptionnellement élevées de 180 W TDP et un fonctionnement quasi inaudible. Il est donc idéal pour toutes les configurations haut de gamme qui présentent un espace limité.', '64.95', 7, 'https://media.ldlc.com/r374/ld/products/00/05/31/01/LD0005310170_2.jpg'),
(58, 8, NULL, 'be quiet! Pure Loop 360 mm ', 'Le Pure Loop 360 mm est la solution de watercooling tout-en-un silencieuse et performante signée be quiet! pour les utilisateurs qui veulent profiter d\'un prix accessible et qui ne souhaitent pas spécialement overclocké leur système.', '139.95', 9, 'https://media.ldlc.com/r374/ld/products/00/05/73/47/LD0005734772_1.jpg'),
(59, 8, NULL, 'be quiet! Pure Rock 2 Black ', 'Le ventirad Pure Rock 2 Black est destiné aux configurations puissantes, multimédia et gaming, qui ne veulent être et rester silencieuses. Il offre un excellent rapport performances/prix avec une efficacité de refroidissement de 150 W TDP, quatre caloducs 6 mm, un ventilateur Pure Wings 2 120 mm PWM', '44.95', 9, 'https://media.ldlc.com/r374/ld/products/00/05/67/87/LD0005678767_1.jpg'),
(61, 8, NULL, 'be quiet! Pure Wings 2 120mm High-Speed ', 'Les modèles Pure Wings 2 sont les dignes descendants des Silents Wings et Shadow Wings, maintes fois récompensés par la presse. De nombreuses améliorations ont été portées à la gamme pour parvenir à l\'objectif ultime d\'allier performances et silence d\'or.', '11.95', 35, 'https://media.ldlc.com/r374/ld/products/00/05/18/94/LD0005189490_2.jpg'),
(62, 8, NULL, 'Aerocool Frost 12', 'Le ventilateur Frost 12 d\'Aerocool est un modèle de 120 mm avec connecteur Molex + à 3 broches. Il est doté d\'un élégant design d\'éclairage LED RGB fixe qui ajoute une touche de style supplémentaire à votre configuration. Il est équipé de pales incurvées qui augmente la pression d\'air...', '5.90', 51, 'https://media.ldlc.com/r374/ld/products/00/05/40/27/LD0005402795_2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `id_adresse` int(11) DEFAULT NULL,
  `id_commande` int(11) DEFAULT NULL,
  `identifiant_utilisateur` varchar(50) NOT NULL,
  `nom_utilisateur` varchar(50) NOT NULL,
  `prenom_utilisateur` varchar(50) NOT NULL,
  `mail_utilisateur` varchar(50) NOT NULL,
  `tel_utilisateur` varchar(50) NOT NULL,
  `mdp_utilisateur` varchar(255) NOT NULL,
  `admin` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `ville` varchar(100) NOT NULL,
  `pays` varchar(100) NOT NULL,
  `code_postal` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `id_adresse`, `id_commande`, `identifiant_utilisateur`, `nom_utilisateur`, `prenom_utilisateur`, `mail_utilisateur`, `tel_utilisateur`, `mdp_utilisateur`, `admin`, `ville`, `pays`, `code_postal`) VALUES
(3, NULL, NULL, 'Warz', 'Carpy', 'Benjamin', 'benjamin.carpy@gmail.com', '0692346919', 'hdehgbfcedhf', 0, '', '', ''),
(4, NULL, NULL, 'Gazo ', 'Houmadi', 'Hilani', 'gazo@gmail.com', '021252154', 'eiuhtjzehc95467¤⁻@', 0, '', '', ''),
(5, NULL, NULL, '-+-', 'PERRAULT', 'Lucas', 'MonMail@gmail.com', '0693816203', 'ouioui', 0, '', '', ''),
(6, NULL, NULL, 'GTAline', 'GARDEAU', 'Garrisson', 'G.garrisson@gmail.com', '02568920', 'GGARDEAU50', 0, '', '', ''),
(7, NULL, NULL, 'Dtm626', 'darren', 'mellon', 'darren.mellon626@gmail.com', '0693118277', 'jesaispas', 0, '', '', ''),
(8, NULL, NULL, 'a.kassir', 'Abdel', 'Kassir', 'knfj@gmail.com', '0692004875', '1234', 0, '', '', ''),
(9, NULL, NULL, 'admin', 'Hmd', 'Ilan', 'admin@gmail.com', '0692004875', '97410', 0, '', '', ''),
(10, NULL, NULL, 'enor', 'ygj', 'fhyg', 'jkj@tyg.re', '55265484', '0000', 0, '', '', ''),
(11, NULL, NULL, 'sfg', 'dfg', 'Kassir', 'knfj@gmail.com', '55265484', '575', 0, '', '', ''),
(14, NULL, NULL, 'al', 'abdallah', 'Attoumani', 'lali@info.re', '0692178598', '$2y$10$qEG/9sdfQbUjJg8LqbMXx.Ow.HSMZ8uIDIISRTkBd7KreMxFtLvoS', 0, '', '', ''),
(15, NULL, NULL, 'Bazzoka', 'louis', 'mili', 'b@info.re', '0692132458', '$2y$10$hpLu.tpxDA/c8wnKPYUE3OaQpIjHdsFeMmUQzOa8jpYBm6fHBkRA2', 1, '', '', ''),
(18, NULL, NULL, 'falijky', 'ippupa', 'bizi', 'fali@gmail.com', '998987878', '$2y$10$lJG2o2s4FVvJnl6m3GsRjeJybiB8m5MA565k3mXfpVvG942TXE.I6', 0, '', '', ''),
(19, NULL, NULL, 'jean976', 'Dujardin', 'Jean', 'b@info.re', '965230', '$2y$10$sdynwyi6yYDX5VDbL5zqpekd3W7zHE8aAfxsLbJ8gtl6cLTHUl47W', 0, '', '', ''),
(20, NULL, NULL, 'btssio', 'Combe', 'P', 'pcombe@info.re', '', '$2y$10$3UgGYexrNPkCiu1n0yp9iehF9U9eeHsl9JHJF5IZQUjlQeYSXWohe', 0, '', '', ''),
(21, NULL, NULL, 'fgv', ' vb vbh', 'tfy,fy', 'test@gmail.com', '', '$2y$10$DEiQcAcIY3NQs8BhFzYGm.YYw1uXzGkVI.NQ6fxPCu1ayH1mmXgn6', 0, '', '', ''),
(22, NULL, NULL, '', '', '', 'admin@info.re', '', '$2b$10$p.2z3.SAekdA0RpT7mpqW.a8xN3sITxsNah3NX4mtIlyu2ejh0hnm', 1, '', '', ''),
(23, NULL, NULL, '', '', '', 'Bob@bob.bob', '', '$2b$10$f7arRJkGUkTULqZ4hdZbA.8CT8oFgHH6EYGitsKbp.Qv6GZnQNbyG', 0, '', '', ''),
(24, NULL, NULL, '', '', '', 'fakeadmin@gmail.com', '', '$2b$10$MYFNMBebBbKK4c.8uzJSnu3AAqQxHJW7YXXnLvTS.L3TdDS4JxOne', 0, '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adresse_utilisateur`
--
ALTER TABLE `adresse_utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Indexes for table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `compte_bancaire`
--
ALTER TABLE `compte_bancaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Indexes for table `fiche_technique`
--
ALTER TABLE `fiche_technique`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_prod_fiche_technique` (`id_prod_fiche_technique`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categorie_prod` (`id_categorie_prod`),
  ADD KEY `id_commande_prod` (`id_commande_prod`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_adresse` (`id_adresse`),
  ADD KEY `id_commande` (`id_commande`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adresse_utilisateur`
--
ALTER TABLE `adresse_utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compte_bancaire`
--
ALTER TABLE `compte_bancaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fiche_technique`
--
ALTER TABLE `fiche_technique`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `compte_bancaire`
--
ALTER TABLE `compte_bancaire`
  ADD CONSTRAINT `compte_bancaire_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`);

--
-- Constraints for table `fiche_technique`
--
ALTER TABLE `fiche_technique`
  ADD CONSTRAINT `fiche_technique_ibfk_1` FOREIGN KEY (`id_prod_fiche_technique`) REFERENCES `produit` (`id`),
  ADD CONSTRAINT `fiche_technique_ibfk_2` FOREIGN KEY (`id_prod_fiche_technique`) REFERENCES `produit` (`id`);

--
-- Constraints for table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_2` FOREIGN KEY (`id_categorie_prod`) REFERENCES `categorie` (`id_categorie`),
  ADD CONSTRAINT `produit_ibfk_3` FOREIGN KEY (`id_commande_prod`) REFERENCES `commande` (`id`);

--
-- Constraints for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`id_adresse`) REFERENCES `adresse_utilisateur` (`id`),
  ADD CONSTRAINT `utilisateur_ibfk_2` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
