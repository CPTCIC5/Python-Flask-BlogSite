-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2021 at 06:45 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogger`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `phone` int(15) NOT NULL,
  `email` text NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone`, `email`, `message`) VALUES
(1, 'name', 2147483647, 'email@gmail.com', 'message'),
(2, 'name', 97, 'email@gmail.com', 'hello'),
(3, 'Mayank', 69, 'jainnaveen973@gmail.com', 'Message'),
(4, 'nayan jain', 0, '', ''),
(5, 'nayan jain', 0, 'oju@gmail.com', ''),
(6, 'nayan jain', 69, 'oju@gmail.com', 'Message'),
(7, 'Oju', 69, 'blaze@gmail.com', 'Message'),
(8, 'nayan jain', 69, 'oju@gmail.com', 'hello'),
(9, 'Golden Pheonix', 69, 'goldenpheonix@gmail.com', 'Golden Pheonix is pro'),
(10, '', 0, '', ''),
(11, 'a', 0, '', ''),
(12, 'name', 69, 'xyz@gmail.com', 'Message'),
(13, 'hi', 95, 'xyz@gmail.com', 'message'),
(14, 'name', 69, 'xyz@gmail.com', 'message');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `subtitle` text NOT NULL,
  `content` text NOT NULL,
  `slug` text NOT NULL,
  `img_file` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `subtitle`, `content`, `slug`, `img_file`) VALUES
(1, 'STOCKS', 'ALL ABOUT STOCKS', 'What Is a Stock?\r\nA stock (also known as equity) is a security that represents the ownership of a fraction of a corporation. This entitles the owner of the stock to a proportion of the corporation\'s assets and profits equal to how much stock they own. Units of stock are called \"shares.\"\r\n\r\n', 'post_slug', 'contact-bg.jpg'),
(2, 'SCHOOL', 'SCHOOL (SUBTITLE', 'SCHOOL X100', 'second-post', 'contact-bg.jpg'),
(3, 'CORONA VIRUS', 'DATA ABOUT COVID-19', 'Coronavirus disease (COVID-19) is an infectious disease caused by a newly discovered coronavirus.\r\n\r\nMost people infected with the COVID-19 virus will experience mild to moderate respiratory illness and recover without requiring special treatment.  Older people, and those with underlying medical problems like cardiovascular disease, diabetes, chronic respiratory disease, and cancer are more likely to develop serious illness.\r\n\r\nThe best way to prevent and slow down transmission is to be well informed about the COVID-19 virus, the disease it causes and how it spreads. Protect yourself and others from infection by washing your hands or using an alcohol based rub frequently and not touching your face. \r\n\r\nThe COVID-19 virus spreads primarily through droplets of saliva or discharge from the nose when an infected person coughs or sneezes, so it’s important that you also practice respiratory etiquette (for example, by coughing into a flexed elbow).', 'third-post', ''),
(4, 'Phoenix (mythology)', 'ABOUT Phoenix', 'The phoenix is a long-lived bird associated with Greek mythology (with analogs in many cultures) that cyclically regenerates or is otherwise born again. Associated with the sun, a phoenix obtains new life by arising from the ashes of its predecessor. Some legends say it dies in a show of flames and combustion, others that it simply dies and decomposes before being born again.[1] In the Motif-Index of Folk-Literature, a tool used by folklorists, the phoenix is classified as motif B32.[2]\r\n\r\nThe origin of the phoenix has been attributed to Ancient Egypt by Herodotus and later 19th-century scholars, but other scholars think the Egyptian texts may have been influenced by classical folklore. Over time the phoenix motif spread and gained variety of new associations: Herodotus, Lucan, Pliny the Elder, Pope Clement I, Lactantius, Ovid, and Isidore of Seville are among those who have contributed to the retelling and transmission of the phoenix motif. Over time, extending beyond its origins, the phoenix could variously \"symbolize renewal in general as well as the sun, time, the Empire, metempsychosis, consecration, resurrection, life in the heavenly Paradise, Christ, Mary, virginity, the exceptional man, and certain aspects of Christian life\".[3] Some scholars have claimed that the poem De ave phoenice may present the mythological phoenix motif as a symbol of Christ\'s resurrection.[4]', 'about-pheonix', 'contact-bg.jpg'),
(5, 'Discord', 'About Discord', 'Discord is a group-chatting platform originally built for gamers that has since become a general use platform for many kinds of communities.\r\nDiscord is divided into servers, each of which has its own members, topics, rules, and channels.\r\nDiscord also allows users to voice- and video-chat, as well as livestream games and other programs from their computers.\r\nDiscord, a popular group-chatting app, was originally made to give gamers a place to build communities and talk.\r\n\r\nBut since its launch in 2015, it has branched out to include communities from all over the internet, ranging from writers to artists to K-Pop stans. It has boomed in popularity during the pandemic, as more people have worked, played games, and socialized online, and the platform says it now has more than 140 million active monthly users.', 'discord-discord', ''),
(6, 'GIT', 'WHAT IS GIT', 'By far, the most widely used modern version control system in the world today is Git. Git is a mature, actively maintained open source project originally developed in 2005 by Linus Torvalds, the famous creator of the Linux operating system kernel. A staggering number of software projects rely on Git for version control, including commercial projects as well as open source. Developers who have worked with Git are well represented in the pool of available software development talent and it works well on a wide range of operating systems and IDEs (Integrated Development Environments).\r\n\r\nHaving a distributed architecture, Git is an example of a DVCS (hence Distributed Version Control System). Rather than have only one single place for the full version history of the software as is common in once-popular version control systems like CVS or Subversion (also known as SVN), in Git, every developer\'s working copy of the code is also a repository that can contain the full history of all changes.\r\n\r\nIn addition to being distributed, Git has been designed with performance, security and flexibility in mind.', 'git-github', 'contact-bg.jpg'),
(7, 'API', 'ABOUT API', 'API is the acronym for Application Programming Interface, which is a software intermediary that allows two applications to talk to each other. Each time you use an app like Facebook, send an instant message, or check the weather on your phone, you’re using an API.\r\n\r\nWhat exactly is an API? Finally learn for yourself in this helpful video from MuleSoft, the API experts.', 'slug-slug', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`),
  ADD UNIQUE KEY `sno` (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`),
  ADD UNIQUE KEY `sno` (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
