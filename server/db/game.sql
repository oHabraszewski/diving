-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Server version: 10.4.17-MariaDB
-- PHP version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `game`
--

-- --------------------------------------------------------

--
-- Structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `LOGIN` text COLLATE utf8mb4_general_ci NOT NULL,
  `PASS` text COLLATE utf8mb4_general_ci NOT NULL,
  `SESSION` text COLLATE utf8mb4_general_ci NOT NULL,
  `EMAIL` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure for table `rooms`
--

CREATE TABLE `rooms` (
  `ID` int(11) NOT NULL,
  `WORLD_ID` int(11) NOT NULL,
  `ROOM_CONFIG` longtext COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure for table `worlds`
--

CREATE TABLE `worlds` (
  `ID` int(11) NOT NULL,
  `WORLD_NAME` text COLLATE utf8mb4_general_ci NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `SEED` bigint(20) NOT NULL,
  `WORLD_DATA` longtext COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure for table "playersData"
--

CREATE TABLE `playersData` (
  `ID` int(11) NOT NULL,
  `WORLD_ID` int(11) NOT NULL,
  `PLAYER_ID` int(11) NOT NULL,
  `PLAYER_DATA` longtext COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_general_ci;


--
-- IDs for `login`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- IDs for `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`ID`);

--
-- IDs for `worlds`
--
ALTER TABLE `worlds`
  ADD PRIMARY KEY (`ID`);

--
-- IDs for `playersData`
--
ALTER TABLE `playersData`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for `login`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for `rooms`
--
ALTER TABLE `rooms`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for `worlds`
--
ALTER TABLE `worlds`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for `playersData`
--
ALTER TABLE `playersData
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
