-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Hôte : 172.16.1.2
-- Généré le : lun. 27 mars 2023 à 14:11
-- Version du serveur :  10.3.29-MariaDB-0+deb10u1
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `etu_ajessondanie`
--

-- --------------------------------------------------------

--
-- Structure de la table `AUTHOR`
--

CREATE TABLE `AUTHOR` (
  `ID_AUTHOR` bigint(4) NOT NULL,
  `AUTHOR_NAME` char(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `AUTHOR`
--

INSERT INTO `AUTHOR` (`ID_AUTHOR`, `AUTHOR_NAME`) VALUES
(1, 'Stephen King'),
(2, 'Albert Camus'),
(3, 'Jacques Ferrandez'),
(4, 'René Char'),
(5, 'Dominique Dupuis'),
(6, 'Serge Buch'),
(7, 'Maurice Attia'),
(8, 'Victor Hugo'),
(9, 'Adrien Goetz'),
(10, 'Emile Zola'),
(11, 'Zola, Emile'),
(12, 'By Label AA-Prod/Edits (Artmusiclitte) 2015'),
(13, 'Zola Emile'),
(14, 'Voltaire'),
(15, 'Jean Goulemot'),
(16, 'Jean-Paul Sartre'),
(17, 'Guillaume Musso'),
(18, 'Jean Giono'),
(19, 'Jean Carrière'),
(20, 'Jean-Yves Laurichesse'),
(21, 'Sylvie Vignes-Mottet'),
(22, 'Joël Dubosclard'),
(23, 'Georges Decote'),
(24, 'Jean-Paul Savignac'),
(25, 'Jules Verne'),
(26, 'JULIO VERNE'),
(27, 'Piero Gondolo della Riva'),
(28, 'Isabelle de Lisle'),
(29, 'Marc Levy'),
(30, 'Charles Dickens'),
(31, 'Dominique Barbéris'),
(32, 'Agatha Christie'),
(33, 'Anatole France'),
(34, 'Claude Debon'),
(35, 'Peter F. Read'),
(36, 'Guillaume Apollinaire'),
(37, 'Véronique Brémond'),
(38, 'Michel Bussi'),
(39, 'Michel BUSSI'),
(40, 'Valérie Perrin'),
(41, 'Brigitte Giraud'),
(42, 'Wilfried N Sondé'),
(43, 'STENDHAL'),
(44, 'Émile Faguet'),
(45, 'Stendhal'),
(46, 'Gustave Flaubert'),
(47, 'Thierry Laget'),
(48, 'Louis Bertrand'),
(49, 'Marcel Proust'),
(50, 'Proust, Marcel'),
(51, 'Jean-Jacques Rousseau'),
(52, 'Jean-jacques Rousseau'),
(53, 'Michael Wu'),
(54, 'R. A. Leigh'),
(55, 'Frédéric Eigeldinger'),
(56, 'Société Jean-Jacques Rousseau'),
(57, 'Claude Dauphin'),
(58, 'Janet Laming'),
(59, 'Jean-Jacques ROUSSEAU'),
(60, 'Cécile HELLIAN'),
(61, 'Rousseau, Jean-Jacques'),
(62, 'Charles Beaudelaire'),
(63, 'Edgar Allan Poe'),
(64, 'Jean Pellegrin (spécialiste de Beaudelaire)'),
(65, 'Simone Beaudelaire'),
(66, 'René Beaudelaire'),
(67, 'Beaudelaire C.'),
(68, 'Honoré de Balzac'),
(69, 'Honore De Balzac'),
(70, 'Eric Bordas'),
(71, 'Guy Riegert'),
(72, 'Jean-Louis Guez de Balzac'),
(73, 'Jules Romains'),
(74, 'Jules Zeller'),
(75, 'Jules Amigues'),
(76, 'Jules Jacquin'),
(77, 'Joseph Duesberg'),
(78, 'Jules Cambon Lavalette'),
(79, 'Jules Romain Joyant'),
(80, 'Frédéric Chappey'),
(81, 'Musée d art et d histoire Louis Senlecq'),
(82, 'Jules Toutain'),
(83, 'Georges Clemenceau'),
(84, 'Jules Ferry'),
(85, 'Jules François Camille Ferry'),
(86, 'François Guizot'),
(87, 'Georges Wormser'),
(88, 'Université Panthéon-Sorbonne'),
(89, 'Jean Martet'),
(90, 'Société des amis de Clemenceau'),
(91, 'Société des amis de Georges Clemenceau'),
(92, 'Claude Monet'),
(93, 'Pascal Bonetti'),
(94, 'M. C. Poinsot');

-- --------------------------------------------------------

--
-- Structure de la table `BOOK`
--

CREATE TABLE `BOOK` (
  `ID_BOOK` bigint(4) NOT NULL,
  `ID_LANGUAGE` bigint(4) DEFAULT NULL,
  `TITLE` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `IMAGE` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NUMBER_OF_PAGES` bigint(4) DEFAULT NULL,
  `EDITOR` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RELEASE_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `BOOK`
--

INSERT INTO `BOOK` (`ID_BOOK`, `ID_LANGUAGE`, `TITLE`, `IMAGE`, `DESCRIPTION`, `NUMBER_OF_PAGES`, `EDITOR`, `RELEASE_DATE`) VALUES
(1, 1, 'Running Man', 'http://books.google.com/books/content?id=LEBenQEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Premier quart du XXIe siècle. La dictature s est installée aux États-Unis. La télévision, arme suprême du nouveau pouvoir, règne sans partage sur le peuple. Une chaîne unique diffuse une émission de jeux suivie par des millions de fans : c est \" La Grande Traque \". Ben Richards, un homme qui n a plus rien à perdre, décide de s engager dans la compétition mortelle. Pendant trente jours il devra fuir les redoutables \" chasseurs \" lancés sur sa piste et activement aidés par une population encouragée à la délation. Tous les moyens sont bons pour éliminer Ben Richards... Dans ce livre terrifiant, le maître incontesté du suspense, le grand écrivain américain Stephen King, alias Richard Bachman, nous fait vivre cette diabolique course contre la mort sans nous laisser un instant de répit. Fascinant.', 315, 'LGF/Le Livre de Poche', NULL),
(2, 1, 'Dôme', NULL, '\"Le Dôme : personne n y entre, personne n en sort. A la fin de l automne, la petite ville de Chester Mill, dans le Maine, est inexplicablement et brutalement isolée du reste du monde par un champ de force invisible. Personne ne comprend ce qu est ce dôme transparent, d où il vient et quand - ou si - il partira. L armée semble impuissante à ouvrir un passage tandis que les ressources à l intérieur de Chester Mill se raréfient. Big Jim Rennie, un politicien pourri jusqu à l os, voit tout de suite le bénéfice qu il peut tirer de la situation, lui qui a toujours rêvé de mettre la ville sous sa coupe. Un nouvel ordre social régi par la terreur s installe et la résistance s organise autour de Dale Barbara, vétéran de l Irak et chef cuistot fraîchement débarqué en ville.\"--[Résumé de l éditeur].', 640, 'Editions Albin Michel', NULL),
(3, 1, 'La Ligne verte', 'http://books.google.com/books/content?id=MSCK1GwuiLUC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Paul Edgecombe, ancien gardien-chef d’un pénitencier dans les années 1930, entreprend d’écrire ses mémoires. Il revient sur l’affaire John Caffey – ce grand Noir au regard absent, condamné à mort pour le viol et le meurtre de deux fillettes – qui défraya la chronique en 1932. La Ligne verte décrit un univers étouffant et brutal, où la défiance est la règle. Personne ne sort indemne de ce bâtiment coupé du monde, où cohabitent une étrange souris apprivoisée par un Cajun pyromane, le sadique Percy Wetmore, et Caffey, prisonnier sans problème. Assez rapidement convaincu de l’innocence de cet homme doté de pouvoirs surnaturels, Paul fera tout pour le sauver de la chaise électrique. Aux frontières du roman noir et du fantastique, ce récit est aussi une brillante réflexion sur la peine de mort. Un livre de Stephen King très différent de ses habituelles incursions dans l’horreur, terriblement efficace et dérangeant.', 512, 'Le Livre de Poche', NULL),
(4, 1, 'Si ça saigne', 'http://books.google.com/books/content?id=hzU7zgEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', '\"Les journalistes le savent : si ça saigne, l’info se vend. Et l’explosion d’une bombe au collège Albert Macready est du pain béni dans le monde des news en continu. Holly Gibney de l’agence de détectives Finders Keepers, travaille sur sa dernière enquête lorsqu’elle apprend l’effroyable nouvelle en allumant la télévision. Elle ne sait pas pourquoi, le journaliste qui couvre les événements attire son attention...Quatre nouvelles magistrales, dont cette suite inédite au thriller L’Outsider, qui illustrent, une fois de plus, l’étendue du talent de Stephen King.\"--Page 4 de la couverture', 457, NULL, NULL),
(5, 1, 'Différentes saisons', 'http://books.google.com/books/content?id=tMQyPAAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Printemps : l histoire d un prisonnier innocent qui prépare l évasion la plus extraordinaire depuis celle du comte de Monte-Cristo... Été : un jeune adolescent découvre le passé monstrueux d un vieillard et joue avec lui une variante terrible du chat et de la souris... Automne : quatre garçons turbulents s aventurent dans les forêts du Maine, à la découverte de la vie, de la mort et des présages de leur destin... Hiver : dans un club étrange, un médecin raconte l histoire d une femme décidée à accoucher quoi qu il arrive... Ces quatre récits prouvent triomphalement que le grand Stephen King est capable de transcender l horreur sans abandonner son style singulièrement entraînant, sa façon imagée de rendre le décor et les personnages, et ses intrigues haletantes, suspendues au bord du gouffre. Différentes saisons : quatre joyaux, d une lecture irrésistible.', 732, 'Livre de Poche', NULL),
(6, 2, 'It', 'http://books.google.com/books/content?id=4e5BYgEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Seven men and women return to their hometown to face the horror they fled from when they were teenagers. Copyright © Libri GmbH. All rights reserved.', 1138, 'Viking Adult', NULL),
(7, 1, 'Le premier homme', 'http://books.google.com/books/content?id=uFZfQgAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Le manuscrit inachevé du roman auquel travaillait Camus pendant les dernières années de sa vie. Dans sa rédaction initiale, il a un caractère autobiographique qui aurait disparu dans sa version finale. En annexe, un carnet intitulé \"Premier homme : notes et plans\" et un échange de lettres avec Louis Germain.', 380, 'Editions Gallimard', NULL),
(8, 1, 'L étranger', 'http://books.google.com/books/content?id=u3hkngEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Dans Folioplus Classiques, le texte intégral, enrichi d une lecture d image, écho pictural de l œuvre, est suivi de sa mise en perpective organisée en six points : Mouvement littéraire -La littérature engagée ; le genre et le registre -\" Un court roman de moraliste \" ; l écrivain à sa table de travail -Un classicisme \" instinctif \" ; le groupement de textes -Personnages insoumis ; la chronologie -Albert Camus et son temps ; la fiche -Des pistes pour rendre compte de sa lecture.', 206, 'Editions Gallimard', NULL),
(9, 1, '˜Laœ chute', NULL, NULL, 152, NULL, NULL),
(10, 4, 'L  hôte : d après l oeuvre d Albert Camus', 'http://books.google.com/books/content?id=SvTtzgEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', NULL, 62, NULL, NULL),
(11, 2, 'L étranger', 'http://books.google.com/books/content?id=uRfuAAAAMAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'The Stranger, unabridged.', 202, 'Prentice Hall', NULL),
(12, 1, 'Correspondance, 1946-1959', 'http://books.google.com/books/content?id=5LyRAAAAIAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', NULL, 276, 'Editions Gallimard', NULL),
(13, 2, 'The Plague', 'http://books.google.com/books/content?id=7_Blv5sqceoC&printsec=frontcover&img=1&zoom=5&source=gbs_api', '“Its relevance lashes you across the face.” —Stephen Metcalf, The Los Angeles Times • “A redemptive book, one that wills the reader to believe, even in a time of despair.” —Roger Lowenstein, The Washington Post A haunting tale of human resilience and hope in the face of unrelieved horror, Albert Camus  iconic novel about an epidemic ravaging the people of a North African coastal town is a classic of twentieth-century literature. The townspeople of Oran are in the grip of a deadly plague, which condemns its victims to a swift and horrifying death. Fear, isolation and claustrophobia follow as they are forced into quarantine. Each person responds in their own way to the lethal disease: some resign themselves to fate, some seek blame, and a few, like Dr. Rieux, resist the terror. An immediate triumph when it was published in 1947, The Plague is in part an allegory of France s suffering under the Nazi occupation, and a timeless story of bravery and determination against the precariousness of human existence.', 324, 'Vintage', NULL),
(14, 1, 'Jacques Ferrandez', NULL, 'Quand Jacques Ferrandez, le grand dessinateur de BD, amateur des paysages méditerranéens, nous offre son regard personnel et sensible sur la nature... Cette toute nouvelle collection est dédiée aux dessinateurs de bandes dessinée, à ces adeptes du croquis, qui dès que leur regard se pose, sortent de manière quasi automatique un petit carnet, un crayon, voire des pastels. Le regard vif, la main agile, le croqueur fou permet aux éléments de prendre forme, souvent en noir et blanc, parfois en couleur, sur le papier. Et le passant, qui jette un regard curieux, par-dessus l épaule du dessinateur, est fasciné par tant de magie... Chaque volume de cette collection donne la parole à un dessinateur de bande dessinée et présente le regard qu il porte sur la nature et sur l environnement. Des croquis et dessins réalisés bien souvent en dehors de tout album mais aussi des esquisses faites à l occasion de repérages, des crayonnés annonciateurs de cases... L ensemble fait de la nature, non pas un second plan ou un décor quelconque dans lequel le héros se glisse, mais un véritable personnage qui montre l investissement et l intérêt du dessinateur. Un temps de respiration, un moment de calme ou une volonté de mettre en avant des éléments qui vont à un moment porter l action !', 118, NULL, NULL),
(15, 1, 'Ferrandez', NULL, 'Entretien, analyse, biographie et bibliographie de Ferrandez avec de nombreuses illustrations inédites.', 160, NULL, NULL),
(16, 1, 'Alger la Noire', 'http://books.google.com/books/content?id=40-uEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Alger, fin janvier 1962. Sur l’une des plages de la ville sont retrouvés les cadavres nus d un jeune couple. Elle est européenne, lui arabe. Il est émasculé et son dos arbore les trois lettres « OAS », gravées au couteau. Exécution presque ordinaire, comme on pourrait le penser en ces temps plus que troublés ? Ou bien l’assassinat de Mouloud et d’Estelle cache-t-il autre chose ? S’échappant de la terne routine de son commissariat de Bab El Oued, l’inspecteur Paco Martinez mène l’enquête accompagné de l’irascible Choukroun. Leurs investigations les conduisent dans les arrières-cours peu reluisantes de la grande ville, entre politique, affairisme, moeurs dissolues et violence omniprésente.', 138, 'Casterman', NULL),
(17, 1, 'L étranger', NULL, NULL, 0, 'Gallimard BD', NULL),
(18, 4, 'L  hôte : d après l oeuvre d Albert Camus', 'http://books.google.com/books/content?id=SvTtzgEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', NULL, 62, NULL, NULL),
(19, 1, 'L  étranger : d après l oeuvre d Albert Camus', 'http://books.google.com/books/content?id=NmzuzgEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Die Adaption von Albert Camus  \"L étranger\" als Graphic Novel ermöglicht in einem ausdrucksvollen Zusammenspiel von Bildern, Zeichnungen und Farben eine sinnenreiche Annäherung an Albert Camus  Klassiker und seine Philosophie des Absurden.', 134, NULL, NULL),
(20, 1, 'Terre fatale', NULL, 'Les personnages de Terre fatale sont ce que nous sommes : des êtres pris dans les rets d une Histoire dont, souvent, ils ne sont que les victimes, avec leurs peurs, leurs incertitudes, leurs lâchetés, ou leurs actes de bravoure, tout ce qui est mis à nu au temps de l embrasement, au temps de la guerre, au temps des affrontements. Que vienne la parole pour réconcilier les mémoires... alors seulement pourrons-nous regarder notre histoire en face. Alors seulement la guerre sera finie...', 62, NULL, NULL),
(21, 1, 'Poèmes de Victor Hugo', NULL, 'L’oeuvre est immense et monumentale, le personnage est imposant. Pourtant, aller à la rencontre de l’homme, l’amoureux fervent, le père, le grand-père, le « rêveur, le camarade des petites fleurs, et l’interlocuteur des arbres et du vent...», qui écrivait en contemplant l’océan, c’est aussi entendre une voix amie. Une voix émouvante. Son amour des enfants est sans réserve. Son dialogue avec la nature prodigieux, son goût de la vie intense et son souci de justice et d’équité exemplaire.', 93, 'Editions Gallimard', NULL),
(22, 1, 'Les misérables', NULL, 'Le destin de Jean Valjean, forçat échappé du bagne, est bouleversé par sa rencontre avec Fantine. Mourante et sans le sou, celle-ci lui demande de prendre soin de Cosette, sa fille confiée aux Thénardier. Ce couple d aubergistes, malhonnête et sans scrupules, exploitent la fillette jusqu à ce que Jean Valjean tienne sa promesse et l adopte. Cosette devient alors sa raison de vivre. Mais son passé le rattrape et l inspecteur Javert le traque.', 347, 'Livre de Poche Jeunesse (Le)', NULL),
(23, 1, 'Quatrevingt-treize', 'http://books.google.com/books/content?id=KbqctAEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Dans a Vendée de 1793, trois personnages s affrontent : l aristocrate Lantenac, fidèle à son passé, son petit-neveu Gauvain, tourné vers l avenir généreux de la République, et le conventionnel Cimourdain, plus durement soucieux des exigences présentes de la Révolution et de la Terreur. Dans cette épopée où le romancier mêle la fiction de l intrigue et la réalité de l Histoire - Danton, Robespierre et Marat sont au centre du livre -, chacun des trois héros se trouve ainsi guidé par une certaine idée du devoir et de l honneur. Et chacun sera conduit à une forme d héroïsme qui n écarte pas la mort. L écrivain se refuse donc à trancher, et Quatrevingt-Treize n est pas un roman à thèse : \" Je ne veux ni du crime rouge ni du crime blanc. \" Mais la violence où s achevait l Ancien Régime était certainement un mal nécessaire, et ce qui s affirme dans ce livre qui paraît en 1874 et sera le dernier roman de Hugo, c est une vision de l Histoire qui garde trace, sans doute, de la Commune récente où une même violence fit retour, mais ne s interdit pas l espérance.', 575, 'LGF/Le Livre de Poche', NULL),
(24, 1, 'Notre-Dame de Paris', 'http://books.google.com/books/content?id=UxyoPwAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Il était là, grave, immobile, absorbé dans un regard et dans une pensée. Tout Paris était sous ses pieds, avec les mille flèches de ses édifices et son circulaire horizon de molles collines, avec son fleuve qui serpente sous ses ponts et son peuple qui ondule dans ses rues, avec le nuage de ses fumées, avec la chaîne montueuse de ses toits qui presse Notre-Dame de ses mailles redoublées. Mais dans toute cette ville, l archidiacre ne regardait qu un point du pavé: la place du Parvis; clans toute cette foule, qu une figure: la bohémienne. Il eût été difficile de dire de quelle nature était ce regard, et d où venait la flamme qui en jaillissait. C était un regard fixe, et pourtant plein de trouble et de tumulte. Et à l immobilité profonde de tout son corps, à peine agité par intervalles d un frisson machinal, connue un arbre air vent, à la roideur de ses coudes plus marbre que la rampe où ils s appuyaient, à voir le sourire pétrifié qui contractait son visage, on eût dit qu il n y avait plus dans Claude Frollo que les yeux de vivant.', 953, 'Gallimard Education', NULL),
(25, 1, 'La légende des siècles', 'http://books.google.com/books/content?id=DtdcAAAAMAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Cette œuvre regroupe des poèmes de Victor Hugo.', 1098, 'Editions Gallimard', NULL),
(26, 1, 'L homme qui rit', 'http://books.google.com/books/content?id=CIORAAAAIAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Publié en 1869, ce dernier roman du poète a pour décor l Angleterre du début du XVIIIe siècle. D une veine sociale aussi prononcée que \"Les misérables\", il demeure vraiment \"brutalisé\" par une intrigue violente où l antithèse chère à l auteur est mise au service de son idéologie. Passionné et passionnant, ce récit vaut le détour car même s il n est pas la meilleure des oeuvres romanesques d Hugo, il en est la plus typique.', 902, 'Editions Gallimard', NULL),
(27, 3, 'Notre-Dame de Paris', 'http://books.google.com/books/content?id=-FVMwYkMa88C&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 527, 'Bur', NULL),
(28, 2, 'Germinal', 'http://books.google.com/books/content?id=OLOEEsbsfEsC&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'The thirteenth novel in Émile Zola’s great Rougon-Macquart sequence, Germinal expresses outrage at the exploitation of the many by the few, but also shows humanity’s capacity for compassion and hope. Etienne Lantier, an unemployed railway worker, is a clever but uneducated young man with a dangerous temper. Forced to take a back-breaking job at Le Voreux mine when he cannot get other work, he discovers that his fellow miners are ill, hungry, and in debt, unable to feed and clothe their families. When conditions in the mining community deteriorate even further, Lantier finds himself leading a strike that could mean starvation or salvation for all. New translation Includes introduction, suggestions for further reading, filmography, chronology, explanatory notes, and glossary', 596, 'Penguin', NULL),
(29, 1, 'Emile Zola - Les oeuvres complètes (édition augmentée)', 'http://books.google.com/books/content?id=sLkeCwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Edition augmentée de nombreuses notes et annexes. Vous y retouverez l intégrale des oeuvres de Emile Zola et plus encore. Cet ebook énorme a fait l objet d un véritable travail de recherche, correction, mise en page pour votre plus grand confort de lecture. La navigation se fait aisément au sein de l oeuvre grâce aux tables des matières hyperliées et NCX intégrées. Pour nous faire part de vos remarques ou signaler une erreur, veuillez nous écrire à editions@ligram.com, les titres seront mis à jour dans les plus brefs délais. Sommaire : Les Rougon-Macquart : La Fortune des Rougon - La Curée - Le Ventre de Paris - La Conquête de Plassans - La Faute de L abbé Mouret - Son Excellence Eugène Rougon - L Assommoir - Une Page d amour - Nana - Pot-Bouille - Au Bonheur des dames - La Joie de vivre - Germinal - L oeuvre - La Terre - Le Rêve - La Bête humaine - L Argent - La Débacle - Le Docteur Pascal Les romans : Therèse Raquin - Le Voeu d’une morte - Madeleine Férat - L’Attaque du Moulin - Les Mystères de Marseille - La Confession de Claude - Les trois Villes : Lourdes - Les trois Villes : Paris - Les trois Villes : Rome - Les quatre évangiles : Fecondité - Les quatre évangiles : Travail - Les Quatre Evangiles : Verité Le théatre : Thérèse Raquin - Les héritiers Rabourdin - Le Bouton de Rose Les contes et nouvelles : Contes à Ninon - Esquisses Parisiennes - Nouveaux contes à Ninon - Naïs Micoulin Etudes biographiques : Mes Haines - Mon Salon - La vérite en marche (L’affaire Dreyfus) Les éloges et discours : Discours d’inauguration du buste d’Emmanuel Gonzales - Eloge : obsèques de Léon Cladel - Eloge : obsèques De Guy De Maupassant - Discours d’inauguration du monument de Guy de Maupassant au parc Monceau - Eloge : obsèques D’Arsène Houssaye - Eloge : obsèques d’Edmond de Goncourt - Eloge : obsèques d’Alphonse Daudet - J’accuse... ! - Eloge : obsèques de Paul Alexis - - Oeuvre poétique et lyrique - L Amoureuse comédie (Rodolpho – l’Aérienne – Paolo) - A mon ami Paul - Ce que je veux Biographie : Emile Zola : sa vie – son œuvre (par Edmond Le Pelletier)', NULL, 'Ligram éditions', NULL),
(30, 1, 'Emile Zola : Oeuvres complètes — 101 titres et annexes (Nouvelle édition enrichie)', 'http://books.google.com/books/content?id=XvJkfUAdXrYC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'L intégrale des oeuvres de Zola, soit 65 titres abondamment annotés. La mise en page et la navigation ont fait l objet d un soin particulier en intégrant les spécificités propres à votre liseuse. Les éditions Arvensa vous font bénéficier régulièrement de mises à jour gratuites et mettent à votre disposition leur service qualité. www.arvensa.com - La référence des ebooks classiques.', 11000, 'Arvensa editions', NULL),
(31, 1, 'Zola Emile 22 (ouvrages classique)', 'http://books.google.com/books/content?id=LFXsDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Zola Emile 22 (ouvrages classique) Au bonheur des dames , germinal , j accuse , l argent , l assommoir , l oeuvre , la bête humaine , la conquête de plassans , la curée , la debacle , la faute de l abbe mouret , la fortune des rougon , la joie de vivre , la terre , le docteur pascal , le rêve , le ventre de paris , lettre a la jeunesse , nana , pot-bouille , son excellence Eugène Rougon , une page d amour .', 7397, 'By Label AA-Prod/Edits (Artmusiclitte) 2015', NULL),
(32, 5, 'Thérèse Raquin', NULL, NULL, 190, NULL, NULL),
(33, 1, 'La Débâcle', 'http://books.google.com/books/content?id=Ij2rEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'La Débâcle est un roman d’Émile Zola publié en 1892, le dix-neuvième volume de la série Les Rougon-Macquart, dont il constitue la conclusion historique. Le premier roman (La Fortune des Rougon) évoquait le coup d’État du 2 décembre 1851, qui mit en place le Second Empire ; celui-ci a pour cadre la déroute de l’armée française devant les Prussiens à Sedan pendant la guerre franco-allemande de 1870, et donc la chute de l’Empire, remplacé le 4 septembre 1870 par la Troisième République. Les Rougon-Macquart: histoire naturelle et sociale d une famille sous le second Empire. XIX (1892). Texte intégral. Cet ouvrage s’inscrit dans un projet de sauvegarde et de valorisation de bibliothèques et fonds patrimoniaux anciens appartenant à la littérature des 19e et 20e siècles. Une collection de grands classiques, d’écrits pour le théâtre, de poésie, mais aussi des livres d’histoire, de philosophie ou d’économie, des récits de voyage ou des livres pour la jeunesse à retrouver via les librairies en ligne ou à lire sur papier avec une mise en page étudiée pour optimiser le confort de lecture.', 622, 'BoD - Books on Demand', NULL),
(34, 1, 'Le Capitaine Burle', 'http://books.google.com/books/content?id=GNiwEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Émile Zola a publié de 1875 à 1880 une soixante de textes dont une vingtaine de nouvelles dans le journal russe . est un recueil de six de ces nouvelles et fut publié du vivant de l auteur. Trois textes dramatiques ressortent de ce recueil: La nouvelle qui donne son titre au recueil est l histoire de la déchéance d un officier détournant de l argent de la caisse de son régiment. Dans , un jeune homme soupire après sa voisine. Un soir, celleci le fait monter chez elle et se dit prête à se donner à lui s il lui obéit en tout... est la très sombre histoire d un fermier aisé, perdant tout lors d une crue de la Garonne. Trois autres nouvelles complètent ce recueil: , ou comment la mort frappe des familles de milieux sociaux différents. , chronique sur les parisiens fuyant la ville pour se mettre au vert le temps d un dimanche, mais aussi souvenirs de la jeunesse de Zola s échappant vers la banlieue. Et enfin, la légère , histoire d un village de pêcheurs qui vont faire une pêche miraculeuse qui va les détourner des poissons pour un bon moment...', 226, 'BoD - Books on Demand', NULL),
(35, 1, 'Micromégas', 'http://books.google.com/books/content?id=2HAQHAAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Après une étape sur Saturne où il se fait un compagnon de voyage, philosophe comme lui, Micromégas, habitant de Sirius, vient visiter la terre des hommes, \" notre petite fourmilière \" : occasion de péripéties nombreuses et de dialogues variés. Puis, à la fin du livre, les deux personnages reprennent leur voyage, on ne sait vers quelle destination. Le lecteur ne les accompagne plus. Il demeure aux côtés des Terriens, ses semblables. Si l étrangeté dont joue Voltaire dans ce conte qu il publie en 1752 est d abord celle des deux voyageurs, des autres mondes habités et du voyage interstellaire, c est bien ensuite celle des Terriens qu il met en scène : étrangeté physique, puis intellectuelle et philosophique. Le livre ainsi nous invite à changer de rôle, à philosopher nous aussi, non sur des créatures imaginaires, mais au contraire sur l Homme. A l évidence, Voltaire s amuse. Son rire pourtant n est pas gratuit : Micromégas est une histoire philosophique, une magnifique leçon de \" gai savoir \".', 94, 'Livre De Poche', NULL),
(36, 1, 'Zadig ou La destinée', NULL, 'Dans ce siècle du voyage et de la philosophie, Zadig entreprend son apprentissage dans un univers partagé entre le bien et le mal. Trahi par Sémire et Azora, déçu par l amour, Zadig trouve refuge dans la nature, qui est à l image de Dieu. Remarqué par le roi d Egypte Moabdar, il retourne dans le tourbillon du monde et devient Premier ministre. Séduit par la reine Astarté et menacé par la jalousie du roi, il fuit bientôt Babylone. C est l occasion pour lui d un retour sur soi et d une réflexion sur les caprices de la fatalité. Au hasard des aventures qu il croise sur son chemin en compagnie de l ermite, Zadig devient l incarnation de la Providence, dont les voies restent par ailleurs impénétrables. L ange Jesrad lui révélera une partie des mystères de la Destinée. Si l homme est sans cesse tiraillé entre liberté et déterminisme, il semble bien devoir les concilier. Et c est là sans doute la seule vérité qui nous soit accessible.', 166, NULL, NULL),
(37, 1, 'Candide', 'http://books.google.com/books/content?id=NqV0PwAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Candide nous conte les mésaventures d un voyageur philosophe qui affronte les horreurs de la guerre et les sanglants caprices de la Nature ; qui connaît les désillusions de l amour et découvre les turpitudes de ses semblables, faisant à l occasion l expérience de leurs dangereuses fantaisies. Pourtant si l homme est un bien méchant animal et si l existence n est qu une cascade de catastrophes est-ce une raison pour que le héros perde sa sérénité et le récit son allégresse ? Sous la forme d une ironique fiction, Candide propose une réflexion souriante sur l omniprésence de la déraison qui puise sa force aux sources vives d une expérience humaine, celle de l auteur. Candide, on l a dit, ce sont les \" Confessions \" de Voltaire, et c est en cela qu il nous émeut. Mais ce \" roman d apprentissage \" est aussi - et peut-être surtout - un festival merveilleusement ordonné de drôlerie et de fantaisie sarcastique, ruisselant d un immense savoir maîtrise qui ne dédaigne jamais de porter le rire jusqu au sublime. C est en cela qu il nous éblouit et qu il nous charme.', 218, 'Hachette', NULL),
(38, 2, 'The Portable Voltaire', 'http://books.google.com/books/content?id=sVVeywY0VYgC&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Includes Part One of Candide; three stories; selections from The Philosophical Dictionary, The Lisbon Earthquake, and other works; and thirty-five letters.', 580, 'Penguin Classics', NULL),
(39, 2, 'Philosophical Letters, Or, Letters Regarding the English Nation', 'http://books.google.com/books/content?id=LzOGQgAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'In his Philosophical Letters, Voltaire provides a pungent and often satirical assessment of the religion, politics, science, and arts of the England he observed during his nearly three-year exile. In addition to the Letters, this edition provides a translation of Voltaire s Proposal for a Letter about the English, a general Introduction, chronology, notes, and bibliography.', 158, 'Hackett Publishing Company Incorporated', NULL),
(40, 2, 'Treatise on Toleration', 'http://books.google.com/books/content?id=GJlPEAAAQBAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'One of the most important essays on religious tolerance and freedom of thought, a French bestseller in the wake of the Charlie Hebdo attacks In 1762 Jean Calas, a merchant from Toulouse, was executed after being falsely accused of killing his son. As it became clear that Calas was in fact persecuted for being a Protestant, Voltaire began a campaign to get his sentence overturned—and in the process made the case for some of the most important values upheld by the Enlightenment, from religious tolerance to freedom of thought. Treatise on Toleration is the story of that case and a screed against fanaticism—a book that is as fresh and urgent today as it was when it was first published in 1763. For more than seventy years, Penguin has been the leading publisher of classic literature in the English-speaking world. With more than 1,700 titles, Penguin Classics represents a global bookshelf of the best works throughout history and across genres and disciplines. Readers trust the series to provide authoritative texts enhanced by introductions and notes by distinguished scholars and contemporary authors, as well as up-to-date translations by award-winning translators.', 0, 'Penguin', NULL),
(41, 1, 'Oeuvres complétes de Voltaire', 'http://books.google.com/books/content?id=2QzrAAAAMAAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, NULL, NULL, NULL),
(42, 1, 'L imagination', NULL, 'Publié pour la première fois en 1936, ce texte de Sartre est une histoire philosophique de l’imagination autant qu’une reconstruction phénoménologique de l’image. Les grands concepts sartriens sont ici présents sous la forme d’embryons d’une pensée nouvelle qui se cherche et se construit dans la recherche « d une théorie vraie de l’existence en image ».', 138, NULL, NULL),
(43, 2, 'The Words', 'http://books.google.com/books/content?id=HygpAQAAIAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'The autobiography of a French author and philosopher concentrates on his first ten years and on his great love of reading and writing', 260, 'Vintage', NULL),
(44, 3, 'La nausea', 'http://books.google.com/books/content?id=pq5LngEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', NULL, 242, NULL, NULL),
(45, 1, 'L être et le néant', 'http://books.google.com/books/content?id=xNQJtixrOeEC&printsec=frontcover&img=1&zoom=5&source=gbs_api', '\"L être ne saurait engendrer que l être et, si l homme est englobé dans ce processus de génération, il ne sortira de lui que de l être. S il doit pouvoir interroger sur ce processus, c est-à-dire le mettre en question, il faut qu il puisse le tenir sous sa vue comme un ensemble, c est-à-dire se mettre lui-même en dehors de l être et du même coup affaiblir la structure d être de l être. Toutefois il n est pas donné à la \"réalité humaine\" d anéantir, même provisoirement, la masse d être qui est posée en face d elle. Ce qu elle peut modifier, c est son rapport avec cet être. Pour elle, mettre hors de circuit un existant particulier, c est se mettre elle-même hors de circuit par rapport à cet existant. En ce cas elle lui échappe, elle est hors d atteinte, il ne saurait agir sur elle, elle s est retirée par-delà un néant. Cette possibilité pour la réalité humaine de sécréter un néant qui l isole, Descartes, après les Stoïciens, lui a donné un nom : c est la liberté.\" J.P. sartre -- Quatrième de couverture.', 712, 'Editions Gallimard', NULL),
(46, 1, 'Huis clos', 'http://books.google.com/books/content?id=yaMNAQAAMAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Deux pièces capitales de Jean-Paul Sartre. Dans Huis Clos, trois étrangerès apprennent que \"l enfer, c est les autres.\" Dans Les Mouches, Sartre adapte le mythe grec d Èlectre.', 260, 'Editions Gallimard', NULL),
(47, 2, 'Jean-Paul Sartre', 'http://books.google.com/books/content?id=khXv5xcIjUsC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'This first collection of Sartre s key philosophical writings provides an indispensable resource for all students and readers of his work, which has been extremely influential in philosophy, literature and politics.', 352, 'Psychology Press', NULL),
(48, 1, 'Oeuvres de Jean Paul Sartre', NULL, NULL, NULL, NULL, NULL),
(49, 1, 'La vie est un roman', 'http://books.google.com/books/content?id=2lrRDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'POUR LUI, TOUT EST ÉCRIT D AVANCE POUR ELLE TOUT RESTE À ÉCRIRE « Un jour d’avril, ma fille de trois ans, Carrie, a disparu alors que nous jouions toutes les deux à cache-cache dans mon appartement de Brooklyn. » Ainsi débute le récit de Flora Conway, romancière renommée à la discrétion légendaire. La disparition de Carrie n’a aucune explication. La porte et les fenêtres de l’appartement étaient closes, les caméras de ce vieil immeuble new-yorkais ne montrent pas d’intrusion. L’enquête de police n’a rien donné. Au même moment, de l’autre côté de l’Atlantique, un écrivain au cœur broyé se terre dans une maison délabrée. Lui seul détient la clé du mystère. Et Flora va le débusquer. Une lecture à nulle autre pareille. En trois actes et deux coups de théâtre, Guillaume Musso nous immerge dans une histoire étourdissante qui puise sa force dans le pouvoir des livres et la rage de vivre de ses personnages. « Un roman peut en cacher un autre. (...) Une vertigineuse mise en abyme et [Guillaume Musso] chahute les frontières entre la fiction et le réel, la vie et le roman, l auteur et ses personnages. Suspense littéraire et amoureux, réflexion sur le pouvoir des livres et le métier d écrivain, La vie est un roman est une lecture étourdissante, jubilatoire. » - Bernard Lehut, Laissez-vous tenter, RTL « Un roman aussi vertigineux que dense, exercice de haut vol et d illusionniste sur les interactions d un auteur avec ses créatures. » - Marianne Payot, L Express « Guillaume Musso est un ensorceleur qui fait surgir l’impossible dans la vie de ses personnages au moment où l’on ne s’y attend pas. Son lecteur ne sera pas déçu car, outre le rythme soutenu, l’émotion et des héros attachants, l’intrigue est truffeée de références littéraires et rend un bel hommage aux écrivains. Captivant. » - Anne Michelet, Version Femina « Un récit machiavélique et jubilatoire autour du pouvoir des livres qui nous a complètement bluffés. (...) Guillaume Musso signe ici un de ses romans les plus personnels. Un de ses meilleurs aussi. » - Sandrine Bajos, Le Parisien « Passionnant ! Vous allez vous régaler ! » - Arnold Derek, France Bleu « Une formidable histoire qui ravira à la fois les amateurs de thrillers et les amoureux de littérature. (...) Assurément grand écrivain et grand lecteur, Guillaume Musso revient avec brio sur le métier d’écrire, l’inspiration, la vie réelle et imaginaire... (...) La vie est un roman fait irrésistiblement penser à Romain Gary. » - Alain-Jean Robert, AFP', 230, 'Calmann-Lévy', NULL),
(50, 1, 'Demain', NULL, 'Elle est son passé... il est son avenir. Emma vit à New York. À 32 ans, elle continue de chercher l’homme de sa vie. Matthew habite à Boston. Il a perdu sa femme dans un terrible accident et élève seul sa fille de quatre ans. Ils font connaissance grâce à Internet et bientôt, leurs échanges de mails les laissent penser qu’ils ont enfin droit au bonheur. Désireux de se rencontrer, ils se donnent rendez-vous dans un petit restaurant italien de Manhattan. Le même jour à la même heure, ils poussent chacun à leur tour la porte du restaurant. Ils sont conduits à la même table et pourtant... ils ne se croiseront jamais. Jeu de mensonges ? Fantasme de l’un ? Manipulation de l’autre ? Victimes d’une réalité qui les dépasse, Matthew et Emma vont rapidement se rendre compte qu’il ne s’agit pas d’un simple rendez-vous manqué... Une aventure aussi mystérieuse que bouleversante. Une intrigue virtuose aux frontières du réel. Un suspense diabolique, intense et captivant.', 438, NULL, NULL),
(51, 1, 'Je reviens te chercher', 'http://books.google.com/books/content?id=KghFDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Peut-on, en quelques heures, rattraper les erreurs de toute une vie ? Un matin, Ethan reçoit le faire-part de mariage de Céline, la femme qu il aimait et qu il a quittée pour se consacrer à sa fulgurante carrière. Une décision qu il regrette amèrement aujourd hui. Sur un coup de tête, il se rend au mariage et se met au défi de reconquérir la jeune femme. Il ne lui reste que quelques heures pour y parvenir. Quelques heures folles et pleines de mystère, au terme desquelles il est abattu par un inconnu. C est alors que l incroyable se produit...', 336, 'Éditions de l épée', NULL),
(52, 1, 'L instant présent', NULL, '« Souviens-toi que l on a deux vies. La seconde commence le jour où on se rend compte que l on n en a qu une. » Pour payer ses études d art dramatique, Lisa travaille dans un bar de Manhattan. Elle y fait la connaissance d Arthur Costello, un jeune médecin urgentiste. En apparence, il a tout pour plaire. Mais Arthur n est pas un homme comme les autres. Deux ans plus tôt, il a hérité de la résidence de son grand-père : un vieux phare isolé dans lequel une pièce a été condamnée. Malgré sa promesse, il a choisi d ouvrir la porte, découvrant une vérité bouleversante qui lui interdit de mener une vie normale. Sa rencontre avec Lisa va tout changer et lui redonner une raison d espérer. Dès lors, Arthur et Lisa n ont qu une obsession, déjouer les pièges que leur impose le plus impitoyable des ennemis : le temps. Un suspense psychologique vertigineux au final stupéfiant. « Guillaume Musso persiste et signe. Il est bien le maître du suspense. » Le Figaro', 440, NULL, NULL),
(53, 1, 'Parce que je t aime', NULL, 'Un livre profondément humain. Un dénouement stupéfiant. Layla, une petite fille de cinq ans, disparaît dans un centre commercial de Los Angeles. Brisés, ses parents finissent par se séparer. Cinq ans plus tard, Layla est retrouvée à l endroit exact où on avait perdu sa trace. Elle est vivante, mais reste plongée dans un étrange mutisme. À la joie des retrouvailles, succèdent les interrogations. Où était Layla pendant toutes ces années ? Avec qui ? Et surtout : pourquoi est-elle revenue ? « Guillaume Musso signe sans doute son meilleur roman. Le plus surprenant, le plus intime, le plus humain. » La Voix du Nord « Les personnnages sont dotés d une fragilité extrêmement touchante et d une humanité qui nous ficelle viscéralement à eux. Chez Musso, l émotion a des accents majeurs. » Le Figaro Magazine', 425, NULL, NULL),
(54, 1, 'Sauve-moi', NULL, 'Le plus difficile n est pas de rencontrer l amour, c est de savoir le garder. Un soir d hiver en plein cœur de Broadway, Juliette, jolie Française de vingt-huit ans, croise la route de Sam, un jeune pédiatre new-yorkais. Par crainte de le décevoir, elle lui cache qu elle multiplie les petits boulots en nourrissant des rêves d actrice. Par peur de s attacher, il prétend qu il est marié alors que sa femme vient de mourir. Malgré ce double mensonge, ils vont s aimer le temps d un week-end intense, magique, inoubliable. Mais Juliette doit retourner à Paris et Sam ne sait pas trouver les mots pour la garder à ses côtés. À peine l avion de la jeune femme a-t-il décollé, qu il explose en plein ciel. Pourtant, leur histoire est loin d être terminée... « Un numéro de haute voltige entre la passion et le suspense. » Le Parisien « Guillaume Musso est un peu le James Cameron ou le Steven Spielberg de la littérature française contemporaine. » Brice Depasse, Lire est un plaisir', 502, NULL, NULL),
(55, 2, 'Where Would I Be Without You?', 'http://books.google.com/books/content?id=HxajcQAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', '#1 French Bestselling author of The Reunion  It s no wonder that Guillaume Musso is one of France s most loved, bestselling authors  Harlan Coben Sometimes, a second chance can come out of nowhere ... Parisian cop Martin Beaumont has never really got over his first love, Gabrielle. Their brief, intense affair in San Francisco and the pain of her rejection still haunt him years later. Now, however, he s a successful detective - and tonight he s going to arrest the legendary art thief, Archibald Maclean, when he raids the Musee d Orsay for a priceless Van Gogh. But the enigmatic Archibald has other plans. Martin s pursuit of the master criminal across Paris is the first step in an adventure that will take him back to San Francisco, and to the edge of love and life itself.', 352, NULL, NULL),
(56, 1, 'Ecrits pacifistes', NULL, '\"Ce qui me dégoûte dans la guerre, c est son imbécillité. J aime la vie. Je n aime même que la vie. C est beaucoup, mais je comprends qu on la sacrifie à une cause juste et belle. J ai soigné des maladies contagieuses et mortelles sans jamais ménager mon don total. A la guerre j ai peur, j ai toujours peur, je tremble, je fais dans ma culotte. Parce que c est bête, parce que c est inutile. Inutile pour moi. Inutile pour le camarade qui est avec moi sur la ligne de tirailleurs. Inutile pour le camarade en face. Inutile pour le camarade qui est à côté du camarade en face dans la ligne de tirailleurs qui s avance vers moi.\" Ce volume réunit \"Refus d obéissance\", \"Précisions\" et \"Recherche de la pureté\", trois textes pacifistes d un homme qui n oublia jamais l horreur de la Première Guerre mondiale.', 204, NULL, NULL),
(57, 1, 'Voyage en Italie', NULL, NULL, 212, 'Gallimard Education', NULL),
(58, 1, 'Passage du vent', 'http://books.google.com/books/content?id=rwzHjgEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Dans ce récit autobiographique, Jean Giono évoque son enfance passée à Manosque, dans une maison haute avec un escalier étroit qui relie la blanchisserie du rez-de-chaussée, où s active sa mère Pauline, au troisième où se trouve l atelier de cordonnier de son père. C est là que Jean Giono a appris à sentir, à voir et à penser sous la garde vigilante de sa mère, modelé par la sagesse et la grande bonté de son père. Jean Giono nous raconte aussi les aventures et les drames qui l ont marqué et sa découverte de la sensualité au cours d un séjour chez les bergers. C est sur le départ pour la guerre de 1914 que s achève ce merveilleux recueil de souvenirs d enfance, empli de fraîcheur et de tendresse.', 276, 'LGF/Le Livre de Poche', NULL),
(59, 1, 'Jean Giono', 'http://books.google.com/books/content?id=NmlYDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', '« Nous sommes obligés de porter un masque. Nous nous défendons. Tu ne vas pas parler de masque au traducteur de Machiavel et à celui qui lit Balthazar Gracian depuis quarante ans. Non, tout le monde porte un masque. Je porte un masque généralement dans la vie, à cause d’une extraordinaire timidité. Je me montrerais à visage découvert si j’étais un génie, si j’étais prodigieusement beau, mais comme je suis l’homme le plus humble, je me dissimule, je me cache. Peut-être une juste connaissance de ma propre valeur. » (Jean Giono.)', 173, 'FeniXX', NULL),
(60, 1, 'Giono', 'http://books.google.com/books/content?id=TR21caZbr0AC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 352, 'Presses Univ. du Mirail', NULL),
(61, 1, 'Profil - Giono (Jean) : Un roi sans divertissement', 'http://books.google.com/books/content?id=lL2XsaSF0BIC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'L’ouvrage fournit toutes les clés pour analyser le roman de Jean Giono. • Le résumé et les repères pour la lecture sont suivis de l’étude des problématiques essentielles, parmi lesquelles : – La troupe des figurants – Le mystère Langlois – Cruauté et violence – Le thème du divertissement. • Ce Profil d’une œuvre comprend également une comparaison entre cette œuvre et Noé.', 128, 'Hatier', NULL),
(62, 1, 'Le temps dans Le chant du monde de Jean Giono', 'http://books.google.com/books/content?id=ZcZWAQAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'La lecture du Chant du monde que propose ici Jean-Paul Savignac explore, chapitre après chapitre, le soubassement mythologique du roman. En d autres termes, il y décèle l affleurement des mythes et nous convainc que le roman en est abondamment pétri. Il révèle en Giono \"un mytho-poète qui réactualisé les mythes de façon intuitive\" et découvre, se profilant derrière ses personnages et ses forces naturelles, des archétypes et des mythèmes.', 250, 'Critiques Littéraires', NULL),
(63, 1, 'L île mystérieuse', 'http://books.google.com/books/content?id=Syn1PQAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Au cours de la guerre de Sécession, cinq Nordistes : l ingénieur Cyrus Smith et son chien Top, le reporter Gédéon Spilett, le Noir Nab, le marin Pencroff et le jeune Harbert, prisonniers des troupes séparatistes, se sont enfuis en ballon. Pris dans la tempête, ils échouent sur une île déserte, en plein océan Pacifique. Ingénieux, persévérants, les cinq compagnons, pourtant privés de tout, ne tardent pas à s organiser, à vivre presque normalement. D ailleurs, l île, qu ils baptisent du nom de Lincoln, offre des ressources admirables et tout à fait inattendues. Mais une série de faits inexplicables, des coïncidences troublantes les obligent à croire à la présence d une puissance mystérieuse qui les épie sans cesse et conduit leur destinée, leur imposant sa volonté par des voies détournées, intervenant pour les sauver aux moments critiques... L Île mystérieuse un des très grands romans de Jules Verne, cet enchanteur aux charmes inépuisables.', 826, 'LGF/Le Livre de Poche', NULL),
(64, 1, 'Paris au XXe siècle', 'http://books.google.com/books/content?id=l7_jHAAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Paris, 1960 : une métropole splendide, étincelante d électricité, reliée à la mer par un gigantesque canal, sillonnée d autos et de métros silencieux...Tel est le monde fascinant qu ont forgé, conjuguant leurs efforts, la Finance et la Technique. Pourtant, cet avenir radieux a son envers. Seuls quelques marginaux, méprisés, bientôt vaincus par la misère et la faim, persistent dans le culte de l Art et de la Poésie, tandis qu un Etat omniprésent organise la distribution du savoir scientifique... Composé avant les \" Voyages extraordinaires \", refusé par l éditeur Hetzel, ce roman aura attendu cent trente ans avant de revoir le jour. Surprenant par la pertinence de son information scientifique, il vaut aussi et surtout par l acuité de son analyse des intrications de l économie, de la technique et la politique. Une vision ambiguë qui fait justice de l image d un Jules Verne chantre béat du Progrès. Et d abord un roman prenant, coloré, où le grandiose se teinte volontiers d un humour des plus sombres...', 186, 'LGF/Le Livre de Poche', NULL),
(65, 1, 'Voyage au Centre de la Terre', 'http://books.google.com/books/content?id=DuVRCE41gjgC&printsec=frontcover&img=1&zoom=5&source=gbs_api', NULL, NULL, NULL, NULL),
(66, 1, 'Voyage au centre de la Terre', NULL, 'Le professeur Lidenbrock est persuadé d avoir découvert le chemin qui mène au centre de la Terre. Accompagné de son neveu Axel, l impétueux géologue part en Islande. Là, au fond d un volcan, les deux explorateurs et leur guide s enfoncent dans les entrailles mystérieuses du globe. Un voyage d une folle audace, véritable défi lancé à la science.', 288, 'Livre de Poche Jeunesse (Le)', NULL),
(67, 2, 'Seven Novels', 'http://books.google.com/books/content?id=m0tJXwAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Collecting Five Weeks in a Balloon, Around the World in Eighty Days, A Journey to the Center of the Earth, From the Earth to the Moon, Round the Moon, Twenty-Thousand Leagues Under the Sea and The Mysterious Island, this title offers a compilation of seven of Jules Verne s Voyages.', 0, 'Barnes & Noble Incorporated', NULL),
(68, 1, 'Bibliocollège - Un hivernage dans les glaces, Jules Verne', 'http://books.google.com/books/content?id=no_FCQAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Un hivernage dans les glaces a été écrit sept ans avant la rencontre déterminante de Jules Verne avec l éditeur Jules Hetzel. Pourtant, Jules Verne jugera ce petit roman digne de rentrer sans modification dans Les Voyages extraordinaires aux côtés de Cinq semaines en ballon, de Vingt mille lieues sous les mers ou de l Île mystérieuse. Ce n est pas étonnant. Un hivernage dans les glaces, malgré sa brièveté, présente tout ce qui, dans les grands romans d aventures, nous ouvre la porte du rêve : voyage maritime, quête difficile, survie improbable dans un milieu hostile, mutinerie, courage et amour... Bibliocollège propose : • le texte intégral annoté, • des questionnaires au fil du texte, • des documents iconographiques exploités, • une présentation de Jules Verne et de son époque, • un aperçu du genre du roman d aventures, • un groupement de textes : « Survivre... ».', 128, 'Hachette Éducation', NULL),
(69, 2, 'Around the World in Eighty Days', 'http://books.google.com/books/content?id=jsSMEAAAQBAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Verne s classic novel of global voyaging One night in the reform club, Phileas Fogg bets his companions that he can travel across the globe in just eighty days. Breaking the well-established routine of his daily life, he immediately sets off for Dover with his astonished valet Passepartout. Passing through exotic lands and dangerous locations, they seize whatever transportation is at hand - whether train or elephant - overcoming set-backs and always racing against the clock. For more than seventy years, Penguin has been the leading publisher of classic literature in the English-speaking world. With more than 1,700 titles, Penguin Classics represents a global bookshelf of the best works throughout history and across genres and disciplines. Readers trust the series to provide authoritative texts enhanced by introductions and notes by distinguished scholars and contemporary authors, as well as up-to-date translations by award-winning translators.', 0, 'National Geographic Books', NULL),
(70, 1, 'C est arrivé la nuit', NULL, NULL, 416, NULL, NULL);
INSERT INTO `BOOK` (`ID_BOOK`, `ID_LANGUAGE`, `TITLE`, `IMAGE`, `DESCRIPTION`, `NUMBER_OF_PAGES`, `EDITOR`, `RELEASE_DATE`) VALUES
(71, 1, 'Le crépuscule des fauves', 'http://books.google.com/books/content?id=yPcTEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Maya a disparu. Une course contre la montre s engage sur le terrain pour les hackeurs du Groupe 9 qui cherchent à déjouer la conspiration des fauves. Les fauves, une poignée de puissants qui s attaquent à nos libertés. Leur plan : créer le chaos, s approprier toutes les richesses et régner sans limites. Mais qui est 9 ? * Ce nouveau thriller de Marc Levy est la suite passionnante de l aventure des 9 héros intrépides et attachants rencontrés dans C est arrivé la nuit. 9 Robins des Bois d aujourd hui, 9 hors la loi qui œuvrent pour le bien au péril de leur vie. Un roman d espionnage engagé qui dévoile de manière éblouissante les dérives de notre époque. * À propos de C est arrivé la nuit (tome 1) \" Un roman qu on ne peut pas lâcher, avec un rythme haletant, une écriture électrique. Il se dévore comme une série. \" François Busnel, La Grande Librairie \" Un panaché de Millénium et de James Bond. \" Bernard Lehut, RTL \" Les portraits des personnages sont magnifiques avec leurs fêlures et leur passé... Le fabuleux conteur sait tenir en haleine son lecteur. \" Mohammed Aïssaoui, Le Figaro littéraire \" Un roman à cent à l heure... Ce polar remue les tripes et donne envie de rejoindre ces Robin des Bois d aujourd hui. Émouvant, intelligent et très engagé. \" Sandrine Bajos, Le Parisien \" Un roman fort et palpitant. \" Anne Michelet, Version Femina', 267, 'Versilio', NULL),
(72, 1, 'Toutes ces choses qu on ne s est pas dites', 'http://books.google.com/books/content?id=S85rTVE-GR0C&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Quelques jours avant son mariage, Julia reçoit un coup de fil du secrétaire particulier de son père. Comme elle l avait pressenti, Anthony Walsh - homme d affaires brillant, mais père distant - ne pourra pas assister à la cérémonie. Pour une fois, Julia reconnaît qu il a une excuse irréprochable. Il est mort. Julia ne peut s empêcher de voir là un dernier clin d oeil de son père, qui a toujours eu un don très particulier pour disparaître soudainement et faire basculer le cours de sa vie. Le lendemain de l enterrement, Julia découvre que son père lui réserve une autre surprise. Sans doute le voyage le plus extraordinaire de sa vie... et peut-être pour eux deux l occasion de se dire, enfin, toutes les choses qu ils ne se sont pas dites. Marc Levy renoue ici avec l univers romantique et fantastique qui l a fait connaître. Dans cette aventure pleine de suspense, de tendresse et d humour, l auteur nous entraîne au coeur de la relation entre un père et sa fille et nous raconte l histoire d un premier amour - celui qui ne meurt jamais.', 315, 'Versilio', NULL),
(73, 1, 'Elle et Lui', NULL, 'Un site de rencontres les a réunis. Ils ne sont pas devenus amants, mais amis. Et ils comptent bien en rester là... Elle est actrice. Lui écrivain. Elle s appelle Mia. Lui Paul. Elle est anglaise. Lui américain. Elle se cache à Montmartre. Lui vit dans le Marais. Elle a beaucoup de succès. Lui pas vraiment. Elle est même une star. Mais lui ne le sait pas. Elle se sent seule. Lui aussi. Il la fait rire. Elle enchaîne les maladresses. Elle ne doit pas tomber amoureuse. Lui non plus. Dans ce roman, où l on retrouve les personnages de Et si c était vrai, Marc Lévy nous entraîne dans une histoire d amour irrésistible et totalement imprévisible. Elle & lui marque le grand retour de Marc Lévy à la comédie.', 384, 'Robert Laffont/Versilio', NULL),
(74, 1, 'Elle & lui', NULL, 'Elle est actrice. Lui, écrivain. Elle s appelle Mia. Lui, Paul. Elle est anglaise. Lui, américain. Elle se cache à Montmartre. Lui vit dans le Marais. Elle a beaucoup de succès. Lui, pas vraiment. Elle est même une star. Mais lui ne le sait pas. Elle se sent seule. Lui aussi. Il la fait rire. Elle enchaîne les maladresses. Elle ne doit pas tomber amoureuse. Lui non plus. Une comédie irrésistible et surprenante, relevée d une bonne pincée d humour, au coeur de la capitale française.', 384, NULL, NULL),
(75, 1, 'Si c était à refaire', NULL, NULL, 448, NULL, NULL),
(76, 1, 'La dernière des Stanfield', NULL, NULL, NULL, NULL, NULL),
(77, 1, 'Contes de Noël', NULL, 'Dans ces cinq contes, Dickens célèbre l esprit de Noël, le partage et la charité, et dénonce l injustice sociale qui exclut les pauvres de cette fête.. C est un portrait truculent de la vie quotidienne et une condamnation sans appel de l exploitation et de la misère. Ce message social, Dickens nous le donne en douceur, par le détour du conte et du fantastique. Comme l écrit Dominique Barbéris, \"ces contes nous rendent un peu d enfance à l état pur, dans la vigueur native des sentiments : l indignation et la pitié, le rire, la peur. Ils nous redonnent le bonheur oublié de nos premières lectures, ces lectures d adhésion sans distance critique, sans réserve, non pas sceptiques et endurcies, mais merveilleusement sensibles et \"crédules\"', 712, 'Editions Gallimard', NULL),
(78, 1, 'L histoire, les aventures, et l expérience personnelles de David Copperfield le jeune', NULL, 'Lorsqu en 1850 il publie David Copperfield Charles Dickens offre à ses lecteurs le premier roman qu il ait écrit à la première personne, et derrière l histoire de son jeune héros, c est aussi parfois la sienne qu on peut lire. Mais ce que dessinent surtout les douloureuses premières années, le dur apprentissage de la vie dans une fabrique, puis la fuite et l errance picaresque du jeune Copperfield, c est un roman de formation où le personnage se fait son propre biographe. Il arrive alors qu on ne sache pas si le réel évoqué est celui que l enfant vécut au présent ou celui que l adulte revisite au passé. Car, d épreuve en épreuve, c est une nouvelle image de soi que le narrateur peu à peu reconstruit, avant de devenir lui-même à la fin du livre un écrivain semblable à celui qui, dès le début, a pris la plume pour raconter sa vie - et nous offrir ce qui est encore aujourd hui le plus grand roman anglais du XIXe siècle. Cette édition du texte intégral, dans la traduction établie sous la direction de P. Lorain et revue par Laurent Bury et Jean-Pierre Naugrette, comprend également : une préface de Jean-Pierre Naugrette, des notes de Laurent Bury, une chronologie, une bibliographie.', 1024, 'LGF/Le Livre de Poche', NULL),
(79, 2, 'Pictures from Italy', 'http://books.google.com/books/content?id=-VTOcqwW3dAC&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Charles Dickens (1812-1870) has produced some of the most memorable writings in the English language, including such well known works as \"A Christmas Carol, Sketches by Boz, A Tale of Two Cities, Oliver Twist, Daivid Copperfield, Great Expectations, and The Pickwick Papers. Dickens is famous for the characters he created and his descriptions. A man of tremendous energy, he spent hours a day walking the London streets from which his characters and scenes came. Most of Dickens  work was in magazine serial form. Quiet Vision publishes not only Dickens  well known works but also many of his lesser known but still well crafted works.', 367, 'Penguin UK', NULL),
(80, 2, 'Major Works of Charles Dickens', 'http://books.google.com/books/content?id=IYqMEAAAQBAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'This perfect gift of perennial favorite Dickens classics includes Great Expectations, Hard Times, Oliver Twist, A Christmas Carol, Bleak House, and A Tale of Two Cities. Bound in high-quality, colorful linen cases with foil-stamped designs inspired by each classic, this specially curated boxed set of Penguin Clothbound Classics is designed by the award-winning Coralie Bickford-Smith.', 0, 'National Geographic Books', NULL),
(81, 2, 'Great Expectations', 'http://books.google.com/books/content?id=etp4J_KuuHwC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'An unknown benefactor provides Philip Pirrip with the chance to escape his poor upbringing. Aspiring to be a gentleman, and encouraged by his expectations of wealth, he abandons his friends and moves to London. His expectations prove to be unfounded however, and he must return home penniless.', 436, 'Wordsworth Editions', NULL),
(82, 1, 'Le drôle de Noël de Scrooge', NULL, 'Le soir de Noël, un vieil homme égoïste et solitaire choisit de passer la soirée seul. Mais les esprits de Noël en ont décidé autrement. L entraînant tour à tour dans son passé, son présent et son futur, les trois spectres lui montrent ce que sera son avenir s il persiste à ignorer que le bonheur existe, même dans le quotidien le plus ordinaire.', 156, NULL, NULL),
(83, 2, 'American Notes for General Circulation', 'http://books.google.com/books/content?id=t4CMEAAAQBAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'A fascinating account of nineteenth-century America sketched with Charles Dickens s characteristic wit and charm When Charles Dickens set out for America in 1842 he was the most famous man of his day to travel there - curious about the revolutionary new civilization that had captured the English imagination. His frank and often humorous descriptions cover everything from his comically wretched sea voyage to his sheer astonishment at the magnificence of the Niagara Falls, while he also visited hospitals, prisons and law courts and found them exemplary. But Dickens s opinion of America as a land ruled by money, built on slavery, with a corrupt press and unsavoury manners, provoked a hostile reaction on both sides of the Atlantic. American Notes is an illuminating account of a great writer s revelatory encounter with the New World. In her introduction, Patricia Ingham examines the response the book received when it was published, and compares it with similar travel writings of the period and with Dickens s fiction, in particular Martin Chuzzlewit. This edition includes an updated chronology, appendices and notes. For more than seventy years, Penguin has been the leading publisher of classic literature in the English-speaking world. With more than 1,700 titles, Penguin Classics represents a global bookshelf of the best works throughout history and across genres and disciplines. Readers trust the series to provide authoritative texts enhanced by introductions and notes by distinguished scholars and contemporary authors, as well as up-to-date translations by award-winning translators.', 0, 'National Geographic Books', NULL),
(84, 1, 'Une autobiographie', NULL, 'Publiée pour la première fois en 1977 en Angleterre l autobiographie d Agatha Christie nous permet d entrer dans l intimité d une femme au destin incroyable. Sacrée \" reine du crime \" de son vivant, elle connut un succès mondial. C est avec un humour ravageur qu elle se raconte : ses souvenirs d enfance, le naufrage de son premier mariage, sa relation particulière avec sa fille et, bien sûr, sa passion pour le suspense et la littérature... Mais ce que l on retiendra surtout chez cette femme qui met si bien la mort en scène, c est son admirable appétit de vivre.', 985, 'LGF/Le Livre de Poche', NULL),
(85, 1, 'Dix petits nègres', NULL, 'Il se passe quelque chose d anormal. Les dix personnes conviées sur l île du Nègre en ont la certitude. Pourquoi leur hôte est-il absent ? Soudain, une voix s élève, accusant d un crime chaque invité. Commence alors une ronde mortelle, rythmée par les couplets d une étrange comptine...', 320, 'Livre de Poche Jeunesse (Le)', NULL),
(86, 1, 'Cinq petits cochons', NULL, 'Amyas Crale, un peintre célèbre, a été assassiné, et sa femme, condamnée pour ce meurtre. Seize ans plus tard, leur fille, persuadée de l innocence de sa mère, demande à Hercule Poirot de mener une nouvelle enquête. Ayant retrouvé les cinq témoins de ce drame, tous coupables potentiels, Poirot déploie son exceptionnelle faculté de déduction pour découvrir qui a vraiment tué Amyas Crale.', 352, 'Livre de Poche Jeunesse (Le)', NULL),
(87, 1, 'Les travaux d Hercule', NULL, 'Pas de répit pour Hercule Poirot. Douze nouvelles, douze mystères brillamment élucidés.', 317, 'LGF/Le Livre de Poche', NULL),
(88, 2, 'An Autobiography', 'http://books.google.com/books/content?id=c3SgtwAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Millions of fans the world over got to know her beloved characters, Hercule Poirot, Miss Jane Marple, and the rest, yet for decades little was known about their creator. Dame Agatha Christie was a woman who scrupulously kept her private life hidden from view, dodging the press, granting no interviews, and even, for a brief time, famously disappearing. But shortly after the great lady s death, the silence was broken when An Autobiography was finally published. The witty, insightful, and immensely entertaining reflections of a marvelous talent, An Autobiography is as compulsively readable as Christie s novels. In her own inimitable style, a brilliant eccentric whose life encapsulated her times sheds light on her past, including her childhood in Victorian England, her volunteer work during World War II, and, of course, her phenomenal career. Agatha Christie s An Autobiography brings into sharp focus a beloved and enduring literary icon whose imagination continues to mesmerize readers to this very day.', 576, 'William Morrow Paperbacks', NULL),
(89, 2, 'Curtain', 'http://books.google.com/books/content?id=BuO8jwEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'A wheelchair-bound Poirot returns to Styles, the venue of his first investigation, where he knows another murder is going to take place...', 240, 'William Morrow', NULL),
(90, 2, 'And Then There Were None', 'http://books.google.com/books/content?id=Y5BdrgEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'The book that topped the international online poll held in Agatha Christie s 125th birthday year to discover which of her 80 crime books was the world s favourite. 1939. Europe teeters on the brink of war. Ten strangers are invited to Soldier Island, an isolated rock near the Devon coast. Cut off from the mainland, with their generous hosts Mr and Mrs U.N. Owen mysteriously absent, they are each accused of a terrible crime. When one of the party dies suddenly they realise they may be harbouring a murderer among their number. The 10 strangers include a reckless playboy, a troubled Harley Street doctor, a formidable judge, an uncouth detective, an unscrupulous mercenary, a God-fearing spinster, two restless servants, a highly decorated general and an anxious secretary. One by one they are picked off. Who will survive? And who is the killer? Copies of an ominous nursery rhyme hang in each room, the murders mimicking the awful fates of its  Ten Little Soldier Boys . The clear winner in an international online poll held to discover the world s favourite Agatha Christie book, this new paperback also coincides with a new 3-part BBC TV adaptation featuring a stellar ensemble cast: Douglas Booth, Charles Dance, Maeve Dermody, Burn Gorman, Anna Maxwell Martin, Sam Neill, Miranda Richardson, Toby Stephens, Noah Taylor and Aidan Turner.', 0, 'HarperCollins publishers', NULL),
(91, 1, 'Anatole France - Oeuvres', 'http://books.google.com/books/content?id=ojn4CwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Le Classcompilé n° 112 contient les oeuvres d Anatole France. Anatole France, pour l état civil François Anatole Thibault, né le 16 avril 1844 à Paris et mort le 12 octobre 1924 à Saint-Cyr-sur-Loire (Indre-et-Loire), est un écrivain français, considéré comme l’un des plus grands de l époque de la Troisième République, dont il a également été un des plus importants critiques littéraires. Il devient une des consciences les plus significatives de son temps en s’engageant en faveur de nombreuses causes sociales et politiques du début du XXe siècle. Il reçoit le prix Nobel de littérature pour l’ensemble de son œuvre en 1921 (Wikip.). LISTE DES TITRES : ROMANS LE CRIME DE SYLVESTRE BONNARD 1881 LES DÉSIRS DE JEAN SERVIEN 1882 BALTHASAR 1889 THAÏS 1890 LA RÔTISSERIE DE LA REINE PÉDAUQUE 1892 LES OPINIONS DE M. JÉRÔME COIGNARD 1893 LE JARDIN D’ÉPICURE 1894 LE LYS ROUGE 1894 LE PUITS DE SAINTE CLAIRE 1895 L’ORME DU MAIL 1897 LE MANNEQUIN D’OSIER 1897 L’ANNEAU D’AMÉTHYSTE 1900 MONSIEUR BERGERET À PARIS 1901 LE CRIME DE SYLVESTRE BONNARD (2IEME VERSION) 1902 HISTOIRE COMIQUE 1903 SUR LA PIERRE BLANCHE 1903 L’ÎLE DES PINGOUINS 1908 LES DIEUX ONT SOIF 1912 LA RÉVOLTE DES ANGES 1914 CONTES ET NOUVELLES JOCASTE 1879 LE CHAT MAIGRE 1879 LES AUTELS DE LA PEUR 1884 NOS ENFANTS (ILLUSTRÉ) 1886 L’ÉTUI DE NACRE 1892 CLIO (ILLUSTRÉ) 1899 CRAINQUEBILLE, PUTOIS, RIQUET, ET PLUSIEURS AUTRES RÉCITS PROFITABLES 1902 LES CONTES DE JACQUES TOURNEBROCHE 1908 LES SEPT FEMMES DE LA BARBE-BLEUE 1909 FILLES ET GARÇONS (ILLUSTRÉ) 1915 SOUVENIRS D’ENFANCE LE LIVRE DE MON AMI 1883 PIERRE NOZIÈRE 1899 LE PETIT PIERRE 1918 LA VIE EN FLEUR 1922 ESSAIS ET CRITIQUES LITTÉRAIRES LE LIVRE DU BIBLIOPHILE 1874 LA VIE LITTÉRAIRE _ PREMIÈRE SÉRIE 1888 LA VIE LITTÉRAIRE – DEUXIÈME SÉRIE 1890 LA VIE LITTÉRAIRE – TROISIÈME SÉRIE 1891 LA VIE LITTÉRAIRE – QUATRIÈME SÉRIE 1892 VIE DE JEANNE D’ARC I 1908 VIE DE JEANNE D’ARC II 1908 RABELAIS 1909 LE GÉNIE LATIN (PARTIEL) 1913 ESSAIS POLITIQUES ET DISCOURS OPINIONS SOCIALES 1902 DISCOURS PRONONCÉ À L’INAUGURATION DE LA STATUE D’ERNEST RENAN 1903 LE PARTI NOIR 1904 L’ÉGLISE ET LA RÉPUBLIQUE 1904 SUR LA VOIE GLORIEUSE 1915 DISCOURS PRONONCÉ À LA SORBONNE, LORS DU MEETING « HOMMAGE À L’ARMÉNIE » 1916 ON CROIT MOURIR POUR LA PATRIE... 1922 SALUT AUX SOVIETS 1922 POÉSIE LES POÈMES DORÉS 1873 THÉÂTRE AU PETIT BONHEUR 1898 CRAINQUEBILLE 1903 LA COMÉDIE DE CELUI QUI ÉPOUSA UNE FEMME MUETTE 1912 JUVENILIA MÉDITATION SUR LES RUINES DE PALMYRE 1859 WERTHER ET TOM JONES, TRADUITS PAR M. LE COMTE DE LA BÉDOYÈRE 1863 DIX VERS D’ANDRÉ CHENIER. ― SONT-ILS INÉDITS ? 1864 VOIR AUSSI THAÏS ET M. ANATOLE FRANCE 1890 Les livrels de lci-eBooks sont des compilations d’œuvres appartenant au domaine public : les textes d’un même auteur sont regroupés dans un eBook à la mise en page soignée, pour la plus grande commodité du lecteur. On trouvera le catalogue sur le site de l éditeur.', 5749, 'lci-eBooks', NULL),
(92, 1, 'Le Mannequin d osier', 'http://books.google.com/books/content?id=WoexEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Ce livre est le titre générique d un ensemble d articles d Anatole France, parus dans l , et qui désignera plus tard une série de quatre romans publiés chez Calmann-Lévy: (1897), (1897), (1899) et . Dans , M. Bergeret poursuit une existence qu il juge médiocre et indigne de lui. Rejeté à la fois par les notables locaux, le recteur et le doyen de la Faculté qui le jugent trop anticonformiste, il doit encore supporter le mépris de sa femme. Il atteint le comble de l écœurement quand il découvre qu elle le trompe avec son meilleur élève...', 188, 'BoD - Books on Demand', NULL),
(93, 1, 'Le Livre de mon ami', 'http://books.google.com/books/content?id=H4exEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Texte intégral. Cet ouvrage s’inscrit dans un projet de sauvegarde et de valorisation de bibliothèques et de fonds patrimoniaux anciens, rares ou oubliés, appartenant à la littérature des 19e et 20e siècles. Une collection de grands classiques, d’écrits pour le théâtre, de poésie, mais aussi des livres d’histoire, de philosophie ou d’économie, de récits de voyage ou de livres pour la jeunesse à re-découvrir via les librairies en ligne ou à lire sur papier avec une mise en page étudiée pour favoriser le confort de lecture.', 187, 'BoD - Books on Demand', NULL),
(94, 1, 'Œuvres complétes de Anatole France: La vie littéraire, 1-2 sér', 'http://books.google.com/books/content?id=v1EJDky1o7kC&printsec=frontcover&img=1&zoom=5&source=gbs_api', NULL, 688, NULL, NULL),
(95, 1, 'Coffret Anatole France', 'http://books.google.com/books/content?id=UBArEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Ce coffret contient trois œuvres d Anatole France : Thaïs, Le Lys rouge et Les dieux ont soif. Retrouvez d autres auteurs dans la collection Coffrets Classiques : Alexandre Dumas, Homère, Victor Hugo, Marivaux, Molière, Émile Zola, Honoré de Balzac, Guy de Maupassant, George Sand...', 1120, 'BnF collection ebooks', NULL),
(96, 1, 'Le Puits de sainte Claire', 'http://books.google.com/books/content?id=t0OxEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Les nouvelles qui composent ce recueil, se déroulent en Italie, une Italie rêvée par l auteur, entre MoyenÂge et Renaissance, inspirée par les , les et surtout les Fioretti qui racontent la vie de saint François d Assise. Il s agit, pour la plupart, d anecdotes écrites dans une langue raffinée et parfois archaïque, qui évoqueront des images de tombeaux antiques et de fresques florentines. Certains voudront, derrière la beauté de l écriture, tirer une signification de ces récits divers, marqués par la place tenue par les questions religieuses et la dialectique éternelle de la vie et de la mort. La leçon à retenir, peutêtre, est celle qu illustre le plus long texte de ce recueil et qui est ainsi formulée: «La vérité est blanche.» Anatole France, pour l état civil François Anatole Thibault, né le 16 avril 1844 à Paris et mort le 12 octobre 1924 à Saint-Cyr-sur-Loire (Indre-et-Loire), est un écrivain français. Il est considéré comme l’un des plus grands de l époque de la Troisième République, dont il a également été un des plus importants critiques littéraires. Il devient une des consciences les plus significatives de son temps en s’engageant en faveur de nombreuses causes sociales et politiques du début du xxe siècle.', 200, 'BoD - Books on Demand', NULL),
(97, 1, 'L Orme du mail', 'http://books.google.com/books/content?id=qkKxEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Ce livre est le titre générique d un ensemble d articles d Anatole France, parus dans l , et qui désignera plus tard une série de quatre romans publiés chez CalmannLévy: (1897), (1897), (1899) et . D abord attaché à construire une violente satire anticléricale, l auteur puise son inspiration dans les faits les plus brûlants de l actualité, l affaire Dreyfus notamment. L ensemble trouve son unité autour d un personnage central, M. Bergeret, universitaire libéral dont l honnêteté et l intelligence, durement éprouvées par la vie, s expriment à travers un scepticisme amer et désabusé. S il ne songe pas à corriger les injustices du monde, M. Bergeret ne renonce pas à en être le témoin lucide. Ce volume s ouvre sur la vacance de l évêché de Tourcoing. Deux candidats s affrontent. L un d eux, l abbé Lantaigne, responsable du grand séminaire, est un érudit, austère et froid, peu ami des idées nouvelles et tourné vers le passé. L autre, l abbé Guitrel, est professeur d éloquence, également au grand séminaire, et a plus de souplesse, ce qui lui permet de mieux réussir dans sa campagne. Tous deux sont également décrits comme sournois et hypocrites, bien loin des vertus chrétiennes qu ils sont censés incarner...', 192, 'BoD - Books on Demand', NULL),
(98, 1, 'Les dessins de Guillaume Apollinaire', 'http://books.google.com/books/content?id=hxpLAQAAIAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Tout le monde connaît les poèmes et les calligrammes de Guillaume Apollinaire. Mais sait-on que cet homme, fervent partisan de l art contemporain et de ses amis - Marie Laurencin, Giorgio De Chirico, Pablo Picasso, Francis Picabia, Marcel Duchamp, Michel Larionov, Nathalie Gontcharova, Sonia et Robert Delaunay, Jean Cocteau et d autres - a dessiné dès son jeune âge, remplissant des pages de ses cahiers de visages humains le plus souvent tristes ou grotesques, dont on imagine qu ils correspondent à des êtres familiers ? Portraits, paysages, bestiaire, figures imaginaires, soldats : comme toujours, avec les dessins d écrivains, naît une curiosité redoublée par le sentiment de décrypter l œuvre poétique afin de mieux la goûter. Ces dessins sont toujours exécutés sans prétention ; ils se faufilent dans les manuscrits et mettent le lecteur en situation d explorateur. En effet, nous assistons presque miraculeusement à l émergence de l inspiration poétique. Ce livre, publié à l occasion des quatre-vingt-dix ans de sa disparition, présente pour la première fois plus de trois cents dessins et documents reproduits en couleurs de Guillaume Apollinaire. Personnage complexe, né à Rome en 1880 d une mère russo-polonaise et d un père inconnu, il est mort à Paris le 9 novembre 1918 de la grippe espagnole, après avoir été gazé et gravement blessé sur le front. Il n apprit le français qu à l âge de cinq ans et devint tout à la fois poète, critique d art, romancier, auteur de nouvelles extraordinaires, amateur de textes érotiques. Son engagement volontaire dans la Grande Guerre lui permit d obtenir la naturalisation française. On savait tout, ou presque, de Guillaume de Kostrowitzky, que ses amis surnommaient \" Cointreau-whisky \" ; on ignorait la diversité de son œuvre graphique. Ce recueil, présenté et commenté par deux éminents spécialistes, constitue un document indispensable pour les amateurs du poète, et merveilleux pour tout lecteur curieux.', 164, 'Buchet-Chastel', NULL),
(99, 1, 'Alcools de Guillaume Apollinaire (fiche de lecture de référence)', 'http://books.google.com/books/content?id=cY6ODwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Venez découvrir Alcools, le recueil de Guillaume Apollinaire, grâce à une analyse littéraire de référence. Écrite par un spécialiste universitaire, cette fiche de lecture est recommandée par de nombreux enseignants. Cet ouvrage contient plusieurs parties : • la biographie de l écrivain • le résumé détaillé • le mouvement littéraire • le contexte de publication du recueil • l analyse complète Retrouvez tous nos titres sur : www.fichedelecture.fr.', NULL, 'Comprendre la littérature', NULL),
(100, 1, 'Poèmes de Guillaume Apollinaire', NULL, 'De la chanson au vers libre, la poésie d Apollinaire est à la fois classique et passionnément inspirée par la modernité. Mélancolique et fervente, elle chante la vie, l espérance, l amour, la fuite du temps. La puissance d une parole poétique inégalée.', 93, 'Gallimard-Jeunesse', NULL),
(101, 1, 'Guillaume Apollinaire : Oeuvres et annexes (annotées, illustrées)', 'http://books.google.com/books/content?id=6KONDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Retrouvez les oeuvres majeures de Guillaume Apollinaire dans une nouvelle édition augmentée de centaines de notes explicatives et d illustrations qui satisfera les lecteurs les plus exigeants. LISTE DES OEUVRES : Oeuvres poétiques : — Le bestiaire ou cortège d’Orphée (1911) — Alcools (1911) — Calligrammes : poèmes de la paix et de la guerre (1913-1916) Oeuvres en prose de fiction : — L’Hérésiarque & cie (1910) — La fin de Babylone (1914) — Les trois Don Juan (1915) Théâtre : — Les mamelles de Tirésias (1917) Essais et articles : L’esprit nouveau et les poètes (1917) ERGONOMIE AMÉLIORÉE : L ouvrage a été spécifiquement mis en forme pour votre liseuse. - Naviguez par simple clic de chapitre à chapitre ou de livre à livre. - Accédez instantanément à la table des matières hyperliée globale. - Une table des matières est placée également au début de chaque titre. A PROPOS DE L ÉDITEUR : Les éditions Arvensa sont les leaders de la littérature classique numérique. Leur objectif est de vous faire connaître les oeuvres des grands auteurs de la littérature classique en langue française à un prix abordable tout en vous fournissant la meilleure expérience de lecture sur votre liseuse. Tous les titres sont produits avec le plus grand soin. Le service qualité des éditions Arvensa s’engage à vous répondre dans les 48h.', NULL, 'Arvensa Editions', NULL),
(102, 1, 'Apollinaire', 'http://books.google.com/books/content?id=TsJ-vMU3i2YC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'APOLLINAIRE, Guillaume, poète français, 1880-1918', 164, 'RENAISSANCE DU LIVRE', NULL),
(103, 1, 'Guillaume Apollinaire : Oeuvres et annexes (annotées, illustrées)', 'http://books.google.com/books/content?id=6KONDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Retrouvez les oeuvres majeures de Guillaume Apollinaire dans une nouvelle édition augmentée de centaines de notes explicatives et d illustrations qui satisfera les lecteurs les plus exigeants. LISTE DES OEUVRES : Oeuvres poétiques : — Le bestiaire ou cortège d’Orphée (1911) — Alcools (1911) — Calligrammes : poèmes de la paix et de la guerre (1913-1916) Oeuvres en prose de fiction : — L’Hérésiarque & cie (1910) — La fin de Babylone (1914) — Les trois Don Juan (1915) Théâtre : — Les mamelles de Tirésias (1917) Essais et articles : L’esprit nouveau et les poètes (1917) ERGONOMIE AMÉLIORÉE : L ouvrage a été spécifiquement mis en forme pour votre liseuse. - Naviguez par simple clic de chapitre à chapitre ou de livre à livre. - Accédez instantanément à la table des matières hyperliée globale. - Une table des matières est placée également au début de chaque titre. A PROPOS DE L ÉDITEUR : Les éditions Arvensa sont les leaders de la littérature classique numérique. Leur objectif est de vous faire connaître les oeuvres des grands auteurs de la littérature classique en langue française à un prix abordable tout en vous fournissant la meilleure expérience de lecture sur votre liseuse. Tous les titres sont produits avec le plus grand soin. Le service qualité des éditions Arvensa s’engage à vous répondre dans les 48h.', NULL, 'Arvensa Editions', NULL),
(104, 1, 'Bibliolycée - Alcools, Apollinaire - BAC 2022', 'http://books.google.com/books/content?id=9z0pEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Programme Bac 2022 Première générale et Premières technologiques Parcours : Modernité poétique ? L oeuvre : « Sous le pont Mirabeau coule la Seine »... Ces mots nostalgiques d’Apollinaire, si souvent mis en musique, chantent toujours à nos oreilles la tristesse du « mal-aimé »... Mais le recueil Alcools, c’est aussi l’œuvre d’un aventurier de la poésie en quête d’un nouveau langage capable de « changer les mots en étoiles ». Ses poèmes, brûlants comme l’alcool, ouvrent à une nouvelle vision de la réalité où se mêlent la frénésie de la ville moderne, la mélancolie de l’automne ou de l’amour perdu et la magie des vieilles légendes. En abolissant les frontières entre le réel et l’imaginaire, entre la raison et la musique, Apollinaire l’enchanteur invite le lecteur à devenir, comme lui, un chercheur de sens et un inventeur de mots. DOSSIER SPECIAL BAC 2022 : Le texte intégral annoté Quatre questionnaires d’analyse de l’œuvre Une présentation de Guillaume Apollinaire et de son époque Le genre de l’œuvre et sa place dans l’histoire littéraire Une rubrique « Portfolio » pour la lecture d’images Un dossier « Spécial bac » proposant un groupement de textes et des sujets d’écrit sur le parcours : Modernité poétique ?', 208, 'Hachette Éducation', NULL),
(105, 1, 'N oublier jamais', 'http://books.google.com/books/content?id=W4ljvgEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', '\"À Yport, parti courir sur la plus haute falaise d’Europe, Jamal a d’abord remarqué l’écharpe, rouge, accrochée à une clôture. Puis la femme, incroyablement belle, la robe déchirée, le dos face au vide, les yeux rivés aux siens. Jamal lui tend l’écharpe comme on tend une bouée. Quelques secondes plus tard, sur les galets glacés de la plage déserte, gît le corps inerte de l’inconnue. À son cou, l’écharpe rouge. Tout le monde pense qu’il l’a poussée. Il voulait simplement la sauver. C’est la version de Jamal. Le croyez-vous ?\" [Source : 4e de couv.]', 542, NULL, NULL),
(106, 1, 'Rien ne t efface', 'http://books.google.com/books/content?id=UPMqzgEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Extrait de la 4ème de couverture : \"Juin 2010 : Esteban, dix ans, disparaît sur la plage de Saint-Jean-de-Luz. Personne n a rien vu. Juin 2020 : sa mère, Maddi, a refait sa vie mais la douleur et l incompréhension sont toujours là. Elle revient en pèlerinage au Pays Basque et, sur la même plage, reconnaît Esteban. Ou son jumeau parfait, Tom, un enfant de dix ans. Maddi quitte tout pour découvrir l identité de ce garçon et s installe dans son village, à Murol, en Auvergne. Elle, si rationnelle, peut-elle croire à l impossible ? Esteban serait-il devenu Tom ? L histoire se répéterait-elle ? Tom est-il en danger ? Maddi est-elle la seule à pouvoir le protéger ?\"', 447, 'Presses de la Cité', NULL),
(107, 1, 'J ai dû rêver trop fort', 'http://books.google.com/books/content?id=dn_PDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Les plus belles histoires d amour ne meurent jamais. Les plus belles histoires d amour ne meurent jamais. Elles continuent de vivre dans nos souvenirs et les coïncidences cruelles que notre esprit invente. Mais quand, pour Nathy, ces coïncidences deviennent trop nombreuses, doit-elle croire qu il n y a pas de hasard, seulement des rendez-vous ? Qui s évertue à lui faire revivre cette parenthèse passionnelle qui a failli balayer sa vie ? Quand passé et présent se répètent au point de défier toute explication rationnelle, Nathy doit-elle admettre qu on peut remonter le temps ? En quatre escales, Montréal, San Diego, Barcelone et Jakarta, dans un jeu de miroirs entre 1999 et 2019, J ai dû rêver trop fort déploie une partition virtuose, mêlant passion et suspense, au plus près des cœurs qui battent trop fort. Inédit ! L artiste Gauvain Sers compose et interprète la bande originale du roman. La chanson, dont les paroles sont signées Michel Bussi, est au cœur de l intrigue de J ai dû rêver trop fort. Elle s intitule Que restera-t-il de nous ? et sera disponible en ligne dès le 1er mars puis sur l album de Gauvain Sers à partir du 29 mars.', 392, 'Presses de la Cité', NULL),
(108, 1, 'Nymphéas noirs', 'http://books.google.com/books/content?id=cofmXEPe-FUC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Trois femmes vivaient dans un village. La première était méchante, la deuxième était menteuse, la troisième était égoïste. Elles possédaient pourtant un point commun, un secret en quelque sorte : toutes les trois rêvaient de fuir... Tout n est qu illusion, surtout quand un jeu de miroirs multiplie les indices et brouille les pistes. Pourtant les meurtres qui troublent la quiétude de Giverny, village cher à Claude Monet, sont bien réels. Au cœur de l intrigue, trois femmes : une fillette de onze ans douée pour la peinture, une institutrice redoutablement séduisante et une vieille femme aux yeux de hibou qui voit et sait tout. Et puis, bien sûr, une passion dévastatrice. Le tout sur fond de rumeur de toiles perdues ou volées, dont les fameux Nymphéas noirs. Perdues ou volées, telles les illusions quand passé et présent se confondent et que jeunesse et mort défient le temps. Un suspense brillant, à la résolution insoupçonnable, dans lequel chaque personnage est une énigme. 2017, prix Segalen des lycées français de la zone Asie Pacifique 2011, prix des lecteurs du festival Polar de Cognac 2011, prix du polar méditerranéen (festival de Villeneuve-lez-Avignon) 2011, prix Michel Lebrun de la 25e heure du Mans 2011, Grand prix Gustave Flaubert de la Société des écrivains normands 2011, prix des lecteurs du festival Sang d Encre de la ville de Vienne (\" gouttes de Sang d encre \") 2011, Finaliste du prix mystère de la critique (3e), du prix du polar francophone de Montigny-lès-Cormeilles (2ème), du prix marseillais du polar, du prix Polar de Cognac, du prix du roman populaire d Elven, du prix Plume-Libre, du prix plume de Cristal du festival policier de Liège.', 299, 'Presses de la Cité', NULL),
(109, 1, 'Gravé dans le sable', NULL, 'Quel est le prix d une vie ? Quand on s appelle Lucky, qu on a la chance du diable, alors peut-être la mort n est-elle qu un défi. Un jeu. Ils étaient cent quatre-vingt-huit soldats sur la péniche en ce jour de juin 1944. Et Lucky a misé sa vie contre une hypothétique fortune. Alice, sa fiancée, n a rien à perdre lorsque, vingt ans plus tard, elle apprend l incroyable pacte conclu par Lucky. De la Normandie aux Etats-Unis, elle se lance en quête de la vérité et des témoins de l époque... au risque de réveiller les démons du passé. \" Cet ouvrage va vous plaire. Nous, on l adore ! \" Femme actuelle \" Nouvelle édition, revue et corrigée, de son premier roman déjà aussi passionnant que les autres. Un must ! \" Nadine Monfils', 477, NULL, NULL),
(110, 1, 'T en souviens-tu, mon Anaïs?', NULL, NULL, 298, NULL, NULL),
(111, 1, 'Code Lupin', 'http://books.google.com/books/content?id=USunCgAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Plongez dans le Da Vinci Code normand ! L’aiguille creuse d’Étretat, les tours blanches de l’abbaye de Jumièges, le vieux phare de Tancarville, le tombeau de Rollon sous les ruines de Thibermesnil, la valleuse déserte de Parfonval, les îles englouties de la Seine, les marées d’équinoxe de la Barre-y-va... Autant de lieux mystérieux dont les énigmes sont percées par Arsène Lupin, dans de fascinantes chasses aux trésors, au cœur du triangle d’or, le fameux triangle cauchois, imaginé par Maurice Leblanc. Imaginé ? Est-ce si sûr ? Et si les aventures d’Arsène Lupin dissimulaient un code ? Un sens secret ? La clé d’un trésor normand, bien réel celui-là ? Le professeur Roland Bergton en est convaincu. Il dispose d’une journée pour percer l’énigme, avec pour seuls indices une pièce d’or trouvée sous les falaises, une nouvelle inachevée de Maurice Leblanc... et l’aide d’une jeune étudiante en histoire, aussi brillante que séduisante. Code Lupin, une invitation au voyage et un jeu de piste à la recherche d un trésor, dans les pas d’Arsène Lupin... EXTRAIT Gérard Meyer hésita quelques instants avant d’entrer dans l’office de tourisme de Saint-Valery-en-Caux, cette longue bâtisse à colombages, étrange et biscornue. Ce 11 juillet, un soleil de plomb s’était abattu toute la journée sur la petite station balnéaire. C’était comme cela depuis une semaine, et seuls de violents orages chaque soir venaient perturber la canicule. Mais en cette fin d’après-midi, pour l’instant, aucun vent ne soufflait et les drapeaux européen, français, normand, pendaient immobiles, paresseusement, devant la mairie. À quelques mètres, les bateaux multicolores du port de plaisance clapotaient doucement. Ils étaient piégés. C’était la marée basse. Ils devraient attendre plusieurs heures avant de pouvoir sortir en mer. CE QU EN PENSE LA CRITIQUE Code Lupin, une sorte de Da Vinci Code à la normande, sur fond de falaises crayeuses, à Étretat. - Anne Letouzé, L’Union Un régal, j ai adoré ce livre qui m a donné envie de me replonger dans les aventures du gentleman cambrioleur. - jonatmeltom, Babelio Un vrai jeu de piste rocambolesque qui double cette course poursuite. Avec ce duo de choc, on sillonne la Normandie et on n’est pas loin d’un Da Vinci Code, auquel le titre fait d’ailleurs référence ! - Lisou, Les pipelettes en parlent Étretat et son aiguille creuse, Jumièges et son abbaye, Tancarville et son vieux phare, la Barre-y-va et ses marées d’équinoxes, le château de Thibermesnil... Bref, que du plaisir ! - lesloisirsdebernie.over-blog.com Code Lupin propose un roman basé sur un concept amusant (sur les pas d Arsène Lupin !), avec un côté dépaysement et pas mal d aventures ! Plutôt pas mal pour se détendre en vacances ! - Ellane92, Critiques libres À PROPOS DE L’AUTEUR Michel Bussi est l’un des auteurs de romans policiers les plus lus et les plus primés en France (il est notamment l auteur de Un avion sans elle et Nymphéas noirs). Ses romans, des page-turner sans surenchère de détails macabres, parviennent à faire la synthèse entre le meilleur de l’atmosphère des romans policiers populaires français et le rythme des romans à suspense américains. Et c’est ce que les lecteurs adorent... Code Lupin est son premier livre de fiction publié. En 2015, Michel Bussi est le 3e auteur le plus lu en France, et toujours dans le top 20 polars en début d’année 2016 avec Maman a tort !', 224, 'Éditions des Falaises', NULL),
(112, 1, 'Trois', 'http://books.google.com/books/content?id=kxkgEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', '\"Une pépite de roman\". Le Parisien Palmarès 2021 Les 100 livres de l année du magazine Lire « Je m’appelle Virginie. Aujourd’hui, de Nina, Adrien et Etienne, seul Adrien me parle encore. Nina me méprise. Quant à Etienne, c’est moi qui ne veux plus de lui. Pourtant, ils me fascinent depuis l’enfance. Je ne me suis jamais attachée qu’à ces trois-là. » 1986. Adrien, Etienne et Nina se rencontrent en CM2. Très vite, ils deviennent fusionnels et une promesse les unit : quitter leur province pour vivre à Paris et ne jamais se séparer. 2017. Une voiture est découverte au fond d’un lac dans le hameau où ils ont grandi. Virginie, journaliste au passé énigmatique, couvre l’événement. Peu à peu, elle dévoile les liens extraordinaires qui unissent ces trois amis d’enfance. Que sont-ils devenus ? Quel rapport entre cette épave et leur histoire d’amitié ? Valérie Perrin a ce don de saisir la profondeur insoupçonnée des choses de la vie. Au fil d’une intrigue poignante et implacable, elle nous plonge au cœur de l’adolescence, du temps qui passe et nous sépare. Ses précédents romans, Les Oubliés du dimanche et Changer l’eau des fleurs, ont connu des succès mondiaux, totalisant plus de deux millions d’exemplaires, traduits dans une trentaine de pays. En 2018, elle a été récompensée par le prix Maison de la Presse et le prix Choix des Libraires du Livre de Poche ; en 2019, par le prix des Lecteurs. Coup de coeur - Les 10 meilleurs livres de 2021 - Le Parisien', 672, 'ALBIN MICHEL', NULL),
(113, 1, 'Changer l eau des fleurs', 'http://books.google.com/books/content?id=hfFIDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Violette Toussaint est garde-cimetière dans une petite ville de Bourgogne. Les gens de passage et les habitués viennent se réchauffer dans sa loge où rires et larmes se mélangent au café qu’elle leur offre. Son quotidien est rythmé par leurs confidences. Un jour, parce qu’un homme et une femme ont décidé de reposer ensemble dans son carré de terre, tout bascule. Des liens qui unissent vivants et morts sont exhumés, et certaines âmes que l’on croyait noires, se révèlent lumineuses. Après l’émotion et le succès des Oubliés du dimanche, Valérie Perrin nous fait partager l’histoire intense d’une femme qui, malgré les épreuves, croit obstinément au bonheur. Avec ce talent si rare de rendre l’ordinaire exceptionnel, Valérie Perrin crée autour de cette fée du quotidien un monde plein de poésie et d’humanité. Un hymne au merveilleux des choses simples.', 560, 'ALBIN MICHEL', NULL),
(114, 1, 'Changer l eau des fleurs', NULL, 'Violette Toussaint est garde-cimetière dans une petite ville de Bourgogne. Les gens de passage et les habitués viennent se confier et se réchauffer dans sa loge. Avec la petite équipe de fossoyeurs et le jeune curé, elle forme une famille décalée. Mais quels événements ont mené Violette dans cet univers où le tragique et le cocasse s entremêlent ? Après le succès des Oubliés du dimanche, un nouvel hymne au merveilleux des choses simples.', 672, NULL, NULL),
(115, 1, 'Les Oubliés du dimanche', 'http://books.google.com/books/content?id=80quCAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Justine, vingt et un ans, aime les personnes âgées comme d autres les contes. Hélène, presque cinq fois son âge, a toujours rêvé d apprendre à lire. Ces deux femmes se parlent, s écoutent, se révèlent l une à l autre jusqu au jour où un mystérieux « corbeau » sème le trouble dans la maison de retraite qui abrite leurs confidences et dévoile un terrible secret. Parce qu on ne sait jamais rien de ceux que l on connaît. À la fois drôle et mélancolique, Les oubliés du dimanche est un roman d amours passées, présentes, inavouées... éblouissantes.', 384, 'Albin Michel', NULL),
(116, 1, 'Les oubliés du dimanche', NULL, 'Justine, vingt et un ans, aime les personnes âgées comme d autres les contes. Hélène, presque cinq fois son âge, a toujours rêvé d apprendre à lire. Ces deux femmes se parlent, s écoutent, se révèlent l une à l autre jusqu au jour où un mystérieux «corbeau» sème le trouble dans la maison de retraite qui abrite leurs confidences et dévoile un terrible secret. Parce qu on ne sait jamais rien de ceux que l on connaît. A la fois drôle et mélancolique, Les Oubliés du dimanche est un roman d amours passées, présentes, inavouées... éblouissantes.', 378, NULL, NULL),
(117, 1, 'Trois', NULL, NULL, NULL, NULL, NULL),
(118, 1, '24 h ensemble', NULL, NULL, 87, NULL, NULL),
(119, 1, 'Le Rouge et le Noir', NULL, 'Ce livre est une oeuvre unique il débute par une biographie détaillée et illustrée de STENDHAL .Il s accompagne d une de ses oeuvres : \"Le Rouge et Le Noir\" .AUTEUR : Henri Beyle, plus connu sous le pseudonyme de Stendhal, né le 23 janvier 1783 à Grenoble et mort d apoplexie le 23 mars 1842 à Paris, est un écrivain français, connu en particulier pour ses romans Le Rouge et le Noir et La Chartreuse de Parme.RÉSUMÉ :Le roman est divisé en deux parties : la première partie retrace le parcours de Julien Sorel en province, dans une petite ville nommée Verrières, puis à Besançon, et plus précisément son entrée chez les Rênal, et sa passion avec Louise de Rênal, de même que son séjour dans un séminaire ; la seconde partie porte sur la vie du héros à Paris comme secrétaire du marquis de La Mole, et la passion qu il a avec sa fille, Mathilde .EXTRAIT : À force d examiner le comte Norbert, Julien remarqua qu il était en bottes et en éperons ; et moi je dois être en souliers, apparemment comme inférieur. On se mit à table. Julien entendit la marquise qui disait un mot sévère, en élevant un peu la voix.', 509, NULL, NULL),
(120, 1, 'Stendhal : sa vie, son œuvre et sa philosophie', 'http://books.google.com/books/content?id=ErklEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Ce livre traite de l’histoire de la vie et de la philosophie de Stendhal. Né à Grenoble, le 23 janvier 1783, Henri Beyle, plus connu sous le nom de Stendhal, se distingua dès sa jeunesse avec cette vivacité d’intelligence qui a valu tant d’hommes distingués au pays qui l’a vu naître... « L’originalité philosophique d’une période, il faut la chercher presqu’aussi souvent chez un moraliste, un poète, un romancier, que chez les philosophes vrais, les hommes de culture philosophique et dont la philosophie fut le métier ou l’objet d’une méditation constante. Notre dix-septième siècle a eu Descartes, Malebranche. Au dix-neuvième siècle, quelques esprits indépendants et originaux ont également construit, sans le savoir, une véritable philosophie. Ainsi Stendhal... »', 132, 'Editions Le Mono', NULL),
(121, 1, 'Stendhal : Oeuvres complètes et annexes (annotées, illustrées)', 'http://books.google.com/books/content?id=EqWNDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Nouvelle édition enrichie de plus de 11000 notes, de centaines d’illustrations, d introductions et d annexes. L ouvrage le plus complet à ce jour des oeuvres de Stendhal, mis en forme spécifiquement pour une navigation et une lecture optimales sur votre liseuse. Il contient 141 titres CONTENU DÉTAILLÉ : LES 14 ROMANS ET NOUVELLES : Armance - Le Rouge et le Noir - Lucien Leuwen - La Chartreuse de Parme - Lamiel - Souvenirs d’un gentilhomme italien - Le Coffre et le Revenant - Mina de Vanghel - Le Philtre... LES 10 CHRONIQUES ITALIENNES : Vanina Vanini - San Francesco a Ripa - Vittoria Accoramboni - Les Cenci - La Duchesse de Palliano - L Abbesse de Castro - Trop de faveur tue - Suora Scolastica - Les tombeaux de Corneto - La comédie est impossible en 1836. LES 15 FRAGMENTS ROMANESQUES : Le roman de Métilde - Journal de sir John Armitage - Francesca Polo - Le lac de Genève - Paul Sergar - Une position sociale - Anecdote italienne - Maria Fortunata - Madame Tarin - Le Consiprateur - A-Imagination... LES 2 FRAGMENTS POÉTIQUES : La Pharsale - Vers lyriques LES 17 ESSAIS DE PSYCHOLOGIE, MŒURS ET SOCIÉTÉ : Anecdote - Du caractère des femmes françaises - Le caractère et la géologie - Jean-Louis en Province - D’un nouveau complot contre les industriels ... et tous les autres. LES 17 oeuvres AUTOBIOGRAPHIQUES : Journal (3 tomes) - Pensées : Filosofia Nova - Souvenirs d’égotisme - Vie de Henri Brulard ... et toutes les autres. LES 3 CRITIQUES LITTÉRAIRES : Courrier anglais - Racine et Shakespeare - Molière, Shakespeare, la comédie et le rire LES 4 CRITIQUES D’ART : Histoire de la peinture en Italie - Écoles italiennes de peinture LES 5 oeuvres BIOGRAPHIQUES : Vie de Rossini - d’un dilettante - Vie de Haydn, de Mozart et de Métastase - Vie de Napoléon - Mémoires sur Napoléon LES 16 oeuvres THÉÂTRALES : Selmours - Les quiproquo - Le ménage à la mode - Les amours de Zélinde et Lindor - Ulysse ... et toutes les autres LES 9 RÉCITS DE VOYAGE : Mémoires d’un touriste - Rome, Naples et Florence - Promenades dans Rome - Pages d’Italie - Voyage dans le midi de la France LES 21 OEUVRES POLITIQUES : Sur le général Moreau ... et toutes les autres. LES 6 OEUVRES D’HISTOIRE : Histoire de la guerre de succession - Renaissance de la Grèce - Le pape Léon XII - Le gouvernement pontifical - Rome et le pape en 1832 - Tartarie chinoise LA CORRESPONDANCE (1800 à 1814) LES ANNEXES : Sur la vie et les ouvrages de M. Beyle par R. Colomb et autres annexes ERGONOMIE AMÉLIORÉE : L ouvrage a été...', NULL, 'Arvensa Editions', NULL);
INSERT INTO `BOOK` (`ID_BOOK`, `ID_LANGUAGE`, `TITLE`, `IMAGE`, `DESCRIPTION`, `NUMBER_OF_PAGES`, `EDITOR`, `RELEASE_DATE`) VALUES
(122, 1, 'De l Amour par de Stendhal (Henry Beyle)', 'http://books.google.com/books/content?id=A6Ss7Gq5rhIC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 404, NULL, NULL),
(123, 1, 'Oeuvres complètes de Stendhal: Armance', 'http://books.google.com/books/content?id=X1w6AQAAMAAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 656, NULL, NULL),
(124, 1, 'Stendhal (12 ouvrages classique)', 'http://books.google.com/books/content?id=ucTsDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Stendhal (12 ouvrages classique) : souvenirs d un gentilhomme italien, romans et nouvelles préface de l’éditeur, Philibert lescale, mina de vanghel, le rouge et le noir, le rose et le vert, le philtre, le juif, le coffre et le revenant, le chevalier de saint-Ismier, la chartreuse de parme, feder .', 1424, 'By Label AA-Prod/Edits (Artmusiclitte) 2015', NULL),
(125, 2, 'Le Rouge et le Noir', 'http://books.google.com/books/content?id=tWErAgAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'La collection Le Petit classique vous offre la possibilité de découvrir ou redécouvrir Le Rouge et le Noir de Stendhal, accompagné d une biographie de l auteur, d une présentation de l oeuvre et d une analyse littéraire, rédigées par un spécialiste universitaire. Notre travail éditorial vous offre un grand confort de lecture, spécialement développé pour la lecture numérique. Cet eBook contient : - Un sommaire dynamique - La biographie de Stendhal - La présentation de l oeuvre - Le roman complet - L analyse littéraire', 564, 'Les Éditions de l Ebook malin', NULL),
(126, 4, 'Madame Bovary', 'http://books.google.com/books/content?id=k7CIPwAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', NULL, 453, NULL, NULL),
(127, 1, 'Madame Bovary', 'http://books.google.com/books/content?id=1ThlAAAAMAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Fille d un riche fermier, Emma Rouault épouse Charles Bovary, officier de santé et veuf récent d une femme tyrannique. Élevée dans un couvent, Emma aspire à vivre dans le monde de rêve dont parlent les romans à l eau de rose qu elle y a lu. Un bal au château de Vaubyessard la persuade qu un tel monde existe, mais le décalage qu elle découvre avec sa propre vie déclenche chez elle une maladie nerveuse. La naissance d une fille la distrait un peu, mais bientôt Emma cède aux avances de Rodolphe. Elle veut s enfuir avec son amant qui, lâche, l abandonne... [RERO]', 532, 'Editions Gallimard', NULL),
(128, 1, 'Gustave Flaubert - Les oeuvres complètes (Edition augmentée)', 'http://books.google.com/books/content?id=RLoeCwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Edition augmentée de nombreuses illustrations, notes et annexes.Vous y retouverez l intégrale des oeuvres de Gustave Flaubert et plus encore. Cet ebook énorme a fait l objet d un véritable travail de recherche, correction, mise en page pour votre plus grand confort de lecture. La navigation se fait aisément au sein de l oeuvre grâce aux tables des matières hyperliées et NCX intégrées. Pour nous faire part de vos remarques ou signaler une erreur, veuillez nous écrire à editions@ligram.com, les titres seront mis à jour dans les plus brefs délais. Sommaire : - Romans : l’Éducation sentimentale (1869) - Madame Bovary - Bouvard et Pécuchet - Trois Contes - Salammbô - La tentation de saint Antoine - Théâtre : Le candidat - Le sexe faible - Le château des coeurs - Voyages : Par les champs et par les grèves - notes de voyages - Oeuvres de jeunesse : Deux mains sur une couronne - Un secret de Philippe le prudent - Un parfum à sentir - La femme du monde - La peste à florence - Bibliomanie - Rage et impuissance - Rêve d enfer - Une leçon d histoire naturelle - Quidquid volueris - Passion et vertu - Loys XI - Agonies. angoisses - La danse des morts - Ivre et mort - Mémoires d un fou - Les arts et le commerce - Art et progrès - San Pietro Ornano - Matteo Falcone - Chevrin et le roi de Prusse - Dernière scène de la mort de Marguerite de Bourgogne. - Portrait de Lord Byron - Le moine des Chartreux - Mort du duc de Guise - Smarh - Les funérailles du docteur Mathurin - Rabelais - Mademoiselle Rachel - Novembre - Chronique normande du Xe siècle - La dernière heure - La main de fer - Rome et les césars - Souvenirs, notes et pensées intimes - Articles : Des pierres de Carnac • Préface des « dernières chansons et poésies » de Louis Bouilhet • Préface « des vers » de Maupassant - Annexes :L enterrement de Flaubert par Emile Zola - Discours de Paul Bourget - Gustave Flaubert par Albert Thibaudet', NULL, 'Ligram éditions', NULL),
(129, 1, 'Gustave Flaubert : Oeuvres complètes – suivi d annexes (annotées, illustrées)', 'http://books.google.com/books/content?id=3qONDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Nouvelle édition 2019 des oeuvres complètes de Gustave Flaubert. Il s agit de l ouvrage de référence des oeuvres de Gustave Flaubert contenant 69 titres, plus de 500 notes explicatives ainsi que des centaines d illustrations originales. Contenu détaillé : — Une INTRODUCTION — Les 6 OEUVRES MAJEURES: Madame Bovary - l’Éducation sentimentale (1869) - Salammbô - La tentation de saint Antoine - Bouvard et Pécuchet - Trois Contes — Les 4 titres du THÉÂTRE : Introduction – les romanciers au théâtre, par Paul Alexis - Le candidat - Le sexe faible - Le château des coeurs — Les 2 titres de l oeuvre DIVERS : Dictionnaire des idées reçues - la spirale — Les 2 titres des VOYAGES: Par les champs et par les grèves - notes de voyages — Les 40 titres des OEUVRES DE JEUNESSE: Art et progrès - San Pietro Ornano - Matteo Falcone - Chevrin et le roi de Prusse - Dernière scène de la mort de Marguerite de Bourgogne. - Portrait de Lord Byron - Le moine des Chartreux - Mort du duc de Guise - Deux mains sur une couronne - Un secret de Philippe le Prudent - Un parfum à sentir - La femme du monde - La peste à florence - Bibliomanie - Rage et impuissance - Rêve d enfer - Une leçon d histoire naturelle - Quidquid volueris - Passion et Vertu - Loys XI - Agonies. Angoisses - La danse des morts - Ivre et Mort - Mémoires d un fou - Les Arts et le Commerce - Smarh - Les funérailles du docteur Mathurin - Rabelais - Mademoiselle Rachel - Novembre - Chronique normande du Xe siècle - La dernière heure - La main de fer - Rome et les Césars - Souvenirs, notes et pensées intimes - l’Éducation sentimentale. (version de 1845) - Lutte du Sacerdoce et de l Empire - Une nuit de don Juan. - Pierrot au sérail - La découverte de la vaccine — Les 3 PRÉFACES et ARTICLES : Des pierres de Carnac - Préface des « dernières chansons et poésies » de Louis Bouilhet - Préface « des vers » de Maupassant — CORRESPONDANCE : Plus de 1500 lettres ou fragments — les 9 titres ANNEXES : L enterrement de Flaubert par Emile Zola - La presse et la critique a la mort de Flaubert. - Discours de Paul Bourget - Gustave Flaubert par Albert Thibaudet - L érudition dans le roman - Revue littéraire – Correspondance de Gustave Flaubert avec George Sand - A propos du style de Flaubert - Biographie - Illustrations ERGONOMIE AMÉLIORÉE : L ouvrage a été spécifiquement mis en forme pour votre liseuse. - Naviguez par simple clic de chapitre à chapitre ou de livre à livre. - Accédez instantanément à la table des matières hyperliée globale. - Une table des...', NULL, 'Arvensa Editions', NULL),
(130, 2, 'Madame Bovary', 'http://books.google.com/books/content?id=FJJPEAAAQBAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'The award-winning, nationally bestselling translation, by Lydia Davis, of one of the world’s most celebrated novels Emma Bovary is the original desperate housewife. Beautiful but bored, she spends lavishly on clothes and on her home and embarks on two disappointing affairs in an effort to make her life everything she believes it should be. Soon heartbroken and crippled by debts, she takes drastic action, with tragic consequences for her husband and daughter. In this landmark new translation of Gustave Flaubert s masterwork, award-winning writer and translator Lydia Davis honors the nuances and particulars of Flaubert s legendary prose style, giving new life in English to the book that redefined the novel as an art form. For more than seventy years, Penguin has been the leading publisher of classic literature in the English-speaking world. With more than 1,700 titles, Penguin Classics represents a global bookshelf of the best works throughout history and across genres and disciplines. Readers trust the series to provide authoritative texts enhanced by introductions and notes by distinguished scholars and contemporary authors, as well as up-to-date translations by award-winning translators.', 0, 'Penguin', NULL),
(131, 1, 'Oeuvres complètes de Gustave Flaubert', 'http://books.google.com/books/content?id=Rgc-AQAAMAAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 432, NULL, NULL),
(132, 1, 'Flaubert et l Afrique', 'http://books.google.com/books/content?id=JX09AQAAMAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', NULL, 42, NULL, NULL),
(133, 1, 'A la recherche du temps perdu', 'http://books.google.com/books/content?id=VVj-oQEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Les parties blanches de barbes jusque-là entièrement noires rendaient mélancolique le paysage humain de cette matinée, comme les premières feuilles jaunes des arbres alors qu on croyait encore pouvoir compter sur un long été, et qu avant d avoir commencé d en profiter on voit que c est déjà l automne. Alors moi qui depuis mon enfance, vivant au jour le jour et ayant reçu d ailleurs de moi-même et des autres une impression définitive, je m aperçus pour la première fois, d après les métamorphoses qui s étaient produites dans tous ces gens, du temps qui avait passé pour eux, ce qui me bouleversa par la révélation qu il avait passé aussi pour moi. Et indifférente en elle-même, leur vieillesse me désolait en m avertissant des approches de la mienne.', 447, 'Editions Gallimard', NULL),
(134, 2, 'The Complete Short Stories of Marcel Proust', 'http://books.google.com/books/content?id=fP1UvtGM8bwC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'This volume gathers together all of Marcel Proust s short fiction and six tales never before translated into English.', 224, 'Rowman & Littlefield', NULL),
(135, 1, 'Les soixante-quinze feuillets', NULL, NULL, NULL, NULL, NULL),
(136, 2, 'In Search of Lost Time Volume I Swann s Way', 'http://books.google.com/books/content?id=4pi7zgEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'In Swann’s Way, the themes of Proust’s masterpiece are introduced, and the narrator’s childhood in Paris and Combray is recalled, most memorably in the evocation of the famous maternal good-night kiss. The recollection of the narrator’s love for Swann’s daughter Gilberte leads to an account of Swann’s passion for Odette and the rise of the nouveaux riches Verdurins. For this authoritative English-language edition, D. J. Enright has revised the late Terence Kilmartin’s acclaimed reworking of C. K. Scott Moncrieff’s translation to take into account the new definitive French editions of Á la recherché du temps perdu (the final volume of these new editions was published by the Bibliothèque de la Pléiade in 1989).', 660, 'Modern Library', NULL),
(137, 1, 'Marcel Proust : Oeuvres complètes — Les 40 titres et annexes (Nouvelle édition enrichie)', 'http://books.google.com/books/content?id=tLFaokWg8vMC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'L intégrale des oeuvres de Proust, soit 40 titres et annexes abondamment annotés et particulièrement destinés aux lecteurs exigeants. La mise en page et la navigation ont fait l objet d un soin particulier en intégrant les spécificités propres à votre liseuse. Les éditions Arvensa vous font bénéficier régulièrement de mises à jour gratuites et mettent à votre disposition leur service qualité. www.arvensa.com - La référence des ebooks classiques.', 8000, 'Arvensa editions', NULL),
(138, 1, 'Les Oeuvres Complètes de Marcel Proust', 'http://books.google.com/books/content?id=wSlCBAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Ce livre numérique présente Les Oeuvres Complètes de Marcel Proust avec une table des matières dynamique et détaillée. Marcel Proust (prénoms complets : Valentin Louis Georges Eugène Marcel), né à Auteuil le 10 juillet 1871 et mort à Paris le 18 novembre 1922, est un écrivain français, dont l oeuvre principale est une suite romanesque intitulée À la recherche du temps perdu, publiée de 1913 à 1927. En 1907, Marcel Proust commence l écriture de son grand œuvre À la recherche du temps perdu dont les sept tomes seront publiés entre 1913 (Du côté de chez Swann) et 1927, c est-à-dire en partie après sa mort ; le second volume, À l’ombre des jeunes filles en fleurs, obtiendra le prix Goncourt en 1919. Marcel Proust meurt épuisé, le 18 novembre 1922, d une bronchite mal soignée : il est inhumé au cimetière du Père-Lachaise à Paris, accompagné par une assistance nombreuse qui salue un écrivain d importance que les générations suivantes placeront au plus haut en faisant de lui un véritable mythe littéraire. Contenu: LES PLAISIRS ET LES JOURS À LA RECHERCHE DU TEMPS PERDU Du Côté De Chez Swann A l’Ombre Des Jeunes Filles En Fleurs Le Côté De Guermantes Sodome Et Gomorrhe La Prisonnière Albertine Disparue Le Temps Retrouvé PASTICHES ET MÉLANGES ARTICLES ET LETTRES PARUS DANS LA NOUVELLE REVUE FRANÇAISE CHRONIQUES ENTRETIEN AVEC ÉLIE-JOSEPH BOIS LA BIBLE D’AMIENS SESAME ET LES LYS MARCEL PROUST par Paul Souday Notes', NULL, 'e-artnow sro', NULL),
(139, 1, 'Marcel Proust : Oeuvres complètes et annexes (annotées, illustrées)', 'http://books.google.com/books/content?id=LGmNDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Nouvelle édition 2019 des oeuvres complètes de Marcel Proust. Cet ouvrage inclut l intégralité de A la recherche du temps perdu, les poèmes et nouvelles, les articles, chroniques et correspondances. Ces oeuvres complètes et ses annexes ont été classées, annotées et contrôlées avec soin pour être parfaitement fidèles à l’oeuvre originale. Contenu détaillé : — Les 7 tomes de «A LA RECHERCHE DU TEMPS PERDU»: Du côté de chez Swann - A l ombre des jeunes filles en fleurs - Le Côté de Guermantes - Sodome et Gomorrhe - La Prisonnière - Albertine disparue - Le Temps retrouvé — Les 11 poèmes en prose et nouvelles des «LES PLAISIRS ET LES JOURS»: Avant-propos dédié à mon ami Willie Heath - La mort de Baldassare Silvande, vicomte de Sylvanie - Violante ou la Mondanité - Fragments de comédie italienne - Mondanité et mélomanie de Bouvard et Pécuchet - Mélancolique villégiature de Mme de Breyves - Portraits de peintres et de musiciens - La confession d une jeune fille - Un dîner en ville - Les regrets, rêveries couleur du temps - La fin de la jalousie — Les 5 articles ou préfaces de «PASTICHES ET MELANGES»: L’Affaire Lemoine - En Mémoire des Eglises Assassinées - La Mort des cathédrales - Sentiments filiaux d’un parricide - Journées de lecture — LES 4 «ARTICLES ET LETTRES PARUS DANS LA NOUVELLE REVUE FRANCAISE» A propos du style de Flaubert - Une agonie - Un baiser - A propos de Baudelaire — Les 5 articles des «CHRONIQUES»: Les Salons et la Vie de Paris - Paysages et réflexions - Notes et Souvenirs - Critiques littéraires — Correspondance — Entretien avec Elie-Joseph Bois Les 2 TRADUCTIONS: — LA BIBLE D’AMIENS — SESAME ET LES LYS TITRES DES ANNEXES: Les citations les plus célèbres de Proust - Le questionnaire de Proust ou “Marcel Proust par lui-même” - Biographie détaillée de Marcel Proust - Marcel Proust par Paul Souday JEAN SANTEUIL, CONTRE SAINTE BEUVE, CHARDIN ET REMBRANDT ne figurent pas dans cette collection car ces titres sont encore soumis aux droits d’auteur. ERGONOMIE AMÉLIORÉE : L ouvrage a été spécifiquement mis en forme pour votre liseuse. - Naviguez par simple clic de chapitre à chapitre ou de livre à livre. - Accédez instantanément à la table des matières hyperliée globale. - Une table des matières est placée également au début de chaque titre. A PROPOS DE L ÉDITEUR : Les éditions Arvensa sont les leaders de la littérature classique numérique. Leur objectif est de vous faire connaître les oeuvres des grands auteurs de la littérature classique en langue française à un prix...', NULL, 'Arvensa Editions', NULL),
(140, 1, 'Albertine disparue de Marcel Proust (fiche de lecture de référence)', 'http://books.google.com/books/content?id=y9mVDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Venez découvrir Albertine disparue, le roman de Marcel Proust, grâce à une analyse littéraire de référence. Écrite par un spécialiste universitaire, cette fiche de lecture est recommandée par de nombreux enseignants. Cet ouvrage contient plusieurs parties : • la biographie de l écrivain • le résumé détaillé • le mouvement littéraire • le contexte de publication du roman • l analyse complète Retrouvez tous nos titres sur : www.fichedelecture.fr.', NULL, 'Comprendre la littérature', NULL),
(141, 1, 'Fiche de lecture Du côté de chez Swann de Marcel Proust (complète)', 'http://books.google.com/books/content?id=aMKXDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'La collection « Fichebook » vous offre la possibilité de tout savoir du roman Du côté de chez Swann de Marcel Proust grâce à une fiche de lecture aussi complète que détaillée. La rédaction, claire et accessible, a été confiée à un spécialiste universitaire. Notre travail éditorial vous offre un grand confort de lecture, spécialement développé pour la lecture numérique. Cette fiche de lecture répond à une charte qualité mise en place par une équipe d’enseignants. Ce livre numérique contient : - Un sommaire dynamique - La biographie de Marcel Proust - La présentation de l’œuvre - Le résumé détaillé (chapitre par chapitre) - Les raisons du succès - Les thèmes principaux - L étude du mouvement littéraire de l’auteur', NULL, 'Les Éditions de l Ebook malin', NULL),
(142, 1, 'Le Côté de Guermantes de Marcel Proust (fiche de lecture de référence)', 'http://books.google.com/books/content?id=19mVDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Venez découvrir Le Côté de Guermantes, le roman de Marcel Proust, grâce à une analyse littéraire de référence. Écrite par un spécialiste universitaire, cette fiche de lecture est recommandée par de nombreux enseignants. Cet ouvrage contient plusieurs parties : • la biographie de l écrivain • le résumé détaillé • le mouvement littéraire • le contexte de publication du roman • l analyse complète Retrouvez tous nos titres sur : www.fichedelecture.fr.', NULL, 'Comprendre la littérature', NULL),
(143, 1, 'Le Temps retrouvé de Marcel Proust (fiche de lecture de référence)', 'http://books.google.com/books/content?id=2dmVDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Venez découvrir Le Temps retrouvé, le roman de Marcel Proust, grâce à une analyse littéraire de référence. Écrite par un spécialiste universitaire, cette fiche de lecture est recommandée par de nombreux enseignants. Cet ouvrage contient plusieurs parties : • la biographie de l écrivain • le résumé détaillé • le mouvement littéraire • le contexte de publication du roman • l analyse complète Retrouvez tous nos titres sur : www.fichedelecture.fr.', NULL, 'Comprendre la littérature', NULL),
(144, 1, 'Un amour de Swann de Marcel Proust (fiche de lecture de référence)', 'http://books.google.com/books/content?id=_9mVDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Venez découvrir Un amour de Swann de Marcel Proust grâce à une analyse littéraire de référence. Écrite par un spécialiste universitaire, cette fiche de lecture est recommandée par de nombreux enseignants. Cet ouvrage contient plusieurs parties : • la biographie de l écrivain • le résumé détaillé • le mouvement littéraire • le contexte de publication du roman • l analyse complète Retrouvez tous nos titres sur : www.fichedelecture.fr.', NULL, 'Comprendre la littérature', NULL),
(145, 1, 'Du côté de chez Swann de Marcel Proust (fiche de lecture de référence)', 'http://books.google.com/books/content?id=0dmVDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Venez découvrir Du côté de chez Swann, le roman de Marcel Proust, grâce à une analyse littéraire de référence. Écrite par un spécialiste universitaire, cette fiche de lecture est recommandée par de nombreux enseignants. Cet ouvrage contient plusieurs parties : • la biographie de l écrivain • le résumé détaillé • le mouvement littéraire • le contexte de publication du roman • l analyse complète Retrouvez tous nos titres sur : www.fichedelecture.fr.', NULL, 'Comprendre la littérature', NULL),
(146, 1, 'À l ombre des jeunes filles en fleurs de Marcel Proust (fiche de lecture de référence)', 'http://books.google.com/books/content?id=x9mVDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Venez découvrir À l ombre des jeunes filles en fleurs, le roman de Marcel Proust, grâce à une analyse littéraire de référence. Écrite par un spécialiste universitaire, cette fiche de lecture est recommandée par de nombreux enseignants. Cet ouvrage contient plusieurs parties : • la biographie de l écrivain • le résumé détaillé • le mouvement littéraire • le contexte de publication du roman • l analyse complète Retrouvez tous nos titres sur : www.fichedelecture.fr.', NULL, 'Comprendre la littérature', NULL),
(147, 1, 'Discours sur l origine et les fondements de l inégalité parmi les hommes', NULL, 'Paru en 1755, le Discorns sur l origine et les fondements de l inégalité parmi les hommes peut être considéré comme la matrice de l oeuvre morale et politique de Rousseau : il y affirme sa stature de philosophe, l originalité de sa voix, la force de son \"système\". Résoudre le problème posé par l Académie de Dijon, \"quelle est la source de l inégalité parmi les hommes et si elle est autorisée par la loi naturelle ?\" en d autres termes expliquer que riches et puissants dominent leurs semblables sur lesquels ils n ont pas de réelle supériorité, exige aux yeux de Rousseau de poser à nouveaux frais la question \"qu est-ce que l homme ?\". Pour cela, il faut comprendre comment s est formée sa \"nature actuelle\", si éloignée de ce que serait son état de nature : \"Si je me suis étendu si longtemps sur la supposition de cette condition primitive, c est qu ayant d anciennes erreurs et des préjugés invétérés à détruire, j ai cru devoir creuser jusqu à la racine...\"', 302, NULL, NULL),
(148, 2, 'The Major Political Writings of Jean-Jacques Rousseau', 'http://books.google.com/books/content?id=BM8JngEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Individualist and communitarian. Anarchist and totalitarian. Classicist and romanticist. Progressive and reactionary. Since the eighteenth century, Jean-Jacques Rousseau has been said to be all of these things. Few philosophers have been the subject of as much or as intense debate, yet almost everyone agrees that Rousseau is among the most important and influential thinkers in the history of political philosophy. This new edition of his major political writings, published in the year of the three-hundredth anniversary of his birth, renews attention to the perennial importance of Rousseau’s work. The book brings together superb new translations by renowned Rousseau scholar John T. Scott of three of Rousseau’s works: the Discourse on the Sciences and Arts, the Discourse on the Origin and Foundations of Inequality Among Men, and On the Social Contract. The two Discourses show Rousseau developing his well-known conception of the natural goodness of man and the problems posed by life in society. With the Social Contract, Rousseau became the first major thinker to argue that democracy is the only legitimate form of political organization. Scott’s extensive introduction enhances our understanding of these foundational writings, providing background information, social and historical context, and guidance for interpreting the works. Throughout, translation and editorial notes clarify ideas and terms that might not be immediately familiar to most readers. The three works collected in The Major Political Writings of Jean-Jacques Rousseau represent an important contribution to eighteenth-century political theory that has exerted an extensive influence on generations of thinkers, beginning with the leaders of the French Revolution and continuing to the present day. The new translations on offer here will be welcomed by a wide readership of both Rousseau scholars and readers with a general interest in political thought.', 0, 'University of Chicago Press', NULL),
(149, 2, 'Emile', 'http://books.google.com/books/content?id=ObOWswEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Alan Bloom s new translation of Emile, Rousseau s masterpiece on the education and training of the young, is the first in more than seventy years. In it, Bloom, whose magnificent translation of Plato s Republic has been universally hailed as a virtual rediscovery of that timeless text, again brings together the translator s gift for journeying between two languages and cultures and the philosopher s perception of the true meaning and significance of the issues being examined in the work. The result is a clear, readable, and highly engrossing text that at the same time offers a wholly new sense of the importance and relevance of Rousseau s thought to us.In addition to his translation, Bloom provides a brilliant introduction that relates the structure and themes of the book to the vital preoccupation s of our own age, particularly in the field of education, but also more generally to the current concerns about the limits and possibilities of human nature. Thus in this translation Emile, long a classic in the history of Western thought and educational theory, becomes something more: a prescription, fresh and dazzling, for the bringing up of autonomous, responsible—that is, truly democratic—human beings.', 0, 'Basic Books', NULL),
(150, 1, 'Les Confessions', 'http://books.google.com/books/content?id=Sa6XDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Les Confessions de Jean-Jacques Rousseau est une autobiographie couvrant les cinquante-trois premières années de la vie de Rousseau, jusqu à 1765. Les douze livres des Confessions se divisent en deux ensembles distincts, définis par Rousseau lui-même : la première partie constituée par les livres i à vi avec le Préambule, rédigée en 1765-1767, couvre les années 1712-1740 (années de formation, de la naissance à Genève à l installation à Paris à 28 ans) alors que la deuxième partie, constituée par les livres vii à xii et rédigée en 1769-1770, couvre les années 1741-1765, c est-à-dire sa vie à Paris dans les milieux de la musique et des philosophes, avec ses réussites (Discours - La Nouvelle Héloïse) et ses déboires, comme les attaques qui suivent la publication de l Émile, qui l obligent à fuir en Suisse. L oeuvre aura une publication entièrement posthume : en 1782 pour la première partie et en 1789 pour la deuxième. Rousseau avait cependant déjà fait des lectures publiques de certains extraits. Le titre des Confessions a sans doute été choisi en référence aux Confessions de saint Augustin. Rousseau accomplit ainsi un acte sans valeur religieuse à proprement parler, mais doté d une forte connotation symbolique : celui de l aveu des péchés, de la confession. Associant sincérité, humilité et plaidoyer pour lui-même, Rousseau cherche à brosser un portrait positif de lui-même et se présente essentiellement comme une victime de la vie. L oeuvre des Confessions fonde néanmoins le genre moderne de l autobiographie et constitue un texte marquant de la littérature française.', 562, 'BoD - Books on Demand', NULL),
(151, 1, 'Correspondance complète de Jean Jacques Rousseau', 'http://books.google.com/books/content?id=dSQrAAAAIAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', NULL, 322, 'Genève : Institut et musée Voltaire', NULL),
(152, 1, 'Jean-Jacques Rousseau et les arts visuels', 'http://books.google.com/books/content?id=A5A45cBs7vgC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 686, 'Librairie Droz', NULL),
(153, 1, 'Le dictionnaire de musique de Jean-Jacques Rousseau', 'http://books.google.com/books/content?id=phmNjZuA-_4C&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Cette édition critique met l accent sur la taxonomie musicale de Rousseau et son esthétique, et lie la réflexion musicologique qu il y développe à ses autres travaux sur la nature du lien social et contre le déterminisme.', 896, 'Peter Lang', NULL),
(154, 1, 'Lettres originales de Jean Jacques Rousseau a Mme. de ..., à Mme. la maréchale de Luxembourg, à Mr. de Malesherbes, à d Alembert, etc', 'http://books.google.com/books/content?id=CrEPAAAAQAAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 220, NULL, NULL),
(155, 1, 'Annales de la Société Jean-Jacques Rousseau', 'http://books.google.com/books/content?id=0Fe6Nq-GRxoC&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Includes \"Bibliographie\", \"Chronique\", and \"Liste des membres\".', 380, NULL, NULL),
(156, 1, 'Correspondance complète de Jean Jacques Rousseau', 'http://books.google.com/books/content?id=TKoHAQAAIAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', NULL, 356, 'Genève : Institut et Musée Voltaire', NULL),
(157, 1, 'Jean-Jacques Rousseau et la vie simple', 'http://books.google.com/books/content?id=wockEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', '« Ce qui rend l homme essentiellement bon est d avoir peu de besoins. »Tour à tour romancier, autobiographe, dramaturge, épistolier, encyclopédiste, essayiste, Jean-Jacques Rousseau (1712-1778) est le penseur majeur de la démocratie directe.À l aube de la révolution industrielle, il se distingue de ses contemporains en dénonçant l accumulation de biens inutiles, le luxe et le consumérisme, causes des inégalités et de la destruction du lien social. Il défend à travers l idée de vie simple, qui traverse toute son œuvre, un modèle de société fondée sur la mesure et la proximité avec la nature.Comme le montre Cécile Hellian, loin de se limiter à une condamnation morale de la richesse, la vie simple est le préalable indispensable à l autonomie et à la mise en place - aujourd hui urgente - d une société écologique et véritablement démocratique. Spécialiste de l oeuvre de Rousseau, Cécile Hellian s’intéresse à la philosophie politique ainsi qu’à l’analyse de la reproduction des inégalités en sciences sociales. Elle enseigne en lycée dans l’académie de Lyon ainsi qu’à l’Université Claude Bernard-Lyon 1. Actuellement doctorante à l’EHESS, elle commence une thèse sur l’incorporation des structures sociales chez Pierre Bourdieu.', 128, 'LE PASSAGER CLANDESTIN', NULL),
(158, 1, 'Jean-Jacques Rousseau : Oeuvres complètes — 93 titres (Nouvelle édition enrichie)', 'http://books.google.com/books/content?id=rnyHAgAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Nouvelle édition enrichie — Les œuvres complètes de Jean-Jacques Rousseau, dans une édition de référence augmentée de près de 3000 notes, d’analyses, d’illustrations et d annexes et accompagnée d une préface exclusive de L. G. Deschard. L ouvrage a été conçu pour un confort de lecture et de navigation optimal sur votre liseuse. Il contient 93 titres. Contenu détaillé : ŒUVRE LITTÉRAIRE: Julie ou La Nouvelle Héloïse • Les amours de Milord Édouard Bomston • Observations ŒUVRE PHILOSOPHIQUE ET POLITIQUE : Les Sciences et les Arts • Lettre à M. l’abbé Raynal • Lettre à M. Grimm • Réponse au roi de Pologne • Réponse à M. Bordes • Lettre sur une nouvelle réfutation de son discours • Résumé de la querelle. L’inégalité parmi les hommes • Lettre à M. Philopolis • La vertu nécessaire aux héros • Oraison funèbre du duc d’Orléans • Lettre à d’Alembert sur les spectacles • Réponse à une lettre anonyme • Apologie du Théâtre • De l’imitation théâtrale • Essai sur l’origine des langues • Lettre sur la vertu • Lettres morales • Émile ou de l’éducation • Émile et Sophie ou Les solitaires • Lettre à Mgr de Beaumont • Discours sur l’économie politique • Du Contrat social ou Essai sur la forme de la république • Du contrat social ou Principes du droit politique • Considérations sur le gouvernement de Pologne • Lettres à M. Buttafoco sur la législation de la Corse • Jugement sur la Paix perpétuelle • Extrait du Projet de Paix perpétuelle • Jugement sur la Polysynodie • Lettres écrites de la montagne. BOTANIQUE : Lettres sur la botanique • Fragments pour un dictionnaire des termes d’usage en botanique • Planches sur la botanique MÉLANGES OU LITTÉRATURE VARIÉE : Mémoire à Mgr le gouverneur de Savoie • Traduction de l’ode de Jean Puthod • Réponse au mémoire anonyme • Projet pour l’éducation de M. de Sainte-Marie • Mémoire à M. Boudet • La persifleur • Traduction du premier livre de l’histoire de Tacite • Traduction de l’Apocolokintosis • La Reine fantasque • Les amours de Claire et de Marcellin • Le Petit Savoyard ou La vie de Claude Noyer • Notes en réfutation de l’ouvrage d’Helvétius • Le lévite d’Éphraïm • Lettres à Sara • Vision de Pierre de la Montagne • Olinde et Sophronie • Narcisse ou l’amant de lui-même • Les prisonniers de guerre • L’engagement téméraire • Courts fragments de Lucrèce • Mélanges en vers (18 œuvres) ÉCRITS SUR LA MUSIQUE : Projet concernant de nouveaux signes pour la musique • Dissertation sur la musique moderne • Pièces diverses • Lettre sur la musique française • Lettre d’un symphoniste de l’académie royale de musique • Examen de deux principes avancés par M. Rameau • Lettre à M. Burney sur la musique • Extrait d’une réponse du petit faiseur à son prête-nom • Sur la musique militaire • Lettre à M. Grimm • Fragments d’Iphis • La découverte du Nouveau Monde • Les Muses galantes • Airs principaux du Devin du village • Note du journal encyclopédique • Pygmalion • Choix de romances • Dictionnaire de musique. MÉMOIRES : Les Confessions • Déclaration relatives à M. le pasteur Vernes • Lettres à M. de Malesherbes • Les Rêveries du promeneur solitaire • Écrits en forme de circulaire • Rousseau Juge de Jean-Jacques (Dialogues) CORRESPONDANCE : près de 1000 lettres. ANNEXES : Recueil d’estampes • Du gouvernement de Genève (d’Alembert) • Extrait des registres sur l’Encyclopédie • Lettre à M. Rousseau, citoyen de Genève (d’Alembert) • Arrêt de la cour de Parlement• Polysynodie de l’abbé de Saint-Pierre • Lettres élémentaires sur la botanique (William Martyn) • Examen des Confessions (M. Musset-Pathay) • Biographie • Précis des circonstances de la vie de J. J. Rousseau (M. Musset-Pathay) • Essai sur la vie et le caractère de J. J. Rousseau (G. Morin) A PROPOS DE L ÉDITEUR : L objectif des Éditions Arvensa est de vous faire connaître les auteurs de la littérature classique en langue française à un prix abordable. Tous les titres sont produits avec le plus grand soin. Retrouvez tous les titres sur http://www. arvensa. com', 12000, 'Arvensa editions', NULL),
(159, 1, 'Esprit, maximes, et principes de M. Jean Jacques Rousseau, de Genéve', 'http://books.google.com/books/content?id=fVsqF-6xkKMC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 468, NULL, NULL),
(160, 1, 'Jean-Jacques Rousseau', 'http://books.google.com/books/content?id=TvA_AQAAIAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Grand écrivain dont le style était unanimement admiré, même par ses adversaires, Jean-Jacques Rousseau n avait pas cependant l écriture facile. De cet ennemi de la correspondance, ne nous sont pas moins parvenues quelque 2 700 lettres écrites de 1730 à 1778. Une vie d homme n est pas uniforme, et celle de Rousseau moins que toute autre, aussi ses lettres sont-elles d une grande diversité. Certaines sont familières ou personnelles, révélatrices d un tempérament susceptible de passions ardentes. Certaines, touchantes, vont à celle qui partagea son quotidien pendant trente-trois ans et n hésita jamais, à partir de 1762, à le suivre dans son exil. La correspondance révèle aussi, chez ce solitaire par choix et par force, son besoin d autrui, son exigence de compréhension toujours déçue, sa conception intransigeante de l amitié. \"Je fus ami si jamais homme le fut\", assure-t-il dans Les Confessions. Autre Rousseau encore, et qu on ne pouvait ignorer, le philosophe qui constitue son \" magasin d idées\" et surtout, en 1756, la lettre qu il adresse, sur la Providence et la théodicée, au Voltaire du Poème sur le désastre de Lisbonne. Autre Rousseau enfin, celui qui s exprime, de plus en plus angoissé, quand, après les désastres de Môtiers et de l île de Saint-Pierre, il pénètre dans l univers effrayant de la paranoïa des dernières années. Il serait artificiel de présenter cette correspondance selon un ordre thématique. Mais suivies une à une, dans l ordre chronologique, les 78 lettres de ce florilège font percevoir les étapes successives d une vie, d une carrière et d une pensée.', 297, 'Sulliver Editions', NULL),
(161, 1, 'Edgar Poe, sa vie et ses oeuvres', 'http://books.google.com/books/content?id=8XGXEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'C est vers 1848 que Charles Baudelaire découvrit l oeuvre de Poe ; il entreprit alors de le traduire. Quelques contes parurent ainsi dans des revues, puis, en 1852, la notice biographique que nous publions ici, reprise en 1856 dans la publication chez Michel Lévy du premier recueil intitulé Histoires extraordinaires. Un second volume, les Nouvelles histoires extraordinaires, parut un an plus tard chez le même éditeur. Vinrent ensuite les Aventures d Arthur Gordon Pym en 1858, Eureka en 1864 et enfin les Histoires grotesques et sérieuses publiées en 1865. Bien que parfois contestées pour une certaine infidélité aux textes originaux, ces traductions permirent à l oeuvre de Poe d atteindre à une véritable notoriété en France. Les noms de Charles Baudelaire et d Edgar Allan Poe sont en France intimement liés. C est que s il ne fut pas le premier à traduire Poe pour le public français (certains contes avaient déjà été publiés dans des revues), Charles Baudelaire entreprit ce travail avec l intention résolue de faire de l auteur américain «un grand homme pour la France» (lettre de Baudelaire à Sainte-Beuve du 19 mars 1856). Edgar Poe, sa vie et ses oeuvres, paru pour la première fois en 1852 dans la Revue de Paris, puis repris comme introduction aux Histoires extraordinaires (1856), contribua largement à forger cette légende. Car c est bien d une légende qu il s agit ici, dans la mesure où cette notice ne retrace pas exactement la vie de l auteur américain. Mais là n est pas son véritable intérêt. Au-delà de sa dimension strictement biographique, ce texte apparaît plutôt comme un plaidoyer. En racontant l histoire «d un de ces illustres malheureux, trop riche de poésie et de passion, qui est venu, après tant d autres, faire en ce bas monde le rude apprentissage du génie chez les âmes inférieures», Charles Baudelaire s attache surtout à défendre l Artiste, amoureux du Beau, contre une société tout entière imprégnée de matérialisme et de pragmatisme.', 36, 'BoD - Books on Demand', NULL),
(162, 1, 'Le Spleen de Paris', 'http://books.google.com/books/content?id=RE6MEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Ce recueil de cinquante poèmes est souvent désigné par son sous-titre : Petits Poèmes en Prose. C’est en effet cette forme qui le caractérise, plus que ses thèmes, qui ne diffèrent guère de ceux des Fleurs du Mal. Seul le dernier poème, Epilogue, est en vers. Tous les autres sont de courts textes de prose, une prose rythmée, enrichie de divers procédés poétiques, mais sans rimes (comme l’avait fait quelques années plus tôt Aloysius Bertrand avec Gaspard de la Nuit). Quelques poèmes (par ex. : L’invitation au Voyage) ont leur double en vers rimés dans les Fleurs du Mal, ce qui permet d’apprécier les différences. Le titre, qui rappelle ceux de deux parties des Fleurs du Mal : Spleen et Idéal et Tableaux Parisiens souligne sa parenté avec ce premier recueil.', 88, 'BoD - Books on Demand', NULL),
(163, 1, 'Les Fleurs du mal - version annotée', 'http://books.google.com/books/content?id=My5-zQEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Les Fleurs du mal est un recueil de poèmes de Charles Baudelaire, englobant la quasi-totalité de sa production en vers, de 1840 jusqu à sa mort survenue fin août 1867. Publié le 23 août 1857, le livre scandalise aussitôt la société conformiste et soucieuse de respectabilité. Couvert d opprobre, son auteur subit un procès retentissant. Le jugement le condamné à une forte amende, réduit sur l intervention de l Impératrice; il entraîne la censure de six pièces jugées immorales. De 1861 à 1868, l ouvrage est réédité dans trois versions successives, enrichies de nouveaux poèmes; les pièces interdites paraissent en Belgique. La réhabilitation n interviendra que près d un siècle plus tard, en mai 1949. C est une oeuvre majeure de la poésie moderne. Ses 163 pièces rompent avec le style convenu, en usage jusqu alors. Elle rajeunit la structure du vers par l usage régulier d enjambements, de rejets et de contre-rejets. Elle rénove la forme rigide du sonnet. Elle utilise des images suggestives en procédant à des associations souvent inédites, tel l  Ange cruelle qui fouette des soleils (Le Voyage). Elle mêle langage savant et parler quotidien. Rompant avec un romantisme qui, depuis un demi-siècle, loue la Nature jusqu à la banaliser, elle célèbre la ville et plus particulièrement Paris. Elle diffère d un recueil classique, où souvent le seul hasard présente des poèmes généralement disparates. Ceux-ci s articulent avec méthode et selon un dessein précis, pour chanter avec une sincérité absolue: la souffrance d ici-bas considérée selon le dogme chrétien du péché originel, qui implique l expiation; le dégoût du mal - et souvent de soi-même; l obsession de la mort; l aspiration à un monde idéal, accessible par des correspondances mystérieuses. Nourrie de sensations physiques que la mémoire restitue avec acuité, elle exprime une nouvelle esthétique où l art poétique juxtapose la palette mouvante des sentiments humains et la vision lucide d une réalité parfois triviale à la plus ineffable beauté. Elle exerce une influence considérable sur des poètes ultérieurs aussi éminents que Paul Verlaine, Arthur Rimbaud et Stéphane Mallarmé.', 238, NULL, NULL),
(164, 1, 'Les Fleurs du mal', 'http://books.google.com/books/content?id=h66YEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Les 137 poèmes des Fleurs du Mal sont regroupés en chapitres eux-mêmes organisés d’une manière stricte : ils évoquent les tentatives du poète pour dépasser sa misérable condition humaine, par l’amour et l’art (ch. 1), l’observation de la société (ch. 2), l’ivresse (ch. 3), le mal (ch. 4), la révolte (ch. 5). Ces tentatives, chaque fois vaines, ne lui laissent d’espoir que dans la mort (ch. 6). Ces poèmes sont d’une forme classique (vers rimés d’une métrique régulière) mais d’un esprit poétique nouveau (les « correspondances ») qui ouvre la voie à ce qu’on appellera par la suite le « symbolisme ».', 177, 'BoD - Books on Demand', NULL),
(165, 1, 'Histoires extraordinaires', 'http://books.google.com/books/content?id=_8CZEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Baudelaire avait raison : ces nouvelles sont extraordinaires. Un homme atteint la lune en ballon, un autre transforme en or les vils métaux, les morts apparaissent pour entraîner les vivants au tombeau, les malédictions s accomplissent. Edgar Poe était fasciné par le rêve, le spiritisme, la métempsycose mais aussi les sciences. Il a créé un monde irréel d autant plus envoûtant que le fantastique est peint avec logique et minutie. Cet écrivain américain ressentit toute sa vie la perversité qui existe en tout être. L homme est sans cesse et à la fois homicide et suicide, assassin et bourreau. « Edgar Poe a emprunté la voie royale du grand art. Il a découvert l étrange dans le banal, le neuf dans le vieux, le pur dans l impur. Voilà un être complet », disait Valéry.', 214, 'BoD - Books on Demand', NULL),
(166, 1, 'De l essence du rire', 'http://books.google.com/books/content?id=6pCZEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Cet article des Curiosités Esthétiques (1855) intitulé De l essence du rire et généralement du comique dans les arts plastiques fut initialement écrit par Baudelaire en guise d introduction à son étude consacrée à la caricature. Il n en écrira finalement que deux chapitres, intitulés : \"Quelques caricaturistes\" et \"Quelques caricaturistes étrangers\". Pour Baudelaire, le rire est sans aucun doute mauvais, satanique. Il est le signe du péché originel. \"Le Sage ne rit qu en tremblant\", rappelle-t-il, adaptant une maxime attribuée à Bossuet. Voici un cours magistral et très pédagogique où Baudelaire, on le reconnaît bien là, fait une brillante démonstration de toute la cruauté du rire : \"le rire est causé par la vue du malheur d autrui\" ou \"le rire est au fond satanique, il est donc profondément humain.\" Il n est pas question pour lui du comique \"ordinaire\", ou significatif, comme il le nomme, pas de celui de la traditionnelle satire sociale, déclenché à la vue d une caricature et la monarchie de Juillet, temps de la jeunesse de Baudelaire, fut la grande époque de la caricature, avec Gavarni ou Daumier. La caricature est selon lui toujours un peu complaisante, elle flatte le spectateur, en fait un compère ; c est le comique des contes de Voltaire, typique de l esprit français que Baudelaire n aime pas, celui des comédies de Molière, qui suscitent des réserves chez Baudelaire ; et c est même celui de Rabelais, chez qui le rire est utile, sert à faire la leçon et a \"la transparence d un apologue\". Non, il s agit du rire en ce qu il est l une des manifestations humaines les plus émouvantes, les plus mystérieuses, les plus intelligentes aussi, ce que Baudelaire appelle, dans ce traité De l essence du rire, le \"comique absolu\".', 30, 'BoD - Books on Demand', NULL),
(167, 1, 'Réversibilité de Baudelaire', NULL, NULL, 448, NULL, NULL),
(168, 1, 'Baudelaire Dufaÿs - annoté', 'http://books.google.com/books/content?id=tJSVzQEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Salon de 1846 est un recueil de textes que Baudelaire consacre à la grande exposition annuelle de peinture et de sculpture française. L inventeur du genre, et de la critique d art, est Diderot, qui à la demande de Grimm, directeur de la Correspondance littéraire, demande au philosophe de faire pour ses lecteurs des comptes rendus des expositions de l Académie royale de peinture et de sculpture. Poursuivant cette oeuvre, Baudelaire fonde la critique moderne comme Diderot avait créé un nouveau type de sujet et d écrit. Le Salon de 1846 présente des textes plus unifiés et ordonnés: après une adresse aux bourgeois, spectateurs de la peinture auxquels il reproche de ne pas aimer l art, Baudelaire commence par une interrogation sur le rôle de la critique puis développe une réflexion sur le romantisme qui tient dans la manière de sentir . Sa critique s approfondit en essais sur les coloristes et les dessinateurs, ceux dont le but est d imiter la nature, ceux qui entendent véritablement créer. Baudelaire s arrête en particulier sur les oeuvres de Delacroix et de Vernet, mais aussi sur le genre du portrait ou celui du paysage. Enfin, vous pourrez apprendre pourquoi, selon le poète des Fleurs du Mal, la sculpture est ennuyeuse .', 164, NULL, NULL),
(169, 1, 'Nouvelles histoires extraordinaires', 'http://books.google.com/books/content?id=rYaREAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Et ici, par une bravade frénétique, je frappai fortement avec une canne que j avais à la main juste sur la partie du briquetage derrière laquelle se tenait le cadavre de l épouse de mon cœur... Pendant un moment, les officiers placés sur les marches restèrent immobiles, stupéfiés par la terreur. Un instant après, une douzaine de bras robustes s acharnaient sur le mur. Il tomba tout d une pièce. Le corps déjà grandement délabré et souillé de sang grumelé, se tenait droit devant les yeux des spectateurs. Sur sa tête, avec la gueule rouge dilatée et l’œil unique flamboyant, était perchée la hideuse bête dont l astuce m avait induit à l assassinat, et dont la voix révélatrice m avait livré au bourreau (Le Chat noir).', 194, 'BoD - Books on Demand', NULL),
(170, 1, 'Le dilemme de Devin', 'http://books.google.com/books/content?id=fB4XEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Brighton, Angleterre, 1856. Pour Devin Bennett, notaire débutant, rien n est plus important que de faire avancer sa carrière. L amour et le futur ne font pas partie de ses préoccupations quotidiennes. Puis, il rencontre Harry. Femme de chambre et chaperonne de la fille du client de Devin, Harry est intelligente, captivante et occupe les pensées du jeune homme jour et nuit. Mais Devin sait qu Harry lui cache quelque chose, un secret qui pourrait les séparer et envoyer Harry à l autre bout du monde...', 130, 'Babelcube Inc.', NULL),
(171, 1, 'Histoires grotesques et serieuses par Edgar Poe', 'http://books.google.com/books/content?id=Dim0jEwfBIwC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 371, NULL, NULL);
INSERT INTO `BOOK` (`ID_BOOK`, `ID_LANGUAGE`, `TITLE`, `IMAGE`, `DESCRIPTION`, `NUMBER_OF_PAGES`, `EDITOR`, `RELEASE_DATE`) VALUES
(172, 1, 'Chaleur Polaire', 'http://books.google.com/books/content?id=AERmEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Le métamorphe de l ours polaire Russell est heureux de sa vie isolée dans une petite ville de l Alaska. C est-à-dire jusqu à ce que l arrivée d un professeur de maternelle des 48 inférieurs met en pièces le monde confortable de Russell. Une bouffée de l odeur irrésistible de Riley Jenkins, et Russ est foutu. Mais comment expliquer tout ce qu il est à cette jeune femme innocente, et son sombre passé empêchera-t-il leur amour fatidique de se transformer en un bonheur éternel?', 212, 'Next Chapter', NULL),
(173, 1, 'La chanson réaliste', 'http://books.google.com/books/content?id=oILPfteRuvkC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 156, 'Editions L Harmattan', NULL),
(174, 1, 'Les fleurs du mal', NULL, NULL, 490, NULL, NULL),
(175, 1, 'Illusions perdues', 'http://books.google.com/books/content?id=TSllAAAAMAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', NULL, 870, 'LGF/Le Livre de Poche', NULL),
(176, 1, 'Le cycle de Vautrin', NULL, NULL, 1244, NULL, NULL),
(177, 1, 'La femme de trente ans', NULL, 'La femme de trente ans, qui est-elle ? Mariée, elle est au sommet de sa vie, car c est là qu elle prend sa liberté, c est-à-dire un amant, ce dont Balzac la félicite, mais que la société punit cruellement. Voici donc l un des romans les plus engagés de Balzac, dans lequel il dénonce la condition des femmes, mariées à des hommes dont elles découvrent trop tard les défauts, et vieilles déjà à la moitié de leur vie. L auteur constate l échec du mariage d amour et, avec ces enfants nés sans amour, l échec de la maternité. Cette histoire sombre, où la sexualité joue un rôle étonnamment moderne, est traitée avec une grande liberté de ton : le roman historique croise le roman-feuilleton, et jusqu aux histoires de pirates. C est aussi un véritable essai, où la peinture psychologique mène à la revendication politique et sociale. A rebours d une politique des âges de la vie figée, Balzac montre qu à tout âge la femme a le droit d aimer et d être aimée, même en dehors du mariage, et d être reconnue par la société pas seulement comme épouse et mère, mais comme femme.', 356, NULL, NULL),
(178, 1, 'Oeuvres Completes de H. de Balzac. Scenes de La Vie Parisienne. Scene de La Vie Politique.', 'http://books.google.com/books/content?id=3wPMoQEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Oeuvres completes de H. de Balzac. Scenes de la vie Parisienne. Scene de la vie PolitiqueCe livre est la reproduction fidele d une oeuvre publiee avant 1920 et fait partie d un projet propose par la Bibliotheque nationale de France (BnF), offrant l opportunite pour les lecteurs, enseignants ou chercheurs d acceder a des ouvrages anciens et souvent rares issus de ses fonds patrimoniaux.Les oeuvres de cette collection appartiennent au domaine public . Elles ont ete numerisees par la BnF et sont presentes sur Gallica, la bibliotheque numerique de la BnF.En entreprenant de redonner vie a ces oeuvres au travers d une collection de livres reimprimes a la demande, nous offrons la possibilite a ces oeuvres de rencontrer un public elargi et participons a la transmission de connaissances et de savoirs difficilement accessibles par ailleurs.Sur un plan technique, nous avons cherche a concilier la reproduction fidele d un livre ancien a partir de sa version numerisee avec le souci d un confort de lecture optimal. Nous esperons que les ouvrages de cette nouvelle collection vous apporteront entiere satisfaction.http://gallica.bnf.fr/ark:/12148/bpt6k146589h', 700, NULL, NULL),
(179, 1, 'Sarrasine', 'http://books.google.com/books/content?id=1MqMPwAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Lors d une brillante soirée parisienne, tandis que les invités dansent et conversent dans des salons splendides, une jeune femme s épouvante à la vue d un étrange petit vieillard décharné et pareil à un spectre. La jeune femme supplie alors le narrateur de lever pour elle le mystère de cet inconnu, et, le lendemain du bal, il lui raconte longuement l histoire du sculpteur Sarrasine et de la dangereuse passion que, dans sa jeunesse, il éprouva pour la mystérieuse Zambinella aussitôt qu il l eut entendue chanter à Rome. Dès la première page, c est sous le double signe de la danse des morts et de la danse des vivants, de la sensualité et de la déchéance, que le jeune Balzac place ce récit publié par la Revue de Paris en 1830. Et Sarrasine est doublement énigmatique aussi : parce que la narration tient le lecteur captif jusqu au mot de la fin - et parce qu elle met en scène les ambiguïtés d un désir dont l écrivain ne cherche pas à dissiper les ombres.', 93, 'LGF/Le Livre de Poche', NULL),
(180, 1, 'Béatrix', NULL, 'L éducation sentimentale d un jeune homme, Calyste du Guénic, \" magnifique rejeton de la plus vieille race bretonne \" (l action commence à Guérande), et le douloureux vieillissement d une femme de lettres, Félicité des Touches, qui, après avoir hésité devant un dernier amour, achèvera dans un couvent l  \"ardente aridité \" de sa vie. Georges Sand a inspiré le personnage de Félicité. Marie d Agoult et Liszt ceux de la marquise de Rochefide, \" Béatrix \", et de son amant, le musicien Conti, qu elle a autrefois volé à Félicité. Entre ces quatre êtres se joue un drame subtil et dangereux dans lequel Pierre Gascar voit \" l expression la plus achevée du romantisme balzacien \" et qui résume les problèmes de la condition féminine au XIXe siècle.', 535, 'Editions Gallimard', NULL),
(181, 1, 'Coffret Balzac', 'http://books.google.com/books/content?id=OiC9DwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Ce coffret contient cinq œuvres de Balzac : La Peau de chagrin, Le Père Goriot, La Fille aux yeux d or, Illusions perdues, La Maison Nucingen. Retrouvez d autres auteurs dans la collection Coffrets Classiques : Jules Verne, Alexandre Dumas, Homère, Victor Hugo, Marivaux, Molière, Émile Zola, Guy de Maupassant, George Sand...', 1491, 'BnF collection ebooks', NULL),
(182, 1, 'Coffret Balzac', 'http://books.google.com/books/content?id=JC1AEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Ce coffret contient trois œuvres de Balzac : Les Chouans, Eugénie Grandet et Le Lys dans la vallée. Retrouvez d autres auteurs dans la collection Coffrets Classiques : Alexandre Dumas, Homère, Victor Hugo, Marivaux, Molière, Émile Zola, Honoré de Balzac, Guy de Maupassant, George Sand...', 1167, 'BnF collection ebooks', NULL),
(183, 1, 'Les Oeuvres Complètes de Balzac (La Comédie Humaine + les autres écrits)', 'http://books.google.com/books/content?id=DbOmAwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Ce livre numérique présente Les Oeuvres Complètes de Balzac (La Comédie Humaine + les autres écrits) avec une table des matières dynamique et détaillée. Honoré de Balzac, né Honoré Balzac à Tours le 20 mai 1799 et mort à Paris le 18 août 1850, est un écrivain français. Il fut romancier, dramaturge, critique littéraire, critique d art, essayiste, journaliste, imprimeur, et a laissé l une des plus imposantes oeuvres romanesques de la littérature française, avec 91 romans et nouvelles parus de 1829 à 1852, auxquels il faut ajouter une cinquantaine d oeuvres non achevées, le tout constituant un ensemble réuni sous le titre de Comédie humaine. Honoré de Balzac est un des maîtres incontestés du roman français dont il a abordé plusieurs genres : le roman historique et politique, avec Les Chouans, le roman philosophique avec Le Chef-d oeuvre inconnu, le roman fantastique avec La Peau de chagrin ou encore le roman poétique avec Le Lys dans la vallée. Mais ses romans réalistes et psychologiques les plus célèbres comme Le Père Goriot ou Eugénie Grandet, qui constituent une part très importante de son oeuvre, ont induit, à tort, une classification réductrice d « auteur réaliste», aspect qui a notamment été attaqué et critiqué par le mouvement du Nouveau roman dans les années 1960. Les études balzaciennes récentes soulignent au contraire le romantisme de Balzac et la poétique de ses romans, notamment dans Le Lys dans la vallée, ainsi que l inspiration fantastique, voire mystique, qui imprègne nombre de ses romans ou nouvelles, et qui, selon Jacques Martineau, « ne disparaît jamais totalement de La Comédie humaine depuis La Peau de chagrin et La Messe de l athée jusqu à Louis Lambert ». Balzac a organisé ses oeuvres en un vaste ensemble, La Comédie humaine, dont le titre est une référence à La Divine Comédie de Dante. Son projet est d explorer les différentes classes sociales et les individus qui les composent. Il entend « faire concurrence à l état civil » selon la formule qu il emploie dans l avant-propos de La Comédie humaine. Il a classé ses textes par ensembles génériques : Études de moeurs, Études analytiques, Études philosophiques. Il attachait une énorme importance aux Études philosophiques qui permettent de comprendre l ensemble de son oeuvre. La Peau de chagrin représentait selon ses propres termes « la clé de voûte qui relie les études de moeurs aux études philosophiques par l anneau d’une fantaisie presque orientale où la vie elle-même est prise avec le Désir, principe de toute passion ». Contenu: AVANT-PROPOS LA MAISON DU CHAT-QUI-PELOTE LE BAL DE SCEAUX LA BOURSE LA VENDETTA MADAME FIRMIANI UNE DOUBLE FAMILLE LA PAIX DU MENAGE LA FAUSSE MAITRESSE ETUDE DE FEMME ALBERT SAVARUS MEMOIRES DE DEUX JEUNES MARIEES UNE FILLE D’EVE LA FEMME ABANDONNEE LA GRENADIERE LE MESSAGE GOBSECK AUTRE ETUDE DE FEMME LA FEMME DE TRENTE ANS LE CONTRAT DE MARIAGE LA MESSE DE L’ATHEE BEATRIX LA GRANDE BRETECHE MODESTE MIGNON HONORINE UN DEBUT DANS LA VIE URSULE MIROUËT EUGENIE GRANDET PIERRETTE LE CURE DE TOURS LA RABOUILLEUSE L’ILLUSTRE GAUDISSART LA MUSE DU DEPARTEMENT LE LYS DANS LA VALLEE ILLUSIONS PERDUES 1 – LES DEUX POETES ILLUSIONS PERDUES 2 – UN GRAND HOMME DE PROVINCE A PARIS ILLUSIONS PERDUES 3 – EVE ET DAVID LES RIVALITES 1 – LA VIEILLE FILLE LES RIVALITES 2 – LE CABINET DES ANTIQUES HISTOIRE DES TREIZE 1 – FERRAGUS HISTOIRE DES TREIZE 2 – LA DUCHESSE DE LANGEAIS HISTOIRE DES TREIZE 3 – LA FILLE AUX YEUX D’OR LE PERE GORIOT LE COLONEL CHABERT FACINO CANE SARRASINE L’INTERDICTION HISTOIRE DE LA GRANDEUR ET DE LA DECADENCE DE CESAR BIROTTEAU LA MAISON NUCINGEN PIERRE GRASSOU LES SECRETS DE LA PRINCESSE DE CADIGNAN LES EMPLOYES OU LA FEMME SUPERIEURE SPLENDEURS ET MISERES DES COURTISANES LES PARENTS PAUVRES 1 – LE COUSIN PONS LES PARENTS PAUVRES 2 – LA COUSINE BETTE UN PRINCE DE LA BOHEME ESQUISSE D’HOMME D’AFFAIRES D’APRES NATURE GAUDISSART II LES COMEDIENS SANS LE SAVOIR UN EPISODE SOUS LA TERREUR UNE TENEBREUSE AFFAIRE Z. MARCAS L’ENVERS DE L’HISTOIRE CONTEMPORAINE LES CHOUANS JESUS-CHRIST EN FLANDRES MELMOTH RECONCILIE LE CHEF-D’OEUVRE INCONNU LA RECHERCHE DE L’ABSOLU MASSIMILLA DONI GAMBARA LES PROSCRITS LOUIS LAMBERT SERAPHITA L’ENFANT MAUDIT LES MARANA ADIEU ! LE REQUISITIONNAIRE EL VERDUGO UN DRAME AU BORD DE LA MER L’AUBERGE ROUGE L’ELIXIR DE LONGUE VIE MAITRE CORNELIUS SUR CATHERINE DE MEDICIS PHYSIOLOGIE DU MARIAGE PETITES MISERES DE LA VIE CONJUGALE PATHOLOGIE DE LA VIE SOCIALE 1 – TRAITE DE LA VIE ELEGANTE PATHOLOGIE DE LA VIE SOCIALE 2 – THEORIE DE LA DEMARCHE PATHOLOGIE DE LA VIE SOCIALE 3 – TRAITE DES EXCITANTS MODERNES CONTES BRUNS CONTES DROLATIQUES CODE DES GENS HONNETES LE NOTAIRE UNE RUE DE PARIS ET SON HABITANT', NULL, 'e-artnow sro', NULL),
(184, 1, 'BiblioLycée - Mémoires de deux jeunes mariées, Balzac - BAC 2023', 'http://books.google.com/books/content?id=DUCVEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Programme du BAC 2023 – Premières technologiques Objet d’étude : Le roman et le récit du Moyen-Âge au XXIe siècle – Parcours traité : Raison et sentiment L’œuvre Louise et Renée se lancent dans une correspondance à leur sortie du couvent. Elles se racontent leur découverte du monde, mais surtout leur vie sentimentale et leurs mariages, en tout point opposés. Tandis que la raisonnable Renée se consacre à la vie de famille, Louise, éprise d’absolu, s’adonne à la passion. Avec ces deux destins de femmes et cette belle histoire d’amitié, Balzac ouvre une réflexion sur l’amour, la passion et le mariage. Le dossier pédagogique Bibliolycée : toutes les clés pour comprendre l’œuvre : Avant de lire l’œuvre : l’essentiel sur l’auteur, l’œuvre et son contexte Au fil de l’œuvre : des questionnaires d’analyse d’extraits pour une préparation à l’oral du Bac Des fiches de synthèse : l’essentiel pour comprendre et analyser l’œuvre (auteur, structure, genre, personnages, genèse et réception, contexte historique et culturel en images) Le parcours « Raison et sentiment » - Spécial BAC Les thèmes principaux expliqués, accompagnés de citations commentées et d’un groupement de textes complémentaires. Le dossier Objectif BAC pour s’entraîner aux épreuves du BAC Une rubrique spécifique pour une meilleure préparation au BAC comportant des sujets d’écrit et d’oral guidés et corrigés, ainsi que des fiches Méthode et des conseils. Pour l’enseignant Un dossier pédagogique téléchargeable gratuitement sur www.enseignants.hachette-education.com avec tous les corrigés des questionnaires.', 510, 'Hachette Éducation', NULL),
(185, 1, 'H. de Balzac. Théâtre complet', 'http://books.google.com/books/content?id=ynU3djU2CGwC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 398, NULL, NULL),
(186, 1, 'Profil - Balzac (Honoré de) : Le Père Goriot', 'http://books.google.com/books/content?id=A66CzGmSvGQC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'L’ouvrage fournit toutes les clés pour analyser le roman de Balzac. Le résumé détaillé est suivi de l’étude des problématiques essentielles, parmi lesquelles : – Goriot, ou la paternité – Paris dans Le Père Goriot– Les femmes, l’amour et le mariage – Le Père Goriot et le réalisme de Balzac.', 80, 'Hatier', NULL),
(187, 1, 'La Peau de chagrin', 'http://books.google.com/books/content?id=5M9bEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Les grands classiques en texte intégral Raphaël de Valentin a perdu au jeu. Il envisage de se suicider. Errant dans les rues de Paris, il finit par entrer dans la boutique d un antiquaire. Le vieil homme lui montre alors un étrange objet : la \"Peau de chagrin\". Celle-ci a le pouvoir d exaucer tous les vœux de son propriétaire. Quelques lignes sont inscrites dessus : « Si tu me possèdes, tu posséderas tout, mais ta vie m appartiendra. » Le vieillard met en garde le jeune homme : chaque désir exaucé fera diminuer la taille de cette peau, symbole de sa vie. Que va faire Raphaël de Valentin ? Cette \"peau de chagrin\" peut-elle être son salut ou au contraire lui coûter son âme ? Avec La Peau de chagrin, Balzac nous livre un roman fantastique puissant qui a marqué durablement l histoire de la littérature. Honoré de Balzac (1799 - 1850), romancier, dramaturge, critique littéraire et journaliste, est l auteur de plus de quatre-vingt-dix romans et nouvelles composant le cycle de la comédie humaine. Il est considéré comme le précurseur du mouvement réaliste.', 306, 'Les éditions d Avallon', NULL),
(188, 1, 'Les oeuvres de Monsieur de Balzac. Divisées en deux tomes', 'http://books.google.com/books/content?id=h-WZwMpxqhUC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 1128, NULL, NULL),
(189, 2, '(Jules Romain). @ (@Choix de poèmes). @.', NULL, NULL, 36, NULL, NULL),
(190, 1, 'La vie unanime', NULL, NULL, 256, 'Gallimard Education', NULL),
(191, 1, 'Théâtre de Jules Romain', NULL, NULL, 182, NULL, NULL),
(192, 1, 'Histoire résumée d Italie depuis la chute l empire romain jusqu à nos jours (476-1876)', 'http://books.google.com/books/content?id=4wY3AAAAMAAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 698, NULL, NULL),
(193, 1, 'Histoire résumée d Italie depuis la chute de l empire romain, jusqu à la fondation du royaume italien à la mort de Pie IX et de Victor-Emmanuel II.', 'http://books.google.com/books/content?id=dwNGwSkOrMkC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 708, NULL, NULL),
(194, 1, 'L état-romain depuis 1815 jusqu à nos jours', 'http://books.google.com/books/content?id=o285AAAAcAAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 534, NULL, NULL),
(195, 1, 'Dictionnaire d antiquités chrétiennes, suivi du calendrier romain', 'http://books.google.com/books/content?id=8rM7AAAAcAAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 516, NULL, NULL),
(196, 1, '1. ptie., I. Chute de l Empire romain. Invasions barbares. L église chrétienne. Clovis et les Mérovingiens. 3.éd. 1884', 'http://books.google.com/books/content?id=4PB896Pr9OwC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, NULL, NULL, NULL),
(197, 1, 'De la Cession des créances en droit romain et en droit français', 'http://books.google.com/books/content?id=_Boi0iozJ0oC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 96, NULL, NULL),
(198, 1, 'L état-romain depuis 1815 jusqu a nos jours avec des notes et documents historiques Jules Amigues', 'http://books.google.com/books/content?id=BSVaU03XcDsC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 516, NULL, NULL),
(199, 1, 'L etat-Romain depuis 1815 jusqu a nosjours, avec des notes et documents historiques recueilles par L-C. Farini', 'http://books.google.com/books/content?id=QrfLbVkZfdgC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 532, NULL, NULL),
(200, 1, 'L État-Romain depuis 1815 jusqu à nos jours, avec des notes et documents historiques recueillis par M. L.-C. Farini', 'http://books.google.com/books/content?id=mzpYAAAAcAAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 516, NULL, NULL),
(201, 1, 'Sur la route de Venise', 'http://books.google.com/books/content?id=Ea5IAQAAIAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Remarqué très tôt, dès son premier Salon en 1835, par la critique d art de l époque, Jules-Romain Joyant fut probablement l un des premiers peintres romantiques français à pratiquer, sur les conseils de Bonington, la technique de l aquarelle, jusque-là typiquement anglaise. Ce dernier lui recommanda également d aller dessiner et peindre en Italie, où il se rendit dès 1829. Se découvrant une véritable passion pour ce pays, il passa une grande partie de sa vie sur les routes entre Rome, Florence, Bologne et surtout Venise, qui le subjugua. Peintre paysagiste d architectures urbaines, il fut un fervent admirateur de ses prestigieux prédécesseurs italiens du XVIIIe siècle : Pannini, Canaletto et Guardi. Tout comme eux, il savait harmoniser la richesse et la douceur des couleurs avec un dessin irréprochable, fondé sur l emploi de curieux appareils d optique, étudiés ici pour la première fois. Cette monographie présente des dessins et des peintures inédites, mais surtout un ensemble extraordinaire d esquisses préparatoires mises en regard des œuvres définitives. Jamais on n avait pu, dans un livre consacré à un peintre du XIXe siècle, comparer de façon aussi méthodique l ébauche initiale et l œuvre achevée. Le lecteur pénètre ainsi les arcanes de la création en assistant à la germination d une composition dans l esprit d un paysagiste romantique. Ses quelque 300 illustrations, accompagnées de textes de spécialistes qui replacent l œuvre de Jules-Romain Joyant dans la redécouverte de la peinture vénitienne et du mythe de Venise en général, font de cet ouvrage un véritable livre de référence sur Venise au XIXe siècle.', 255, 'Somogy éditions d art', NULL),
(202, 1, 'Les cultes paiens dans l empire romain: Les cultes officiels. Les cultes romains et gréco-romains', 'http://books.google.com/books/content?id=-IhbAAAAMAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', NULL, NULL, NULL, NULL),
(203, 1, 'La politique coloniale', NULL, 'En 1885, la France est en pleine expansion coloniale et toutes les grandes puissances internationales tentent d’élargir leurs territoires colonisés sur tous les continents. À cette même époque, Georges Clemenceau (1841-1929) est député de Paris à la Chambre des députés, mandat durant lequel la question de la colonisation et de son expansion prend une place importante dans les débats politiques. A ce sujet, deux discours ont marqués les esprits : celui de Jules Ferry le 28 juillet 1885 et la réponse de Georges Clemenceau le 31 juillet. Ce dernier s’oppose fermement au discours colonialiste de Jules Ferry en reprenant ses argument et en les démontant un à un. Ces débats sur les questions coloniales feront de Clémenceau le tombeur du ministère de Ferry en 1885. Le discours de Clemenceau s’appuie sur les propos de Jules Ferry et sur sa vision des colonies. Il répond à son collègue afin de mieux réfuter ses arguments. Quels que soient les thèmes abordés, Clemenceau est en désaccord profond et tente d’expliquer clairement sa vision de la colonisation. Il aborde la question économique en premier lieu. Présentant ses chiffres et les comparant à ceux de Ferry, il accuse la colonisation d’être responsable de nombreuses pertes pour la France. Cette dernière n’aurait aucun bénéfice à s’associer à de nouveaux pays. Mais la vision économique de la colonisation n’est pas la seule à poser un problème selon lui. Les questions d’ordre humanitaire le sont tout autant. Il réfute vigoureusement l’idée de « race supérieure » ou « inférieure » évoquée par Jules Ferry. Il prend alors l’exemple de l’Allemagne qui avait utilisé cet argument contre la France : « Races supérieures ! Races inférieures ! C’est bientôt dit ! Pour ma part, j’en rabats singulièrement depuis que j’ai vu des savants allemands démontrer scientifiquement que la France devait être vaincue dans la guerre franco-allemande, parce que le Français est d’une race inférieure à l’Allemand. » Enfin, pour lui, la France n’est pas encore capable de se lancer dans de nouvelles conquêtes. Elle doit se reconstruire et se consolider avant de se lancer dans une nouvelle guerre ? «Mais nous disons, nous, que lorsqu’une nation a éprouvé de graves, de très graves revers en Europe, lorsque sa frontière a été entamée, il convient peut-être avant de la lancer dans les conquêtes lointaines – fussent-elles utiles et, j’ai démontré le contraire –, de bien s’assurer que l’on a le pied solide chez soi et que le sol national ne tremble pas. Voilà le devoir qui s’impose. » Ce discours tient une place importante dans la vie politique de Georges Clemenceau et demeure toujours d’actualité aujourd’hui alors que la mondialisation est au coeur des débats actuels. Et la vision de celui que l’on présente généralement comme un humaniste (Jules Ferry) est, sur ce point et analysée au présent, très contestable, contrairement à la vision de celui qui est réputé le plus conservateur : Georges Clemenceau.', 151, 'Magellan et Cie', NULL),
(204, 1, 'Discours et opinions', 'http://books.google.com/books/content?id=qgu8s04OuCYC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, NULL, NULL, NULL),
(205, 1, 'Discours et opinions de Jules Ferry: Le second empire. La guerre et la Commune', 'http://books.google.com/books/content?id=jZ4DAAAAYAAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 614, NULL, NULL),
(206, 1, 'Discours et opinions de Jules Ferry: L Assemblée nationale. Les ministères Dufaure et jules simon. Le ré gime du 16 mai. Le second ministère Dufaure', 'http://books.google.com/books/content?id=Cpo4AAAAIAAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 514, NULL, NULL),
(207, 1, 'Discours et Opinions de Jules Ferry publiés avec commentaires et notes par Paul Robiquet', 'http://books.google.com/books/content?id=UXUOUO439gAC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 606, NULL, NULL),
(208, 1, 'Discours et opinions de Jules Ferry: Les lois scolaires (suit et fin): Louis sur l enseignement des jeunes filles, sur la gratuité, l obligation et la laïcité de l enseignement primaire, sur la caisse des écoles. Discours divers sur les questions scolaires. Discours sur la politique extérieure et coloniale: affaires grecques. Affaires tunisiennes (1. ptie.)', 'http://books.google.com/books/content?id=t23o31ftfnMC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 626, NULL, NULL),
(209, 1, 'Discours et Opinions de Jules Ferry publiés avec commentaires et notes par Paul Robiquet', 'http://books.google.com/books/content?id=XPPJlPUlU8wC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 508, NULL, NULL),
(210, 1, 'Déposition de monsieur Jules Ferry sur l insurrection du 18 mars', 'http://books.google.com/books/content?id=CdRNAQAAMAAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 68, NULL, NULL),
(211, 1, 'Discours et Opinions de Jules Ferry publiés avec commentaires et notes par Paul Robiquet', 'http://books.google.com/books/content?id=awtZ8IzURXAC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 614, NULL, NULL),
(212, 1, 'Discours et opinions de Jules Ferry: Les lois scolaires (1. ptie.): La loi sur la liberté de l enseignement supérieur. L article 7. Les décrets. La loi sur le Conseil supérieur. La loi sur les titres de capacité', 'http://books.google.com/books/content?id=xB0oAAAAYAAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 614, NULL, NULL),
(213, 1, 'Deux ministres pédagogues, M. Guizot et M. Ferry', 'http://books.google.com/books/content?id=nYWX24OCAScC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 44, NULL, NULL),
(214, 1, 'Discours et opinions de Jules Ferry', 'http://books.google.com/books/content?id=kJ8DAAAAYAAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 584, NULL, NULL),
(215, 1, 'Discours Et Opinions de Jules Ferry', 'http://books.google.com/books/content?id=jKlAjgEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Discours et opinions de Jules Ferry. Les lois scolaires (suite et fin): lois sur l enseignement des jeunes filles, sur la gratuite, l obligation et la laicite de l enseignement primaire, sur la caisse des ecoles, discours divers sur les questions scolaires. Discours sur la politique exterieure et coloniale: affaires grecques, affaires tunisiennes / publies avec commentaires et notes, par Paul Robiquet, ...Date de l edition originale: 1893-1898Ce livre est la reproduction fidele d une oeuvre publiee avant 1920 et fait partie d une collection de livres reimprimes a la demande editee par Hachette Livre, dans le cadre d un partenariat avec la Bibliotheque nationale de France, offrant l opportunite d acceder a des ouvrages anciens et souvent rares issus des fonds patrimoniaux de la BnF.Les oeuvres faisant partie de cette collection ont ete numerisees par la BnF et sont presentes sur Gallica, sa bibliotheque numerique.En entreprenant de redonner vie a ces ouvrages au travers d une collection de livres reimprimes a la demande, nous leur donnons la possibilite de rencontrer un public elargi et participons a la transmission de connaissances et de savoirs parfois difficilement accessibles.Nous avons cherche a concilier la reproduction fidele d un livre ancien a partir de sa version numerisee avec le souci d un confort de lecture optimal. Nous esperons que les ouvrages de cette nouvelle collection vous apporteront entiere satisfaction.Pour plus d informations, rendez-vous sur www.hachettebnf.fr', 616, NULL, NULL),
(216, 1, 'Discours et opinions de Jules Ferry', 'http://books.google.com/books/content?id=1Z8DAAAAYAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', NULL, 562, NULL, NULL),
(217, 1, 'La politique coloniale', NULL, 'En 1885, la France est en pleine expansion coloniale et toutes les grandes puissances internationales tentent d’élargir leurs territoires colonisés sur tous les continents. À cette même époque, Georges Clemenceau (1841-1929) est député de Paris à la Chambre des députés, mandat durant lequel la question de la colonisation et de son expansion prend une place importante dans les débats politiques. A ce sujet, deux discours ont marqués les esprits : celui de Jules Ferry le 28 juillet 1885 et la réponse de Georges Clemenceau le 31 juillet. Ce dernier s’oppose fermement au discours colonialiste de Jules Ferry en reprenant ses argument et en les démontant un à un. Ces débats sur les questions coloniales feront de Clémenceau le tombeur du ministère de Ferry en 1885. Le discours de Clemenceau s’appuie sur les propos de Jules Ferry et sur sa vision des colonies. Il répond à son collègue afin de mieux réfuter ses arguments. Quels que soient les thèmes abordés, Clemenceau est en désaccord profond et tente d’expliquer clairement sa vision de la colonisation. Il aborde la question économique en premier lieu. Présentant ses chiffres et les comparant à ceux de Ferry, il accuse la colonisation d’être responsable de nombreuses pertes pour la France. Cette dernière n’aurait aucun bénéfice à s’associer à de nouveaux pays. Mais la vision économique de la colonisation n’est pas la seule à poser un problème selon lui. Les questions d’ordre humanitaire le sont tout autant. Il réfute vigoureusement l’idée de « race supérieure » ou « inférieure » évoquée par Jules Ferry. Il prend alors l’exemple de l’Allemagne qui avait utilisé cet argument contre la France : « Races supérieures ! Races inférieures ! C’est bientôt dit ! Pour ma part, j’en rabats singulièrement depuis que j’ai vu des savants allemands démontrer scientifiquement que la France devait être vaincue dans la guerre franco-allemande, parce que le Français est d’une race inférieure à l’Allemand. » Enfin, pour lui, la France n’est pas encore capable de se lancer dans de nouvelles conquêtes. Elle doit se reconstruire et se consolider avant de se lancer dans une nouvelle guerre ? «Mais nous disons, nous, que lorsqu’une nation a éprouvé de graves, de très graves revers en Europe, lorsque sa frontière a été entamée, il convient peut-être avant de la lancer dans les conquêtes lointaines – fussent-elles utiles et, j’ai démontré le contraire –, de bien s’assurer que l’on a le pied solide chez soi et que le sol national ne tremble pas. Voilà le devoir qui s’impose. » Ce discours tient une place importante dans la vie politique de Georges Clemenceau et demeure toujours d’actualité aujourd’hui alors que la mondialisation est au coeur des débats actuels. Et la vision de celui que l’on présente généralement comme un humaniste (Jules Ferry) est, sur ce point et analysée au présent, très contestable, contrairement à la vision de celui qui est réputé le plus conservateur : Georges Clemenceau.', 151, 'Magellan et Cie', NULL),
(218, 1, 'Clemenceau vu de près', 'http://books.google.com/books/content?id=x3KJDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Né à Paris le 14 janvier 1888, Normalien, Agrégé des Lettres, Georges Wormser, mobilisé en 1914, plusieurs fois blessé, décoré, fut appelé à son côté par Georges Clemenceau dès novembre 1917. Il fut son dernier chef de cabinet à la présidence du Conseil et reste en étroite association avec lui jusqu’à sa mort en 1929. Rentré dans la vie privée, il n’en sort que momentanément en 1934 pour aider, comme directeur de cabinet aux P.T.T., son ami Georges Mandel, et chaque fois qu’il le juge nécessaire pour défendre la mémoire et l’œuvre de Georges Clemenceau. Jusqu’à la fin de sa vie il mènera de front ses activités professionnelles, et cette mission – essentielle à ses yeux – tant comme Président de la Société des amis de Georges Clemenceau que comme auteur de plusieurs brillants ouvrages d’histoire contemporaine, notamment La République de Clemenceau (P.U.F.) et Le septennat de Poincaré (Fayard). Georges Wormser était particulièrement qualifié, par ces longues années d’intime confiance pour faire revivre la grande figure solitaire et énergique de Georges Clemenceau. Lorsqu’il mourut le 16 février 1978 il avait achevé ce dernier livre, véritable testament clemenciste, éclairant de traits inédits la puissante personnalité et la vie extraordinaire du Tigre.', 346, 'FeniXX', NULL),
(219, 2, 'France XIX - XX', 'http://books.google.com/books/content?id=zDP-bjX3EccC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 212, 'Publications de la Sorbonne', NULL),
(220, 1, 'Georges Clemenceau par Georges Clémenceau', NULL, NULL, 159, NULL, NULL),
(221, 1, 'La Politique coloniale', 'http://books.google.com/books/content?id=XnAUCgAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Discours entre Clemenceau et Ferry au sujet de la décolonisation française Avec un bel éclat, les deux discours qu’on va lire donnent à connaître, ramassé, le débat où s’affrontèrent, en un moment décisif, le camp des partisans de la colonisation et celui de ses adversaires : par les grandes voix de deux orateurs essentiels. La résonance de l’une sur l’autre démonstration était destinée, nous le savons maintenant, à évoluer en profondeur dans la suite des temps. Un demi-siècle plus tard, vers l’époque de l’exposition coloniale de 1931, apogée d’un grand dessein, Jules Ferry aurait rallié à ses thèses la majorité des Français, les générations qui avaient assimilé, sur les bancs de l’école, en face des cartes suspendues à côté du tableau noir et portant la couleur rose de nos emprises planétaires, la fierté que leur pays pouvait en tirer. Mais cent ans après, une fois qu’aurait soufflé le grand vent de la décolonisation, Clemenceau apparaîtrait, au contraire, comme celui dont la lucidité avait porté la conscience prémonitoire de l’illégitimité d’une domination de notre peuple sur d’autres qui n’en pouvaient. Les comptes-rendus des débats du Parlement recèlent des trésors, lorsque les tribuns les plus éloquents et les plus inspirés y confrontent leurs visions de la société et leur conception de la place de la France dans le monde. Le duel oratoire de Jules Ferry et de Georges Clemenceau sur la question coloniale, en juillet 1885, à la Chambre des députés, donne à connaître avec éclat l’opposition de deux tempéraments, de deux doctrines, de deux morales. En se protégeant contre l’anachronisme, on découvrira dans leurs discours, reproduits ici pour la première fois en intégralité, quels échos leurs propos peuvent trouver, aujourd’hui encore, au cœur de nos interrogations contemporaines. Un livre pour mieux comprendre l empire colonial français EXTRAIT M. le président : – L’ordre du jour appelle la suite de la de la discussion du projet de loi portant ouverture au ministre de la Marine et des Colonies, au titre de l’exercice de 1885, d’un crédit extraordinaire de 12190000 francs pour les dépenses occasionnées par les événements de Madagascar. La parole est à M. Jules Ferry. M. Jules Ferry: – Messieurs, bien que j’aie eu souvent l’occasion, pendant les deux années durant lesquelles vous m’avez maintenu votre confiance, de m’expliquer sur les origines, sur la portée, sur le caractère de la politique coloniale, et particulièrement, à propos de cette affaire de Madagascar, sur les limites que la sagesse et la prudence politiques doivent imposer à notre expansion coloniale, j’ai pensé, et la majorité de la Chambre, par un vote émis hier, et pour lequel je lui exprime ma profonde gratitude, a pensé aussi... M. Achard: – Il n’y a pas eu d’opposition ! M. le président : – Messieurs, veuillez faire silence. M. Jules Ferry: – S’il n’y a pas eu d’opposition, ma gratitude n’en est que plus grande...', 152, 'Magellan & Cie Éditions', NULL),
(222, 2, 'Georges Clemenceau', 'http://books.google.com/books/content?id=Rc8AAAAAMAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', NULL, 466, NULL, NULL),
(223, 2, 'Discours de Guerre [par] Georges Clemenceau. Publiés Par la Société Des Amis de Georges Clemenceau', NULL, NULL, 274, NULL, NULL),
(224, 1, 'Georges Clemenceau', NULL, NULL, 28, NULL, NULL),
(225, 1, 'Le silence de M. Clemenceau', 'http://books.google.com/books/content?id=kw8bAAAAMAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', NULL, 326, NULL, NULL),
(226, 1, 'Georges Clémenceau', NULL, NULL, 30, NULL, NULL),
(227, 1, 'M. Clemenceau peint par lui-même', 'http://books.google.com/books/content?id=TQ4bAAAAMAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', NULL, 328, NULL, NULL),
(228, 1, 'Georges Clemenceau à son ami Claude Monet', 'http://books.google.com/books/content?id=wSoxjWyLvzUC&printsec=frontcover&img=1&zoom=5&source=gbs_api', 'Ce livre nous permet de découvrir l amitié qu éprouvèrent l un pour l autre G. Clemenceau et C. Monet, à travers une correspondance riche d informations historiques et anecdotiques, illustrée de photographies d époque et de reproductions d oeuvres du peintre.', 195, 'RMN', NULL),
(229, 1, 'Les plus belles pages de Georges Clemenceau', NULL, NULL, 270, NULL, NULL),
(230, 1, 'Georges Clemenceau. L Enseignement dans le droit républicain', NULL, NULL, 86, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `BORROW`
--

CREATE TABLE `BORROW` (
  `ID_BORROW` bigint(4) NOT NULL,
  `ID_USER` bigint(4) NOT NULL,
  `ID_BOOK` bigint(4) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `BORROW`
--

INSERT INTO `BORROW` (`ID_BORROW`, `ID_USER`, `ID_BOOK`, `START_DATE`, `END_DATE`) VALUES
(1, 1, 6, '2023-03-24', '2023-03-30'),
(2, 2, 44, '2023-03-24', '2023-03-30'),
(3, 3, 8, '2023-03-24', '2023-03-31'),
(4, 4, 19, '2023-03-24', '2023-04-01'),
(5, 5, 27, '2023-03-24', '2023-03-28'),
(6, 6, 57, '2023-03-24', '2023-03-26'),
(7, 7, 18, '2023-03-24', '2023-04-01'),
(8, 8, 18, '2023-03-24', '2023-03-31'),
(9, 9, 57, '2023-03-24', '2023-03-29'),
(10, 10, 6, '2023-03-24', '2023-04-03'),
(11, 11, 36, '2023-03-24', '2023-04-01'),
(12, 12, 1, '2023-03-24', '2023-03-27'),
(13, 13, 26, '2023-03-24', '2023-03-28'),
(14, 14, 14, '2023-03-24', '2023-04-02'),
(15, 15, 18, '2023-03-24', '2023-03-30'),
(16, 16, 33, '2023-03-24', '2023-03-26'),
(17, 17, 3, '2023-03-24', '2023-03-31'),
(18, 18, 52, '2023-03-24', '2023-03-29'),
(19, 19, 44, '2023-03-24', '2023-04-02'),
(20, 20, 3, '2023-03-24', '2023-04-03'),
(21, 21, 43, '2023-03-24', '2023-03-30'),
(22, 22, 46, '2023-03-24', '2023-03-30'),
(23, 23, 36, '2023-03-24', '2023-03-27'),
(24, 24, 10, '2023-03-24', '2023-03-31'),
(25, 25, 56, '2023-03-24', '2023-03-27'),
(26, 26, 44, '2023-03-24', '2023-03-27'),
(27, 27, 36, '2023-03-24', '2023-03-27'),
(28, 28, 3, '2023-03-24', '2023-03-26'),
(29, 29, 40, '2023-03-24', '2023-03-29'),
(30, 30, 24, '2023-03-24', '2023-03-29'),
(31, 31, 21, '2023-03-24', '2023-03-27'),
(32, 32, 33, '2023-03-24', '2023-04-02'),
(33, 33, 38, '2023-03-24', '2023-03-29'),
(34, 34, 12, '2023-03-24', '2023-04-01'),
(35, 35, 10, '2023-03-24', '2023-04-01'),
(36, 36, 42, '2023-03-24', '2023-03-31'),
(37, 37, 46, '2023-03-24', '2023-03-26'),
(38, 38, 44, '2023-03-24', '2023-04-03'),
(39, 39, 49, '2023-03-24', '2023-04-02'),
(40, 40, 39, '2023-03-24', '2023-03-31'),
(41, 41, 10, '2023-03-24', '2023-04-03'),
(42, 42, 42, '2023-03-24', '2023-03-29'),
(43, 43, 29, '2023-03-24', '2023-03-29'),
(44, 44, 54, '2023-03-24', '2023-04-03'),
(45, 45, 40, '2023-03-24', '2023-03-29'),
(46, 46, 4, '2023-03-24', '2023-03-27'),
(47, 47, 31, '2023-03-24', '2023-03-31'),
(48, 48, 27, '2023-03-24', '2023-03-28'),
(49, 49, 14, '2023-03-24', '2023-03-31'),
(50, 50, 46, '2023-03-24', '2023-03-28'),
(51, 51, 51, '2023-03-24', '2023-04-02'),
(52, 52, 24, '2023-03-24', '2023-03-29'),
(53, 53, 1, '2023-03-24', '2023-03-28'),
(54, 54, 27, '2023-03-24', '2023-03-30'),
(55, 55, 1, '2023-03-24', '2023-03-26'),
(56, 56, 30, '2023-03-24', '2023-03-27'),
(57, 57, 11, '2023-03-24', '2023-03-28'),
(58, 58, 60, '2023-03-24', '2023-03-30'),
(59, 59, 59, '2023-03-24', '2023-04-03'),
(60, 60, 37, '2023-03-24', '2023-03-29'),
(61, 61, 18, '2023-03-24', '2023-04-03'),
(62, 62, 5, '2023-03-24', '2023-04-01'),
(63, 63, 18, '2023-03-24', '2023-04-03'),
(64, 64, 48, '2023-03-24', '2023-03-31'),
(65, 65, 17, '2023-03-24', '2023-03-30'),
(66, 66, 21, '2023-03-24', '2023-03-31'),
(67, 67, 17, '2023-03-24', '2023-03-27'),
(68, 68, 33, '2023-03-24', '2023-04-03'),
(69, 69, 59, '2023-03-24', '2023-03-26'),
(70, 70, 19, '2023-03-24', '2023-03-30'),
(71, 71, 16, '2023-03-24', '2023-03-31'),
(72, 72, 22, '2023-03-24', '2023-04-01'),
(73, 73, 43, '2023-03-24', '2023-03-27'),
(74, 74, 13, '2023-03-24', '2023-03-30'),
(75, 75, 49, '2023-03-24', '2023-03-28'),
(76, 76, 57, '2023-03-24', '2023-03-29'),
(77, 77, 22, '2023-03-24', '2023-03-28'),
(78, 78, 47, '2023-03-24', '2023-04-03'),
(79, 79, 27, '2023-03-24', '2023-03-28'),
(80, 80, 48, '2023-03-24', '2023-03-26'),
(81, 81, 48, '2023-03-24', '2023-03-27'),
(82, 82, 8, '2023-03-24', '2023-03-26'),
(83, 83, 13, '2023-03-24', '2023-03-30'),
(84, 84, 53, '2023-03-24', '2023-03-30'),
(85, 85, 52, '2023-03-24', '2023-03-30'),
(86, 86, 46, '2023-03-24', '2023-04-01'),
(87, 87, 43, '2023-03-24', '2023-04-02'),
(88, 88, 51, '2023-03-24', '2023-04-01'),
(89, 89, 36, '2023-03-24', '2023-03-26'),
(90, 90, 57, '2023-03-24', '2023-04-01'),
(91, 91, 52, '2023-03-24', '2023-03-26'),
(92, 92, 40, '2023-03-24', '2023-03-28'),
(93, 93, 7, '2023-03-24', '2023-03-26'),
(94, 94, 36, '2023-03-24', '2023-03-27'),
(95, 95, 35, '2023-03-24', '2023-03-26'),
(96, 96, 33, '2023-03-24', '2023-04-01'),
(97, 97, 46, '2023-03-24', '2023-03-31'),
(98, 98, 60, '2023-03-24', '2023-03-28'),
(99, 99, 15, '2023-03-24', '2023-03-26'),
(100, 100, 16, '2023-03-24', '2023-03-27'),
(101, 101, 3, '2023-03-24', '2023-03-31'),
(102, 102, 59, '2023-03-24', '2023-03-26'),
(103, 103, 22, '2023-03-24', '2023-04-01'),
(104, 104, 37, '2023-03-24', '2023-04-02'),
(105, 105, 51, '2023-03-24', '2023-04-02'),
(106, 106, 33, '2023-03-24', '2023-03-31'),
(107, 107, 1, '2023-03-24', '2023-03-27'),
(108, 108, 18, '2023-03-24', '2023-03-29'),
(109, 109, 41, '2023-03-24', '2023-04-02'),
(110, 110, 44, '2023-03-24', '2023-04-01'),
(111, 111, 34, '2023-03-24', '2023-04-03'),
(112, 112, 3, '2023-03-24', '2023-03-26'),
(113, 113, 60, '2023-03-24', '2023-03-27'),
(114, 114, 30, '2023-03-24', '2023-03-28'),
(115, 115, 33, '2023-03-24', '2023-04-01'),
(116, 116, 59, '2023-03-24', '2023-04-03'),
(117, 117, 25, '2023-03-24', '2023-04-01'),
(118, 118, 51, '2023-03-24', '2023-03-27'),
(119, 119, 16, '2023-03-24', '2023-03-30'),
(120, 120, 9, '2023-03-24', '2023-04-02'),
(121, 121, 40, '2023-03-24', '2023-04-02'),
(122, 122, 10, '2023-03-24', '2023-03-29'),
(123, 123, 29, '2023-03-24', '2023-03-28'),
(124, 124, 22, '2023-03-24', '2023-03-29'),
(125, 125, 30, '2023-03-24', '2023-04-01'),
(126, 126, 43, '2023-03-24', '2023-03-30'),
(127, 127, 33, '2023-03-24', '2023-03-31'),
(128, 128, 53, '2023-03-24', '2023-04-02'),
(129, 129, 32, '2023-03-24', '2023-03-31'),
(130, 130, 44, '2023-03-24', '2023-03-26'),
(131, 131, 50, '2023-03-24', '2023-03-29'),
(132, 132, 1, '2023-03-24', '2023-03-27'),
(133, 133, 47, '2023-03-24', '2023-03-30'),
(134, 134, 10, '2023-03-24', '2023-03-29'),
(135, 135, 7, '2023-03-24', '2023-03-27'),
(136, 136, 23, '2023-03-24', '2023-03-27'),
(137, 137, 8, '2023-03-24', '2023-04-02'),
(138, 138, 1, '2023-03-24', '2023-03-28'),
(139, 139, 33, '2023-03-24', '2023-03-29'),
(140, 140, 32, '2023-03-24', '2023-04-01'),
(141, 141, 33, '2023-03-24', '2023-04-02'),
(142, 142, 32, '2023-03-24', '2023-03-27'),
(143, 143, 1, '2023-03-24', '2023-03-29'),
(144, 144, 9, '2023-03-24', '2023-03-30'),
(145, 145, 8, '2023-03-24', '2023-04-01'),
(146, 146, 31, '2023-03-24', '2023-04-03'),
(147, 147, 52, '2023-03-24', '2023-03-29'),
(148, 148, 47, '2023-03-24', '2023-04-02'),
(149, 149, 11, '2023-03-24', '2023-03-28'),
(150, 150, 41, '2023-03-24', '2023-03-29'),
(151, 151, 28, '2023-03-24', '2023-03-26'),
(152, 152, 56, '2023-03-24', '2023-04-01'),
(153, 153, 30, '2023-03-24', '2023-04-03'),
(154, 154, 25, '2023-03-24', '2023-03-30'),
(155, 155, 46, '2023-03-24', '2023-03-29'),
(156, 156, 24, '2023-03-24', '2023-03-31'),
(157, 157, 27, '2023-03-24', '2023-03-29'),
(158, 158, 33, '2023-03-24', '2023-03-27'),
(159, 159, 54, '2023-03-24', '2023-04-02'),
(160, 160, 44, '2023-03-24', '2023-03-27'),
(161, 161, 38, '2023-03-24', '2023-04-03'),
(162, 162, 39, '2023-03-24', '2023-04-02'),
(163, 163, 46, '2023-03-24', '2023-03-31'),
(164, 164, 31, '2023-03-24', '2023-03-26'),
(165, 165, 6, '2023-03-24', '2023-03-27'),
(166, 166, 15, '2023-03-24', '2023-04-01'),
(167, 167, 24, '2023-03-24', '2023-04-01'),
(168, 168, 8, '2023-03-24', '2023-04-03'),
(169, 169, 53, '2023-03-24', '2023-03-31'),
(170, 170, 36, '2023-03-24', '2023-03-30'),
(171, 171, 2, '2023-03-24', '2023-03-27'),
(172, 172, 15, '2023-03-24', '2023-03-29'),
(173, 173, 59, '2023-03-24', '2023-03-27'),
(174, 174, 36, '2023-03-24', '2023-04-02'),
(175, 175, 41, '2023-03-24', '2023-03-31'),
(176, 176, 19, '2023-03-24', '2023-04-01'),
(177, 177, 17, '2023-03-24', '2023-03-31'),
(178, 178, 13, '2023-03-24', '2023-04-03'),
(179, 179, 42, '2023-03-24', '2023-03-28'),
(180, 180, 1, '2023-03-24', '2023-03-31'),
(181, 181, 7, '2023-03-24', '2023-03-30'),
(182, 182, 9, '2023-03-24', '2023-03-31'),
(183, 183, 40, '2023-03-24', '2023-03-29'),
(184, 184, 44, '2023-03-24', '2023-03-28'),
(185, 185, 35, '2023-03-24', '2023-04-02'),
(186, 186, 9, '2023-03-24', '2023-03-30'),
(187, 187, 48, '2023-03-24', '2023-04-02'),
(188, 188, 36, '2023-03-24', '2023-04-03'),
(189, 189, 22, '2023-03-24', '2023-04-02'),
(190, 190, 44, '2023-03-24', '2023-04-01'),
(191, 191, 30, '2023-03-24', '2023-03-31'),
(192, 192, 8, '2023-03-24', '2023-03-30'),
(193, 193, 28, '2023-03-24', '2023-04-02'),
(194, 194, 2, '2023-03-24', '2023-04-03'),
(195, 195, 41, '2023-03-24', '2023-03-31'),
(196, 196, 42, '2023-03-24', '2023-04-02'),
(197, 197, 13, '2023-03-24', '2023-03-28'),
(198, 198, 9, '2023-03-24', '2023-03-31'),
(199, 199, 37, '2023-03-24', '2023-03-28'),
(200, 200, 13, '2023-03-24', '2023-03-29'),
(201, 201, 10, '2023-03-24', '2023-03-26'),
(202, 202, 44, '2023-03-24', '2023-03-26'),
(203, 203, 3, '2023-03-24', '2023-04-01'),
(204, 204, 11, '2023-03-24', '2023-03-27'),
(205, 205, 30, '2023-03-24', '2023-03-31'),
(206, 206, 24, '2023-03-24', '2023-04-03'),
(207, 207, 49, '2023-03-24', '2023-03-29'),
(208, 208, 58, '2023-03-24', '2023-03-30'),
(209, 209, 41, '2023-03-24', '2023-03-31'),
(210, 210, 34, '2023-03-24', '2023-04-02'),
(211, 211, 37, '2023-03-24', '2023-04-02'),
(212, 212, 35, '2023-03-24', '2023-03-30'),
(213, 213, 15, '2023-03-24', '2023-03-29'),
(214, 214, 4, '2023-03-24', '2023-03-27'),
(215, 215, 22, '2023-03-24', '2023-03-29'),
(216, 216, 7, '2023-03-24', '2023-03-30'),
(217, 217, 43, '2023-03-24', '2023-03-30'),
(218, 218, 57, '2023-03-24', '2023-03-29'),
(219, 219, 51, '2023-03-24', '2023-03-28'),
(220, 220, 19, '2023-03-24', '2023-03-31'),
(221, 221, 52, '2023-03-24', '2023-04-02'),
(222, 222, 22, '2023-03-24', '2023-04-01'),
(223, 223, 25, '2023-03-24', '2023-03-29'),
(224, 224, 26, '2023-03-24', '2023-03-26'),
(225, 225, 37, '2023-03-24', '2023-04-01'),
(226, 226, 10, '2023-03-24', '2023-03-27'),
(227, 227, 45, '2023-03-24', '2023-03-28'),
(228, 228, 13, '2023-03-24', '2023-03-30'),
(229, 229, 16, '2023-03-24', '2023-03-30'),
(230, 230, 31, '2023-03-24', '2023-03-30'),
(231, 231, 10, '2023-03-24', '2023-03-30'),
(232, 232, 35, '2023-03-24', '2023-04-01'),
(233, 233, 43, '2023-03-24', '2023-04-02'),
(234, 234, 46, '2023-03-24', '2023-03-30'),
(235, 235, 15, '2023-03-24', '2023-03-27'),
(236, 236, 16, '2023-03-24', '2023-03-30'),
(237, 237, 3, '2023-03-24', '2023-03-31'),
(238, 238, 13, '2023-03-24', '2023-03-31'),
(239, 239, 54, '2023-03-24', '2023-04-02'),
(240, 240, 37, '2023-03-24', '2023-03-29'),
(241, 241, 53, '2023-03-24', '2023-04-01'),
(242, 242, 27, '2023-03-24', '2023-04-01'),
(243, 243, 28, '2023-03-24', '2023-03-27'),
(244, 244, 40, '2023-03-24', '2023-03-27'),
(245, 245, 29, '2023-03-24', '2023-04-01'),
(246, 246, 4, '2023-03-24', '2023-03-31'),
(247, 247, 30, '2023-03-24', '2023-04-02'),
(248, 248, 4, '2023-03-24', '2023-03-27'),
(249, 249, 13, '2023-03-24', '2023-04-02'),
(250, 250, 11, '2023-03-24', '2023-03-26'),
(251, 251, 34, '2023-03-24', '2023-04-02'),
(252, 252, 60, '2023-03-24', '2023-04-01'),
(253, 253, 51, '2023-03-24', '2023-04-03'),
(254, 254, 4, '2023-03-24', '2023-03-26'),
(255, 255, 4, '2023-03-24', '2023-04-02'),
(256, 256, 44, '2023-03-24', '2023-03-28'),
(257, 257, 17, '2023-03-24', '2023-03-27'),
(258, 258, 26, '2023-03-24', '2023-03-28'),
(259, 259, 20, '2023-03-24', '2023-03-29'),
(260, 260, 53, '2023-03-24', '2023-04-03'),
(261, 261, 18, '2023-03-24', '2023-03-30'),
(262, 262, 19, '2023-03-24', '2023-03-27'),
(263, 263, 6, '2023-03-24', '2023-03-26'),
(264, 264, 14, '2023-03-24', '2023-03-30'),
(265, 265, 58, '2023-03-24', '2023-04-01'),
(266, 266, 31, '2023-03-24', '2023-03-30'),
(267, 267, 33, '2023-03-24', '2023-04-01'),
(268, 268, 14, '2023-03-24', '2023-03-30'),
(269, 269, 32, '2023-03-24', '2023-03-30'),
(270, 270, 32, '2023-03-24', '2023-03-28'),
(271, 271, 13, '2023-03-24', '2023-04-03'),
(272, 272, 36, '2023-03-24', '2023-03-29'),
(273, 273, 4, '2023-03-24', '2023-03-27'),
(274, 274, 30, '2023-03-24', '2023-04-03'),
(275, 275, 37, '2023-03-24', '2023-03-31'),
(276, 276, 2, '2023-03-24', '2023-03-26'),
(277, 277, 40, '2023-03-24', '2023-04-02'),
(278, 278, 39, '2023-03-24', '2023-03-26'),
(279, 279, 35, '2023-03-24', '2023-03-29'),
(280, 280, 37, '2023-03-24', '2023-04-03'),
(281, 281, 52, '2023-03-24', '2023-03-31'),
(282, 282, 51, '2023-03-24', '2023-04-02'),
(283, 283, 51, '2023-03-24', '2023-03-26'),
(284, 284, 42, '2023-03-24', '2023-03-27'),
(285, 285, 7, '2023-03-24', '2023-04-02'),
(286, 286, 59, '2023-03-24', '2023-03-30'),
(287, 287, 48, '2023-03-24', '2023-03-29'),
(288, 288, 26, '2023-03-24', '2023-03-28'),
(289, 289, 25, '2023-03-24', '2023-03-26'),
(290, 290, 11, '2023-03-24', '2023-04-02'),
(291, 291, 15, '2023-03-24', '2023-03-28'),
(292, 292, 10, '2023-03-24', '2023-04-01'),
(293, 293, 59, '2023-03-24', '2023-03-31'),
(294, 294, 33, '2023-03-24', '2023-03-27'),
(295, 295, 6, '2023-03-24', '2023-03-29'),
(296, 296, 4, '2023-03-24', '2023-04-01'),
(297, 297, 60, '2023-03-24', '2023-03-30'),
(298, 298, 13, '2023-03-24', '2023-03-29'),
(299, 299, 47, '2023-03-24', '2023-03-31'),
(300, 300, 2, '2023-03-24', '2023-04-02'),
(301, 301, 42, '2023-03-24', '2023-03-29'),
(302, 302, 58, '2023-03-24', '2023-04-03'),
(303, 303, 58, '2023-03-24', '2023-03-26'),
(304, 304, 22, '2023-03-24', '2023-03-29'),
(305, 305, 1, '2023-03-24', '2023-04-03'),
(306, 306, 55, '2023-03-24', '2023-04-01'),
(307, 307, 23, '2023-03-24', '2023-03-30'),
(308, 308, 18, '2023-03-24', '2023-04-03'),
(309, 309, 9, '2023-03-24', '2023-03-28'),
(310, 310, 36, '2023-03-24', '2023-04-03'),
(311, 311, 13, '2023-03-24', '2023-04-01'),
(312, 312, 56, '2023-03-24', '2023-04-02'),
(313, 313, 15, '2023-03-24', '2023-03-26'),
(314, 314, 2, '2023-03-24', '2023-03-30'),
(315, 315, 7, '2023-03-24', '2023-04-03'),
(316, 316, 34, '2023-03-24', '2023-03-29'),
(317, 317, 52, '2023-03-24', '2023-03-27'),
(318, 318, 43, '2023-03-24', '2023-04-03'),
(319, 319, 9, '2023-03-24', '2023-03-26'),
(320, 320, 31, '2023-03-24', '2023-03-26'),
(321, 321, 41, '2023-03-24', '2023-04-02'),
(322, 322, 32, '2023-03-24', '2023-03-28'),
(323, 323, 21, '2023-03-24', '2023-03-27'),
(324, 324, 43, '2023-03-24', '2023-03-27'),
(325, 325, 39, '2023-03-24', '2023-03-26'),
(326, 326, 6, '2023-03-24', '2023-04-02'),
(327, 327, 50, '2023-03-24', '2023-03-30'),
(328, 328, 15, '2023-03-24', '2023-04-02'),
(329, 329, 1, '2023-03-24', '2023-03-31'),
(330, 330, 1, '2023-03-24', '2023-04-03'),
(331, 331, 40, '2023-03-24', '2023-04-02'),
(332, 332, 17, '2023-03-24', '2023-04-03'),
(333, 333, 39, '2023-03-24', '2023-03-26'),
(334, 334, 20, '2023-03-24', '2023-03-28'),
(335, 335, 42, '2023-03-24', '2023-03-27'),
(336, 336, 36, '2023-03-24', '2023-04-02'),
(337, 337, 5, '2023-03-24', '2023-04-02'),
(338, 338, 43, '2023-03-24', '2023-03-30'),
(339, 339, 42, '2023-03-24', '2023-04-03'),
(340, 340, 44, '2023-03-24', '2023-03-29'),
(341, 341, 13, '2023-03-24', '2023-03-26'),
(342, 342, 57, '2023-03-24', '2023-04-01'),
(343, 343, 36, '2023-03-24', '2023-03-26'),
(344, 344, 10, '2023-03-24', '2023-04-03'),
(345, 345, 14, '2023-03-24', '2023-03-27'),
(346, 346, 57, '2023-03-24', '2023-03-31'),
(347, 347, 5, '2023-03-24', '2023-04-01'),
(348, 348, 59, '2023-03-24', '2023-03-29'),
(349, 349, 18, '2023-03-24', '2023-03-30'),
(350, 350, 39, '2023-03-24', '2023-03-31'),
(351, 351, 15, '2023-03-24', '2023-03-30'),
(352, 352, 52, '2023-03-24', '2023-04-01'),
(353, 353, 54, '2023-03-24', '2023-04-01'),
(354, 354, 58, '2023-03-24', '2023-03-27'),
(355, 355, 40, '2023-03-24', '2023-03-29'),
(356, 356, 38, '2023-03-24', '2023-04-03'),
(357, 357, 21, '2023-03-24', '2023-03-27'),
(358, 358, 15, '2023-03-24', '2023-03-29'),
(359, 359, 49, '2023-03-24', '2023-03-26'),
(360, 360, 38, '2023-03-24', '2023-03-26'),
(361, 361, 49, '2023-03-24', '2023-03-30'),
(362, 362, 28, '2023-03-24', '2023-04-01'),
(363, 363, 20, '2023-03-24', '2023-03-31'),
(364, 364, 57, '2023-03-24', '2023-04-02'),
(365, 365, 51, '2023-03-24', '2023-04-01'),
(366, 366, 19, '2023-03-24', '2023-04-03'),
(367, 367, 25, '2023-03-24', '2023-04-03'),
(368, 368, 38, '2023-03-24', '2023-03-27'),
(369, 369, 26, '2023-03-24', '2023-03-31'),
(370, 370, 46, '2023-03-24', '2023-03-31'),
(371, 371, 12, '2023-03-24', '2023-03-30'),
(372, 372, 47, '2023-03-24', '2023-04-02'),
(373, 373, 52, '2023-03-24', '2023-04-02'),
(374, 374, 3, '2023-03-24', '2023-03-28'),
(375, 375, 4, '2023-03-24', '2023-03-29'),
(376, 376, 2, '2023-03-24', '2023-03-31'),
(377, 377, 4, '2023-03-24', '2023-04-02'),
(378, 378, 47, '2023-03-24', '2023-03-27'),
(379, 379, 55, '2023-03-24', '2023-03-29'),
(380, 380, 60, '2023-03-24', '2023-03-29'),
(381, 381, 57, '2023-03-24', '2023-03-31'),
(382, 382, 39, '2023-03-24', '2023-03-31'),
(383, 383, 24, '2023-03-24', '2023-03-26'),
(384, 384, 53, '2023-03-24', '2023-04-01'),
(385, 385, 37, '2023-03-24', '2023-03-26'),
(386, 386, 57, '2023-03-24', '2023-03-28'),
(387, 387, 47, '2023-03-24', '2023-04-03'),
(388, 388, 35, '2023-03-24', '2023-03-28'),
(389, 389, 16, '2023-03-24', '2023-04-03'),
(390, 390, 6, '2023-03-24', '2023-03-29'),
(391, 391, 35, '2023-03-24', '2023-03-28'),
(392, 392, 10, '2023-03-24', '2023-03-29'),
(393, 393, 31, '2023-03-24', '2023-03-31'),
(394, 394, 12, '2023-03-24', '2023-04-01'),
(395, 395, 59, '2023-03-24', '2023-03-28'),
(396, 396, 18, '2023-03-24', '2023-03-26'),
(397, 397, 24, '2023-03-24', '2023-04-01'),
(398, 398, 29, '2023-03-24', '2023-03-27'),
(399, 399, 54, '2023-03-24', '2023-04-01'),
(400, 400, 18, '2023-03-24', '2023-04-01'),
(401, 401, 37, '2023-03-24', '2023-03-26'),
(402, 402, 52, '2023-03-24', '2023-03-29'),
(403, 403, 25, '2023-03-24', '2023-03-30'),
(404, 404, 39, '2023-03-24', '2023-03-31'),
(405, 405, 17, '2023-03-24', '2023-03-26'),
(406, 406, 56, '2023-03-24', '2023-04-03'),
(407, 407, 28, '2023-03-24', '2023-03-30'),
(408, 408, 39, '2023-03-24', '2023-03-29'),
(409, 409, 4, '2023-03-24', '2023-03-27'),
(410, 410, 36, '2023-03-24', '2023-03-30'),
(411, 411, 16, '2023-03-24', '2023-04-01'),
(412, 412, 18, '2023-03-24', '2023-04-03'),
(413, 413, 50, '2023-03-24', '2023-03-27'),
(414, 414, 33, '2023-03-24', '2023-04-02'),
(415, 415, 41, '2023-03-24', '2023-03-28'),
(416, 416, 22, '2023-03-24', '2023-03-31'),
(417, 417, 52, '2023-03-24', '2023-03-31'),
(418, 418, 13, '2023-03-24', '2023-04-02'),
(419, 419, 3, '2023-03-24', '2023-03-28'),
(420, 420, 25, '2023-03-24', '2023-03-27'),
(421, 421, 3, '2023-03-24', '2023-04-02'),
(422, 422, 36, '2023-03-24', '2023-03-26'),
(423, 423, 8, '2023-03-24', '2023-03-30'),
(424, 424, 58, '2023-03-24', '2023-04-01'),
(425, 425, 29, '2023-03-24', '2023-03-29'),
(426, 426, 45, '2023-03-24', '2023-03-29'),
(427, 427, 36, '2023-03-24', '2023-03-27'),
(428, 428, 53, '2023-03-24', '2023-03-29'),
(429, 429, 26, '2023-03-24', '2023-03-28'),
(430, 430, 15, '2023-03-24', '2023-04-02'),
(431, 431, 47, '2023-03-24', '2023-04-02'),
(432, 432, 21, '2023-03-24', '2023-03-27'),
(433, 433, 39, '2023-03-24', '2023-03-30'),
(434, 434, 25, '2023-03-24', '2023-03-28'),
(435, 435, 18, '2023-03-24', '2023-03-31'),
(436, 436, 26, '2023-03-24', '2023-04-03'),
(437, 437, 59, '2023-03-24', '2023-03-29'),
(438, 438, 43, '2023-03-24', '2023-03-27'),
(439, 439, 1, '2023-03-24', '2023-03-27'),
(440, 440, 5, '2023-03-24', '2023-04-01'),
(441, 441, 58, '2023-03-24', '2023-03-27'),
(442, 442, 40, '2023-03-24', '2023-03-27'),
(443, 443, 26, '2023-03-24', '2023-03-26'),
(444, 444, 50, '2023-03-24', '2023-04-02'),
(445, 445, 22, '2023-03-24', '2023-03-29'),
(446, 446, 27, '2023-03-24', '2023-03-29'),
(447, 447, 6, '2023-03-24', '2023-04-01'),
(448, 448, 10, '2023-03-24', '2023-03-27'),
(449, 449, 33, '2023-03-24', '2023-03-30'),
(450, 450, 6, '2023-03-24', '2023-03-30'),
(451, 451, 19, '2023-03-24', '2023-03-28'),
(452, 452, 15, '2023-03-24', '2023-03-29'),
(453, 453, 1, '2023-03-24', '2023-03-30'),
(454, 454, 42, '2023-03-24', '2023-04-01'),
(455, 455, 42, '2023-03-24', '2023-03-28'),
(456, 456, 7, '2023-03-24', '2023-03-31'),
(457, 457, 40, '2023-03-24', '2023-04-03'),
(458, 458, 34, '2023-03-24', '2023-03-27'),
(459, 459, 57, '2023-03-24', '2023-04-01'),
(460, 460, 24, '2023-03-24', '2023-04-03'),
(461, 461, 25, '2023-03-24', '2023-03-26'),
(462, 462, 3, '2023-03-24', '2023-03-31'),
(463, 463, 18, '2023-03-24', '2023-03-30'),
(464, 464, 48, '2023-03-24', '2023-03-26'),
(465, 465, 53, '2023-03-24', '2023-04-01'),
(466, 466, 30, '2023-03-24', '2023-03-27'),
(467, 467, 32, '2023-03-24', '2023-03-29'),
(468, 468, 9, '2023-03-24', '2023-03-30'),
(469, 469, 11, '2023-03-24', '2023-04-01'),
(470, 470, 33, '2023-03-24', '2023-03-28'),
(471, 471, 30, '2023-03-24', '2023-03-30'),
(472, 472, 59, '2023-03-24', '2023-03-31'),
(473, 473, 3, '2023-03-24', '2023-04-01'),
(474, 474, 8, '2023-03-24', '2023-04-01'),
(475, 475, 32, '2023-03-24', '2023-03-30'),
(476, 476, 35, '2023-03-24', '2023-04-02'),
(477, 477, 1, '2023-03-24', '2023-03-26'),
(478, 478, 15, '2023-03-24', '2023-03-30'),
(479, 479, 4, '2023-03-24', '2023-03-26'),
(480, 480, 13, '2023-03-24', '2023-03-29'),
(481, 481, 6, '2023-03-24', '2023-03-26'),
(482, 482, 26, '2023-03-24', '2023-03-30'),
(483, 483, 17, '2023-03-24', '2023-03-30'),
(484, 484, 13, '2023-03-24', '2023-03-27'),
(485, 485, 1, '2023-03-24', '2023-03-26'),
(486, 486, 24, '2023-03-24', '2023-04-02'),
(487, 487, 14, '2023-03-24', '2023-04-02'),
(488, 488, 49, '2023-03-24', '2023-04-02'),
(489, 489, 21, '2023-03-24', '2023-04-03'),
(490, 490, 3, '2023-03-24', '2023-03-30'),
(491, 491, 50, '2023-03-24', '2023-03-31'),
(492, 492, 54, '2023-03-24', '2023-04-01'),
(493, 493, 7, '2023-03-24', '2023-04-01'),
(494, 494, 8, '2023-03-24', '2023-04-02'),
(495, 495, 41, '2023-03-24', '2023-03-30'),
(496, 496, 17, '2023-03-24', '2023-03-30'),
(497, 497, 45, '2023-03-24', '2023-04-01'),
(498, 498, 60, '2023-03-24', '2023-04-02'),
(499, 499, 34, '2023-03-24', '2023-04-03');

-- --------------------------------------------------------

--
-- Structure de la table `CATEGORY`
--

CREATE TABLE `CATEGORY` (
  `ID_CATEGORY` bigint(4) NOT NULL,
  `CATEGORY_NAME` char(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `CATEGORY`
--

INSERT INTO `CATEGORY` (`ID_CATEGORY`, `CATEGORY_NAME`) VALUES
(27, 'Adultery'),
(20, 'Adventure stories'),
(2, 'Algeria'),
(5, 'Alienation (Social psychology)'),
(10, 'Allegory'),
(29, 'Art'),
(16, 'Art thefts'),
(32, 'Authors'),
(3, 'Authors, French'),
(42, 'Benjamin, Walter'),
(12, 'Biography & Autobiography'),
(22, 'Christmas stories'),
(43, 'Clemenceau, George Eugene Benjamin'),
(37, 'Colonialism'),
(4, 'Comics & Graphic Novels'),
(25, 'Detective and mystery stories'),
(24, 'Drawing, French'),
(13, 'Existential phenomenology'),
(14, 'Existentialism'),
(46, 'Fiction'),
(7, 'France'),
(15, 'French fiction'),
(26, 'French language'),
(8, 'French language materials'),
(18, 'French literature'),
(6, 'Graphic novels'),
(40, 'History'),
(33, 'Italy'),
(17, 'Literary Collections'),
(28, 'Love stories'),
(34, 'Middle Ages'),
(39, 'Moral education'),
(30, 'Music'),
(38, 'Paris (France)'),
(11, 'Philosophy'),
(9, 'Poetry'),
(36, 'Religions'),
(44, 'Sans categorie'),
(31, 'Social Science'),
(21, 'Study Aids'),
(1, 'Teachers'),
(19, 'Time in literature'),
(23, 'Travel'),
(35, 'Venice (Italy)'),
(41, 'World War, 1914-1918');

-- --------------------------------------------------------

--
-- Structure de la table `FOLLOW`
--

CREATE TABLE `FOLLOW` (
  `ID_USER_FOLLOW` bigint(4) NOT NULL,
  `ID_USER_IS_FOLLOWED` bigint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `LANGUAGE`
--

CREATE TABLE `LANGUAGE` (
  `ID_LANGUAGE` bigint(4) NOT NULL,
  `LIB_LANGUAGE` char(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `LANGUAGE`
--

INSERT INTO `LANGUAGE` (`ID_LANGUAGE`, `LIB_LANGUAGE`) VALUES
(4, 'de'),
(2, 'en'),
(1, 'fr'),
(3, 'it'),
(5, 'sv');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `RATING`
--

CREATE TABLE `RATING` (
  `ID_USER` bigint(4) NOT NULL,
  `ID_BOOK` bigint(4) NOT NULL,
  `RATE` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déclencheurs `RATING`
--
DELIMITER $$
CREATE TRIGGER `check_if_borrowed_before_rating` BEFORE INSERT ON `RATING` FOR EACH ROW BEGIN
    DECLARE res INT;
    SELECT ID_BORROW INTO res
    FROM BORROW
    WHERE ID_USER = NEW.ID_USER AND ID_BOOK = NEW.ID_BOOK;
    
    IF res IS NULL THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot rate a book that has not been borrowed.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `TAG`
--

CREATE TABLE `TAG` (
  `ID_BOOK` bigint(4) NOT NULL,
  `ID_CATEGORY` bigint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `TAG`
--

INSERT INTO `TAG` (`ID_BOOK`, `ID_CATEGORY`) VALUES
(1, 44),
(2, 44),
(3, 1),
(4, 1),
(5, 44),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 44),
(11, 2),
(12, 3),
(13, 4),
(14, 1),
(15, 44),
(16, 4),
(17, 5),
(18, 6),
(19, 2),
(20, 7),
(21, 3),
(22, 44),
(23, 8),
(24, 1),
(25, 9),
(26, 10),
(27, 11),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 44),
(34, 1),
(35, 1),
(36, 1),
(37, 44),
(38, 1),
(39, 1),
(40, 12),
(41, 12),
(42, 44),
(43, 44),
(44, 13),
(45, 1),
(46, 14),
(47, 1),
(48, 15),
(49, 44),
(50, 1),
(51, 16),
(52, 1),
(53, 44),
(54, 44),
(55, 44),
(56, 17),
(57, 44),
(58, 1),
(59, 44),
(60, 18),
(61, 19),
(62, 1),
(63, 20),
(64, 21),
(65, 1),
(66, 44),
(67, 44),
(68, 1),
(69, 22),
(70, 1),
(71, 44),
(72, 18),
(73, 18),
(74, 44),
(75, 44),
(76, 44),
(77, 44),
(78, 44),
(79, 1),
(80, 13),
(81, 1),
(82, 1),
(83, 23),
(84, 24),
(85, 1),
(86, 44),
(87, 44),
(88, 44),
(89, 13),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 44),
(96, 1),
(97, 1),
(98, 1),
(99, 25),
(100, 44),
(101, 44),
(102, 12),
(103, 44),
(104, 12),
(105, 22),
(106, 26),
(107, 44),
(108, 1),
(109, 18),
(110, 26),
(111, 44),
(112, 1),
(113, 1),
(114, 1),
(115, 44),
(116, 1),
(117, 44),
(118, 44),
(119, 44),
(120, 44),
(121, 13),
(122, 1),
(123, 44),
(124, 44),
(125, 1),
(126, 27),
(127, 44),
(128, 28),
(129, 1),
(130, 1),
(131, 1),
(132, 44),
(133, 44),
(134, 29),
(135, 44),
(136, 44),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 44),
(142, 44),
(143, 44),
(144, 44),
(145, 44),
(146, 1),
(147, 44),
(148, 44),
(149, 12),
(150, 12),
(151, 13),
(152, 4),
(153, 30),
(154, 31),
(155, 4),
(156, 44),
(157, 4),
(158, 32),
(159, 1),
(160, 44),
(161, 4),
(162, 13),
(163, 10),
(164, 44),
(165, 10),
(166, 1),
(167, 18),
(168, 44),
(169, 44),
(170, 1),
(171, 1),
(172, 44),
(173, 1),
(174, 32),
(175, 44),
(176, 33),
(177, 44),
(178, 44),
(179, 44),
(180, 1),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 22),
(186, 44),
(187, 1),
(188, 1),
(189, 44),
(190, 44),
(191, 10),
(192, 44),
(193, 34),
(194, 34),
(195, 44),
(196, 44),
(197, 35),
(198, 44),
(199, 44),
(200, 44),
(201, 44),
(202, 36),
(203, 37),
(204, 38),
(205, 44),
(206, 8),
(207, 8),
(208, 44),
(209, 8),
(210, 44),
(211, 39),
(212, 44),
(213, 8),
(214, 40),
(215, 8),
(216, 44),
(217, 8),
(218, 38),
(219, 41),
(220, 44),
(221, 44),
(222, 41),
(223, 8),
(224, 42),
(225, 44),
(226, 43),
(227, 44),
(228, 44),
(229, 44),
(230, 44);

-- --------------------------------------------------------

--
-- Structure de la table `test_AUTHOR`
--

CREATE TABLE `test_AUTHOR` (
  `ID_AUTHOR` bigint(20) NOT NULL,
  `AUTHOR_NAME` char(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `test_BOOK`
--

CREATE TABLE `test_BOOK` (
  `ID_BOOK` bigint(20) NOT NULL,
  `TITLE` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `IMAGE` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NUMBER_OF_PAGES` bigint(20) DEFAULT NULL,
  `EDITOR` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RELEASE_DATE` date DEFAULT NULL,
  `ID_LANGUAGE` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `test_BORROW`
--

CREATE TABLE `test_BORROW` (
  `ID_BORROW` bigint(20) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date DEFAULT NULL,
  `ID_BOOK` bigint(20) DEFAULT NULL,
  `ID_USER` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `test_CATEGORY`
--

CREATE TABLE `test_CATEGORY` (
  `ID_CATEGORY` bigint(20) NOT NULL,
  `CATEGORY_NAME` char(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `test_follow`
--

CREATE TABLE `test_follow` (
  `ID_USER_FOLLOW` bigint(20) NOT NULL,
  `ID_USER_IS_FOLLOWED` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `test_LANGUAGE`
--

CREATE TABLE `test_LANGUAGE` (
  `ID_LANGUAGE` bigint(20) NOT NULL,
  `LIB_LANGUAGE` char(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `test_rating`
--

CREATE TABLE `test_rating` (
  `ID_USER` bigint(20) NOT NULL,
  `ID_BOOK` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déclencheurs `test_rating`
--
DELIMITER $$
CREATE TRIGGER `check_if_borrowed_before_test_rating` BEFORE INSERT ON `test_rating` FOR EACH ROW BEGIN
    DECLARE res INT;
    SELECT ID_BORROW INTO res
    FROM test_BORROW
    WHERE ID_USER = NEW.ID_USER AND ID_BOOK = NEW.ID_BOOK;
    
    IF res IS NULL THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot rate a book that has not been borrowed.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `test_tag`
--

CREATE TABLE `test_tag` (
  `ID_BOOK` bigint(20) NOT NULL,
  `ID_CATEGORY` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `test_USER`
--

CREATE TABLE `test_USER` (
  `ID_USER` bigint(20) NOT NULL,
  `FIRSTNAME` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LASTNAME` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EMAIL` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PASSWORD` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AVATAR` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `TOKEN` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `test_USER`
--

INSERT INTO `test_USER` (`ID_USER`, `FIRSTNAME`, `LASTNAME`, `EMAIL`, `PASSWORD`, `AVATAR`, `TOKEN`) VALUES
(2, 'Evan', 'Loper', 'Evan@gmail.com', 'Evan33', 'https://ozgrozer.github.io/100k-faces/0/0/000164.jpg', NULL),
(3, 'Chris', 'Manser', 'Chris@gmail.com', 'Chris33', 'https://ozgrozer.github.io/100k-faces/0/9/009517.jpg', NULL),
(4, 'Nathan', 'Horton', 'Nathan@gmail.com', 'Nathan33', 'https://ozgrozer.github.io/100k-faces/0/9/009623.jpg', NULL),
(5, 'Elizabeth', 'Hodson', 'Elizabeth@gmail.com', 'Elizabeth33', 'https://ozgrozer.github.io/100k-faces/0/2/002567.jpg', NULL),
(6, 'Barbara', 'Williams', 'Barbara@gmail.com', 'Barbara33', 'https://ozgrozer.github.io/100k-faces/0/1/001318.jpg', NULL),
(7, 'Doug', 'White', 'Doug@gmail.com', 'Doug33', 'https://ozgrozer.github.io/100k-faces/0/9/009506.jpg', NULL),
(8, 'Marla', 'Troilo', 'Marla@gmail.com', 'Marla33', 'https://ozgrozer.github.io/100k-faces/0/4/004926.jpg', NULL),
(9, 'Barbara', 'Celestine', 'Barbara94541@gmail.com', 'Barbara33', 'https://ozgrozer.github.io/100k-faces/0/6/006607.jpg', NULL),
(10, 'Joan', 'Gordon', 'Joan@gmail.com', 'Joan33', 'https://ozgrozer.github.io/100k-faces/0/8/008954.jpg', NULL),
(11, 'William', 'Barton', 'William@gmail.com', 'William33', 'https://ozgrozer.github.io/100k-faces/0/1/001261.jpg', NULL),
(12, 'Cruz', 'Maultsby', 'Cruz@gmail.com', 'Cruz33', 'https://ozgrozer.github.io/100k-faces/0/8/008151.jpg', NULL),
(13, 'Edythe', 'Odonnell', 'Edythe@gmail.com', 'Edythe33', 'https://ozgrozer.github.io/100k-faces/0/0/000944.jpg', NULL),
(14, 'Michael', 'Gribbin', 'Michael@gmail.com', 'Michael33', 'https://ozgrozer.github.io/100k-faces/0/1/001580.jpg', NULL),
(15, 'Jeffery', 'Alexander', 'Jeffery@gmail.com', 'Jeffery33', 'https://ozgrozer.github.io/100k-faces/0/2/002483.jpg', NULL),
(16, 'Frederic', 'Sanford', 'Frederic@gmail.com', 'Frederic33', 'https://ozgrozer.github.io/100k-faces/0/2/002197.jpg', NULL),
(17, 'Ernest', 'Drake', 'Ernest@gmail.com', 'Ernest33', 'https://ozgrozer.github.io/100k-faces/0/4/004517.jpg', NULL),
(18, 'Ryan', 'Davis', 'Ryan@gmail.com', 'Ryan33', 'https://ozgrozer.github.io/100k-faces/0/6/006528.jpg', NULL),
(19, 'Thersa', 'Victory', 'Thersa@gmail.com', 'Thersa33', 'https://ozgrozer.github.io/100k-faces/0/3/003860.jpg', NULL),
(20, 'Donald', 'Williams', 'Donald@gmail.com', 'Donald33', 'https://ozgrozer.github.io/100k-faces/0/2/002535.jpg', NULL),
(21, 'Noelle', 'Fisher', 'Noelle@gmail.com', 'Noelle33', 'https://ozgrozer.github.io/100k-faces/0/9/009903.jpg', NULL),
(22, 'Marissa', 'Cruz', 'Marissa@gmail.com', 'Marissa33', 'https://ozgrozer.github.io/100k-faces/0/4/004616.jpg', NULL),
(23, 'Christina', 'Riley', 'Christina@gmail.com', 'Christina33', 'https://ozgrozer.github.io/100k-faces/0/4/004216.jpg', NULL),
(24, 'Pansy', 'Fleming', 'Pansy@gmail.com', 'Pansy33', 'https://ozgrozer.github.io/100k-faces/0/6/006222.jpg', NULL),
(25, 'Julie', 'Grisham', 'Julie@gmail.com', 'Julie33', 'https://ozgrozer.github.io/100k-faces/0/5/005866.jpg', NULL),
(26, 'Catherine', 'Hilton', 'Catherine@gmail.com', 'Catherine33', 'https://ozgrozer.github.io/100k-faces/0/5/005794.jpg', NULL),
(27, 'Edwin', 'Cadogan', 'Edwin@gmail.com', 'Edwin33', 'https://ozgrozer.github.io/100k-faces/0/4/004816.jpg', NULL),
(28, 'Pamela', 'Griffey', 'Pamela@gmail.com', 'Pamela33', 'https://ozgrozer.github.io/100k-faces/0/7/007180.jpg', NULL),
(29, 'Glenna', 'Thomas', 'Glenna@gmail.com', 'Glenna33', 'https://ozgrozer.github.io/100k-faces/0/6/006247.jpg', NULL),
(30, 'Lillian', 'Fowlkes', 'Lillian@gmail.com', 'Lillian33', 'https://ozgrozer.github.io/100k-faces/0/2/002086.jpg', NULL),
(31, 'Fred', 'Kimball', 'Fred@gmail.com', 'Fred33', 'https://ozgrozer.github.io/100k-faces/0/0/000717.jpg', NULL),
(32, 'Steve', 'Mccan', 'Steve@gmail.com', 'Steve33', 'https://ozgrozer.github.io/100k-faces/0/5/005088.jpg', NULL),
(33, 'Kyle', 'Carlson', 'Kyle@gmail.com', 'Kyle33', 'https://ozgrozer.github.io/100k-faces/0/2/002543.jpg', NULL),
(34, 'Jerald', 'Gallegos', 'Jerald@gmail.com', 'Jerald33', 'https://ozgrozer.github.io/100k-faces/0/7/007241.jpg', NULL),
(35, 'Charity', 'Doe', 'Charity@gmail.com', 'Charity33', 'https://ozgrozer.github.io/100k-faces/0/0/000582.jpg', NULL),
(36, 'Glenda', 'Vargas', 'Glenda@gmail.com', 'Glenda33', 'https://ozgrozer.github.io/100k-faces/0/4/004412.jpg', NULL),
(37, 'Rebecca', 'Wells', 'Rebecca@gmail.com', 'Rebecca33', 'https://ozgrozer.github.io/100k-faces/0/7/007380.jpg', NULL),
(38, 'Timothy', 'Lewis', 'Timothy@gmail.com', 'Timothy33', 'https://ozgrozer.github.io/100k-faces/0/1/001815.jpg', NULL),
(39, 'Anthony', 'Catton', 'Anthony@gmail.com', 'Anthony33', 'https://ozgrozer.github.io/100k-faces/0/4/004193.jpg', NULL),
(40, 'Gary', 'Testa', 'Gary@gmail.com', 'Gary33', 'https://ozgrozer.github.io/100k-faces/0/7/007303.jpg', NULL),
(41, 'Deborah', 'Allison', 'Deborah@gmail.com', 'Deborah33', 'https://ozgrozer.github.io/100k-faces/0/4/004303.jpg', NULL),
(42, 'Anneliese', 'Angelocci', 'Anneliese@gmail.com', 'Anneliese33', 'https://ozgrozer.github.io/100k-faces/0/8/008610.jpg', NULL),
(43, 'Teresa', 'Crowder', 'Teresa@gmail.com', 'Teresa33', 'https://ozgrozer.github.io/100k-faces/0/5/005300.jpg', NULL),
(44, 'Tanya', 'Watson', 'Tanya@gmail.com', 'Tanya33', 'https://ozgrozer.github.io/100k-faces/0/2/002229.jpg', NULL),
(45, 'Deshawn', 'Hutson', 'Deshawn@gmail.com', 'Deshawn33', 'https://ozgrozer.github.io/100k-faces/0/2/002112.jpg', NULL),
(46, 'Ashley', 'Schroeder', 'Ashley@gmail.com', 'Ashley33', 'https://ozgrozer.github.io/100k-faces/0/2/002124.jpg', NULL),
(47, 'Nidia', 'Briant', 'Nidia@gmail.com', 'Nidia33', 'https://ozgrozer.github.io/100k-faces/0/4/004992.jpg', NULL),
(48, 'Jason', 'Bristol', 'Jason@gmail.com', 'Jason33', 'https://ozgrozer.github.io/100k-faces/0/1/001133.jpg', NULL),
(49, 'Essie', 'Medlin', 'Essie@gmail.com', 'Essie33', 'https://ozgrozer.github.io/100k-faces/0/9/009799.jpg', NULL),
(50, 'Philip', 'Luce', 'Philip@gmail.com', 'Philip33', 'https://ozgrozer.github.io/100k-faces/0/5/005439.jpg', NULL),
(51, 'Edith', 'Lybarger', 'Edith@gmail.com', 'Edith33', 'https://ozgrozer.github.io/100k-faces/0/9/009588.jpg', NULL),
(52, 'Anna', 'Lee', 'Anna@gmail.com', 'Anna33', 'https://ozgrozer.github.io/100k-faces/0/1/001727.jpg', NULL),
(53, 'Reed', 'Annis', 'Reed@gmail.com', 'Reed33', 'https://ozgrozer.github.io/100k-faces/0/3/003308.jpg', NULL),
(54, 'Mary', 'Haun', 'Mary@gmail.com', 'Mary33', 'https://ozgrozer.github.io/100k-faces/0/1/001203.jpg', NULL),
(55, 'Ruby', 'Kerby', 'Ruby@gmail.com', 'Ruby33', 'https://ozgrozer.github.io/100k-faces/0/7/007392.jpg', NULL),
(56, 'Walter', 'Auzenne', 'Walter@gmail.com', 'Walter33', 'https://ozgrozer.github.io/100k-faces/0/1/001411.jpg', NULL),
(57, 'James', 'Mason', 'James@gmail.com', 'James33', 'https://ozgrozer.github.io/100k-faces/0/6/006804.jpg', NULL),
(58, 'Richard', 'Phipps', 'Richard@gmail.com', 'Richard33', 'https://ozgrozer.github.io/100k-faces/0/6/006234.jpg', NULL),
(59, 'Randee', 'Cornelius', 'Randee@gmail.com', 'Randee33', 'https://ozgrozer.github.io/100k-faces/0/8/008294.jpg', NULL),
(60, 'Frank', 'Richardson', 'Frank@gmail.com', 'Frank33', 'https://ozgrozer.github.io/100k-faces/0/4/004679.jpg', NULL),
(61, 'Monty', 'Clapham', 'Monty@gmail.com', 'Monty33', 'https://ozgrozer.github.io/100k-faces/0/8/008570.jpg', NULL),
(62, 'Joshua', 'Munoz', 'Joshua@gmail.com', 'Joshua33', 'https://ozgrozer.github.io/100k-faces/0/7/007011.jpg', NULL),
(63, 'Larry', 'Henry', 'Larry@gmail.com', 'Larry33', 'https://ozgrozer.github.io/100k-faces/0/8/008694.jpg', NULL),
(64, 'Sarah', 'Kinzer', 'Sarah@gmail.com', 'Sarah33', 'https://ozgrozer.github.io/100k-faces/0/1/001717.jpg', NULL),
(65, 'Jose', 'Stramel', 'Jose@gmail.com', 'Jose33', 'https://ozgrozer.github.io/100k-faces/0/8/008628.jpg', NULL),
(66, 'Mona', 'Rochin', 'Mona@gmail.com', 'Mona33', 'https://ozgrozer.github.io/100k-faces/0/6/006931.jpg', NULL),
(67, 'William', 'Gonzalez', 'William76154@gmail.com', 'William33', 'https://ozgrozer.github.io/100k-faces/0/4/004734.jpg', NULL),
(68, 'Daniel', 'Schoen', 'Daniel@gmail.com', 'Daniel33', 'https://ozgrozer.github.io/100k-faces/0/9/009261.jpg', NULL),
(69, 'Van', 'Baggesen', 'Van@gmail.com', 'Van33', 'https://ozgrozer.github.io/100k-faces/0/1/001870.jpg', NULL),
(70, 'Shira', 'Cravens', 'Shira@gmail.com', 'Shira33', 'https://ozgrozer.github.io/100k-faces/0/9/009187.jpg', NULL),
(71, 'James', 'Vargas', 'James87680@gmail.com', 'James33', 'https://ozgrozer.github.io/100k-faces/0/6/006824.jpg', NULL),
(72, 'Robert', 'Short', 'Robert@gmail.com', 'Robert33', 'https://ozgrozer.github.io/100k-faces/0/4/004426.jpg', NULL),
(73, 'Roberta', 'Roberts', 'Roberta@gmail.com', 'Roberta33', 'https://ozgrozer.github.io/100k-faces/0/9/009256.jpg', NULL),
(74, 'Roberta', 'Edwards', 'Roberta27954@gmail.com', 'Roberta33', 'https://ozgrozer.github.io/100k-faces/0/3/003027.jpg', NULL),
(75, 'Marie', 'Berger', 'Marie@gmail.com', 'Marie33', 'https://ozgrozer.github.io/100k-faces/0/7/007857.jpg', NULL),
(76, 'Christine', 'Green', 'Christine@gmail.com', 'Christine33', 'https://ozgrozer.github.io/100k-faces/0/7/007616.jpg', NULL),
(77, 'Wendy', 'Wilson', 'Wendy@gmail.com', 'Wendy33', 'https://ozgrozer.github.io/100k-faces/0/7/007727.jpg', NULL),
(78, 'Joy', 'Darling', 'Joy@gmail.com', 'Joy33', 'https://ozgrozer.github.io/100k-faces/0/3/003670.jpg', NULL),
(79, 'Alice', 'Knightly', 'Alice@gmail.com', 'Alice33', 'https://ozgrozer.github.io/100k-faces/0/1/001310.jpg', NULL),
(80, 'Rebecca', 'Peluso', 'Rebecca72830@gmail.com', 'Rebecca33', 'https://ozgrozer.github.io/100k-faces/0/7/007550.jpg', NULL),
(81, 'Maria', 'Mccormick', 'Maria@gmail.com', 'Maria33', 'https://ozgrozer.github.io/100k-faces/0/9/009237.jpg', NULL),
(82, 'Elizabeth', 'Thomson', 'Elizabeth84179@gmail.com', 'Elizabeth33', 'https://ozgrozer.github.io/100k-faces/0/9/009983.jpg', NULL),
(83, 'Jeanette', 'Jackson', 'Jeanette@gmail.com', 'Jeanette33', 'https://ozgrozer.github.io/100k-faces/0/1/001523.jpg', NULL),
(84, 'Kendra', 'Franklin', 'Kendra@gmail.com', 'Kendra33', 'https://ozgrozer.github.io/100k-faces/0/8/008464.jpg', NULL),
(85, 'Carl', 'Payne', 'Carl@gmail.com', 'Carl33', 'https://ozgrozer.github.io/100k-faces/0/1/001203.jpg', NULL),
(86, 'Debbie', 'Maker', 'Debbie@gmail.com', 'Debbie33', 'https://ozgrozer.github.io/100k-faces/0/8/008328.jpg', NULL),
(87, 'Marlene', 'Fraser', 'Marlene@gmail.com', 'Marlene33', 'https://ozgrozer.github.io/100k-faces/0/8/008326.jpg', NULL),
(88, 'David', 'Vandergriff', 'David@gmail.com', 'David33', 'https://ozgrozer.github.io/100k-faces/0/1/001202.jpg', NULL),
(89, 'Clarence', 'Deleon', 'Clarence@gmail.com', 'Clarence33', 'https://ozgrozer.github.io/100k-faces/0/4/004590.jpg', NULL),
(90, 'Donald', 'Diaz', 'Donald72363@gmail.com', 'Donald33', 'https://ozgrozer.github.io/100k-faces/0/5/005693.jpg', NULL),
(91, 'Judith', 'Kevan', 'Judith@gmail.com', 'Judith33', 'https://ozgrozer.github.io/100k-faces/0/6/006737.jpg', NULL),
(92, 'Elizabeth', 'Morris', 'Elizabeth960@gmail.com', 'Elizabeth33', 'https://ozgrozer.github.io/100k-faces/0/1/001544.jpg', NULL),
(93, 'Larry', 'Kimberlin', 'Larry90085@gmail.com', 'Larry33', 'https://ozgrozer.github.io/100k-faces/0/6/006412.jpg', NULL),
(94, 'Milan', 'Borcherding', 'Milan@gmail.com', 'Milan33', 'https://ozgrozer.github.io/100k-faces/0/9/009352.jpg', NULL),
(95, 'Kim', 'Green', 'Kim@gmail.com', 'Kim33', 'https://ozgrozer.github.io/100k-faces/0/6/006345.jpg', NULL),
(96, 'Sylvester', 'Rupert', 'Sylvester@gmail.com', 'Sylvester33', 'https://ozgrozer.github.io/100k-faces/0/2/002681.jpg', NULL),
(97, 'Pedro', 'Womack', 'Pedro@gmail.com', 'Pedro33', 'https://ozgrozer.github.io/100k-faces/0/2/002957.jpg', NULL),
(98, 'George', 'Eaves', 'George@gmail.com', 'George33', 'https://ozgrozer.github.io/100k-faces/0/4/004881.jpg', NULL),
(99, 'Wanda', 'Saum', 'Wanda@gmail.com', 'Wanda33', 'https://ozgrozer.github.io/100k-faces/0/7/007355.jpg', NULL),
(100, 'Napoleon', 'Loynes', 'Napoleon@gmail.com', 'Napoleon33', 'https://ozgrozer.github.io/100k-faces/0/6/006762.jpg', NULL),
(101, 'Theresa', 'Yang', 'Theresa@gmail.com', 'Theresa33', 'https://ozgrozer.github.io/100k-faces/0/9/009006.jpg', NULL),
(102, 'James', 'Stewart', 'James93724@gmail.com', 'James33', 'https://ozgrozer.github.io/100k-faces/0/1/001159.jpg', NULL),
(103, 'Jefferson', 'Denham', 'Jefferson@gmail.com', 'Jefferson33', 'https://ozgrozer.github.io/100k-faces/0/6/006356.jpg', NULL),
(104, 'Kristin', 'Smith', 'Kristin@gmail.com', 'Kristin33', 'https://ozgrozer.github.io/100k-faces/0/4/004764.jpg', NULL),
(105, 'Nancy', 'Bonanno', 'Nancy@gmail.com', 'Nancy33', 'https://ozgrozer.github.io/100k-faces/0/3/003387.jpg', NULL),
(106, 'Steven', 'Blackwell', 'Steven@gmail.com', 'Steven33', 'https://ozgrozer.github.io/100k-faces/0/4/004759.jpg', NULL),
(107, 'Linda', 'Hendren', 'Linda@gmail.com', 'Linda33', 'https://ozgrozer.github.io/100k-faces/0/8/008696.jpg', NULL),
(108, 'Zachary', 'Steinberg', 'Zachary@gmail.com', 'Zachary33', 'https://ozgrozer.github.io/100k-faces/0/4/004312.jpg', NULL),
(109, 'Jeffrey', 'Nichols', 'Jeffrey@gmail.com', 'Jeffrey33', 'https://ozgrozer.github.io/100k-faces/0/9/009080.jpg', NULL),
(110, 'Angelique', 'Esterbrook', 'Angelique@gmail.com', 'Angelique33', 'https://ozgrozer.github.io/100k-faces/0/2/002072.jpg', NULL),
(111, 'Lorraine', 'Godwin', 'Lorraine@gmail.com', 'Lorraine33', 'https://ozgrozer.github.io/100k-faces/0/9/009801.jpg', NULL),
(112, 'Stella', 'Herrera', 'Stella@gmail.com', 'Stella33', 'https://ozgrozer.github.io/100k-faces/0/2/002984.jpg', NULL),
(113, 'Effie', 'Heyer', 'Effie@gmail.com', 'Effie33', 'https://ozgrozer.github.io/100k-faces/0/2/002367.jpg', NULL),
(114, 'Janice', 'Wellman', 'Janice@gmail.com', 'Janice33', 'https://ozgrozer.github.io/100k-faces/0/4/004239.jpg', NULL),
(115, 'Roberto', 'Nicholls', 'Roberto@gmail.com', 'Roberto33', 'https://ozgrozer.github.io/100k-faces/0/2/002770.jpg', NULL),
(116, 'Darline', 'Bush', 'Darline@gmail.com', 'Darline33', 'https://ozgrozer.github.io/100k-faces/0/0/000925.jpg', NULL),
(117, 'James', 'Wilson', 'James41207@gmail.com', 'James33', 'https://ozgrozer.github.io/100k-faces/0/4/004950.jpg', NULL),
(118, 'Dora', 'Macdonald', 'Dora@gmail.com', 'Dora33', 'https://ozgrozer.github.io/100k-faces/0/1/001598.jpg', NULL),
(119, 'Mary', 'Johnson', 'Mary91780@gmail.com', 'Mary33', 'https://ozgrozer.github.io/100k-faces/0/1/001577.jpg', NULL),
(120, 'Benjamin', 'Greene', 'Benjamin@gmail.com', 'Benjamin33', 'https://ozgrozer.github.io/100k-faces/0/3/003205.jpg', NULL),
(121, 'Barbara', 'Kennett', 'Barbara76322@gmail.com', 'Barbara33', 'https://ozgrozer.github.io/100k-faces/0/8/008013.jpg', NULL),
(122, 'Christopher', 'Belk', 'Christopher@gmail.com', 'Christopher33', 'https://ozgrozer.github.io/100k-faces/0/5/005962.jpg', NULL),
(123, 'Ryan', 'Angulo', 'Ryan97624@gmail.com', 'Ryan33', 'https://ozgrozer.github.io/100k-faces/0/1/001556.jpg', NULL),
(124, 'Ronald', 'Bollman', 'Ronald@gmail.com', 'Ronald33', 'https://ozgrozer.github.io/100k-faces/0/9/009736.jpg', NULL),
(125, 'David', 'Ruppert', 'David56864@gmail.com', 'David33', 'https://ozgrozer.github.io/100k-faces/0/5/005283.jpg', NULL),
(126, 'James', 'Cole', 'James46366@gmail.com', 'James33', 'https://ozgrozer.github.io/100k-faces/0/3/003149.jpg', NULL),
(127, 'Robert', 'Alexander', 'Robert23100@gmail.com', 'Robert33', 'https://ozgrozer.github.io/100k-faces/0/5/005192.jpg', NULL),
(128, 'Brandon', 'Walker', 'Brandon@gmail.com', 'Brandon33', 'https://ozgrozer.github.io/100k-faces/0/0/000425.jpg', NULL),
(129, 'Thomas', 'Morrell', 'Thomas@gmail.com', 'Thomas33', 'https://ozgrozer.github.io/100k-faces/0/4/004387.jpg', NULL),
(130, 'Herbert', 'Flores', 'Herbert@gmail.com', 'Herbert33', 'https://ozgrozer.github.io/100k-faces/0/3/003005.jpg', NULL),
(131, 'Sidney', 'Potter', 'Sidney@gmail.com', 'Sidney33', 'https://ozgrozer.github.io/100k-faces/0/2/002308.jpg', NULL),
(132, 'Caroline', 'Jackson', 'Caroline@gmail.com', 'Caroline33', 'https://ozgrozer.github.io/100k-faces/0/9/009987.jpg', NULL),
(133, 'Katherine', 'Musick', 'Katherine@gmail.com', 'Katherine33', 'https://ozgrozer.github.io/100k-faces/0/7/007620.jpg', NULL),
(134, 'John', 'Bailey', 'John@gmail.com', 'John33', 'https://ozgrozer.github.io/100k-faces/0/7/007245.jpg', NULL),
(135, 'Stacy', 'Jackson', 'Stacy@gmail.com', 'Stacy33', 'https://ozgrozer.github.io/100k-faces/0/7/007262.jpg', NULL),
(136, 'William', 'Estrada', 'William91316@gmail.com', 'William33', 'https://ozgrozer.github.io/100k-faces/0/0/000030.jpg', NULL),
(137, 'Cecilia', 'Sanfilippo', 'Cecilia@gmail.com', 'Cecilia33', 'https://ozgrozer.github.io/100k-faces/0/2/002854.jpg', NULL),
(138, 'Robert', 'Roach', 'Robert19622@gmail.com', 'Robert33', 'https://ozgrozer.github.io/100k-faces/0/5/005791.jpg', NULL),
(139, 'Hiram', 'Jodha', 'Hiram@gmail.com', 'Hiram33', 'https://ozgrozer.github.io/100k-faces/0/2/002426.jpg', NULL),
(140, 'Annabel', 'Lopez', 'Annabel@gmail.com', 'Annabel33', 'https://ozgrozer.github.io/100k-faces/0/9/009572.jpg', NULL),
(141, 'Daniel', 'Mccraw', 'Daniel57703@gmail.com', 'Daniel33', 'https://ozgrozer.github.io/100k-faces/0/4/004654.jpg', NULL),
(142, 'Toni', 'Campbell', 'Toni@gmail.com', 'Toni33', 'https://ozgrozer.github.io/100k-faces/0/8/008757.jpg', NULL),
(143, 'Christopher', 'Adams', 'Christopher55539@gmail.com', 'Christopher33', 'https://ozgrozer.github.io/100k-faces/0/5/005798.jpg', NULL),
(144, 'Carol', 'Osburn', 'Carol@gmail.com', 'Carol33', 'https://ozgrozer.github.io/100k-faces/0/8/008334.jpg', NULL),
(145, 'Lionel', 'Clay', 'Lionel@gmail.com', 'Lionel33', 'https://ozgrozer.github.io/100k-faces/0/8/008041.jpg', NULL),
(146, 'Michael', 'Gralak', 'Michael60618@gmail.com', 'Michael33', 'https://ozgrozer.github.io/100k-faces/0/2/002002.jpg', NULL),
(147, 'Jerry', 'Smith', 'Jerry@gmail.com', 'Jerry33', 'https://ozgrozer.github.io/100k-faces/0/6/006706.jpg', NULL),
(148, 'Florence', 'Broyles', 'Florence@gmail.com', 'Florence33', 'https://ozgrozer.github.io/100k-faces/0/7/007344.jpg', NULL),
(149, 'Gloria', 'Needham', 'Gloria@gmail.com', 'Gloria33', 'https://ozgrozer.github.io/100k-faces/0/8/008478.jpg', NULL),
(150, 'Amanda', 'Kiffer', 'Amanda@gmail.com', 'Amanda33', 'https://ozgrozer.github.io/100k-faces/0/5/005852.jpg', NULL),
(151, 'Peter', 'Farrell', 'Peter@gmail.com', 'Peter33', 'https://ozgrozer.github.io/100k-faces/0/9/009072.jpg', NULL),
(152, 'Darrell', 'Maynard', 'Darrell@gmail.com', 'Darrell33', 'https://ozgrozer.github.io/100k-faces/0/8/008314.jpg', NULL),
(153, 'Cheryl', 'Jara', 'Cheryl@gmail.com', 'Cheryl33', 'https://ozgrozer.github.io/100k-faces/0/7/007579.jpg', NULL),
(154, 'Alyssa', 'Folk', 'Alyssa@gmail.com', 'Alyssa33', 'https://ozgrozer.github.io/100k-faces/0/1/001529.jpg', NULL),
(155, 'Janine', 'Snyder', 'Janine@gmail.com', 'Janine33', 'https://ozgrozer.github.io/100k-faces/0/6/006150.jpg', NULL),
(156, 'Frank', 'Weiss', 'Frank22189@gmail.com', 'Frank33', 'https://ozgrozer.github.io/100k-faces/0/1/001912.jpg', NULL),
(157, 'Florentino', 'Mendez', 'Florentino@gmail.com', 'Florentino33', 'https://ozgrozer.github.io/100k-faces/0/3/003037.jpg', NULL),
(158, 'Eunice', 'Herrara', 'Eunice@gmail.com', 'Eunice33', 'https://ozgrozer.github.io/100k-faces/0/2/002555.jpg', NULL),
(159, 'Thaddeus', 'Landes', 'Thaddeus@gmail.com', 'Thaddeus33', 'https://ozgrozer.github.io/100k-faces/0/2/002983.jpg', NULL),
(160, 'Sharron', 'Parks', 'Sharron@gmail.com', 'Sharron33', 'https://ozgrozer.github.io/100k-faces/0/9/009328.jpg', NULL),
(161, 'Birdie', 'Case', 'Birdie@gmail.com', 'Birdie33', 'https://ozgrozer.github.io/100k-faces/0/8/008254.jpg', NULL),
(162, 'Pamella', 'Lockhart', 'Pamella@gmail.com', 'Pamella33', 'https://ozgrozer.github.io/100k-faces/0/8/008482.jpg', NULL),
(163, 'Cornelius', 'Glassman', 'Cornelius@gmail.com', 'Cornelius33', 'https://ozgrozer.github.io/100k-faces/0/6/006894.jpg', NULL),
(164, 'Timothy', 'Sharp', 'Timothy12857@gmail.com', 'Timothy33', 'https://ozgrozer.github.io/100k-faces/0/6/006671.jpg', NULL),
(165, 'George', 'Figueroa', 'George31668@gmail.com', 'George33', 'https://ozgrozer.github.io/100k-faces/0/1/001082.jpg', NULL),
(166, 'Kenneth', 'Currie', 'Kenneth@gmail.com', 'Kenneth33', 'https://ozgrozer.github.io/100k-faces/0/0/000224.jpg', NULL),
(167, 'Helen', 'Nickel', 'Helen@gmail.com', 'Helen33', 'https://ozgrozer.github.io/100k-faces/0/6/006416.jpg', NULL),
(168, 'Joy', 'Stigall', 'Joy21360@gmail.com', 'Joy33', 'https://ozgrozer.github.io/100k-faces/0/0/000888.jpg', NULL),
(169, 'Margaret', 'Turner', 'Margaret@gmail.com', 'Margaret33', 'https://ozgrozer.github.io/100k-faces/0/1/001789.jpg', NULL),
(170, 'Jesse', 'Cook', 'Jesse@gmail.com', 'Jesse33', 'https://ozgrozer.github.io/100k-faces/0/7/007301.jpg', NULL),
(171, 'Gene', 'Garica', 'Gene@gmail.com', 'Gene33', 'https://ozgrozer.github.io/100k-faces/0/6/006143.jpg', NULL),
(172, 'Christopher', 'Henry', 'Christopher99615@gmail.com', 'Christopher33', 'https://ozgrozer.github.io/100k-faces/0/6/006099.jpg', NULL),
(173, 'John', 'Spriggs', 'John71423@gmail.com', 'John33', 'https://ozgrozer.github.io/100k-faces/0/3/003845.jpg', NULL),
(174, 'Jeremiah', 'Messier', 'Jeremiah@gmail.com', 'Jeremiah33', 'https://ozgrozer.github.io/100k-faces/0/2/002369.jpg', NULL),
(175, 'Garry', 'Harris', 'Garry@gmail.com', 'Garry33', 'https://ozgrozer.github.io/100k-faces/0/6/006136.jpg', NULL),
(176, 'Lillian', 'Ferguson', 'Lillian96373@gmail.com', 'Lillian33', 'https://ozgrozer.github.io/100k-faces/0/3/003307.jpg', NULL),
(177, 'Mary', 'Macias', 'Mary25686@gmail.com', 'Mary33', 'https://ozgrozer.github.io/100k-faces/0/3/003508.jpg', NULL),
(178, 'April', 'Gonzales', 'April@gmail.com', 'April33', 'https://ozgrozer.github.io/100k-faces/0/4/004656.jpg', NULL),
(179, 'Ernestine', 'Kranz', 'Ernestine@gmail.com', 'Ernestine33', 'https://ozgrozer.github.io/100k-faces/0/2/002951.jpg', NULL),
(180, 'Dorothy', 'Thibadeau', 'Dorothy@gmail.com', 'Dorothy33', 'https://ozgrozer.github.io/100k-faces/0/8/008903.jpg', NULL),
(181, 'Richard', 'Lane', 'Richard87078@gmail.com', 'Richard33', 'https://ozgrozer.github.io/100k-faces/0/1/001712.jpg', NULL),
(182, 'Edward', 'Roberson', 'Edward@gmail.com', 'Edward33', 'https://ozgrozer.github.io/100k-faces/0/3/003158.jpg', NULL),
(183, 'Ramiro', 'Hultgren', 'Ramiro@gmail.com', 'Ramiro33', 'https://ozgrozer.github.io/100k-faces/0/4/004912.jpg', NULL),
(184, 'Robin', 'Groves', 'Robin@gmail.com', 'Robin33', 'https://ozgrozer.github.io/100k-faces/0/3/003395.jpg', NULL),
(185, 'Alice', 'Anderson', 'Alice15686@gmail.com', 'Alice33', 'https://ozgrozer.github.io/100k-faces/0/4/004038.jpg', NULL),
(186, 'Harold', 'Dunn', 'Harold@gmail.com', 'Harold33', 'https://ozgrozer.github.io/100k-faces/0/7/007851.jpg', NULL),
(187, 'Dora', 'Suarez', 'Dora78898@gmail.com', 'Dora33', 'https://ozgrozer.github.io/100k-faces/0/0/000777.jpg', NULL),
(188, 'Charles', 'Cagle', 'Charles@gmail.com', 'Charles33', 'https://ozgrozer.github.io/100k-faces/0/2/002313.jpg', NULL),
(189, 'Noel', 'Mathis', 'Noel@gmail.com', 'Noel33', 'https://ozgrozer.github.io/100k-faces/0/7/007629.jpg', NULL),
(190, 'Terry', 'Hudson', 'Terry@gmail.com', 'Terry33', 'https://ozgrozer.github.io/100k-faces/0/5/005142.jpg', NULL),
(191, 'Angela', 'Meador', 'Angela@gmail.com', 'Angela33', 'https://ozgrozer.github.io/100k-faces/0/8/008147.jpg', NULL),
(192, 'Elizabeth', 'Qualls', 'Elizabeth94961@gmail.com', 'Elizabeth33', 'https://ozgrozer.github.io/100k-faces/0/3/003584.jpg', NULL),
(193, 'Ramiro', 'Goe', 'Ramiro31556@gmail.com', 'Ramiro33', 'https://ozgrozer.github.io/100k-faces/0/7/007089.jpg', NULL),
(194, 'Marta', 'Henderson', 'Marta@gmail.com', 'Marta33', 'https://ozgrozer.github.io/100k-faces/0/9/009857.jpg', NULL),
(195, 'Leona', 'Tucker', 'Leona@gmail.com', 'Leona33', 'https://ozgrozer.github.io/100k-faces/0/3/003976.jpg', NULL),
(196, 'Faith', 'Daniel', 'Faith@gmail.com', 'Faith33', 'https://ozgrozer.github.io/100k-faces/0/3/003885.jpg', NULL),
(197, 'Mary', 'Huff', 'Mary34729@gmail.com', 'Mary33', 'https://ozgrozer.github.io/100k-faces/0/5/005785.jpg', NULL),
(198, 'Helen', 'Sturgeon', 'Helen26936@gmail.com', 'Helen33', 'https://ozgrozer.github.io/100k-faces/0/0/000116.jpg', NULL),
(199, 'Angela', 'Spada', 'Angela38590@gmail.com', 'Angela33', 'https://ozgrozer.github.io/100k-faces/0/5/005556.jpg', NULL),
(200, 'Raymond', 'Scott', 'Raymond@gmail.com', 'Raymond33', 'https://ozgrozer.github.io/100k-faces/0/0/000072.jpg', NULL),
(201, 'Linda', 'Loucks', 'Linda220@gmail.com', 'Linda33', 'https://ozgrozer.github.io/100k-faces/0/9/009960.jpg', NULL),
(202, 'Pamela', 'Brown', 'Pamela13217@gmail.com', 'Pamela33', 'https://ozgrozer.github.io/100k-faces/0/2/002447.jpg', NULL),
(203, 'Richard', 'Mueller', 'Richard94037@gmail.com', 'Richard33', 'https://ozgrozer.github.io/100k-faces/0/3/003578.jpg', NULL),
(204, 'Grace', 'Sanders', 'Grace@gmail.com', 'Grace33', 'https://ozgrozer.github.io/100k-faces/0/0/000672.jpg', NULL),
(205, 'Michael', 'Crook', 'Michael85035@gmail.com', 'Michael33', 'https://ozgrozer.github.io/100k-faces/0/2/002755.jpg', NULL),
(206, 'John', 'Navarez', 'John1991@gmail.com', 'John33', 'https://ozgrozer.github.io/100k-faces/0/3/003168.jpg', NULL),
(207, 'Julia', 'Shirley', 'Julia@gmail.com', 'Julia33', 'https://ozgrozer.github.io/100k-faces/0/6/006878.jpg', NULL),
(208, 'Zachary', 'Ragin', 'Zachary50538@gmail.com', 'Zachary33', 'https://ozgrozer.github.io/100k-faces/0/7/007215.jpg', NULL),
(209, 'Rodney', 'Mitchell', 'Rodney@gmail.com', 'Rodney33', 'https://ozgrozer.github.io/100k-faces/0/9/009052.jpg', NULL),
(210, 'Patricia', 'Freeman', 'Patricia@gmail.com', 'Patricia33', 'https://ozgrozer.github.io/100k-faces/0/5/005871.jpg', NULL),
(211, 'Mable', 'Marez', 'Mable@gmail.com', 'Mable33', 'https://ozgrozer.github.io/100k-faces/0/3/003258.jpg', NULL),
(212, 'Ken', 'Mccutchan', 'Ken@gmail.com', 'Ken33', 'https://ozgrozer.github.io/100k-faces/0/7/007720.jpg', NULL),
(213, 'Danilo', 'Reiners', 'Danilo@gmail.com', 'Danilo33', 'https://ozgrozer.github.io/100k-faces/0/7/007315.jpg', NULL),
(214, 'Despina', 'Burr', 'Despina@gmail.com', 'Despina33', 'https://ozgrozer.github.io/100k-faces/0/4/004838.jpg', NULL),
(215, 'Marvin', 'Soto', 'Marvin@gmail.com', 'Marvin33', 'https://ozgrozer.github.io/100k-faces/0/5/005411.jpg', NULL),
(216, 'Jeffrey', 'Hayes', 'Jeffrey98559@gmail.com', 'Jeffrey33', 'https://ozgrozer.github.io/100k-faces/0/5/005764.jpg', NULL),
(217, 'Kerry', 'Worthy', 'Kerry@gmail.com', 'Kerry33', 'https://ozgrozer.github.io/100k-faces/0/2/002780.jpg', NULL),
(218, 'Pearl', 'Goodman', 'Pearl@gmail.com', 'Pearl33', 'https://ozgrozer.github.io/100k-faces/0/3/003138.jpg', NULL),
(219, 'Robert', 'Manzano', 'Robert40800@gmail.com', 'Robert33', 'https://ozgrozer.github.io/100k-faces/0/1/001286.jpg', NULL),
(220, 'Shirley', 'Digangi', 'Shirley15562@gmail.com', 'Shirley33', 'https://ozgrozer.github.io/100k-faces/0/9/009949.jpg', NULL),
(221, 'Angla', 'Rivera', 'Angla@gmail.com', 'Angla33', 'https://ozgrozer.github.io/100k-faces/0/0/000519.jpg', NULL),
(222, 'Enrique', 'Glover', 'Enrique@gmail.com', 'Enrique33', 'https://ozgrozer.github.io/100k-faces/0/9/009159.jpg', NULL),
(223, 'Natalie', 'Berner', 'Natalie@gmail.com', 'Natalie33', 'https://ozgrozer.github.io/100k-faces/0/4/004749.jpg', NULL),
(224, 'Myron', 'Doty', 'Myron@gmail.com', 'Myron33', 'https://ozgrozer.github.io/100k-faces/0/6/006629.jpg', NULL),
(225, 'April', 'Mcgough', 'April67619@gmail.com', 'April33', 'https://ozgrozer.github.io/100k-faces/0/8/008137.jpg', NULL),
(226, 'John', 'Pullins', 'John85115@gmail.com', 'John33', 'https://ozgrozer.github.io/100k-faces/0/0/000057.jpg', NULL),
(227, 'Horace', 'Matson', 'Horace@gmail.com', 'Horace33', 'https://ozgrozer.github.io/100k-faces/0/4/004726.jpg', NULL),
(228, 'Doug', 'Alexander', 'Doug5439@gmail.com', 'Doug33', 'https://ozgrozer.github.io/100k-faces/0/8/008808.jpg', NULL),
(229, 'Paul', 'Alexander', 'Paul@gmail.com', 'Paul33', 'https://ozgrozer.github.io/100k-faces/0/5/005950.jpg', NULL),
(230, 'Sarah', 'Coles', 'Sarah97975@gmail.com', 'Sarah33', 'https://ozgrozer.github.io/100k-faces/0/0/000758.jpg', NULL),
(231, 'Albert', 'Sickles', 'Albert@gmail.com', 'Albert33', 'https://ozgrozer.github.io/100k-faces/0/0/000163.jpg', NULL),
(232, 'Justin', 'Richard', 'Justin@gmail.com', 'Justin33', 'https://ozgrozer.github.io/100k-faces/0/6/006445.jpg', NULL),
(233, 'Bridget', 'Young', 'Bridget@gmail.com', 'Bridget33', 'https://ozgrozer.github.io/100k-faces/0/9/009135.jpg', NULL),
(234, 'Charles', 'Mason', 'Charles31818@gmail.com', 'Charles33', 'https://ozgrozer.github.io/100k-faces/0/8/008439.jpg', NULL),
(235, 'Anthony', 'Cass', 'Anthony7058@gmail.com', 'Anthony33', 'https://ozgrozer.github.io/100k-faces/0/6/006436.jpg', NULL),
(236, 'Jason', 'Mabrey', 'Jason33476@gmail.com', 'Jason33', 'https://ozgrozer.github.io/100k-faces/0/5/005047.jpg', NULL),
(237, 'Marcia', 'Thomas', 'Marcia@gmail.com', 'Marcia33', 'https://ozgrozer.github.io/100k-faces/0/1/001189.jpg', NULL),
(238, 'Sandra', 'Nease', 'Sandra@gmail.com', 'Sandra33', 'https://ozgrozer.github.io/100k-faces/0/3/003885.jpg', NULL),
(239, 'Walter', 'Johnson', 'Walter57373@gmail.com', 'Walter33', 'https://ozgrozer.github.io/100k-faces/0/7/007850.jpg', NULL),
(240, 'Drew', 'Perales', 'Drew@gmail.com', 'Drew33', 'https://ozgrozer.github.io/100k-faces/0/9/009173.jpg', NULL),
(241, 'Elizabeth', 'Scoggins', 'Elizabeth73683@gmail.com', 'Elizabeth33', 'https://ozgrozer.github.io/100k-faces/0/7/007820.jpg', NULL),
(242, 'Robert', 'Lamere', 'Robert21199@gmail.com', 'Robert33', 'https://ozgrozer.github.io/100k-faces/0/3/003897.jpg', NULL),
(243, 'Sandra', 'Buntrock', 'Sandra80460@gmail.com', 'Sandra33', 'https://ozgrozer.github.io/100k-faces/0/8/008840.jpg', NULL),
(244, 'Clint', 'Izquierdo', 'Clint@gmail.com', 'Clint33', 'https://ozgrozer.github.io/100k-faces/0/8/008664.jpg', NULL),
(245, 'Cameron', 'Lowry', 'Cameron@gmail.com', 'Cameron33', 'https://ozgrozer.github.io/100k-faces/0/9/009125.jpg', NULL),
(246, 'Nathalie', 'Mccleary', 'Nathalie@gmail.com', 'Nathalie33', 'https://ozgrozer.github.io/100k-faces/0/4/004023.jpg', NULL),
(247, 'Craig', 'Joyner', 'Craig@gmail.com', 'Craig33', 'https://ozgrozer.github.io/100k-faces/0/7/007782.jpg', NULL),
(248, 'Claire', 'Tecuanhuey', 'Claire@gmail.com', 'Claire33', 'https://ozgrozer.github.io/100k-faces/0/3/003851.jpg', NULL),
(249, 'Rose', 'Hentges', 'Rose@gmail.com', 'Rose33', 'https://ozgrozer.github.io/100k-faces/0/9/009139.jpg', NULL),
(250, 'Edward', 'Worrell', 'Edward29466@gmail.com', 'Edward33', 'https://ozgrozer.github.io/100k-faces/0/7/007297.jpg', NULL),
(251, 'Elizabeth', 'Johnson', 'Elizabeth61719@gmail.com', 'Elizabeth33', 'https://ozgrozer.github.io/100k-faces/0/9/009267.jpg', NULL),
(252, 'Michele', 'Cohen', 'Michele@gmail.com', 'Michele33', 'https://ozgrozer.github.io/100k-faces/0/3/003455.jpg', NULL),
(253, 'James', 'Watson', 'James85609@gmail.com', 'James33', 'https://ozgrozer.github.io/100k-faces/0/3/003941.jpg', NULL),
(254, 'Doris', 'Mazzocco', 'Doris@gmail.com', 'Doris33', 'https://ozgrozer.github.io/100k-faces/0/3/003054.jpg', NULL),
(255, 'Christopher', 'James', 'Christopher82673@gmail.com', 'Christopher33', 'https://ozgrozer.github.io/100k-faces/0/8/008890.jpg', NULL),
(256, 'Heather', 'Solarz', 'Heather@gmail.com', 'Heather33', 'https://ozgrozer.github.io/100k-faces/0/0/000425.jpg', NULL),
(257, 'Teresa', 'Flickner', 'Teresa821@gmail.com', 'Teresa33', 'https://ozgrozer.github.io/100k-faces/0/1/001452.jpg', NULL),
(258, 'Polly', 'Cabral', 'Polly@gmail.com', 'Polly33', 'https://ozgrozer.github.io/100k-faces/0/6/006474.jpg', NULL),
(259, 'Roxie', 'Rains', 'Roxie@gmail.com', 'Roxie33', 'https://ozgrozer.github.io/100k-faces/0/3/003813.jpg', NULL),
(260, 'Stuart', 'Hensley', 'Stuart@gmail.com', 'Stuart33', 'https://ozgrozer.github.io/100k-faces/0/2/002796.jpg', NULL),
(261, 'Elsie', 'Wilmore', 'Elsie@gmail.com', 'Elsie33', 'https://ozgrozer.github.io/100k-faces/0/8/008434.jpg', NULL),
(262, 'Bertha', 'Butler', 'Bertha@gmail.com', 'Bertha33', 'https://ozgrozer.github.io/100k-faces/0/5/005131.jpg', NULL),
(263, 'Joanna', 'Thomas', 'Joanna@gmail.com', 'Joanna33', 'https://ozgrozer.github.io/100k-faces/0/5/005206.jpg', NULL),
(264, 'Mary', 'Stickland', 'Mary29526@gmail.com', 'Mary33', 'https://ozgrozer.github.io/100k-faces/0/9/009444.jpg', NULL),
(265, 'James', 'Curbelo', 'James44584@gmail.com', 'James33', 'https://ozgrozer.github.io/100k-faces/0/7/007188.jpg', NULL),
(266, 'Brian', 'Vath', 'Brian@gmail.com', 'Brian33', 'https://ozgrozer.github.io/100k-faces/0/2/002569.jpg', NULL),
(267, 'Miguel', 'Indermuehle', 'Miguel@gmail.com', 'Miguel33', 'https://ozgrozer.github.io/100k-faces/0/8/008347.jpg', NULL),
(268, 'Lynne', 'Conner', 'Lynne@gmail.com', 'Lynne33', 'https://ozgrozer.github.io/100k-faces/0/2/002068.jpg', NULL),
(269, 'Dale', 'Schroeder', 'Dale@gmail.com', 'Dale33', 'https://ozgrozer.github.io/100k-faces/0/7/007158.jpg', NULL),
(270, 'William', 'Holland', 'William84339@gmail.com', 'William33', 'https://ozgrozer.github.io/100k-faces/0/2/002561.jpg', NULL),
(271, 'Betty', 'White', 'Betty@gmail.com', 'Betty33', 'https://ozgrozer.github.io/100k-faces/0/2/002661.jpg', NULL),
(272, 'Maria', 'Cygan', 'Maria4019@gmail.com', 'Maria33', 'https://ozgrozer.github.io/100k-faces/0/3/003740.jpg', NULL),
(273, 'Karole', 'Jacques', 'Karole@gmail.com', 'Karole33', 'https://ozgrozer.github.io/100k-faces/0/2/002213.jpg', NULL),
(274, 'Michael', 'Johnson', 'Michael76290@gmail.com', 'Michael33', 'https://ozgrozer.github.io/100k-faces/0/5/005521.jpg', NULL),
(275, 'Ronald', 'Wren', 'Ronald64095@gmail.com', 'Ronald33', 'https://ozgrozer.github.io/100k-faces/0/9/009676.jpg', NULL),
(276, 'Ronald', 'Clark', 'Ronald72206@gmail.com', 'Ronald33', 'https://ozgrozer.github.io/100k-faces/0/2/002303.jpg', NULL),
(277, 'Mario', 'James', 'Mario@gmail.com', 'Mario33', 'https://ozgrozer.github.io/100k-faces/0/7/007251.jpg', NULL),
(278, 'Angela', 'Moore', 'Angela62092@gmail.com', 'Angela33', 'https://ozgrozer.github.io/100k-faces/0/5/005168.jpg', NULL),
(279, 'Jose', 'Wong', 'Jose6512@gmail.com', 'Jose33', 'https://ozgrozer.github.io/100k-faces/0/2/002829.jpg', NULL),
(280, 'Kim', 'Ward', 'Kim4194@gmail.com', 'Kim33', 'https://ozgrozer.github.io/100k-faces/0/6/006500.jpg', NULL),
(281, 'Keith', 'Bynum', 'Keith@gmail.com', 'Keith33', 'https://ozgrozer.github.io/100k-faces/0/9/009563.jpg', NULL),
(282, 'Mary', 'Chittum', 'Mary29619@gmail.com', 'Mary33', 'https://ozgrozer.github.io/100k-faces/0/6/006495.jpg', NULL),
(283, 'Joseph', 'Jack', 'Joseph@gmail.com', 'Joseph33', 'https://ozgrozer.github.io/100k-faces/0/8/008065.jpg', NULL),
(284, 'David', 'William', 'David30228@gmail.com', 'David33', 'https://ozgrozer.github.io/100k-faces/0/4/004293.jpg', NULL),
(285, 'Candy', 'Caldwell', 'Candy@gmail.com', 'Candy33', 'https://ozgrozer.github.io/100k-faces/0/7/007144.jpg', NULL),
(286, 'Josh', 'Nuzum', 'Josh@gmail.com', 'Josh33', 'https://ozgrozer.github.io/100k-faces/0/6/006036.jpg', NULL),
(287, 'Sherry', 'Hanna', 'Sherry@gmail.com', 'Sherry33', 'https://ozgrozer.github.io/100k-faces/0/4/004486.jpg', NULL),
(288, 'Helen', 'Fray', 'Helen54914@gmail.com', 'Helen33', 'https://ozgrozer.github.io/100k-faces/0/0/000133.jpg', NULL),
(289, 'Nichole', 'Roberts', 'Nichole@gmail.com', 'Nichole33', 'https://ozgrozer.github.io/100k-faces/0/7/007904.jpg', NULL),
(290, 'Samuel', 'Green', 'Samuel@gmail.com', 'Samuel33', 'https://ozgrozer.github.io/100k-faces/0/2/002117.jpg', NULL),
(291, 'Beatrice', 'Chafin', 'Beatrice@gmail.com', 'Beatrice33', 'https://ozgrozer.github.io/100k-faces/0/1/001914.jpg', NULL),
(292, 'Lori', 'Correa', 'Lori@gmail.com', 'Lori33', 'https://ozgrozer.github.io/100k-faces/0/3/003010.jpg', NULL),
(293, 'Brenda', 'Mallon', 'Brenda@gmail.com', 'Brenda33', 'https://ozgrozer.github.io/100k-faces/0/6/006167.jpg', NULL),
(294, 'Mark', 'Bradley', 'Mark@gmail.com', 'Mark33', 'https://ozgrozer.github.io/100k-faces/0/9/009705.jpg', NULL),
(295, 'Sharon', 'Sanchez', 'Sharon@gmail.com', 'Sharon33', 'https://ozgrozer.github.io/100k-faces/0/8/008006.jpg', NULL),
(296, 'Kathie', 'Ford', 'Kathie@gmail.com', 'Kathie33', 'https://ozgrozer.github.io/100k-faces/0/9/009341.jpg', NULL),
(297, 'Virginia', 'Conway', 'Virginia@gmail.com', 'Virginia33', 'https://ozgrozer.github.io/100k-faces/0/4/004305.jpg', NULL),
(298, 'Charles', 'Bryan', 'Charles22897@gmail.com', 'Charles33', 'https://ozgrozer.github.io/100k-faces/0/9/009170.jpg', NULL),
(299, 'Maria', 'Comnick', 'Maria27475@gmail.com', 'Maria33', 'https://ozgrozer.github.io/100k-faces/0/9/009083.jpg', NULL),
(300, 'Casey', 'Wood', 'Casey@gmail.com', 'Casey33', 'https://ozgrozer.github.io/100k-faces/0/9/009765.jpg', NULL),
(301, 'Kayla', 'Mitchell', 'Kayla@gmail.com', 'Kayla33', 'https://ozgrozer.github.io/100k-faces/0/3/003060.jpg', NULL),
(302, 'Betty', 'Harris', 'Betty40578@gmail.com', 'Betty33', 'https://ozgrozer.github.io/100k-faces/0/1/001818.jpg', NULL),
(303, 'Angela', 'Sizemore', 'Angela12386@gmail.com', 'Angela33', 'https://ozgrozer.github.io/100k-faces/0/7/007490.jpg', NULL),
(304, 'Mary', 'Coleman', 'Mary63644@gmail.com', 'Mary33', 'https://ozgrozer.github.io/100k-faces/0/0/000134.jpg', NULL),
(305, 'Laura', 'Gutierrez', 'Laura@gmail.com', 'Laura33', 'https://ozgrozer.github.io/100k-faces/0/2/002351.jpg', NULL),
(306, 'Jose', 'Hardter', 'Jose30850@gmail.com', 'Jose33', 'https://ozgrozer.github.io/100k-faces/0/5/005944.jpg', NULL),
(307, 'Victor', 'Mcwhirter', 'Victor@gmail.com', 'Victor33', 'https://ozgrozer.github.io/100k-faces/0/4/004415.jpg', NULL),
(308, 'Eric', 'Rice', 'Eric@gmail.com', 'Eric33', 'https://ozgrozer.github.io/100k-faces/0/1/001201.jpg', NULL),
(309, 'Tracey', 'Salvaggio', 'Tracey@gmail.com', 'Tracey33', 'https://ozgrozer.github.io/100k-faces/0/1/001343.jpg', NULL),
(310, 'Albert', 'Snedegar', 'Albert16645@gmail.com', 'Albert33', 'https://ozgrozer.github.io/100k-faces/0/4/004411.jpg', NULL),
(311, 'Jeffrey', 'Baker', 'Jeffrey46099@gmail.com', 'Jeffrey33', 'https://ozgrozer.github.io/100k-faces/0/6/006108.jpg', NULL),
(312, 'Brian', 'Cox', 'Brian64324@gmail.com', 'Brian33', 'https://ozgrozer.github.io/100k-faces/0/4/004024.jpg', NULL),
(313, 'Donald', 'Matthews', 'Donald59724@gmail.com', 'Donald33', 'https://ozgrozer.github.io/100k-faces/0/4/004836.jpg', NULL),
(314, 'Mildred', 'Prince', 'Mildred@gmail.com', 'Mildred33', 'https://ozgrozer.github.io/100k-faces/0/9/009158.jpg', NULL),
(315, 'Doug', 'Griffen', 'Doug23468@gmail.com', 'Doug33', 'https://ozgrozer.github.io/100k-faces/0/1/001491.jpg', NULL),
(316, 'Nickolas', 'Bergeron', 'Nickolas@gmail.com', 'Nickolas33', 'https://ozgrozer.github.io/100k-faces/0/2/002573.jpg', NULL),
(317, 'Jeff', 'Biller', 'Jeff@gmail.com', 'Jeff33', 'https://ozgrozer.github.io/100k-faces/0/0/000735.jpg', NULL),
(318, 'John', 'Jackson', 'John1097@gmail.com', 'John33', 'https://ozgrozer.github.io/100k-faces/0/7/007047.jpg', NULL),
(319, 'Daniel', 'Sanchez', 'Daniel85099@gmail.com', 'Daniel33', 'https://ozgrozer.github.io/100k-faces/0/5/005463.jpg', NULL),
(320, 'Donnie', 'Paull', 'Donnie@gmail.com', 'Donnie33', 'https://ozgrozer.github.io/100k-faces/0/8/008098.jpg', NULL),
(321, 'Stephanie', 'Shinn', 'Stephanie@gmail.com', 'Stephanie33', 'https://ozgrozer.github.io/100k-faces/0/0/000024.jpg', NULL),
(322, 'Loretta', 'Banner', 'Loretta@gmail.com', 'Loretta33', 'https://ozgrozer.github.io/100k-faces/0/4/004635.jpg', NULL),
(323, 'Ruth', 'Haist', 'Ruth@gmail.com', 'Ruth33', 'https://ozgrozer.github.io/100k-faces/0/7/007395.jpg', NULL),
(324, 'Helen', 'Perrine', 'Helen94563@gmail.com', 'Helen33', 'https://ozgrozer.github.io/100k-faces/0/8/008121.jpg', NULL),
(325, 'Vickie', 'Johnson', 'Vickie@gmail.com', 'Vickie33', 'https://ozgrozer.github.io/100k-faces/0/5/005410.jpg', NULL),
(326, 'Christopher', 'Wigley', 'Christopher26999@gmail.com', 'Christopher33', 'https://ozgrozer.github.io/100k-faces/0/3/003691.jpg', NULL),
(327, 'Joe', 'Dulin', 'Joe@gmail.com', 'Joe33', 'https://ozgrozer.github.io/100k-faces/0/5/005240.jpg', NULL),
(328, 'Ellen', 'Ross', 'Ellen@gmail.com', 'Ellen33', 'https://ozgrozer.github.io/100k-faces/0/2/002696.jpg', NULL),
(329, 'Shirley', 'Avila', 'Shirley5895@gmail.com', 'Shirley33', 'https://ozgrozer.github.io/100k-faces/0/8/008635.jpg', NULL),
(330, 'Yuko', 'Becker', 'Yuko@gmail.com', 'Yuko33', 'https://ozgrozer.github.io/100k-faces/0/6/006141.jpg', NULL),
(331, 'Ariana', 'Corbin', 'Ariana@gmail.com', 'Ariana33', 'https://ozgrozer.github.io/100k-faces/0/2/002871.jpg', NULL),
(332, 'Amelia', 'Conley', 'Amelia@gmail.com', 'Amelia33', 'https://ozgrozer.github.io/100k-faces/0/4/004085.jpg', NULL),
(333, 'David', 'Holman', 'David95215@gmail.com', 'David33', 'https://ozgrozer.github.io/100k-faces/0/5/005670.jpg', NULL),
(334, 'William', 'Stahlman', 'William67755@gmail.com', 'William33', 'https://ozgrozer.github.io/100k-faces/0/8/008640.jpg', NULL),
(335, 'Daniel', 'Loveland', 'Daniel85737@gmail.com', 'Daniel33', 'https://ozgrozer.github.io/100k-faces/0/5/005569.jpg', NULL),
(336, 'Carlotta', 'Hayward', 'Carlotta@gmail.com', 'Carlotta33', 'https://ozgrozer.github.io/100k-faces/0/8/008638.jpg', NULL),
(337, 'Robert', 'Rodger', 'Robert24805@gmail.com', 'Robert33', 'https://ozgrozer.github.io/100k-faces/0/0/000143.jpg', NULL),
(338, 'Raquel', 'Petit', 'Raquel@gmail.com', 'Raquel33', 'https://ozgrozer.github.io/100k-faces/0/9/009344.jpg', NULL),
(339, 'Antonetta', 'Barnes', 'Antonetta@gmail.com', 'Antonetta33', 'https://ozgrozer.github.io/100k-faces/0/0/000192.jpg', NULL),
(340, 'Irma', 'Payne', 'Irma@gmail.com', 'Irma33', 'https://ozgrozer.github.io/100k-faces/0/8/008303.jpg', NULL),
(341, 'William', 'Schmalz', 'William9713@gmail.com', 'William33', 'https://ozgrozer.github.io/100k-faces/0/6/006291.jpg', NULL),
(342, 'Brian', 'Gerke', 'Brian10020@gmail.com', 'Brian33', 'https://ozgrozer.github.io/100k-faces/0/3/003687.jpg', NULL),
(343, 'Daniel', 'Fee', 'Daniel83179@gmail.com', 'Daniel33', 'https://ozgrozer.github.io/100k-faces/0/0/000957.jpg', NULL),
(344, 'Casey', 'Land', 'Casey36634@gmail.com', 'Casey33', 'https://ozgrozer.github.io/100k-faces/0/9/009726.jpg', NULL),
(345, 'Betty', 'Woon', 'Betty92004@gmail.com', 'Betty33', 'https://ozgrozer.github.io/100k-faces/0/1/001012.jpg', NULL),
(346, 'Valorie', 'Talamantes', 'Valorie@gmail.com', 'Valorie33', 'https://ozgrozer.github.io/100k-faces/0/1/001796.jpg', NULL),
(347, 'Pat', 'Carrera', 'Pat@gmail.com', 'Pat33', 'https://ozgrozer.github.io/100k-faces/0/4/004234.jpg', NULL),
(348, 'Peter', 'Curtis', 'Peter23146@gmail.com', 'Peter33', 'https://ozgrozer.github.io/100k-faces/0/2/002079.jpg', NULL),
(349, 'Jacinto', 'Tacker', 'Jacinto@gmail.com', 'Jacinto33', 'https://ozgrozer.github.io/100k-faces/0/2/002680.jpg', NULL),
(350, 'Amy', 'Love', 'Amy@gmail.com', 'Amy33', 'https://ozgrozer.github.io/100k-faces/0/9/009482.jpg', NULL),
(351, 'April', 'Chapman', 'April67895@gmail.com', 'April33', 'https://ozgrozer.github.io/100k-faces/0/1/001887.jpg', NULL),
(352, 'Penny', 'Baker', 'Penny@gmail.com', 'Penny33', 'https://ozgrozer.github.io/100k-faces/0/3/003384.jpg', NULL),
(353, 'Jeffrey', 'Spalding', 'Jeffrey93485@gmail.com', 'Jeffrey33', 'https://ozgrozer.github.io/100k-faces/0/5/005176.jpg', NULL),
(354, 'Charles', 'Reyes', 'Charles96292@gmail.com', 'Charles33', 'https://ozgrozer.github.io/100k-faces/0/2/002614.jpg', NULL),
(355, 'Suzanne', 'Plummer', 'Suzanne@gmail.com', 'Suzanne33', 'https://ozgrozer.github.io/100k-faces/0/9/009043.jpg', NULL),
(356, 'Helen', 'Cordell', 'Helen74029@gmail.com', 'Helen33', 'https://ozgrozer.github.io/100k-faces/0/7/007751.jpg', NULL),
(357, 'Rolande', 'Rickard', 'Rolande@gmail.com', 'Rolande33', 'https://ozgrozer.github.io/100k-faces/0/2/002907.jpg', NULL),
(358, 'Bradley', 'Glory', 'Bradley@gmail.com', 'Bradley33', 'https://ozgrozer.github.io/100k-faces/0/1/001920.jpg', NULL),
(359, 'Howard', 'Davenport', 'Howard@gmail.com', 'Howard33', 'https://ozgrozer.github.io/100k-faces/0/8/008530.jpg', NULL),
(360, 'Clarence', 'Denton', 'Clarence70001@gmail.com', 'Clarence33', 'https://ozgrozer.github.io/100k-faces/0/0/000111.jpg', NULL),
(361, 'Garry', 'Mckenzie', 'Garry73431@gmail.com', 'Garry33', 'https://ozgrozer.github.io/100k-faces/0/5/005482.jpg', NULL),
(362, 'Kathy', 'Willson', 'Kathy@gmail.com', 'Kathy33', 'https://ozgrozer.github.io/100k-faces/0/2/002960.jpg', NULL),
(363, 'Donald', 'Lahey', 'Donald17976@gmail.com', 'Donald33', 'https://ozgrozer.github.io/100k-faces/0/7/007537.jpg', NULL),
(364, 'Thomas', 'Mackey', 'Thomas48506@gmail.com', 'Thomas33', 'https://ozgrozer.github.io/100k-faces/0/8/008790.jpg', NULL),
(365, 'Julian', 'Royal', 'Julian@gmail.com', 'Julian33', 'https://ozgrozer.github.io/100k-faces/0/9/009726.jpg', NULL),
(366, 'Jasmin', 'Hall', 'Jasmin@gmail.com', 'Jasmin33', 'https://ozgrozer.github.io/100k-faces/0/2/002826.jpg', NULL),
(367, 'Blanca', 'Frank', 'Blanca@gmail.com', 'Blanca33', 'https://ozgrozer.github.io/100k-faces/0/7/007479.jpg', NULL),
(368, 'Homer', 'Holland', 'Homer@gmail.com', 'Homer33', 'https://ozgrozer.github.io/100k-faces/0/2/002827.jpg', NULL),
(369, 'Ariel', 'Bartolet', 'Ariel@gmail.com', 'Ariel33', 'https://ozgrozer.github.io/100k-faces/0/5/005359.jpg', NULL),
(370, 'Mitchell', 'Paquette', 'Mitchell@gmail.com', 'Mitchell33', 'https://ozgrozer.github.io/100k-faces/0/4/004644.jpg', NULL),
(371, 'Lewis', 'Gomez', 'Lewis@gmail.com', 'Lewis33', 'https://ozgrozer.github.io/100k-faces/0/5/005513.jpg', NULL),
(372, 'Angela', 'Yancey', 'Angela30284@gmail.com', 'Angela33', 'https://ozgrozer.github.io/100k-faces/0/6/006023.jpg', NULL),
(373, 'Rosalyn', 'Lewis', 'Rosalyn@gmail.com', 'Rosalyn33', 'https://ozgrozer.github.io/100k-faces/0/9/009084.jpg', NULL),
(374, 'Rebecca', 'Towne', 'Rebecca92574@gmail.com', 'Rebecca33', 'https://ozgrozer.github.io/100k-faces/0/2/002092.jpg', NULL),
(375, 'Tamara', 'Smith', 'Tamara@gmail.com', 'Tamara33', 'https://ozgrozer.github.io/100k-faces/0/4/004139.jpg', NULL),
(376, 'Carol', 'Ryan', 'Carol57454@gmail.com', 'Carol33', 'https://ozgrozer.github.io/100k-faces/0/6/006339.jpg', NULL),
(377, 'Kerri', 'Vanakin', 'Kerri@gmail.com', 'Kerri33', 'https://ozgrozer.github.io/100k-faces/0/0/000359.jpg', NULL),
(378, 'Anna', 'Ramon', 'Anna65985@gmail.com', 'Anna33', 'https://ozgrozer.github.io/100k-faces/0/9/009220.jpg', NULL),
(379, 'Kelly', 'Spitler', 'Kelly@gmail.com', 'Kelly33', 'https://ozgrozer.github.io/100k-faces/0/7/007374.jpg', NULL),
(380, 'Alfonso', 'Eike', 'Alfonso@gmail.com', 'Alfonso33', 'https://ozgrozer.github.io/100k-faces/0/9/009771.jpg', NULL),
(381, 'Roslyn', 'Williams', 'Roslyn@gmail.com', 'Roslyn33', 'https://ozgrozer.github.io/100k-faces/0/3/003396.jpg', NULL),
(382, 'Sharon', 'Hinds', 'Sharon86073@gmail.com', 'Sharon33', 'https://ozgrozer.github.io/100k-faces/0/2/002255.jpg', NULL),
(383, 'Evangeline', 'Morales', 'Evangeline@gmail.com', 'Evangeline33', 'https://ozgrozer.github.io/100k-faces/0/2/002500.jpg', NULL),
(384, 'James', 'Pickens', 'James20406@gmail.com', 'James33', 'https://ozgrozer.github.io/100k-faces/0/9/009725.jpg', NULL),
(385, 'Daniele', 'Weeks', 'Daniele@gmail.com', 'Daniele33', 'https://ozgrozer.github.io/100k-faces/0/9/009857.jpg', NULL),
(386, 'Gregory', 'Cartwright', 'Gregory@gmail.com', 'Gregory33', 'https://ozgrozer.github.io/100k-faces/0/5/005957.jpg', NULL),
(387, 'Haley', 'Rosado', 'Haley@gmail.com', 'Haley33', 'https://ozgrozer.github.io/100k-faces/0/9/009903.jpg', NULL),
(388, 'Toni', 'Valencia', 'Toni88425@gmail.com', 'Toni33', 'https://ozgrozer.github.io/100k-faces/0/8/008572.jpg', NULL),
(389, 'David', 'Ragland', 'David28677@gmail.com', 'David33', 'https://ozgrozer.github.io/100k-faces/0/2/002667.jpg', NULL),
(390, 'Dale', 'Lapierre', 'Dale41779@gmail.com', 'Dale33', 'https://ozgrozer.github.io/100k-faces/0/4/004199.jpg', NULL),
(391, 'Levi', 'Taylor', 'Levi@gmail.com', 'Levi33', 'https://ozgrozer.github.io/100k-faces/0/8/008242.jpg', NULL),
(392, 'Joseph', 'Leigland', 'Joseph98056@gmail.com', 'Joseph33', 'https://ozgrozer.github.io/100k-faces/0/6/006416.jpg', NULL),
(393, 'Stevie', 'Ho', 'Stevie@gmail.com', 'Stevie33', 'https://ozgrozer.github.io/100k-faces/0/1/001371.jpg', NULL),
(394, 'Dominick', 'Dam', 'Dominick@gmail.com', 'Dominick33', 'https://ozgrozer.github.io/100k-faces/0/4/004406.jpg', NULL),
(395, 'Rosanna', 'Waugh', 'Rosanna@gmail.com', 'Rosanna33', 'https://ozgrozer.github.io/100k-faces/0/4/004089.jpg', NULL),
(396, 'Christopher', 'Henderson', 'Christopher5934@gmail.com', 'Christopher33', 'https://ozgrozer.github.io/100k-faces/0/7/007539.jpg', NULL),
(397, 'Larry', 'Williams', 'Larry27928@gmail.com', 'Larry33', 'https://ozgrozer.github.io/100k-faces/0/1/001783.jpg', NULL),
(398, 'Michael', 'Bacon', 'Michael310@gmail.com', 'Michael33', 'https://ozgrozer.github.io/100k-faces/0/4/004703.jpg', NULL),
(399, 'Joseph', 'Berlinski', 'Joseph91442@gmail.com', 'Joseph33', 'https://ozgrozer.github.io/100k-faces/0/6/006081.jpg', NULL),
(400, 'January', 'Rogers', 'January@gmail.com', 'January33', 'https://ozgrozer.github.io/100k-faces/0/8/008520.jpg', NULL),
(401, 'Vera', 'Seals', 'Vera@gmail.com', 'Vera33', 'https://ozgrozer.github.io/100k-faces/0/3/003796.jpg', NULL),
(402, 'Natasha', 'Pfeffer', 'Natasha@gmail.com', 'Natasha33', 'https://ozgrozer.github.io/100k-faces/0/0/000666.jpg', NULL),
(403, 'Eugene', 'Crawford', 'Eugene@gmail.com', 'Eugene33', 'https://ozgrozer.github.io/100k-faces/0/2/002086.jpg', NULL),
(404, 'Lisa', 'Padgett', 'Lisa@gmail.com', 'Lisa33', 'https://ozgrozer.github.io/100k-faces/0/8/008219.jpg', NULL),
(405, 'David', 'Hotchkiss', 'David57573@gmail.com', 'David33', 'https://ozgrozer.github.io/100k-faces/0/7/007483.jpg', NULL),
(406, 'Calvin', 'Barker', 'Calvin@gmail.com', 'Calvin33', 'https://ozgrozer.github.io/100k-faces/0/2/002455.jpg', NULL),
(407, 'Paul', 'Born', 'Paul12988@gmail.com', 'Paul33', 'https://ozgrozer.github.io/100k-faces/0/2/002036.jpg', NULL),
(408, 'Anne', 'Newkirk', 'Anne@gmail.com', 'Anne33', 'https://ozgrozer.github.io/100k-faces/0/6/006855.jpg', NULL),
(409, 'Josephine', 'Mendez', 'Josephine@gmail.com', 'Josephine33', 'https://ozgrozer.github.io/100k-faces/0/7/007777.jpg', NULL),
(410, 'Richard', 'Laguna', 'Richard79011@gmail.com', 'Richard33', 'https://ozgrozer.github.io/100k-faces/0/8/008159.jpg', NULL),
(411, 'Daniel', 'Stead', 'Daniel69013@gmail.com', 'Daniel33', 'https://ozgrozer.github.io/100k-faces/0/0/000284.jpg', NULL),
(412, 'Sandra', 'Marquez', 'Sandra53194@gmail.com', 'Sandra33', 'https://ozgrozer.github.io/100k-faces/0/4/004724.jpg', NULL),
(413, 'Sarah', 'Mendias', 'Sarah61375@gmail.com', 'Sarah33', 'https://ozgrozer.github.io/100k-faces/0/4/004297.jpg', NULL),
(414, 'James', 'Williams', 'James99788@gmail.com', 'James33', 'https://ozgrozer.github.io/100k-faces/0/5/005558.jpg', NULL),
(415, 'Kayla', 'Cordell', 'Kayla50822@gmail.com', 'Kayla33', 'https://ozgrozer.github.io/100k-faces/0/8/008247.jpg', NULL);
INSERT INTO `test_USER` (`ID_USER`, `FIRSTNAME`, `LASTNAME`, `EMAIL`, `PASSWORD`, `AVATAR`, `TOKEN`) VALUES
(416, 'Jeffery', 'Kittrell', 'Jeffery35299@gmail.com', 'Jeffery33', 'https://ozgrozer.github.io/100k-faces/0/4/004305.jpg', NULL),
(417, 'Hector', 'Brown', 'Hector@gmail.com', 'Hector33', 'https://ozgrozer.github.io/100k-faces/0/9/009050.jpg', NULL),
(418, 'Kenneth', 'Crane', 'Kenneth27583@gmail.com', 'Kenneth33', 'https://ozgrozer.github.io/100k-faces/0/2/002415.jpg', NULL),
(419, 'Esther', 'Sampson', 'Esther@gmail.com', 'Esther33', 'https://ozgrozer.github.io/100k-faces/0/8/008276.jpg', NULL),
(420, 'Eugene', 'Murray', 'Eugene47149@gmail.com', 'Eugene33', 'https://ozgrozer.github.io/100k-faces/0/0/000130.jpg', NULL),
(421, 'Aubrey', 'Higgins', 'Aubrey@gmail.com', 'Aubrey33', 'https://ozgrozer.github.io/100k-faces/0/4/004575.jpg', NULL),
(422, 'Todd', 'Sanchez', 'Todd@gmail.com', 'Todd33', 'https://ozgrozer.github.io/100k-faces/0/6/006053.jpg', NULL),
(423, 'Jessie', 'Massey', 'Jessie@gmail.com', 'Jessie33', 'https://ozgrozer.github.io/100k-faces/0/1/001119.jpg', NULL),
(424, 'Emilia', 'Mccarthy', 'Emilia@gmail.com', 'Emilia33', 'https://ozgrozer.github.io/100k-faces/0/2/002675.jpg', NULL),
(425, 'Nicholas', 'Jones', 'Nicholas@gmail.com', 'Nicholas33', 'https://ozgrozer.github.io/100k-faces/0/7/007497.jpg', NULL),
(426, 'Scott', 'Childress', 'Scott@gmail.com', 'Scott33', 'https://ozgrozer.github.io/100k-faces/0/5/005468.jpg', NULL),
(427, 'Louise', 'Ross', 'Louise@gmail.com', 'Louise33', 'https://ozgrozer.github.io/100k-faces/0/1/001905.jpg', NULL),
(428, 'Shaun', 'Green', 'Shaun@gmail.com', 'Shaun33', 'https://ozgrozer.github.io/100k-faces/0/6/006439.jpg', NULL),
(429, 'Patricia', 'Hepfer', 'Patricia68104@gmail.com', 'Patricia33', 'https://ozgrozer.github.io/100k-faces/0/9/009280.jpg', NULL),
(430, 'Jennifer', 'Baker', 'Jennifer@gmail.com', 'Jennifer33', 'https://ozgrozer.github.io/100k-faces/0/1/001459.jpg', NULL),
(431, 'Maggie', 'Caligiuri', 'Maggie@gmail.com', 'Maggie33', 'https://ozgrozer.github.io/100k-faces/0/2/002325.jpg', NULL),
(432, 'Audrey', 'Heminger', 'Audrey@gmail.com', 'Audrey33', 'https://ozgrozer.github.io/100k-faces/0/9/009983.jpg', NULL),
(433, 'Hoyt', 'Stark', 'Hoyt@gmail.com', 'Hoyt33', 'https://ozgrozer.github.io/100k-faces/0/4/004746.jpg', NULL),
(434, 'Clair', 'Wooten', 'Clair@gmail.com', 'Clair33', 'https://ozgrozer.github.io/100k-faces/0/5/005797.jpg', NULL),
(435, 'Ashley', 'Isaacs', 'Ashley76149@gmail.com', 'Ashley33', 'https://ozgrozer.github.io/100k-faces/0/8/008350.jpg', NULL),
(436, 'Donnie', 'Taylor', 'Donnie89903@gmail.com', 'Donnie33', 'https://ozgrozer.github.io/100k-faces/0/2/002184.jpg', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `test_write`
--

CREATE TABLE `test_write` (
  `ID_AUTHOR` bigint(20) NOT NULL,
  `ID_BOOK` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `USER`
--

CREATE TABLE `USER` (
  `ID_USER` bigint(4) NOT NULL,
  `FIRSTNAME` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LASTNAME` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EMAIL` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PASSWORD` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AVATAR` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `TOKEN` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `USER`
--

INSERT INTO `USER` (`ID_USER`, `FIRSTNAME`, `LASTNAME`, `EMAIL`, `PASSWORD`, `AVATAR`, `TOKEN`) VALUES
(1, 'Shirley', 'Burke', 'Shirley@gmail.com', 'Shirley33', 'https://ozgrozer.github.io/100k-faces/0/8/008537.jpg', NULL),
(2, 'Evan', 'Loper', 'Evan@gmail.com', 'Evan33', 'https://ozgrozer.github.io/100k-faces/0/0/000164.jpg', NULL),
(3, 'Chris', 'Manser', 'Chris@gmail.com', 'Chris33', 'https://ozgrozer.github.io/100k-faces/0/9/009517.jpg', NULL),
(4, 'Nathan', 'Horton', 'Nathan@gmail.com', 'Nathan33', 'https://ozgrozer.github.io/100k-faces/0/9/009623.jpg', NULL),
(5, 'Elizabeth', 'Hodson', 'Elizabeth@gmail.com', 'Elizabeth33', 'https://ozgrozer.github.io/100k-faces/0/2/002567.jpg', NULL),
(6, 'Barbara', 'Williams', 'Barbara@gmail.com', 'Barbara33', 'https://ozgrozer.github.io/100k-faces/0/1/001318.jpg', NULL),
(7, 'Doug', 'White', 'Doug@gmail.com', 'Doug33', 'https://ozgrozer.github.io/100k-faces/0/9/009506.jpg', NULL),
(8, 'Marla', 'Troilo', 'Marla@gmail.com', 'Marla33', 'https://ozgrozer.github.io/100k-faces/0/4/004926.jpg', NULL),
(9, 'Barbara', 'Celestine', 'Barbara94541@gmail.com', 'Barbara33', 'https://ozgrozer.github.io/100k-faces/0/6/006607.jpg', NULL),
(10, 'Joan', 'Gordon', 'Joan@gmail.com', 'Joan33', 'https://ozgrozer.github.io/100k-faces/0/8/008954.jpg', NULL),
(11, 'William', 'Barton', 'William@gmail.com', 'William33', 'https://ozgrozer.github.io/100k-faces/0/1/001261.jpg', NULL),
(12, 'Cruz', 'Maultsby', 'Cruz@gmail.com', 'Cruz33', 'https://ozgrozer.github.io/100k-faces/0/8/008151.jpg', NULL),
(13, 'Edythe', 'Odonnell', 'Edythe@gmail.com', 'Edythe33', 'https://ozgrozer.github.io/100k-faces/0/0/000944.jpg', NULL),
(14, 'Michael', 'Gribbin', 'Michael@gmail.com', 'Michael33', 'https://ozgrozer.github.io/100k-faces/0/1/001580.jpg', NULL),
(15, 'Jeffery', 'Alexander', 'Jeffery@gmail.com', 'Jeffery33', 'https://ozgrozer.github.io/100k-faces/0/2/002483.jpg', NULL),
(16, 'Frederic', 'Sanford', 'Frederic@gmail.com', 'Frederic33', 'https://ozgrozer.github.io/100k-faces/0/2/002197.jpg', NULL),
(17, 'Ernest', 'Drake', 'Ernest@gmail.com', 'Ernest33', 'https://ozgrozer.github.io/100k-faces/0/4/004517.jpg', NULL),
(18, 'Ryan', 'Davis', 'Ryan@gmail.com', 'Ryan33', 'https://ozgrozer.github.io/100k-faces/0/6/006528.jpg', NULL),
(19, 'Thersa', 'Victory', 'Thersa@gmail.com', 'Thersa33', 'https://ozgrozer.github.io/100k-faces/0/3/003860.jpg', NULL),
(20, 'Donald', 'Williams', 'Donald@gmail.com', 'Donald33', 'https://ozgrozer.github.io/100k-faces/0/2/002535.jpg', NULL),
(21, 'Noelle', 'Fisher', 'Noelle@gmail.com', 'Noelle33', 'https://ozgrozer.github.io/100k-faces/0/9/009903.jpg', NULL),
(22, 'Marissa', 'Cruz', 'Marissa@gmail.com', 'Marissa33', 'https://ozgrozer.github.io/100k-faces/0/4/004616.jpg', NULL),
(23, 'Christina', 'Riley', 'Christina@gmail.com', 'Christina33', 'https://ozgrozer.github.io/100k-faces/0/4/004216.jpg', NULL),
(24, 'Pansy', 'Fleming', 'Pansy@gmail.com', 'Pansy33', 'https://ozgrozer.github.io/100k-faces/0/6/006222.jpg', NULL),
(25, 'Julie', 'Grisham', 'Julie@gmail.com', 'Julie33', 'https://ozgrozer.github.io/100k-faces/0/5/005866.jpg', NULL),
(26, 'Catherine', 'Hilton', 'Catherine@gmail.com', 'Catherine33', 'https://ozgrozer.github.io/100k-faces/0/5/005794.jpg', NULL),
(27, 'Edwin', 'Cadogan', 'Edwin@gmail.com', 'Edwin33', 'https://ozgrozer.github.io/100k-faces/0/4/004816.jpg', NULL),
(28, 'Pamela', 'Griffey', 'Pamela@gmail.com', 'Pamela33', 'https://ozgrozer.github.io/100k-faces/0/7/007180.jpg', NULL),
(29, 'Glenna', 'Thomas', 'Glenna@gmail.com', 'Glenna33', 'https://ozgrozer.github.io/100k-faces/0/6/006247.jpg', NULL),
(30, 'Lillian', 'Fowlkes', 'Lillian@gmail.com', 'Lillian33', 'https://ozgrozer.github.io/100k-faces/0/2/002086.jpg', NULL),
(31, 'Fred', 'Kimball', 'Fred@gmail.com', 'Fred33', 'https://ozgrozer.github.io/100k-faces/0/0/000717.jpg', NULL),
(32, 'Steve', 'Mccan', 'Steve@gmail.com', 'Steve33', 'https://ozgrozer.github.io/100k-faces/0/5/005088.jpg', NULL),
(33, 'Kyle', 'Carlson', 'Kyle@gmail.com', 'Kyle33', 'https://ozgrozer.github.io/100k-faces/0/2/002543.jpg', NULL),
(34, 'Jerald', 'Gallegos', 'Jerald@gmail.com', 'Jerald33', 'https://ozgrozer.github.io/100k-faces/0/7/007241.jpg', NULL),
(35, 'Charity', 'Doe', 'Charity@gmail.com', 'Charity33', 'https://ozgrozer.github.io/100k-faces/0/0/000582.jpg', NULL),
(36, 'Glenda', 'Vargas', 'Glenda@gmail.com', 'Glenda33', 'https://ozgrozer.github.io/100k-faces/0/4/004412.jpg', NULL),
(37, 'Rebecca', 'Wells', 'Rebecca@gmail.com', 'Rebecca33', 'https://ozgrozer.github.io/100k-faces/0/7/007380.jpg', NULL),
(38, 'Timothy', 'Lewis', 'Timothy@gmail.com', 'Timothy33', 'https://ozgrozer.github.io/100k-faces/0/1/001815.jpg', NULL),
(39, 'Anthony', 'Catton', 'Anthony@gmail.com', 'Anthony33', 'https://ozgrozer.github.io/100k-faces/0/4/004193.jpg', NULL),
(40, 'Gary', 'Testa', 'Gary@gmail.com', 'Gary33', 'https://ozgrozer.github.io/100k-faces/0/7/007303.jpg', NULL),
(41, 'Deborah', 'Allison', 'Deborah@gmail.com', 'Deborah33', 'https://ozgrozer.github.io/100k-faces/0/4/004303.jpg', NULL),
(42, 'Anneliese', 'Angelocci', 'Anneliese@gmail.com', 'Anneliese33', 'https://ozgrozer.github.io/100k-faces/0/8/008610.jpg', NULL),
(43, 'Teresa', 'Crowder', 'Teresa@gmail.com', 'Teresa33', 'https://ozgrozer.github.io/100k-faces/0/5/005300.jpg', NULL),
(44, 'Tanya', 'Watson', 'Tanya@gmail.com', 'Tanya33', 'https://ozgrozer.github.io/100k-faces/0/2/002229.jpg', NULL),
(45, 'Deshawn', 'Hutson', 'Deshawn@gmail.com', 'Deshawn33', 'https://ozgrozer.github.io/100k-faces/0/2/002112.jpg', NULL),
(46, 'Ashley', 'Schroeder', 'Ashley@gmail.com', 'Ashley33', 'https://ozgrozer.github.io/100k-faces/0/2/002124.jpg', NULL),
(47, 'Nidia', 'Briant', 'Nidia@gmail.com', 'Nidia33', 'https://ozgrozer.github.io/100k-faces/0/4/004992.jpg', NULL),
(48, 'Jason', 'Bristol', 'Jason@gmail.com', 'Jason33', 'https://ozgrozer.github.io/100k-faces/0/1/001133.jpg', NULL),
(49, 'Essie', 'Medlin', 'Essie@gmail.com', 'Essie33', 'https://ozgrozer.github.io/100k-faces/0/9/009799.jpg', NULL),
(50, 'Philip', 'Luce', 'Philip@gmail.com', 'Philip33', 'https://ozgrozer.github.io/100k-faces/0/5/005439.jpg', NULL),
(51, 'Edith', 'Lybarger', 'Edith@gmail.com', 'Edith33', 'https://ozgrozer.github.io/100k-faces/0/9/009588.jpg', NULL),
(52, 'Anna', 'Lee', 'Anna@gmail.com', 'Anna33', 'https://ozgrozer.github.io/100k-faces/0/1/001727.jpg', NULL),
(53, 'Reed', 'Annis', 'Reed@gmail.com', 'Reed33', 'https://ozgrozer.github.io/100k-faces/0/3/003308.jpg', NULL),
(54, 'Mary', 'Haun', 'Mary@gmail.com', 'Mary33', 'https://ozgrozer.github.io/100k-faces/0/1/001203.jpg', NULL),
(55, 'Ruby', 'Kerby', 'Ruby@gmail.com', 'Ruby33', 'https://ozgrozer.github.io/100k-faces/0/7/007392.jpg', NULL),
(56, 'Walter', 'Auzenne', 'Walter@gmail.com', 'Walter33', 'https://ozgrozer.github.io/100k-faces/0/1/001411.jpg', NULL),
(57, 'James', 'Mason', 'James@gmail.com', 'James33', 'https://ozgrozer.github.io/100k-faces/0/6/006804.jpg', NULL),
(58, 'Richard', 'Phipps', 'Richard@gmail.com', 'Richard33', 'https://ozgrozer.github.io/100k-faces/0/6/006234.jpg', NULL),
(59, 'Randee', 'Cornelius', 'Randee@gmail.com', 'Randee33', 'https://ozgrozer.github.io/100k-faces/0/8/008294.jpg', NULL),
(60, 'Frank', 'Richardson', 'Frank@gmail.com', 'Frank33', 'https://ozgrozer.github.io/100k-faces/0/4/004679.jpg', NULL),
(61, 'Monty', 'Clapham', 'Monty@gmail.com', 'Monty33', 'https://ozgrozer.github.io/100k-faces/0/8/008570.jpg', NULL),
(62, 'Joshua', 'Munoz', 'Joshua@gmail.com', 'Joshua33', 'https://ozgrozer.github.io/100k-faces/0/7/007011.jpg', NULL),
(63, 'Larry', 'Henry', 'Larry@gmail.com', 'Larry33', 'https://ozgrozer.github.io/100k-faces/0/8/008694.jpg', NULL),
(64, 'Sarah', 'Kinzer', 'Sarah@gmail.com', 'Sarah33', 'https://ozgrozer.github.io/100k-faces/0/1/001717.jpg', NULL),
(65, 'Jose', 'Stramel', 'Jose@gmail.com', 'Jose33', 'https://ozgrozer.github.io/100k-faces/0/8/008628.jpg', NULL),
(66, 'Mona', 'Rochin', 'Mona@gmail.com', 'Mona33', 'https://ozgrozer.github.io/100k-faces/0/6/006931.jpg', NULL),
(67, 'William', 'Gonzalez', 'William76154@gmail.com', 'William33', 'https://ozgrozer.github.io/100k-faces/0/4/004734.jpg', NULL),
(68, 'Daniel', 'Schoen', 'Daniel@gmail.com', 'Daniel33', 'https://ozgrozer.github.io/100k-faces/0/9/009261.jpg', NULL),
(69, 'Van', 'Baggesen', 'Van@gmail.com', 'Van33', 'https://ozgrozer.github.io/100k-faces/0/1/001870.jpg', NULL),
(70, 'Shira', 'Cravens', 'Shira@gmail.com', 'Shira33', 'https://ozgrozer.github.io/100k-faces/0/9/009187.jpg', NULL),
(71, 'James', 'Vargas', 'James87680@gmail.com', 'James33', 'https://ozgrozer.github.io/100k-faces/0/6/006824.jpg', NULL),
(72, 'Robert', 'Short', 'Robert@gmail.com', 'Robert33', 'https://ozgrozer.github.io/100k-faces/0/4/004426.jpg', NULL),
(73, 'Roberta', 'Roberts', 'Roberta@gmail.com', 'Roberta33', 'https://ozgrozer.github.io/100k-faces/0/9/009256.jpg', NULL),
(74, 'Roberta', 'Edwards', 'Roberta27954@gmail.com', 'Roberta33', 'https://ozgrozer.github.io/100k-faces/0/3/003027.jpg', NULL),
(75, 'Marie', 'Berger', 'Marie@gmail.com', 'Marie33', 'https://ozgrozer.github.io/100k-faces/0/7/007857.jpg', NULL),
(76, 'Christine', 'Green', 'Christine@gmail.com', 'Christine33', 'https://ozgrozer.github.io/100k-faces/0/7/007616.jpg', NULL),
(77, 'Wendy', 'Wilson', 'Wendy@gmail.com', 'Wendy33', 'https://ozgrozer.github.io/100k-faces/0/7/007727.jpg', NULL),
(78, 'Joy', 'Darling', 'Joy@gmail.com', 'Joy33', 'https://ozgrozer.github.io/100k-faces/0/3/003670.jpg', NULL),
(79, 'Alice', 'Knightly', 'Alice@gmail.com', 'Alice33', 'https://ozgrozer.github.io/100k-faces/0/1/001310.jpg', NULL),
(80, 'Rebecca', 'Peluso', 'Rebecca72830@gmail.com', 'Rebecca33', 'https://ozgrozer.github.io/100k-faces/0/7/007550.jpg', NULL),
(81, 'Maria', 'Mccormick', 'Maria@gmail.com', 'Maria33', 'https://ozgrozer.github.io/100k-faces/0/9/009237.jpg', NULL),
(82, 'Elizabeth', 'Thomson', 'Elizabeth84179@gmail.com', 'Elizabeth33', 'https://ozgrozer.github.io/100k-faces/0/9/009983.jpg', NULL),
(83, 'Jeanette', 'Jackson', 'Jeanette@gmail.com', 'Jeanette33', 'https://ozgrozer.github.io/100k-faces/0/1/001523.jpg', NULL),
(84, 'Kendra', 'Franklin', 'Kendra@gmail.com', 'Kendra33', 'https://ozgrozer.github.io/100k-faces/0/8/008464.jpg', NULL),
(85, 'Carl', 'Payne', 'Carl@gmail.com', 'Carl33', 'https://ozgrozer.github.io/100k-faces/0/1/001203.jpg', NULL),
(86, 'Debbie', 'Maker', 'Debbie@gmail.com', 'Debbie33', 'https://ozgrozer.github.io/100k-faces/0/8/008328.jpg', NULL),
(87, 'Marlene', 'Fraser', 'Marlene@gmail.com', 'Marlene33', 'https://ozgrozer.github.io/100k-faces/0/8/008326.jpg', NULL),
(88, 'David', 'Vandergriff', 'David@gmail.com', 'David33', 'https://ozgrozer.github.io/100k-faces/0/1/001202.jpg', NULL),
(89, 'Clarence', 'Deleon', 'Clarence@gmail.com', 'Clarence33', 'https://ozgrozer.github.io/100k-faces/0/4/004590.jpg', NULL),
(90, 'Donald', 'Diaz', 'Donald72363@gmail.com', 'Donald33', 'https://ozgrozer.github.io/100k-faces/0/5/005693.jpg', NULL),
(91, 'Judith', 'Kevan', 'Judith@gmail.com', 'Judith33', 'https://ozgrozer.github.io/100k-faces/0/6/006737.jpg', NULL),
(92, 'Elizabeth', 'Morris', 'Elizabeth960@gmail.com', 'Elizabeth33', 'https://ozgrozer.github.io/100k-faces/0/1/001544.jpg', NULL),
(93, 'Larry', 'Kimberlin', 'Larry90085@gmail.com', 'Larry33', 'https://ozgrozer.github.io/100k-faces/0/6/006412.jpg', NULL),
(94, 'Milan', 'Borcherding', 'Milan@gmail.com', 'Milan33', 'https://ozgrozer.github.io/100k-faces/0/9/009352.jpg', NULL),
(95, 'Kim', 'Green', 'Kim@gmail.com', 'Kim33', 'https://ozgrozer.github.io/100k-faces/0/6/006345.jpg', NULL),
(96, 'Sylvester', 'Rupert', 'Sylvester@gmail.com', 'Sylvester33', 'https://ozgrozer.github.io/100k-faces/0/2/002681.jpg', NULL),
(97, 'Pedro', 'Womack', 'Pedro@gmail.com', 'Pedro33', 'https://ozgrozer.github.io/100k-faces/0/2/002957.jpg', NULL),
(98, 'George', 'Eaves', 'George@gmail.com', 'George33', 'https://ozgrozer.github.io/100k-faces/0/4/004881.jpg', NULL),
(99, 'Wanda', 'Saum', 'Wanda@gmail.com', 'Wanda33', 'https://ozgrozer.github.io/100k-faces/0/7/007355.jpg', NULL),
(100, 'Napoleon', 'Loynes', 'Napoleon@gmail.com', 'Napoleon33', 'https://ozgrozer.github.io/100k-faces/0/6/006762.jpg', NULL),
(101, 'Theresa', 'Yang', 'Theresa@gmail.com', 'Theresa33', 'https://ozgrozer.github.io/100k-faces/0/9/009006.jpg', NULL),
(102, 'James', 'Stewart', 'James93724@gmail.com', 'James33', 'https://ozgrozer.github.io/100k-faces/0/1/001159.jpg', NULL),
(103, 'Jefferson', 'Denham', 'Jefferson@gmail.com', 'Jefferson33', 'https://ozgrozer.github.io/100k-faces/0/6/006356.jpg', NULL),
(104, 'Kristin', 'Smith', 'Kristin@gmail.com', 'Kristin33', 'https://ozgrozer.github.io/100k-faces/0/4/004764.jpg', NULL),
(105, 'Nancy', 'Bonanno', 'Nancy@gmail.com', 'Nancy33', 'https://ozgrozer.github.io/100k-faces/0/3/003387.jpg', NULL),
(106, 'Steven', 'Blackwell', 'Steven@gmail.com', 'Steven33', 'https://ozgrozer.github.io/100k-faces/0/4/004759.jpg', NULL),
(107, 'Linda', 'Hendren', 'Linda@gmail.com', 'Linda33', 'https://ozgrozer.github.io/100k-faces/0/8/008696.jpg', NULL),
(108, 'Zachary', 'Steinberg', 'Zachary@gmail.com', 'Zachary33', 'https://ozgrozer.github.io/100k-faces/0/4/004312.jpg', NULL),
(109, 'Jeffrey', 'Nichols', 'Jeffrey@gmail.com', 'Jeffrey33', 'https://ozgrozer.github.io/100k-faces/0/9/009080.jpg', NULL),
(110, 'Angelique', 'Esterbrook', 'Angelique@gmail.com', 'Angelique33', 'https://ozgrozer.github.io/100k-faces/0/2/002072.jpg', NULL),
(111, 'Lorraine', 'Godwin', 'Lorraine@gmail.com', 'Lorraine33', 'https://ozgrozer.github.io/100k-faces/0/9/009801.jpg', NULL),
(112, 'Stella', 'Herrera', 'Stella@gmail.com', 'Stella33', 'https://ozgrozer.github.io/100k-faces/0/2/002984.jpg', NULL),
(113, 'Effie', 'Heyer', 'Effie@gmail.com', 'Effie33', 'https://ozgrozer.github.io/100k-faces/0/2/002367.jpg', NULL),
(114, 'Janice', 'Wellman', 'Janice@gmail.com', 'Janice33', 'https://ozgrozer.github.io/100k-faces/0/4/004239.jpg', NULL),
(115, 'Roberto', 'Nicholls', 'Roberto@gmail.com', 'Roberto33', 'https://ozgrozer.github.io/100k-faces/0/2/002770.jpg', NULL),
(116, 'Darline', 'Bush', 'Darline@gmail.com', 'Darline33', 'https://ozgrozer.github.io/100k-faces/0/0/000925.jpg', NULL),
(117, 'James', 'Wilson', 'James41207@gmail.com', 'James33', 'https://ozgrozer.github.io/100k-faces/0/4/004950.jpg', NULL),
(118, 'Dora', 'Macdonald', 'Dora@gmail.com', 'Dora33', 'https://ozgrozer.github.io/100k-faces/0/1/001598.jpg', NULL),
(119, 'Mary', 'Johnson', 'Mary91780@gmail.com', 'Mary33', 'https://ozgrozer.github.io/100k-faces/0/1/001577.jpg', NULL),
(120, 'Benjamin', 'Greene', 'Benjamin@gmail.com', 'Benjamin33', 'https://ozgrozer.github.io/100k-faces/0/3/003205.jpg', NULL),
(121, 'Barbara', 'Kennett', 'Barbara76322@gmail.com', 'Barbara33', 'https://ozgrozer.github.io/100k-faces/0/8/008013.jpg', NULL),
(122, 'Christopher', 'Belk', 'Christopher@gmail.com', 'Christopher33', 'https://ozgrozer.github.io/100k-faces/0/5/005962.jpg', NULL),
(123, 'Ryan', 'Angulo', 'Ryan97624@gmail.com', 'Ryan33', 'https://ozgrozer.github.io/100k-faces/0/1/001556.jpg', NULL),
(124, 'Ronald', 'Bollman', 'Ronald@gmail.com', 'Ronald33', 'https://ozgrozer.github.io/100k-faces/0/9/009736.jpg', NULL),
(125, 'David', 'Ruppert', 'David56864@gmail.com', 'David33', 'https://ozgrozer.github.io/100k-faces/0/5/005283.jpg', NULL),
(126, 'James', 'Cole', 'James46366@gmail.com', 'James33', 'https://ozgrozer.github.io/100k-faces/0/3/003149.jpg', NULL),
(127, 'Robert', 'Alexander', 'Robert23100@gmail.com', 'Robert33', 'https://ozgrozer.github.io/100k-faces/0/5/005192.jpg', NULL),
(128, 'Brandon', 'Walker', 'Brandon@gmail.com', 'Brandon33', 'https://ozgrozer.github.io/100k-faces/0/0/000425.jpg', NULL),
(129, 'Thomas', 'Morrell', 'Thomas@gmail.com', 'Thomas33', 'https://ozgrozer.github.io/100k-faces/0/4/004387.jpg', NULL),
(130, 'Herbert', 'Flores', 'Herbert@gmail.com', 'Herbert33', 'https://ozgrozer.github.io/100k-faces/0/3/003005.jpg', NULL),
(131, 'Sidney', 'Potter', 'Sidney@gmail.com', 'Sidney33', 'https://ozgrozer.github.io/100k-faces/0/2/002308.jpg', NULL),
(132, 'Caroline', 'Jackson', 'Caroline@gmail.com', 'Caroline33', 'https://ozgrozer.github.io/100k-faces/0/9/009987.jpg', NULL),
(133, 'Katherine', 'Musick', 'Katherine@gmail.com', 'Katherine33', 'https://ozgrozer.github.io/100k-faces/0/7/007620.jpg', NULL),
(134, 'John', 'Bailey', 'John@gmail.com', 'John33', 'https://ozgrozer.github.io/100k-faces/0/7/007245.jpg', NULL),
(135, 'Stacy', 'Jackson', 'Stacy@gmail.com', 'Stacy33', 'https://ozgrozer.github.io/100k-faces/0/7/007262.jpg', NULL),
(136, 'William', 'Estrada', 'William91316@gmail.com', 'William33', 'https://ozgrozer.github.io/100k-faces/0/0/000030.jpg', NULL),
(137, 'Cecilia', 'Sanfilippo', 'Cecilia@gmail.com', 'Cecilia33', 'https://ozgrozer.github.io/100k-faces/0/2/002854.jpg', NULL),
(138, 'Robert', 'Roach', 'Robert19622@gmail.com', 'Robert33', 'https://ozgrozer.github.io/100k-faces/0/5/005791.jpg', NULL),
(139, 'Hiram', 'Jodha', 'Hiram@gmail.com', 'Hiram33', 'https://ozgrozer.github.io/100k-faces/0/2/002426.jpg', NULL),
(140, 'Annabel', 'Lopez', 'Annabel@gmail.com', 'Annabel33', 'https://ozgrozer.github.io/100k-faces/0/9/009572.jpg', NULL),
(141, 'Daniel', 'Mccraw', 'Daniel57703@gmail.com', 'Daniel33', 'https://ozgrozer.github.io/100k-faces/0/4/004654.jpg', NULL),
(142, 'Toni', 'Campbell', 'Toni@gmail.com', 'Toni33', 'https://ozgrozer.github.io/100k-faces/0/8/008757.jpg', NULL),
(143, 'Christopher', 'Adams', 'Christopher55539@gmail.com', 'Christopher33', 'https://ozgrozer.github.io/100k-faces/0/5/005798.jpg', NULL),
(144, 'Carol', 'Osburn', 'Carol@gmail.com', 'Carol33', 'https://ozgrozer.github.io/100k-faces/0/8/008334.jpg', NULL),
(145, 'Lionel', 'Clay', 'Lionel@gmail.com', 'Lionel33', 'https://ozgrozer.github.io/100k-faces/0/8/008041.jpg', NULL),
(146, 'Michael', 'Gralak', 'Michael60618@gmail.com', 'Michael33', 'https://ozgrozer.github.io/100k-faces/0/2/002002.jpg', NULL),
(147, 'Jerry', 'Smith', 'Jerry@gmail.com', 'Jerry33', 'https://ozgrozer.github.io/100k-faces/0/6/006706.jpg', NULL),
(148, 'Florence', 'Broyles', 'Florence@gmail.com', 'Florence33', 'https://ozgrozer.github.io/100k-faces/0/7/007344.jpg', NULL),
(149, 'Gloria', 'Needham', 'Gloria@gmail.com', 'Gloria33', 'https://ozgrozer.github.io/100k-faces/0/8/008478.jpg', NULL),
(150, 'Amanda', 'Kiffer', 'Amanda@gmail.com', 'Amanda33', 'https://ozgrozer.github.io/100k-faces/0/5/005852.jpg', NULL),
(151, 'Peter', 'Farrell', 'Peter@gmail.com', 'Peter33', 'https://ozgrozer.github.io/100k-faces/0/9/009072.jpg', NULL),
(152, 'Darrell', 'Maynard', 'Darrell@gmail.com', 'Darrell33', 'https://ozgrozer.github.io/100k-faces/0/8/008314.jpg', NULL),
(153, 'Cheryl', 'Jara', 'Cheryl@gmail.com', 'Cheryl33', 'https://ozgrozer.github.io/100k-faces/0/7/007579.jpg', NULL),
(154, 'Alyssa', 'Folk', 'Alyssa@gmail.com', 'Alyssa33', 'https://ozgrozer.github.io/100k-faces/0/1/001529.jpg', NULL),
(155, 'Janine', 'Snyder', 'Janine@gmail.com', 'Janine33', 'https://ozgrozer.github.io/100k-faces/0/6/006150.jpg', NULL),
(156, 'Frank', 'Weiss', 'Frank22189@gmail.com', 'Frank33', 'https://ozgrozer.github.io/100k-faces/0/1/001912.jpg', NULL),
(157, 'Florentino', 'Mendez', 'Florentino@gmail.com', 'Florentino33', 'https://ozgrozer.github.io/100k-faces/0/3/003037.jpg', NULL),
(158, 'Eunice', 'Herrara', 'Eunice@gmail.com', 'Eunice33', 'https://ozgrozer.github.io/100k-faces/0/2/002555.jpg', NULL),
(159, 'Thaddeus', 'Landes', 'Thaddeus@gmail.com', 'Thaddeus33', 'https://ozgrozer.github.io/100k-faces/0/2/002983.jpg', NULL),
(160, 'Sharron', 'Parks', 'Sharron@gmail.com', 'Sharron33', 'https://ozgrozer.github.io/100k-faces/0/9/009328.jpg', NULL),
(161, 'Birdie', 'Case', 'Birdie@gmail.com', 'Birdie33', 'https://ozgrozer.github.io/100k-faces/0/8/008254.jpg', NULL),
(162, 'Pamella', 'Lockhart', 'Pamella@gmail.com', 'Pamella33', 'https://ozgrozer.github.io/100k-faces/0/8/008482.jpg', NULL),
(163, 'Cornelius', 'Glassman', 'Cornelius@gmail.com', 'Cornelius33', 'https://ozgrozer.github.io/100k-faces/0/6/006894.jpg', NULL),
(164, 'Timothy', 'Sharp', 'Timothy12857@gmail.com', 'Timothy33', 'https://ozgrozer.github.io/100k-faces/0/6/006671.jpg', NULL),
(165, 'George', 'Figueroa', 'George31668@gmail.com', 'George33', 'https://ozgrozer.github.io/100k-faces/0/1/001082.jpg', NULL),
(166, 'Kenneth', 'Currie', 'Kenneth@gmail.com', 'Kenneth33', 'https://ozgrozer.github.io/100k-faces/0/0/000224.jpg', NULL),
(167, 'Helen', 'Nickel', 'Helen@gmail.com', 'Helen33', 'https://ozgrozer.github.io/100k-faces/0/6/006416.jpg', NULL),
(168, 'Joy', 'Stigall', 'Joy21360@gmail.com', 'Joy33', 'https://ozgrozer.github.io/100k-faces/0/0/000888.jpg', NULL),
(169, 'Margaret', 'Turner', 'Margaret@gmail.com', 'Margaret33', 'https://ozgrozer.github.io/100k-faces/0/1/001789.jpg', NULL),
(170, 'Jesse', 'Cook', 'Jesse@gmail.com', 'Jesse33', 'https://ozgrozer.github.io/100k-faces/0/7/007301.jpg', NULL),
(171, 'Gene', 'Garica', 'Gene@gmail.com', 'Gene33', 'https://ozgrozer.github.io/100k-faces/0/6/006143.jpg', NULL),
(172, 'Christopher', 'Henry', 'Christopher99615@gmail.com', 'Christopher33', 'https://ozgrozer.github.io/100k-faces/0/6/006099.jpg', NULL),
(173, 'John', 'Spriggs', 'John71423@gmail.com', 'John33', 'https://ozgrozer.github.io/100k-faces/0/3/003845.jpg', NULL),
(174, 'Jeremiah', 'Messier', 'Jeremiah@gmail.com', 'Jeremiah33', 'https://ozgrozer.github.io/100k-faces/0/2/002369.jpg', NULL),
(175, 'Garry', 'Harris', 'Garry@gmail.com', 'Garry33', 'https://ozgrozer.github.io/100k-faces/0/6/006136.jpg', NULL),
(176, 'Lillian', 'Ferguson', 'Lillian96373@gmail.com', 'Lillian33', 'https://ozgrozer.github.io/100k-faces/0/3/003307.jpg', NULL),
(177, 'Mary', 'Macias', 'Mary25686@gmail.com', 'Mary33', 'https://ozgrozer.github.io/100k-faces/0/3/003508.jpg', NULL),
(178, 'April', 'Gonzales', 'April@gmail.com', 'April33', 'https://ozgrozer.github.io/100k-faces/0/4/004656.jpg', NULL),
(179, 'Ernestine', 'Kranz', 'Ernestine@gmail.com', 'Ernestine33', 'https://ozgrozer.github.io/100k-faces/0/2/002951.jpg', NULL),
(180, 'Dorothy', 'Thibadeau', 'Dorothy@gmail.com', 'Dorothy33', 'https://ozgrozer.github.io/100k-faces/0/8/008903.jpg', NULL),
(181, 'Richard', 'Lane', 'Richard87078@gmail.com', 'Richard33', 'https://ozgrozer.github.io/100k-faces/0/1/001712.jpg', NULL),
(182, 'Edward', 'Roberson', 'Edward@gmail.com', 'Edward33', 'https://ozgrozer.github.io/100k-faces/0/3/003158.jpg', NULL),
(183, 'Ramiro', 'Hultgren', 'Ramiro@gmail.com', 'Ramiro33', 'https://ozgrozer.github.io/100k-faces/0/4/004912.jpg', NULL),
(184, 'Robin', 'Groves', 'Robin@gmail.com', 'Robin33', 'https://ozgrozer.github.io/100k-faces/0/3/003395.jpg', NULL),
(185, 'Alice', 'Anderson', 'Alice15686@gmail.com', 'Alice33', 'https://ozgrozer.github.io/100k-faces/0/4/004038.jpg', NULL),
(186, 'Harold', 'Dunn', 'Harold@gmail.com', 'Harold33', 'https://ozgrozer.github.io/100k-faces/0/7/007851.jpg', NULL),
(187, 'Dora', 'Suarez', 'Dora78898@gmail.com', 'Dora33', 'https://ozgrozer.github.io/100k-faces/0/0/000777.jpg', NULL),
(188, 'Charles', 'Cagle', 'Charles@gmail.com', 'Charles33', 'https://ozgrozer.github.io/100k-faces/0/2/002313.jpg', NULL),
(189, 'Noel', 'Mathis', 'Noel@gmail.com', 'Noel33', 'https://ozgrozer.github.io/100k-faces/0/7/007629.jpg', NULL),
(190, 'Terry', 'Hudson', 'Terry@gmail.com', 'Terry33', 'https://ozgrozer.github.io/100k-faces/0/5/005142.jpg', NULL),
(191, 'Angela', 'Meador', 'Angela@gmail.com', 'Angela33', 'https://ozgrozer.github.io/100k-faces/0/8/008147.jpg', NULL),
(192, 'Elizabeth', 'Qualls', 'Elizabeth94961@gmail.com', 'Elizabeth33', 'https://ozgrozer.github.io/100k-faces/0/3/003584.jpg', NULL),
(193, 'Ramiro', 'Goe', 'Ramiro31556@gmail.com', 'Ramiro33', 'https://ozgrozer.github.io/100k-faces/0/7/007089.jpg', NULL),
(194, 'Marta', 'Henderson', 'Marta@gmail.com', 'Marta33', 'https://ozgrozer.github.io/100k-faces/0/9/009857.jpg', NULL),
(195, 'Leona', 'Tucker', 'Leona@gmail.com', 'Leona33', 'https://ozgrozer.github.io/100k-faces/0/3/003976.jpg', NULL),
(196, 'Faith', 'Daniel', 'Faith@gmail.com', 'Faith33', 'https://ozgrozer.github.io/100k-faces/0/3/003885.jpg', NULL),
(197, 'Mary', 'Huff', 'Mary34729@gmail.com', 'Mary33', 'https://ozgrozer.github.io/100k-faces/0/5/005785.jpg', NULL),
(198, 'Helen', 'Sturgeon', 'Helen26936@gmail.com', 'Helen33', 'https://ozgrozer.github.io/100k-faces/0/0/000116.jpg', NULL),
(199, 'Angela', 'Spada', 'Angela38590@gmail.com', 'Angela33', 'https://ozgrozer.github.io/100k-faces/0/5/005556.jpg', NULL),
(200, 'Raymond', 'Scott', 'Raymond@gmail.com', 'Raymond33', 'https://ozgrozer.github.io/100k-faces/0/0/000072.jpg', NULL),
(201, 'Linda', 'Loucks', 'Linda220@gmail.com', 'Linda33', 'https://ozgrozer.github.io/100k-faces/0/9/009960.jpg', NULL),
(202, 'Pamela', 'Brown', 'Pamela13217@gmail.com', 'Pamela33', 'https://ozgrozer.github.io/100k-faces/0/2/002447.jpg', NULL),
(203, 'Richard', 'Mueller', 'Richard94037@gmail.com', 'Richard33', 'https://ozgrozer.github.io/100k-faces/0/3/003578.jpg', NULL),
(204, 'Grace', 'Sanders', 'Grace@gmail.com', 'Grace33', 'https://ozgrozer.github.io/100k-faces/0/0/000672.jpg', NULL),
(205, 'Michael', 'Crook', 'Michael85035@gmail.com', 'Michael33', 'https://ozgrozer.github.io/100k-faces/0/2/002755.jpg', NULL),
(206, 'John', 'Navarez', 'John1991@gmail.com', 'John33', 'https://ozgrozer.github.io/100k-faces/0/3/003168.jpg', NULL),
(207, 'Julia', 'Shirley', 'Julia@gmail.com', 'Julia33', 'https://ozgrozer.github.io/100k-faces/0/6/006878.jpg', NULL),
(208, 'Zachary', 'Ragin', 'Zachary50538@gmail.com', 'Zachary33', 'https://ozgrozer.github.io/100k-faces/0/7/007215.jpg', NULL),
(209, 'Rodney', 'Mitchell', 'Rodney@gmail.com', 'Rodney33', 'https://ozgrozer.github.io/100k-faces/0/9/009052.jpg', NULL),
(210, 'Patricia', 'Freeman', 'Patricia@gmail.com', 'Patricia33', 'https://ozgrozer.github.io/100k-faces/0/5/005871.jpg', NULL),
(211, 'Mable', 'Marez', 'Mable@gmail.com', 'Mable33', 'https://ozgrozer.github.io/100k-faces/0/3/003258.jpg', NULL),
(212, 'Ken', 'Mccutchan', 'Ken@gmail.com', 'Ken33', 'https://ozgrozer.github.io/100k-faces/0/7/007720.jpg', NULL),
(213, 'Danilo', 'Reiners', 'Danilo@gmail.com', 'Danilo33', 'https://ozgrozer.github.io/100k-faces/0/7/007315.jpg', NULL),
(214, 'Despina', 'Burr', 'Despina@gmail.com', 'Despina33', 'https://ozgrozer.github.io/100k-faces/0/4/004838.jpg', NULL),
(215, 'Marvin', 'Soto', 'Marvin@gmail.com', 'Marvin33', 'https://ozgrozer.github.io/100k-faces/0/5/005411.jpg', NULL),
(216, 'Jeffrey', 'Hayes', 'Jeffrey98559@gmail.com', 'Jeffrey33', 'https://ozgrozer.github.io/100k-faces/0/5/005764.jpg', NULL),
(217, 'Kerry', 'Worthy', 'Kerry@gmail.com', 'Kerry33', 'https://ozgrozer.github.io/100k-faces/0/2/002780.jpg', NULL),
(218, 'Pearl', 'Goodman', 'Pearl@gmail.com', 'Pearl33', 'https://ozgrozer.github.io/100k-faces/0/3/003138.jpg', NULL),
(219, 'Robert', 'Manzano', 'Robert40800@gmail.com', 'Robert33', 'https://ozgrozer.github.io/100k-faces/0/1/001286.jpg', NULL),
(220, 'Shirley', 'Digangi', 'Shirley15562@gmail.com', 'Shirley33', 'https://ozgrozer.github.io/100k-faces/0/9/009949.jpg', NULL),
(221, 'Angla', 'Rivera', 'Angla@gmail.com', 'Angla33', 'https://ozgrozer.github.io/100k-faces/0/0/000519.jpg', NULL),
(222, 'Enrique', 'Glover', 'Enrique@gmail.com', 'Enrique33', 'https://ozgrozer.github.io/100k-faces/0/9/009159.jpg', NULL),
(223, 'Natalie', 'Berner', 'Natalie@gmail.com', 'Natalie33', 'https://ozgrozer.github.io/100k-faces/0/4/004749.jpg', NULL),
(224, 'Myron', 'Doty', 'Myron@gmail.com', 'Myron33', 'https://ozgrozer.github.io/100k-faces/0/6/006629.jpg', NULL),
(225, 'April', 'Mcgough', 'April67619@gmail.com', 'April33', 'https://ozgrozer.github.io/100k-faces/0/8/008137.jpg', NULL),
(226, 'John', 'Pullins', 'John85115@gmail.com', 'John33', 'https://ozgrozer.github.io/100k-faces/0/0/000057.jpg', NULL),
(227, 'Horace', 'Matson', 'Horace@gmail.com', 'Horace33', 'https://ozgrozer.github.io/100k-faces/0/4/004726.jpg', NULL),
(228, 'Doug', 'Alexander', 'Doug5439@gmail.com', 'Doug33', 'https://ozgrozer.github.io/100k-faces/0/8/008808.jpg', NULL),
(229, 'Paul', 'Alexander', 'Paul@gmail.com', 'Paul33', 'https://ozgrozer.github.io/100k-faces/0/5/005950.jpg', NULL),
(230, 'Sarah', 'Coles', 'Sarah97975@gmail.com', 'Sarah33', 'https://ozgrozer.github.io/100k-faces/0/0/000758.jpg', NULL),
(231, 'Albert', 'Sickles', 'Albert@gmail.com', 'Albert33', 'https://ozgrozer.github.io/100k-faces/0/0/000163.jpg', NULL),
(232, 'Justin', 'Richard', 'Justin@gmail.com', 'Justin33', 'https://ozgrozer.github.io/100k-faces/0/6/006445.jpg', NULL),
(233, 'Bridget', 'Young', 'Bridget@gmail.com', 'Bridget33', 'https://ozgrozer.github.io/100k-faces/0/9/009135.jpg', NULL),
(234, 'Charles', 'Mason', 'Charles31818@gmail.com', 'Charles33', 'https://ozgrozer.github.io/100k-faces/0/8/008439.jpg', NULL),
(235, 'Anthony', 'Cass', 'Anthony7058@gmail.com', 'Anthony33', 'https://ozgrozer.github.io/100k-faces/0/6/006436.jpg', NULL),
(236, 'Jason', 'Mabrey', 'Jason33476@gmail.com', 'Jason33', 'https://ozgrozer.github.io/100k-faces/0/5/005047.jpg', NULL),
(237, 'Marcia', 'Thomas', 'Marcia@gmail.com', 'Marcia33', 'https://ozgrozer.github.io/100k-faces/0/1/001189.jpg', NULL),
(238, 'Sandra', 'Nease', 'Sandra@gmail.com', 'Sandra33', 'https://ozgrozer.github.io/100k-faces/0/3/003885.jpg', NULL),
(239, 'Walter', 'Johnson', 'Walter57373@gmail.com', 'Walter33', 'https://ozgrozer.github.io/100k-faces/0/7/007850.jpg', NULL),
(240, 'Drew', 'Perales', 'Drew@gmail.com', 'Drew33', 'https://ozgrozer.github.io/100k-faces/0/9/009173.jpg', NULL),
(241, 'Elizabeth', 'Scoggins', 'Elizabeth73683@gmail.com', 'Elizabeth33', 'https://ozgrozer.github.io/100k-faces/0/7/007820.jpg', NULL),
(242, 'Robert', 'Lamere', 'Robert21199@gmail.com', 'Robert33', 'https://ozgrozer.github.io/100k-faces/0/3/003897.jpg', NULL),
(243, 'Sandra', 'Buntrock', 'Sandra80460@gmail.com', 'Sandra33', 'https://ozgrozer.github.io/100k-faces/0/8/008840.jpg', NULL),
(244, 'Clint', 'Izquierdo', 'Clint@gmail.com', 'Clint33', 'https://ozgrozer.github.io/100k-faces/0/8/008664.jpg', NULL),
(245, 'Cameron', 'Lowry', 'Cameron@gmail.com', 'Cameron33', 'https://ozgrozer.github.io/100k-faces/0/9/009125.jpg', NULL),
(246, 'Nathalie', 'Mccleary', 'Nathalie@gmail.com', 'Nathalie33', 'https://ozgrozer.github.io/100k-faces/0/4/004023.jpg', NULL),
(247, 'Craig', 'Joyner', 'Craig@gmail.com', 'Craig33', 'https://ozgrozer.github.io/100k-faces/0/7/007782.jpg', NULL),
(248, 'Claire', 'Tecuanhuey', 'Claire@gmail.com', 'Claire33', 'https://ozgrozer.github.io/100k-faces/0/3/003851.jpg', NULL),
(249, 'Rose', 'Hentges', 'Rose@gmail.com', 'Rose33', 'https://ozgrozer.github.io/100k-faces/0/9/009139.jpg', NULL),
(250, 'Edward', 'Worrell', 'Edward29466@gmail.com', 'Edward33', 'https://ozgrozer.github.io/100k-faces/0/7/007297.jpg', NULL),
(251, 'Elizabeth', 'Johnson', 'Elizabeth61719@gmail.com', 'Elizabeth33', 'https://ozgrozer.github.io/100k-faces/0/9/009267.jpg', NULL),
(252, 'Michele', 'Cohen', 'Michele@gmail.com', 'Michele33', 'https://ozgrozer.github.io/100k-faces/0/3/003455.jpg', NULL),
(253, 'James', 'Watson', 'James85609@gmail.com', 'James33', 'https://ozgrozer.github.io/100k-faces/0/3/003941.jpg', NULL),
(254, 'Doris', 'Mazzocco', 'Doris@gmail.com', 'Doris33', 'https://ozgrozer.github.io/100k-faces/0/3/003054.jpg', NULL),
(255, 'Christopher', 'James', 'Christopher82673@gmail.com', 'Christopher33', 'https://ozgrozer.github.io/100k-faces/0/8/008890.jpg', NULL),
(256, 'Heather', 'Solarz', 'Heather@gmail.com', 'Heather33', 'https://ozgrozer.github.io/100k-faces/0/0/000425.jpg', NULL),
(257, 'Teresa', 'Flickner', 'Teresa821@gmail.com', 'Teresa33', 'https://ozgrozer.github.io/100k-faces/0/1/001452.jpg', NULL),
(258, 'Polly', 'Cabral', 'Polly@gmail.com', 'Polly33', 'https://ozgrozer.github.io/100k-faces/0/6/006474.jpg', NULL),
(259, 'Roxie', 'Rains', 'Roxie@gmail.com', 'Roxie33', 'https://ozgrozer.github.io/100k-faces/0/3/003813.jpg', NULL),
(260, 'Stuart', 'Hensley', 'Stuart@gmail.com', 'Stuart33', 'https://ozgrozer.github.io/100k-faces/0/2/002796.jpg', NULL),
(261, 'Elsie', 'Wilmore', 'Elsie@gmail.com', 'Elsie33', 'https://ozgrozer.github.io/100k-faces/0/8/008434.jpg', NULL),
(262, 'Bertha', 'Butler', 'Bertha@gmail.com', 'Bertha33', 'https://ozgrozer.github.io/100k-faces/0/5/005131.jpg', NULL),
(263, 'Joanna', 'Thomas', 'Joanna@gmail.com', 'Joanna33', 'https://ozgrozer.github.io/100k-faces/0/5/005206.jpg', NULL),
(264, 'Mary', 'Stickland', 'Mary29526@gmail.com', 'Mary33', 'https://ozgrozer.github.io/100k-faces/0/9/009444.jpg', NULL),
(265, 'James', 'Curbelo', 'James44584@gmail.com', 'James33', 'https://ozgrozer.github.io/100k-faces/0/7/007188.jpg', NULL),
(266, 'Brian', 'Vath', 'Brian@gmail.com', 'Brian33', 'https://ozgrozer.github.io/100k-faces/0/2/002569.jpg', NULL),
(267, 'Miguel', 'Indermuehle', 'Miguel@gmail.com', 'Miguel33', 'https://ozgrozer.github.io/100k-faces/0/8/008347.jpg', NULL),
(268, 'Lynne', 'Conner', 'Lynne@gmail.com', 'Lynne33', 'https://ozgrozer.github.io/100k-faces/0/2/002068.jpg', NULL),
(269, 'Dale', 'Schroeder', 'Dale@gmail.com', 'Dale33', 'https://ozgrozer.github.io/100k-faces/0/7/007158.jpg', NULL),
(270, 'William', 'Holland', 'William84339@gmail.com', 'William33', 'https://ozgrozer.github.io/100k-faces/0/2/002561.jpg', NULL),
(271, 'Betty', 'White', 'Betty@gmail.com', 'Betty33', 'https://ozgrozer.github.io/100k-faces/0/2/002661.jpg', NULL),
(272, 'Maria', 'Cygan', 'Maria4019@gmail.com', 'Maria33', 'https://ozgrozer.github.io/100k-faces/0/3/003740.jpg', NULL),
(273, 'Karole', 'Jacques', 'Karole@gmail.com', 'Karole33', 'https://ozgrozer.github.io/100k-faces/0/2/002213.jpg', NULL),
(274, 'Michael', 'Johnson', 'Michael76290@gmail.com', 'Michael33', 'https://ozgrozer.github.io/100k-faces/0/5/005521.jpg', NULL),
(275, 'Ronald', 'Wren', 'Ronald64095@gmail.com', 'Ronald33', 'https://ozgrozer.github.io/100k-faces/0/9/009676.jpg', NULL),
(276, 'Ronald', 'Clark', 'Ronald72206@gmail.com', 'Ronald33', 'https://ozgrozer.github.io/100k-faces/0/2/002303.jpg', NULL),
(277, 'Mario', 'James', 'Mario@gmail.com', 'Mario33', 'https://ozgrozer.github.io/100k-faces/0/7/007251.jpg', NULL),
(278, 'Angela', 'Moore', 'Angela62092@gmail.com', 'Angela33', 'https://ozgrozer.github.io/100k-faces/0/5/005168.jpg', NULL),
(279, 'Jose', 'Wong', 'Jose6512@gmail.com', 'Jose33', 'https://ozgrozer.github.io/100k-faces/0/2/002829.jpg', NULL),
(280, 'Kim', 'Ward', 'Kim4194@gmail.com', 'Kim33', 'https://ozgrozer.github.io/100k-faces/0/6/006500.jpg', NULL),
(281, 'Keith', 'Bynum', 'Keith@gmail.com', 'Keith33', 'https://ozgrozer.github.io/100k-faces/0/9/009563.jpg', NULL),
(282, 'Mary', 'Chittum', 'Mary29619@gmail.com', 'Mary33', 'https://ozgrozer.github.io/100k-faces/0/6/006495.jpg', NULL),
(283, 'Joseph', 'Jack', 'Joseph@gmail.com', 'Joseph33', 'https://ozgrozer.github.io/100k-faces/0/8/008065.jpg', NULL),
(284, 'David', 'William', 'David30228@gmail.com', 'David33', 'https://ozgrozer.github.io/100k-faces/0/4/004293.jpg', NULL),
(285, 'Candy', 'Caldwell', 'Candy@gmail.com', 'Candy33', 'https://ozgrozer.github.io/100k-faces/0/7/007144.jpg', NULL),
(286, 'Josh', 'Nuzum', 'Josh@gmail.com', 'Josh33', 'https://ozgrozer.github.io/100k-faces/0/6/006036.jpg', NULL),
(287, 'Sherry', 'Hanna', 'Sherry@gmail.com', 'Sherry33', 'https://ozgrozer.github.io/100k-faces/0/4/004486.jpg', NULL),
(288, 'Helen', 'Fray', 'Helen54914@gmail.com', 'Helen33', 'https://ozgrozer.github.io/100k-faces/0/0/000133.jpg', NULL),
(289, 'Nichole', 'Roberts', 'Nichole@gmail.com', 'Nichole33', 'https://ozgrozer.github.io/100k-faces/0/7/007904.jpg', NULL),
(290, 'Samuel', 'Green', 'Samuel@gmail.com', 'Samuel33', 'https://ozgrozer.github.io/100k-faces/0/2/002117.jpg', NULL),
(291, 'Beatrice', 'Chafin', 'Beatrice@gmail.com', 'Beatrice33', 'https://ozgrozer.github.io/100k-faces/0/1/001914.jpg', NULL),
(292, 'Lori', 'Correa', 'Lori@gmail.com', 'Lori33', 'https://ozgrozer.github.io/100k-faces/0/3/003010.jpg', NULL),
(293, 'Brenda', 'Mallon', 'Brenda@gmail.com', 'Brenda33', 'https://ozgrozer.github.io/100k-faces/0/6/006167.jpg', NULL),
(294, 'Mark', 'Bradley', 'Mark@gmail.com', 'Mark33', 'https://ozgrozer.github.io/100k-faces/0/9/009705.jpg', NULL),
(295, 'Sharon', 'Sanchez', 'Sharon@gmail.com', 'Sharon33', 'https://ozgrozer.github.io/100k-faces/0/8/008006.jpg', NULL),
(296, 'Kathie', 'Ford', 'Kathie@gmail.com', 'Kathie33', 'https://ozgrozer.github.io/100k-faces/0/9/009341.jpg', NULL),
(297, 'Virginia', 'Conway', 'Virginia@gmail.com', 'Virginia33', 'https://ozgrozer.github.io/100k-faces/0/4/004305.jpg', NULL),
(298, 'Charles', 'Bryan', 'Charles22897@gmail.com', 'Charles33', 'https://ozgrozer.github.io/100k-faces/0/9/009170.jpg', NULL),
(299, 'Maria', 'Comnick', 'Maria27475@gmail.com', 'Maria33', 'https://ozgrozer.github.io/100k-faces/0/9/009083.jpg', NULL),
(300, 'Casey', 'Wood', 'Casey@gmail.com', 'Casey33', 'https://ozgrozer.github.io/100k-faces/0/9/009765.jpg', NULL),
(301, 'Kayla', 'Mitchell', 'Kayla@gmail.com', 'Kayla33', 'https://ozgrozer.github.io/100k-faces/0/3/003060.jpg', NULL),
(302, 'Betty', 'Harris', 'Betty40578@gmail.com', 'Betty33', 'https://ozgrozer.github.io/100k-faces/0/1/001818.jpg', NULL),
(303, 'Angela', 'Sizemore', 'Angela12386@gmail.com', 'Angela33', 'https://ozgrozer.github.io/100k-faces/0/7/007490.jpg', NULL),
(304, 'Mary', 'Coleman', 'Mary63644@gmail.com', 'Mary33', 'https://ozgrozer.github.io/100k-faces/0/0/000134.jpg', NULL),
(305, 'Laura', 'Gutierrez', 'Laura@gmail.com', 'Laura33', 'https://ozgrozer.github.io/100k-faces/0/2/002351.jpg', NULL),
(306, 'Jose', 'Hardter', 'Jose30850@gmail.com', 'Jose33', 'https://ozgrozer.github.io/100k-faces/0/5/005944.jpg', NULL),
(307, 'Victor', 'Mcwhirter', 'Victor@gmail.com', 'Victor33', 'https://ozgrozer.github.io/100k-faces/0/4/004415.jpg', NULL),
(308, 'Eric', 'Rice', 'Eric@gmail.com', 'Eric33', 'https://ozgrozer.github.io/100k-faces/0/1/001201.jpg', NULL),
(309, 'Tracey', 'Salvaggio', 'Tracey@gmail.com', 'Tracey33', 'https://ozgrozer.github.io/100k-faces/0/1/001343.jpg', NULL),
(310, 'Albert', 'Snedegar', 'Albert16645@gmail.com', 'Albert33', 'https://ozgrozer.github.io/100k-faces/0/4/004411.jpg', NULL),
(311, 'Jeffrey', 'Baker', 'Jeffrey46099@gmail.com', 'Jeffrey33', 'https://ozgrozer.github.io/100k-faces/0/6/006108.jpg', NULL),
(312, 'Brian', 'Cox', 'Brian64324@gmail.com', 'Brian33', 'https://ozgrozer.github.io/100k-faces/0/4/004024.jpg', NULL),
(313, 'Donald', 'Matthews', 'Donald59724@gmail.com', 'Donald33', 'https://ozgrozer.github.io/100k-faces/0/4/004836.jpg', NULL),
(314, 'Mildred', 'Prince', 'Mildred@gmail.com', 'Mildred33', 'https://ozgrozer.github.io/100k-faces/0/9/009158.jpg', NULL),
(315, 'Doug', 'Griffen', 'Doug23468@gmail.com', 'Doug33', 'https://ozgrozer.github.io/100k-faces/0/1/001491.jpg', NULL),
(316, 'Nickolas', 'Bergeron', 'Nickolas@gmail.com', 'Nickolas33', 'https://ozgrozer.github.io/100k-faces/0/2/002573.jpg', NULL),
(317, 'Jeff', 'Biller', 'Jeff@gmail.com', 'Jeff33', 'https://ozgrozer.github.io/100k-faces/0/0/000735.jpg', NULL),
(318, 'John', 'Jackson', 'John1097@gmail.com', 'John33', 'https://ozgrozer.github.io/100k-faces/0/7/007047.jpg', NULL),
(319, 'Daniel', 'Sanchez', 'Daniel85099@gmail.com', 'Daniel33', 'https://ozgrozer.github.io/100k-faces/0/5/005463.jpg', NULL),
(320, 'Donnie', 'Paull', 'Donnie@gmail.com', 'Donnie33', 'https://ozgrozer.github.io/100k-faces/0/8/008098.jpg', NULL),
(321, 'Stephanie', 'Shinn', 'Stephanie@gmail.com', 'Stephanie33', 'https://ozgrozer.github.io/100k-faces/0/0/000024.jpg', NULL),
(322, 'Loretta', 'Banner', 'Loretta@gmail.com', 'Loretta33', 'https://ozgrozer.github.io/100k-faces/0/4/004635.jpg', NULL),
(323, 'Ruth', 'Haist', 'Ruth@gmail.com', 'Ruth33', 'https://ozgrozer.github.io/100k-faces/0/7/007395.jpg', NULL),
(324, 'Helen', 'Perrine', 'Helen94563@gmail.com', 'Helen33', 'https://ozgrozer.github.io/100k-faces/0/8/008121.jpg', NULL),
(325, 'Vickie', 'Johnson', 'Vickie@gmail.com', 'Vickie33', 'https://ozgrozer.github.io/100k-faces/0/5/005410.jpg', NULL),
(326, 'Christopher', 'Wigley', 'Christopher26999@gmail.com', 'Christopher33', 'https://ozgrozer.github.io/100k-faces/0/3/003691.jpg', NULL),
(327, 'Joe', 'Dulin', 'Joe@gmail.com', 'Joe33', 'https://ozgrozer.github.io/100k-faces/0/5/005240.jpg', NULL),
(328, 'Ellen', 'Ross', 'Ellen@gmail.com', 'Ellen33', 'https://ozgrozer.github.io/100k-faces/0/2/002696.jpg', NULL),
(329, 'Shirley', 'Avila', 'Shirley5895@gmail.com', 'Shirley33', 'https://ozgrozer.github.io/100k-faces/0/8/008635.jpg', NULL),
(330, 'Yuko', 'Becker', 'Yuko@gmail.com', 'Yuko33', 'https://ozgrozer.github.io/100k-faces/0/6/006141.jpg', NULL),
(331, 'Ariana', 'Corbin', 'Ariana@gmail.com', 'Ariana33', 'https://ozgrozer.github.io/100k-faces/0/2/002871.jpg', NULL),
(332, 'Amelia', 'Conley', 'Amelia@gmail.com', 'Amelia33', 'https://ozgrozer.github.io/100k-faces/0/4/004085.jpg', NULL),
(333, 'David', 'Holman', 'David95215@gmail.com', 'David33', 'https://ozgrozer.github.io/100k-faces/0/5/005670.jpg', NULL),
(334, 'William', 'Stahlman', 'William67755@gmail.com', 'William33', 'https://ozgrozer.github.io/100k-faces/0/8/008640.jpg', NULL),
(335, 'Daniel', 'Loveland', 'Daniel85737@gmail.com', 'Daniel33', 'https://ozgrozer.github.io/100k-faces/0/5/005569.jpg', NULL),
(336, 'Carlotta', 'Hayward', 'Carlotta@gmail.com', 'Carlotta33', 'https://ozgrozer.github.io/100k-faces/0/8/008638.jpg', NULL),
(337, 'Robert', 'Rodger', 'Robert24805@gmail.com', 'Robert33', 'https://ozgrozer.github.io/100k-faces/0/0/000143.jpg', NULL),
(338, 'Raquel', 'Petit', 'Raquel@gmail.com', 'Raquel33', 'https://ozgrozer.github.io/100k-faces/0/9/009344.jpg', NULL),
(339, 'Antonetta', 'Barnes', 'Antonetta@gmail.com', 'Antonetta33', 'https://ozgrozer.github.io/100k-faces/0/0/000192.jpg', NULL),
(340, 'Irma', 'Payne', 'Irma@gmail.com', 'Irma33', 'https://ozgrozer.github.io/100k-faces/0/8/008303.jpg', NULL),
(341, 'William', 'Schmalz', 'William9713@gmail.com', 'William33', 'https://ozgrozer.github.io/100k-faces/0/6/006291.jpg', NULL),
(342, 'Brian', 'Gerke', 'Brian10020@gmail.com', 'Brian33', 'https://ozgrozer.github.io/100k-faces/0/3/003687.jpg', NULL),
(343, 'Daniel', 'Fee', 'Daniel83179@gmail.com', 'Daniel33', 'https://ozgrozer.github.io/100k-faces/0/0/000957.jpg', NULL),
(344, 'Casey', 'Land', 'Casey36634@gmail.com', 'Casey33', 'https://ozgrozer.github.io/100k-faces/0/9/009726.jpg', NULL),
(345, 'Betty', 'Woon', 'Betty92004@gmail.com', 'Betty33', 'https://ozgrozer.github.io/100k-faces/0/1/001012.jpg', NULL),
(346, 'Valorie', 'Talamantes', 'Valorie@gmail.com', 'Valorie33', 'https://ozgrozer.github.io/100k-faces/0/1/001796.jpg', NULL),
(347, 'Pat', 'Carrera', 'Pat@gmail.com', 'Pat33', 'https://ozgrozer.github.io/100k-faces/0/4/004234.jpg', NULL),
(348, 'Peter', 'Curtis', 'Peter23146@gmail.com', 'Peter33', 'https://ozgrozer.github.io/100k-faces/0/2/002079.jpg', NULL),
(349, 'Jacinto', 'Tacker', 'Jacinto@gmail.com', 'Jacinto33', 'https://ozgrozer.github.io/100k-faces/0/2/002680.jpg', NULL),
(350, 'Amy', 'Love', 'Amy@gmail.com', 'Amy33', 'https://ozgrozer.github.io/100k-faces/0/9/009482.jpg', NULL),
(351, 'April', 'Chapman', 'April67895@gmail.com', 'April33', 'https://ozgrozer.github.io/100k-faces/0/1/001887.jpg', NULL),
(352, 'Penny', 'Baker', 'Penny@gmail.com', 'Penny33', 'https://ozgrozer.github.io/100k-faces/0/3/003384.jpg', NULL),
(353, 'Jeffrey', 'Spalding', 'Jeffrey93485@gmail.com', 'Jeffrey33', 'https://ozgrozer.github.io/100k-faces/0/5/005176.jpg', NULL),
(354, 'Charles', 'Reyes', 'Charles96292@gmail.com', 'Charles33', 'https://ozgrozer.github.io/100k-faces/0/2/002614.jpg', NULL),
(355, 'Suzanne', 'Plummer', 'Suzanne@gmail.com', 'Suzanne33', 'https://ozgrozer.github.io/100k-faces/0/9/009043.jpg', NULL),
(356, 'Helen', 'Cordell', 'Helen74029@gmail.com', 'Helen33', 'https://ozgrozer.github.io/100k-faces/0/7/007751.jpg', NULL),
(357, 'Rolande', 'Rickard', 'Rolande@gmail.com', 'Rolande33', 'https://ozgrozer.github.io/100k-faces/0/2/002907.jpg', NULL),
(358, 'Bradley', 'Glory', 'Bradley@gmail.com', 'Bradley33', 'https://ozgrozer.github.io/100k-faces/0/1/001920.jpg', NULL),
(359, 'Howard', 'Davenport', 'Howard@gmail.com', 'Howard33', 'https://ozgrozer.github.io/100k-faces/0/8/008530.jpg', NULL),
(360, 'Clarence', 'Denton', 'Clarence70001@gmail.com', 'Clarence33', 'https://ozgrozer.github.io/100k-faces/0/0/000111.jpg', NULL),
(361, 'Garry', 'Mckenzie', 'Garry73431@gmail.com', 'Garry33', 'https://ozgrozer.github.io/100k-faces/0/5/005482.jpg', NULL),
(362, 'Kathy', 'Willson', 'Kathy@gmail.com', 'Kathy33', 'https://ozgrozer.github.io/100k-faces/0/2/002960.jpg', NULL),
(363, 'Donald', 'Lahey', 'Donald17976@gmail.com', 'Donald33', 'https://ozgrozer.github.io/100k-faces/0/7/007537.jpg', NULL),
(364, 'Thomas', 'Mackey', 'Thomas48506@gmail.com', 'Thomas33', 'https://ozgrozer.github.io/100k-faces/0/8/008790.jpg', NULL),
(365, 'Julian', 'Royal', 'Julian@gmail.com', 'Julian33', 'https://ozgrozer.github.io/100k-faces/0/9/009726.jpg', NULL),
(366, 'Jasmin', 'Hall', 'Jasmin@gmail.com', 'Jasmin33', 'https://ozgrozer.github.io/100k-faces/0/2/002826.jpg', NULL),
(367, 'Blanca', 'Frank', 'Blanca@gmail.com', 'Blanca33', 'https://ozgrozer.github.io/100k-faces/0/7/007479.jpg', NULL),
(368, 'Homer', 'Holland', 'Homer@gmail.com', 'Homer33', 'https://ozgrozer.github.io/100k-faces/0/2/002827.jpg', NULL),
(369, 'Ariel', 'Bartolet', 'Ariel@gmail.com', 'Ariel33', 'https://ozgrozer.github.io/100k-faces/0/5/005359.jpg', NULL),
(370, 'Mitchell', 'Paquette', 'Mitchell@gmail.com', 'Mitchell33', 'https://ozgrozer.github.io/100k-faces/0/4/004644.jpg', NULL),
(371, 'Lewis', 'Gomez', 'Lewis@gmail.com', 'Lewis33', 'https://ozgrozer.github.io/100k-faces/0/5/005513.jpg', NULL),
(372, 'Angela', 'Yancey', 'Angela30284@gmail.com', 'Angela33', 'https://ozgrozer.github.io/100k-faces/0/6/006023.jpg', NULL),
(373, 'Rosalyn', 'Lewis', 'Rosalyn@gmail.com', 'Rosalyn33', 'https://ozgrozer.github.io/100k-faces/0/9/009084.jpg', NULL),
(374, 'Rebecca', 'Towne', 'Rebecca92574@gmail.com', 'Rebecca33', 'https://ozgrozer.github.io/100k-faces/0/2/002092.jpg', NULL),
(375, 'Tamara', 'Smith', 'Tamara@gmail.com', 'Tamara33', 'https://ozgrozer.github.io/100k-faces/0/4/004139.jpg', NULL),
(376, 'Carol', 'Ryan', 'Carol57454@gmail.com', 'Carol33', 'https://ozgrozer.github.io/100k-faces/0/6/006339.jpg', NULL),
(377, 'Kerri', 'Vanakin', 'Kerri@gmail.com', 'Kerri33', 'https://ozgrozer.github.io/100k-faces/0/0/000359.jpg', NULL),
(378, 'Anna', 'Ramon', 'Anna65985@gmail.com', 'Anna33', 'https://ozgrozer.github.io/100k-faces/0/9/009220.jpg', NULL),
(379, 'Kelly', 'Spitler', 'Kelly@gmail.com', 'Kelly33', 'https://ozgrozer.github.io/100k-faces/0/7/007374.jpg', NULL),
(380, 'Alfonso', 'Eike', 'Alfonso@gmail.com', 'Alfonso33', 'https://ozgrozer.github.io/100k-faces/0/9/009771.jpg', NULL),
(381, 'Roslyn', 'Williams', 'Roslyn@gmail.com', 'Roslyn33', 'https://ozgrozer.github.io/100k-faces/0/3/003396.jpg', NULL),
(382, 'Sharon', 'Hinds', 'Sharon86073@gmail.com', 'Sharon33', 'https://ozgrozer.github.io/100k-faces/0/2/002255.jpg', NULL),
(383, 'Evangeline', 'Morales', 'Evangeline@gmail.com', 'Evangeline33', 'https://ozgrozer.github.io/100k-faces/0/2/002500.jpg', NULL),
(384, 'James', 'Pickens', 'James20406@gmail.com', 'James33', 'https://ozgrozer.github.io/100k-faces/0/9/009725.jpg', NULL),
(385, 'Daniele', 'Weeks', 'Daniele@gmail.com', 'Daniele33', 'https://ozgrozer.github.io/100k-faces/0/9/009857.jpg', NULL),
(386, 'Gregory', 'Cartwright', 'Gregory@gmail.com', 'Gregory33', 'https://ozgrozer.github.io/100k-faces/0/5/005957.jpg', NULL),
(387, 'Haley', 'Rosado', 'Haley@gmail.com', 'Haley33', 'https://ozgrozer.github.io/100k-faces/0/9/009903.jpg', NULL),
(388, 'Toni', 'Valencia', 'Toni88425@gmail.com', 'Toni33', 'https://ozgrozer.github.io/100k-faces/0/8/008572.jpg', NULL),
(389, 'David', 'Ragland', 'David28677@gmail.com', 'David33', 'https://ozgrozer.github.io/100k-faces/0/2/002667.jpg', NULL),
(390, 'Dale', 'Lapierre', 'Dale41779@gmail.com', 'Dale33', 'https://ozgrozer.github.io/100k-faces/0/4/004199.jpg', NULL),
(391, 'Levi', 'Taylor', 'Levi@gmail.com', 'Levi33', 'https://ozgrozer.github.io/100k-faces/0/8/008242.jpg', NULL),
(392, 'Joseph', 'Leigland', 'Joseph98056@gmail.com', 'Joseph33', 'https://ozgrozer.github.io/100k-faces/0/6/006416.jpg', NULL),
(393, 'Stevie', 'Ho', 'Stevie@gmail.com', 'Stevie33', 'https://ozgrozer.github.io/100k-faces/0/1/001371.jpg', NULL),
(394, 'Dominick', 'Dam', 'Dominick@gmail.com', 'Dominick33', 'https://ozgrozer.github.io/100k-faces/0/4/004406.jpg', NULL),
(395, 'Rosanna', 'Waugh', 'Rosanna@gmail.com', 'Rosanna33', 'https://ozgrozer.github.io/100k-faces/0/4/004089.jpg', NULL),
(396, 'Christopher', 'Henderson', 'Christopher5934@gmail.com', 'Christopher33', 'https://ozgrozer.github.io/100k-faces/0/7/007539.jpg', NULL),
(397, 'Larry', 'Williams', 'Larry27928@gmail.com', 'Larry33', 'https://ozgrozer.github.io/100k-faces/0/1/001783.jpg', NULL),
(398, 'Michael', 'Bacon', 'Michael310@gmail.com', 'Michael33', 'https://ozgrozer.github.io/100k-faces/0/4/004703.jpg', NULL),
(399, 'Joseph', 'Berlinski', 'Joseph91442@gmail.com', 'Joseph33', 'https://ozgrozer.github.io/100k-faces/0/6/006081.jpg', NULL),
(400, 'January', 'Rogers', 'January@gmail.com', 'January33', 'https://ozgrozer.github.io/100k-faces/0/8/008520.jpg', NULL),
(401, 'Vera', 'Seals', 'Vera@gmail.com', 'Vera33', 'https://ozgrozer.github.io/100k-faces/0/3/003796.jpg', NULL),
(402, 'Natasha', 'Pfeffer', 'Natasha@gmail.com', 'Natasha33', 'https://ozgrozer.github.io/100k-faces/0/0/000666.jpg', NULL),
(403, 'Eugene', 'Crawford', 'Eugene@gmail.com', 'Eugene33', 'https://ozgrozer.github.io/100k-faces/0/2/002086.jpg', NULL),
(404, 'Lisa', 'Padgett', 'Lisa@gmail.com', 'Lisa33', 'https://ozgrozer.github.io/100k-faces/0/8/008219.jpg', NULL),
(405, 'David', 'Hotchkiss', 'David57573@gmail.com', 'David33', 'https://ozgrozer.github.io/100k-faces/0/7/007483.jpg', NULL),
(406, 'Calvin', 'Barker', 'Calvin@gmail.com', 'Calvin33', 'https://ozgrozer.github.io/100k-faces/0/2/002455.jpg', NULL),
(407, 'Paul', 'Born', 'Paul12988@gmail.com', 'Paul33', 'https://ozgrozer.github.io/100k-faces/0/2/002036.jpg', NULL),
(408, 'Anne', 'Newkirk', 'Anne@gmail.com', 'Anne33', 'https://ozgrozer.github.io/100k-faces/0/6/006855.jpg', NULL),
(409, 'Josephine', 'Mendez', 'Josephine@gmail.com', 'Josephine33', 'https://ozgrozer.github.io/100k-faces/0/7/007777.jpg', NULL),
(410, 'Richard', 'Laguna', 'Richard79011@gmail.com', 'Richard33', 'https://ozgrozer.github.io/100k-faces/0/8/008159.jpg', NULL),
(411, 'Daniel', 'Stead', 'Daniel69013@gmail.com', 'Daniel33', 'https://ozgrozer.github.io/100k-faces/0/0/000284.jpg', NULL),
(412, 'Sandra', 'Marquez', 'Sandra53194@gmail.com', 'Sandra33', 'https://ozgrozer.github.io/100k-faces/0/4/004724.jpg', NULL),
(413, 'Sarah', 'Mendias', 'Sarah61375@gmail.com', 'Sarah33', 'https://ozgrozer.github.io/100k-faces/0/4/004297.jpg', NULL),
(414, 'James', 'Williams', 'James99788@gmail.com', 'James33', 'https://ozgrozer.github.io/100k-faces/0/5/005558.jpg', NULL);
INSERT INTO `USER` (`ID_USER`, `FIRSTNAME`, `LASTNAME`, `EMAIL`, `PASSWORD`, `AVATAR`, `TOKEN`) VALUES
(415, 'Kayla', 'Cordell', 'Kayla50822@gmail.com', 'Kayla33', 'https://ozgrozer.github.io/100k-faces/0/8/008247.jpg', NULL),
(416, 'Jeffery', 'Kittrell', 'Jeffery35299@gmail.com', 'Jeffery33', 'https://ozgrozer.github.io/100k-faces/0/4/004305.jpg', NULL),
(417, 'Hector', 'Brown', 'Hector@gmail.com', 'Hector33', 'https://ozgrozer.github.io/100k-faces/0/9/009050.jpg', NULL),
(418, 'Kenneth', 'Crane', 'Kenneth27583@gmail.com', 'Kenneth33', 'https://ozgrozer.github.io/100k-faces/0/2/002415.jpg', NULL),
(419, 'Esther', 'Sampson', 'Esther@gmail.com', 'Esther33', 'https://ozgrozer.github.io/100k-faces/0/8/008276.jpg', NULL),
(420, 'Eugene', 'Murray', 'Eugene47149@gmail.com', 'Eugene33', 'https://ozgrozer.github.io/100k-faces/0/0/000130.jpg', NULL),
(421, 'Aubrey', 'Higgins', 'Aubrey@gmail.com', 'Aubrey33', 'https://ozgrozer.github.io/100k-faces/0/4/004575.jpg', NULL),
(422, 'Todd', 'Sanchez', 'Todd@gmail.com', 'Todd33', 'https://ozgrozer.github.io/100k-faces/0/6/006053.jpg', NULL),
(423, 'Jessie', 'Massey', 'Jessie@gmail.com', 'Jessie33', 'https://ozgrozer.github.io/100k-faces/0/1/001119.jpg', NULL),
(424, 'Emilia', 'Mccarthy', 'Emilia@gmail.com', 'Emilia33', 'https://ozgrozer.github.io/100k-faces/0/2/002675.jpg', NULL),
(425, 'Nicholas', 'Jones', 'Nicholas@gmail.com', 'Nicholas33', 'https://ozgrozer.github.io/100k-faces/0/7/007497.jpg', NULL),
(426, 'Scott', 'Childress', 'Scott@gmail.com', 'Scott33', 'https://ozgrozer.github.io/100k-faces/0/5/005468.jpg', NULL),
(427, 'Louise', 'Ross', 'Louise@gmail.com', 'Louise33', 'https://ozgrozer.github.io/100k-faces/0/1/001905.jpg', NULL),
(428, 'Shaun', 'Green', 'Shaun@gmail.com', 'Shaun33', 'https://ozgrozer.github.io/100k-faces/0/6/006439.jpg', NULL),
(429, 'Patricia', 'Hepfer', 'Patricia68104@gmail.com', 'Patricia33', 'https://ozgrozer.github.io/100k-faces/0/9/009280.jpg', NULL),
(430, 'Jennifer', 'Baker', 'Jennifer@gmail.com', 'Jennifer33', 'https://ozgrozer.github.io/100k-faces/0/1/001459.jpg', NULL),
(431, 'Maggie', 'Caligiuri', 'Maggie@gmail.com', 'Maggie33', 'https://ozgrozer.github.io/100k-faces/0/2/002325.jpg', NULL),
(432, 'Audrey', 'Heminger', 'Audrey@gmail.com', 'Audrey33', 'https://ozgrozer.github.io/100k-faces/0/9/009983.jpg', NULL),
(433, 'Hoyt', 'Stark', 'Hoyt@gmail.com', 'Hoyt33', 'https://ozgrozer.github.io/100k-faces/0/4/004746.jpg', NULL),
(434, 'Clair', 'Wooten', 'Clair@gmail.com', 'Clair33', 'https://ozgrozer.github.io/100k-faces/0/5/005797.jpg', NULL),
(435, 'Ashley', 'Isaacs', 'Ashley76149@gmail.com', 'Ashley33', 'https://ozgrozer.github.io/100k-faces/0/8/008350.jpg', NULL),
(436, 'Donnie', 'Taylor', 'Donnie89903@gmail.com', 'Donnie33', 'https://ozgrozer.github.io/100k-faces/0/2/002184.jpg', NULL),
(437, 'Carrie', 'Birdsall', 'Carrie@gmail.com', 'Carrie33', 'https://ozgrozer.github.io/100k-faces/0/0/000872.jpg', NULL),
(438, 'Timothy', 'Bethune', 'Timothy64092@gmail.com', 'Timothy33', 'https://ozgrozer.github.io/100k-faces/0/0/000854.jpg', NULL),
(439, 'Rogelio', 'Simpson', 'Rogelio@gmail.com', 'Rogelio33', 'https://ozgrozer.github.io/100k-faces/0/7/007601.jpg', NULL),
(440, 'Gary', 'Fox', 'Gary24497@gmail.com', 'Gary33', 'https://ozgrozer.github.io/100k-faces/0/0/000078.jpg', NULL),
(441, 'Helena', 'Dobbs', 'Helena@gmail.com', 'Helena33', 'https://ozgrozer.github.io/100k-faces/0/0/000754.jpg', NULL),
(442, 'Cheri', 'Schwindt', 'Cheri@gmail.com', 'Cheri33', 'https://ozgrozer.github.io/100k-faces/0/4/004005.jpg', NULL),
(443, 'Robert', 'George', 'Robert54182@gmail.com', 'Robert33', 'https://ozgrozer.github.io/100k-faces/0/2/002517.jpg', NULL),
(444, 'John', 'Gigantino', 'John72985@gmail.com', 'John33', 'https://ozgrozer.github.io/100k-faces/0/0/000657.jpg', NULL),
(445, 'Charles', 'Dews', 'Charles80157@gmail.com', 'Charles33', 'https://ozgrozer.github.io/100k-faces/0/2/002355.jpg', NULL),
(446, 'Donnie', 'Holliday', 'Donnie17214@gmail.com', 'Donnie33', 'https://ozgrozer.github.io/100k-faces/0/8/008259.jpg', NULL),
(447, 'Christopher', 'Timmons', 'Christopher12898@gmail.com', 'Christopher33', 'https://ozgrozer.github.io/100k-faces/0/5/005498.jpg', NULL),
(448, 'Kenneth', 'Abron', 'Kenneth54122@gmail.com', 'Kenneth33', 'https://ozgrozer.github.io/100k-faces/0/7/007981.jpg', NULL),
(449, 'Celeste', 'Reynolds', 'Celeste@gmail.com', 'Celeste33', 'https://ozgrozer.github.io/100k-faces/0/1/001343.jpg', NULL),
(450, 'Paula', 'King', 'Paula@gmail.com', 'Paula33', 'https://ozgrozer.github.io/100k-faces/0/8/008897.jpg', NULL),
(451, 'Robert', 'Gadison', 'Robert71799@gmail.com', 'Robert33', 'https://ozgrozer.github.io/100k-faces/0/3/003620.jpg', NULL),
(452, 'Donald', 'Wiley', 'Donald72720@gmail.com', 'Donald33', 'https://ozgrozer.github.io/100k-faces/0/9/009892.jpg', NULL),
(453, 'Allen', 'Taft', 'Allen@gmail.com', 'Allen33', 'https://ozgrozer.github.io/100k-faces/0/3/003288.jpg', NULL),
(454, 'Louis', 'Quesnell', 'Louis@gmail.com', 'Louis33', 'https://ozgrozer.github.io/100k-faces/0/9/009230.jpg', NULL),
(455, 'Irene', 'Newlin', 'Irene@gmail.com', 'Irene33', 'https://ozgrozer.github.io/100k-faces/0/0/000562.jpg', NULL),
(456, 'Terri', 'Ivy', 'Terri@gmail.com', 'Terri33', 'https://ozgrozer.github.io/100k-faces/0/8/008310.jpg', NULL),
(457, 'Richard', 'Saleha', 'Richard69399@gmail.com', 'Richard33', 'https://ozgrozer.github.io/100k-faces/0/7/007458.jpg', NULL),
(458, 'Raymond', 'Bills', 'Raymond44780@gmail.com', 'Raymond33', 'https://ozgrozer.github.io/100k-faces/0/3/003675.jpg', NULL),
(459, 'Teresa', 'Kim', 'Teresa79856@gmail.com', 'Teresa33', 'https://ozgrozer.github.io/100k-faces/0/4/004161.jpg', NULL),
(460, 'Chester', 'Lyons', 'Chester@gmail.com', 'Chester33', 'https://ozgrozer.github.io/100k-faces/0/2/002536.jpg', NULL),
(461, 'Daniel', 'Gowdy', 'Daniel50898@gmail.com', 'Daniel33', 'https://ozgrozer.github.io/100k-faces/0/7/007149.jpg', NULL),
(462, 'Joseph', 'Williams', 'Joseph58001@gmail.com', 'Joseph33', 'https://ozgrozer.github.io/100k-faces/0/3/003634.jpg', NULL),
(463, 'Valerie', 'Brewer', 'Valerie@gmail.com', 'Valerie33', 'https://ozgrozer.github.io/100k-faces/0/5/005830.jpg', NULL),
(464, 'Stephen', 'Kingsbury', 'Stephen@gmail.com', 'Stephen33', 'https://ozgrozer.github.io/100k-faces/0/4/004052.jpg', NULL),
(465, 'Sylvia', 'Louis', 'Sylvia@gmail.com', 'Sylvia33', 'https://ozgrozer.github.io/100k-faces/0/3/003612.jpg', NULL),
(466, 'Christina', 'Mazza', 'Christina74286@gmail.com', 'Christina33', 'https://ozgrozer.github.io/100k-faces/0/4/004166.jpg', NULL),
(467, 'Betty', 'Velis', 'Betty17683@gmail.com', 'Betty33', 'https://ozgrozer.github.io/100k-faces/0/6/006237.jpg', NULL),
(468, 'Herminia', 'Witty', 'Herminia@gmail.com', 'Herminia33', 'https://ozgrozer.github.io/100k-faces/0/0/000043.jpg', NULL),
(469, 'Janet', 'Little', 'Janet@gmail.com', 'Janet33', 'https://ozgrozer.github.io/100k-faces/0/4/004826.jpg', NULL),
(470, 'Edgar', 'Ovall', 'Edgar@gmail.com', 'Edgar33', 'https://ozgrozer.github.io/100k-faces/0/9/009085.jpg', NULL),
(471, 'Rosemary', 'Watts', 'Rosemary@gmail.com', 'Rosemary33', 'https://ozgrozer.github.io/100k-faces/0/3/003280.jpg', NULL),
(472, 'Bernice', 'Martin', 'Bernice@gmail.com', 'Bernice33', 'https://ozgrozer.github.io/100k-faces/0/3/003342.jpg', NULL),
(473, 'James', 'James', 'James81515@gmail.com', 'James33', 'https://ozgrozer.github.io/100k-faces/0/9/009636.jpg', NULL),
(474, 'Chris', 'Krueger', 'Chris8018@gmail.com', 'Chris33', 'https://ozgrozer.github.io/100k-faces/0/6/006357.jpg', NULL),
(475, 'Lera', 'Miller', 'Lera@gmail.com', 'Lera33', 'https://ozgrozer.github.io/100k-faces/0/8/008519.jpg', NULL),
(476, 'Stephanie', 'Eggers', 'Stephanie68894@gmail.com', 'Stephanie33', 'https://ozgrozer.github.io/100k-faces/0/0/000702.jpg', NULL),
(477, 'Scott', 'Brown', 'Scott66904@gmail.com', 'Scott33', 'https://ozgrozer.github.io/100k-faces/0/6/006953.jpg', NULL),
(478, 'Timika', 'Vickery', 'Timika@gmail.com', 'Timika33', 'https://ozgrozer.github.io/100k-faces/0/3/003917.jpg', NULL),
(479, 'Marion', 'Stanley', 'Marion@gmail.com', 'Marion33', 'https://ozgrozer.github.io/100k-faces/0/1/001528.jpg', NULL),
(480, 'Maria', 'Hinton', 'Maria86864@gmail.com', 'Maria33', 'https://ozgrozer.github.io/100k-faces/0/7/007152.jpg', NULL),
(481, 'Tara', 'Ellis', 'Tara@gmail.com', 'Tara33', 'https://ozgrozer.github.io/100k-faces/0/4/004138.jpg', NULL),
(482, 'Dorothy', 'Casey', 'Dorothy94390@gmail.com', 'Dorothy33', 'https://ozgrozer.github.io/100k-faces/0/4/004228.jpg', NULL),
(483, 'Betty', 'Caldwell', 'Betty60396@gmail.com', 'Betty33', 'https://ozgrozer.github.io/100k-faces/0/6/006515.jpg', NULL),
(484, 'John', 'Carter', 'John81200@gmail.com', 'John33', 'https://ozgrozer.github.io/100k-faces/0/9/009863.jpg', NULL),
(485, 'Glenda', 'Crissman', 'Glenda90908@gmail.com', 'Glenda33', 'https://ozgrozer.github.io/100k-faces/0/0/000531.jpg', NULL),
(486, 'Casey', 'Buske', 'Casey28158@gmail.com', 'Casey33', 'https://ozgrozer.github.io/100k-faces/0/9/009571.jpg', NULL),
(487, 'Paula', 'Downey', 'Paula49154@gmail.com', 'Paula33', 'https://ozgrozer.github.io/100k-faces/0/4/004964.jpg', NULL),
(488, 'Selena', 'Frame', 'Selena@gmail.com', 'Selena33', 'https://ozgrozer.github.io/100k-faces/0/0/000494.jpg', NULL),
(489, 'Mary', 'Rodriguez', 'Mary8962@gmail.com', 'Mary33', 'https://ozgrozer.github.io/100k-faces/0/4/004138.jpg', NULL),
(490, 'Matthew', 'Jewell', 'Matthew@gmail.com', 'Matthew33', 'https://ozgrozer.github.io/100k-faces/0/9/009836.jpg', NULL),
(491, 'Mary', 'George', 'Mary89335@gmail.com', 'Mary33', 'https://ozgrozer.github.io/100k-faces/0/4/004852.jpg', NULL),
(492, 'Marcos', 'Shirey', 'Marcos@gmail.com', 'Marcos33', 'https://ozgrozer.github.io/100k-faces/0/5/005437.jpg', NULL),
(493, 'Aida', 'Sanchez', 'Aida@gmail.com', 'Aida33', 'https://ozgrozer.github.io/100k-faces/0/5/005754.jpg', NULL),
(494, 'Hazel', 'Martinez', 'Hazel@gmail.com', 'Hazel33', 'https://ozgrozer.github.io/100k-faces/0/1/001876.jpg', NULL),
(495, 'Aaron', 'Polk', 'Aaron@gmail.com', 'Aaron33', 'https://ozgrozer.github.io/100k-faces/0/9/009716.jpg', NULL),
(496, 'Marcia', 'Brown', 'Marcia47943@gmail.com', 'Marcia33', 'https://ozgrozer.github.io/100k-faces/0/6/006196.jpg', NULL),
(497, 'Jessica', 'Trevino', 'Jessica@gmail.com', 'Jessica33', 'https://ozgrozer.github.io/100k-faces/0/5/005987.jpg', NULL),
(498, 'Adeline', 'Watson', 'Adeline@gmail.com', 'Adeline33', 'https://ozgrozer.github.io/100k-faces/0/2/002130.jpg', NULL),
(499, 'Mark', 'Murray', 'Mark11585@gmail.com', 'Mark33', 'https://ozgrozer.github.io/100k-faces/0/7/007125.jpg', NULL),
(500, 'Colette', 'Johnen', 'colette@gmail.com', 'colette', 'https://ozgrozer.github.io/100k-faces/0/2/002134.jpg', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `WWRITE`
--

CREATE TABLE `WWRITE` (
  `ID_AUTHOR` bigint(4) NOT NULL,
  `ID_BOOK` bigint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `WWRITE`
--

INSERT INTO `WWRITE` (`ID_AUTHOR`, `ID_BOOK`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 18),
(2, 19),
(2, 20),
(3, 11),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(3, 19),
(3, 20),
(3, 21),
(4, 13),
(5, 15),
(6, 16),
(7, 17),
(8, 22),
(8, 23),
(8, 24),
(8, 25),
(8, 26),
(8, 27),
(8, 28),
(9, 25),
(10, 29),
(10, 30),
(10, 34),
(10, 35),
(11, 31),
(12, 32),
(12, 125),
(13, 32),
(14, 36),
(14, 37),
(14, 38),
(14, 39),
(14, 40),
(14, 41),
(14, 42),
(15, 36),
(16, 43),
(16, 44),
(16, 45),
(16, 46),
(16, 47),
(16, 48),
(16, 49),
(17, 50),
(17, 51),
(17, 52),
(17, 56),
(18, 57),
(18, 58),
(18, 59),
(18, 62),
(19, 60),
(20, 61),
(21, 61),
(22, 62),
(23, 62),
(24, 63),
(25, 64),
(25, 66),
(25, 67),
(25, 68),
(25, 69),
(25, 70),
(26, 65),
(27, 65),
(28, 69),
(29, 71),
(29, 72),
(29, 73),
(29, 74),
(29, 75),
(29, 76),
(29, 77),
(30, 78),
(30, 79),
(30, 80),
(30, 81),
(30, 82),
(30, 83),
(30, 84),
(31, 78),
(32, 85),
(32, 86),
(32, 87),
(32, 88),
(32, 89),
(32, 90),
(32, 91),
(33, 92),
(33, 93),
(33, 94),
(33, 95),
(33, 96),
(33, 97),
(33, 98),
(34, 99),
(35, 99),
(36, 100),
(36, 101),
(36, 102),
(36, 103),
(36, 104),
(36, 105),
(37, 105),
(38, 106),
(38, 107),
(38, 110),
(38, 111),
(38, 112),
(39, 108),
(39, 109),
(40, 113),
(40, 114),
(40, 115),
(40, 116),
(40, 117),
(40, 118),
(40, 119),
(41, 119),
(42, 119),
(43, 120),
(44, 121),
(45, 121),
(45, 122),
(45, 123),
(45, 124),
(45, 125),
(45, 126),
(46, 127),
(46, 128),
(46, 129),
(46, 130),
(46, 131),
(46, 132),
(47, 128),
(48, 133),
(49, 134),
(49, 135),
(49, 136),
(49, 137),
(49, 139),
(49, 140),
(49, 141),
(49, 142),
(49, 143),
(49, 144),
(49, 145),
(49, 146),
(49, 147),
(50, 138),
(51, 148),
(51, 149),
(51, 151),
(51, 152),
(51, 154),
(51, 155),
(51, 157),
(51, 160),
(51, 161),
(52, 150),
(53, 150),
(54, 152),
(54, 157),
(55, 153),
(56, 153),
(56, 156),
(57, 154),
(58, 157),
(59, 158),
(60, 158),
(61, 159),
(62, 162),
(62, 163),
(62, 164),
(62, 165),
(62, 166),
(62, 167),
(62, 169),
(62, 170),
(63, 166),
(63, 170),
(63, 172),
(64, 168),
(65, 171),
(65, 173),
(66, 174),
(67, 175),
(68, 176),
(68, 177),
(68, 178),
(68, 180),
(68, 181),
(68, 182),
(68, 183),
(68, 184),
(68, 185),
(68, 186),
(68, 187),
(68, 188),
(69, 179),
(70, 180),
(71, 187),
(72, 189),
(73, 190),
(73, 191),
(73, 192),
(74, 193),
(74, 194),
(74, 197),
(75, 195),
(75, 199),
(75, 200),
(75, 201),
(76, 196),
(77, 196),
(78, 198),
(79, 202),
(80, 202),
(81, 202),
(82, 203),
(83, 204),
(83, 218),
(83, 221),
(83, 222),
(83, 223),
(83, 224),
(83, 226),
(83, 228),
(83, 229),
(83, 230),
(84, 204),
(84, 205),
(84, 206),
(84, 207),
(84, 209),
(84, 210),
(84, 211),
(84, 212),
(84, 213),
(84, 214),
(84, 215),
(84, 216),
(84, 217),
(84, 218),
(85, 208),
(86, 214),
(87, 219),
(88, 220),
(89, 223),
(89, 226),
(89, 228),
(90, 224),
(91, 225),
(91, 227),
(92, 229),
(93, 230),
(94, 230);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `AUTHOR`
--
ALTER TABLE `AUTHOR`
  ADD PRIMARY KEY (`ID_AUTHOR`);

--
-- Index pour la table `BOOK`
--
ALTER TABLE `BOOK`
  ADD PRIMARY KEY (`ID_BOOK`),
  ADD KEY `I_FK_BOOK_LANGUAGE` (`ID_LANGUAGE`);

--
-- Index pour la table `BORROW`
--
ALTER TABLE `BORROW`
  ADD PRIMARY KEY (`ID_BORROW`),
  ADD KEY `I_FK_BORROW_USER` (`ID_USER`),
  ADD KEY `I_FK_BORROW_BOOK` (`ID_BOOK`);

--
-- Index pour la table `CATEGORY`
--
ALTER TABLE `CATEGORY`
  ADD PRIMARY KEY (`ID_CATEGORY`),
  ADD UNIQUE KEY `CATEGORY_NAME` (`CATEGORY_NAME`);

--
-- Index pour la table `FOLLOW`
--
ALTER TABLE `FOLLOW`
  ADD PRIMARY KEY (`ID_USER_FOLLOW`,`ID_USER_IS_FOLLOWED`),
  ADD KEY `I_FK_FOLLOW_USER` (`ID_USER_FOLLOW`),
  ADD KEY `I_FK_FOLLOW_USER1` (`ID_USER_IS_FOLLOWED`);

--
-- Index pour la table `LANGUAGE`
--
ALTER TABLE `LANGUAGE`
  ADD PRIMARY KEY (`ID_LANGUAGE`),
  ADD UNIQUE KEY `LIB_LANGUAGE` (`LIB_LANGUAGE`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `RATING`
--
ALTER TABLE `RATING`
  ADD PRIMARY KEY (`ID_USER`,`ID_BOOK`),
  ADD KEY `I_FK_RATING_USER` (`ID_USER`),
  ADD KEY `I_FK_RATING_BOOK` (`ID_BOOK`);

--
-- Index pour la table `TAG`
--
ALTER TABLE `TAG`
  ADD PRIMARY KEY (`ID_BOOK`,`ID_CATEGORY`),
  ADD KEY `I_FK_TAG_BOOK` (`ID_BOOK`),
  ADD KEY `I_FK_TAG_CATEGORY` (`ID_CATEGORY`);

--
-- Index pour la table `test_AUTHOR`
--
ALTER TABLE `test_AUTHOR`
  ADD PRIMARY KEY (`ID_AUTHOR`);

--
-- Index pour la table `test_BOOK`
--
ALTER TABLE `test_BOOK`
  ADD PRIMARY KEY (`ID_BOOK`),
  ADD KEY `I_FK_BOOK_LANGUAGE` (`ID_LANGUAGE`);

--
-- Index pour la table `test_BORROW`
--
ALTER TABLE `test_BORROW`
  ADD PRIMARY KEY (`ID_BORROW`),
  ADD KEY `I_FK_BORROW_USER` (`ID_USER`),
  ADD KEY `I_FK_BORROW_BOOK` (`ID_BOOK`);

--
-- Index pour la table `test_CATEGORY`
--
ALTER TABLE `test_CATEGORY`
  ADD PRIMARY KEY (`ID_CATEGORY`),
  ADD UNIQUE KEY `CATEGORY_NAME` (`CATEGORY_NAME`);

--
-- Index pour la table `test_follow`
--
ALTER TABLE `test_follow`
  ADD PRIMARY KEY (`ID_USER_FOLLOW`,`ID_USER_IS_FOLLOWED`),
  ADD KEY `IDX_FFED435E29D00AE3` (`ID_USER_FOLLOW`),
  ADD KEY `IDX_FFED435E7EAFEF6` (`ID_USER_IS_FOLLOWED`);

--
-- Index pour la table `test_LANGUAGE`
--
ALTER TABLE `test_LANGUAGE`
  ADD PRIMARY KEY (`ID_LANGUAGE`),
  ADD UNIQUE KEY `LIB_LANGUAGE` (`LIB_LANGUAGE`);

--
-- Index pour la table `test_rating`
--
ALTER TABLE `test_rating`
  ADD PRIMARY KEY (`ID_USER`,`ID_BOOK`),
  ADD KEY `IDX_4F50210CF8371B55` (`ID_USER`),
  ADD KEY `IDX_4F50210CBE416E2D` (`ID_BOOK`);

--
-- Index pour la table `test_tag`
--
ALTER TABLE `test_tag`
  ADD PRIMARY KEY (`ID_BOOK`,`ID_CATEGORY`),
  ADD KEY `IDX_7AF46B44BE416E2D` (`ID_BOOK`),
  ADD KEY `IDX_7AF46B445965E51F` (`ID_CATEGORY`);

--
-- Index pour la table `test_USER`
--
ALTER TABLE `test_USER`
  ADD PRIMARY KEY (`ID_USER`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`);

--
-- Index pour la table `test_write`
--
ALTER TABLE `test_write`
  ADD PRIMARY KEY (`ID_AUTHOR`,`ID_BOOK`),
  ADD KEY `IDX_76B5DC5410E74A56` (`ID_AUTHOR`),
  ADD KEY `IDX_76B5DC54BE416E2D` (`ID_BOOK`);

--
-- Index pour la table `USER`
--
ALTER TABLE `USER`
  ADD PRIMARY KEY (`ID_USER`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`);

--
-- Index pour la table `WWRITE`
--
ALTER TABLE `WWRITE`
  ADD PRIMARY KEY (`ID_AUTHOR`,`ID_BOOK`),
  ADD KEY `I_FK_WRITE_AUTHOR` (`ID_AUTHOR`),
  ADD KEY `I_FK_WRITE_BOOK` (`ID_BOOK`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `AUTHOR`
--
ALTER TABLE `AUTHOR`
  MODIFY `ID_AUTHOR` bigint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT pour la table `BOOK`
--
ALTER TABLE `BOOK`
  MODIFY `ID_BOOK` bigint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT pour la table `BORROW`
--
ALTER TABLE `BORROW`
  MODIFY `ID_BORROW` bigint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500;

--
-- AUTO_INCREMENT pour la table `CATEGORY`
--
ALTER TABLE `CATEGORY`
  MODIFY `ID_CATEGORY` bigint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT pour la table `LANGUAGE`
--
ALTER TABLE `LANGUAGE`
  MODIFY `ID_LANGUAGE` bigint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `test_AUTHOR`
--
ALTER TABLE `test_AUTHOR`
  MODIFY `ID_AUTHOR` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `test_BOOK`
--
ALTER TABLE `test_BOOK`
  MODIFY `ID_BOOK` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `test_BORROW`
--
ALTER TABLE `test_BORROW`
  MODIFY `ID_BORROW` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `test_CATEGORY`
--
ALTER TABLE `test_CATEGORY`
  MODIFY `ID_CATEGORY` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `test_LANGUAGE`
--
ALTER TABLE `test_LANGUAGE`
  MODIFY `ID_LANGUAGE` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `test_USER`
--
ALTER TABLE `test_USER`
  MODIFY `ID_USER` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=439;

--
-- AUTO_INCREMENT pour la table `USER`
--
ALTER TABLE `USER`
  MODIFY `ID_USER` bigint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `BOOK`
--
ALTER TABLE `BOOK`
  ADD CONSTRAINT `FK_BOOK_LANGUAGE` FOREIGN KEY (`ID_LANGUAGE`) REFERENCES `LANGUAGE` (`ID_LANGUAGE`);

--
-- Contraintes pour la table `BORROW`
--
ALTER TABLE `BORROW`
  ADD CONSTRAINT `FK_BORROW_BOOK` FOREIGN KEY (`ID_BOOK`) REFERENCES `BOOK` (`ID_BOOK`),
  ADD CONSTRAINT `FK_BORROW_USER` FOREIGN KEY (`ID_USER`) REFERENCES `USER` (`ID_USER`);

--
-- Contraintes pour la table `FOLLOW`
--
ALTER TABLE `FOLLOW`
  ADD CONSTRAINT `FK_FOLLOW_USER` FOREIGN KEY (`ID_USER_FOLLOW`) REFERENCES `USER` (`ID_USER`),
  ADD CONSTRAINT `FK_FOLLOW_USER1` FOREIGN KEY (`ID_USER_IS_FOLLOWED`) REFERENCES `USER` (`ID_USER`);

--
-- Contraintes pour la table `RATING`
--
ALTER TABLE `RATING`
  ADD CONSTRAINT `FK_RATING_BOOK` FOREIGN KEY (`ID_BOOK`) REFERENCES `BOOK` (`ID_BOOK`),
  ADD CONSTRAINT `FK_RATING_USER` FOREIGN KEY (`ID_USER`) REFERENCES `USER` (`ID_USER`);

--
-- Contraintes pour la table `TAG`
--
ALTER TABLE `TAG`
  ADD CONSTRAINT `FK_TAG_BOOK` FOREIGN KEY (`ID_BOOK`) REFERENCES `BOOK` (`ID_BOOK`),
  ADD CONSTRAINT `FK_TAG_CATEGORY` FOREIGN KEY (`ID_CATEGORY`) REFERENCES `CATEGORY` (`ID_CATEGORY`);

--
-- Contraintes pour la table `test_BOOK`
--
ALTER TABLE `test_BOOK`
  ADD CONSTRAINT `FK_F809644A8BF28D6B` FOREIGN KEY (`ID_LANGUAGE`) REFERENCES `test_LANGUAGE` (`ID_LANGUAGE`);

--
-- Contraintes pour la table `test_BORROW`
--
ALTER TABLE `test_BORROW`
  ADD CONSTRAINT `FK_32FA6818BE416E2D` FOREIGN KEY (`ID_BOOK`) REFERENCES `test_BOOK` (`ID_BOOK`),
  ADD CONSTRAINT `FK_32FA6818F8371B55` FOREIGN KEY (`ID_USER`) REFERENCES `test_USER` (`ID_USER`);

--
-- Contraintes pour la table `test_follow`
--
ALTER TABLE `test_follow`
  ADD CONSTRAINT `FK_FFED435E29D00AE3` FOREIGN KEY (`ID_USER_FOLLOW`) REFERENCES `test_USER` (`ID_USER`),
  ADD CONSTRAINT `FK_FFED435E7EAFEF6` FOREIGN KEY (`ID_USER_IS_FOLLOWED`) REFERENCES `test_USER` (`ID_USER`);

--
-- Contraintes pour la table `test_rating`
--
ALTER TABLE `test_rating`
  ADD CONSTRAINT `FK_4F50210CBE416E2D` FOREIGN KEY (`ID_BOOK`) REFERENCES `test_BOOK` (`ID_BOOK`),
  ADD CONSTRAINT `FK_4F50210CF8371B55` FOREIGN KEY (`ID_USER`) REFERENCES `test_USER` (`ID_USER`);

--
-- Contraintes pour la table `test_tag`
--
ALTER TABLE `test_tag`
  ADD CONSTRAINT `FK_7AF46B445965E51F` FOREIGN KEY (`ID_CATEGORY`) REFERENCES `test_CATEGORY` (`ID_CATEGORY`),
  ADD CONSTRAINT `FK_7AF46B44BE416E2D` FOREIGN KEY (`ID_BOOK`) REFERENCES `test_BOOK` (`ID_BOOK`);

--
-- Contraintes pour la table `test_write`
--
ALTER TABLE `test_write`
  ADD CONSTRAINT `FK_76B5DC5410E74A56` FOREIGN KEY (`ID_AUTHOR`) REFERENCES `test_AUTHOR` (`ID_AUTHOR`),
  ADD CONSTRAINT `FK_76B5DC54BE416E2D` FOREIGN KEY (`ID_BOOK`) REFERENCES `test_BOOK` (`ID_BOOK`);

--
-- Contraintes pour la table `WWRITE`
--
ALTER TABLE `WWRITE`
  ADD CONSTRAINT `FK_WRITE_AUTHOR` FOREIGN KEY (`ID_AUTHOR`) REFERENCES `AUTHOR` (`ID_AUTHOR`),
  ADD CONSTRAINT `FK_WRITE_BOOK` FOREIGN KEY (`ID_BOOK`) REFERENCES `BOOK` (`ID_BOOK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;