SET time_zone = "+00:00";

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL
) ;

INSERT INTO `author` (`id`, `first_name`, `last_name`) VALUES
(1, 'Andrzej', 'Sapkowski'),
(2, 'Stephen', 'King'),
(3, 'Dan', 'Brown'),
(4, 'J.K.', 'Rowling'),
(5, 'Anthony', 'Kiedis'),
(6, 'Cornell', 'Horstmann'),
(7, 'Stephen', 'Prata'),
(8, 'Graham', 'Sellers');

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `id_author` int(11) NOT NULL,
  `title` text NOT NULL,
  `text` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ;

INSERT INTO `news` (`id`, `id_author`, `title`, `text`, `date`) VALUES
(1, 1, 'Otwarcie biblioteki.online!', 'Po wielu latach zmagañ z tradycyjn¹ obs³ug¹ biblioteczn¹, przechodzimy do obs³ugi online! Od dzisiaj mo¿na ju¿ korzystaæ z zasobów biblioteki dziêki rezerwacjom w systemie biblioteka.online.', '2020-01-11 16:49:24'),
(2, 1, 'Nowe woluminy ju¿ dostêpne', 'Od dziœ w katalogu biblioteki znajduj¹ siê wszystkie woluminy zasobów bibliteki wraz z czasopismami, ebook oraz audio-cd.', '2020-01-11 17:43:19');

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_volume` int(11) NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL
) ;

INSERT INTO `reservation` (`id`, `id_status`, `id_user`, `id_volume`, `start_date`, `end_date`) VALUES
(134, 4, 1, 7, '2020-03-16 01:35:37', '2020-03-26 12:34:22'),
(135, 4, 1, 5, '2020-03-22 09:25:24', '2020-03-26 12:34:21'),
(136, 4, 1, 10, '2020-03-25 23:45:43', '2020-03-26 12:33:59'),
(137, 4, 1, 1, '2020-03-25 23:48:00', '2020-03-26 12:32:27'),
(138, 4, 2, 12, '2020-03-26 11:38:24', '2020-04-25 10:38:24'),
(139, 4, 2, 6, '2020-03-29 20:36:39', '2020-03-29 21:01:11'),
(140, 4, 2, 13, '2020-03-29 21:01:58', '2020-03-29 21:03:21'),
(141, 4, 2, 4, '2020-03-29 21:14:13', '2020-04-28 21:14:13'),
(142, 4, 2, 9, '2020-03-29 21:17:35', '2020-03-29 22:03:51'),
(143, 4, 2, 8, '2020-03-30 20:15:57', '2020-04-29 20:15:57'),
(144, 4, 5, 3, '2020-03-30 22:02:57', '2020-04-29 22:02:57'),
(145, 4, 5, 13, '2020-03-30 22:31:00', '2020-03-30 22:45:16'),
(146, 2, 5, 12, '2020-03-30 22:43:17', '2020-04-29 22:43:17'),
(147, 4, 2, 1, '2020-04-06 14:21:46', '2020-04-06 14:27:22'),
(148, 4, 2, 13, '2020-04-06 22:03:43', '2020-04-13 16:43:17'),
(149, 2, 2, 2, '2020-04-13 16:39:31', '2020-05-13 16:39:31'),
(150, 2, 2, 10, '2020-04-13 16:43:40', '2020-05-13 16:43:40');

CREATE TABLE `reservation_status` (
  `id` int(11) NOT NULL,
  `status` varchar(5) NOT NULL,
  `status_desc` varchar(20) NOT NULL
) ;

INSERT INTO `reservation_status` (`id`, `status`, `status_desc`) VALUES
(1, 'rsd', 'reserved'),
(2, 'rdy', 'ready'),
(3, 'rvd', 'received'),
(4, 'fin', 'finished');

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `login` varchar(30) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `role` varchar(100) NOT NULL,
  `join_date` timestamp NOT NULL DEFAULT current_timestamp()
) ;

INSERT INTO `user` (`id`, `first_name`, `last_name`, `login`, `pass`, `role`, `join_date`) VALUES
(1, 'Jacek', 'Duœ', 'admin', '$2y$10$eD7KEcwdY1UZGMPPZ6c5Du4q8bUJpKqw54uEi5ecREUUqF1ZLwq0C', 'admin', '2019-12-17 19:27:28'),
(2, '', '', 'user30', '$2y$10$9zN2jr/8iwAhdqZedCLl/.t5IB9gk9J5bWyQpdeFgF9BOZUwyffbS', 'user', '2020-03-25 21:33:08'),
(4, '', '', 'librarian', '$2y$10$4P0LOLmLAz8/DR7/SlsWJe1sMruY4hQ3S3YSecQSDpjBHYuPB2qmu', 'librarian', '2020-03-29 17:14:05'),
(5, '', '', 'kolumb', '$2y$10$ybt8JY/kQ4S48ZNuMigGhOiV3yeEuaGBL.oMXS79eTibSD.OTsMYO', 'user', '2020-03-30 21:49:27');

CREATE TABLE `volume` (
  `id` int(11) NOT NULL,
  `id_author` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `year_publication` int(11) NOT NULL
) ;

INSERT INTO `volume` (`id`, `id_author`, `title`, `year_publication`) VALUES
(1, 1, 'Ostatnie ¿yczenie', 2015),
(2, 1, 'Miecz przeznaczenia', 2016),
(3, 4, 'Harry Potter i kamieñ filozoficzny', 2016),
(4, 2, 'Bastion', 2015),
(5, 3, 'Kod Leonarda da Vinci', 2015),
(6, 5, 'Blizna', 2010),
(7, 6, 'Java. Techniki zaawansowane', 2012),
(8, 6, 'Java. Podstawy', 2014),
(9, 1, 'Ostatnie ¿yczenie', 2015),
(10, 2, 'Bastion', 2012),
(11, 4, 'Harry Potter i wiêzieñ z Azkabanu', 2015),
(12, 7, 'Jêzyk C++. Szko³a programowania', 2013),
(13, 8, 'OpenGL. Ksiêga eksperta', 2016);


ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_author` (`id_author`);

ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_volume` (`id_volume`),
  ADD KEY `id_status` (`id_status`);

ALTER TABLE `reservation_status`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

ALTER TABLE `volume`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_author` (`id_author`);


ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `reservation_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `volume`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`id_volume`) REFERENCES `volume` (`id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`id_status`) REFERENCES `reservation_status` (`id`);

ALTER TABLE `volume`
  ADD CONSTRAINT `volume_ibfk_1` FOREIGN KEY (`id_author`) REFERENCES `author` (`id`);