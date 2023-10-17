CREATE DATABASE IF NOT EXISTS `fishnchips`;
USE `fishnchips`;



/* -------------------------------------------------------------------------- */


/* ----------------------------------------------------------------------------- 
_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(
----------------------------------------------------------------------------- */


/* -------------------------------------------------------------------------- */


--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE `genre` (
    `id_genre` int NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    `description` varchar(255) DEFAULT NULL,
    CONSTRAINT `PK_genre_id` PRIMARY KEY (`id_genre`)
) AUTO_INCREMENT = 10;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
    `id_topic` int NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    `description` varchar(255) DEFAULT NULL,
    CONSTRAINT `PK_topic_id` PRIMARY KEY (`id_topic`)
) AUTO_INCREMENT = 100;

--
-- Table structure for table `specialty`
--

DROP TABLE IF EXISTS `specialty`;
CREATE TABLE `specialty` (
    `id_specialty` int NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    `description` varchar(255) DEFAULT NULL,
    CONSTRAINT `PK_specialty_id` PRIMARY KEY (`id_specialty`)
) AUTO_INCREMENT = 1000;


/* -----------------------------------------------------------------------------
----------------------------------------------------------------------------- */

--
-- Table structure for table `creator`
--

DROP TABLE IF EXISTS `creator`;
CREATE TABLE `creator` (
    `id_creator` int NOT NULL AUTO_INCREMENT,
    `genre_id` int NOT NULL,    -- how display name; joint eaz?
    `name` varchar(50) NOT NULL,
    `lang` char(2) DEFAULT 'EN',
    CONSTRAINT `PK_creator_id` PRIMARY KEY (`id_creator`),
    CONSTRAINT `FK_creator_to_genre` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id_genre`) ON DELETE RESTRICT ON UPDATE RESTRICT
) AUTO_INCREMENT = 1000;


--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/* Genre + Topic + Specialty => set aside only, no FKs! */
CREATE TABLE `video` (
    `id_video` int NOT NULL AUTO_INCREMENT,
    `creator_id` int NOT NULL,
    `title` varchar(100) NOT NULL,
    `lang` char(2) DEFAULT 'EN',
    `video_url` varchar(80) NOT NULL,
    `release_date` date DEFAULT NULL,
    `quicknote` varchar(255) DEFAULT NULL,
    `date_added` DATE DEFAULT NULL,
    CONSTRAINT `PK_video_id` PRIMARY KEY (`id_video`),
    CONSTRAINT `FK_video_creator` FOREIGN KEY (`creator_id`) REFERENCES `creator`(`id_creator`) ON DELETE RESTRICT ON UPDATE RESTRICT
) AUTO_INCREMENT = 1;


/* -----------------------------------------------------------------------------
----------------------------------------------------------------------------- */

--
-- Table structure for table `creator_genre`
--

DROP TABLE IF EXISTS `creator_genre`;
CREATE TABLE `creator_genre` (
    `id_creator_genre` int NOT NULL AUTO_INCREMENT,
    `creator_id` int NOT NULL,
    `genre_id` int NOT NULL,
    CONSTRAINT `PK_creator_genre_id` PRIMARY KEY (`id_creator_genre`),
    CONSTRAINT `FK_creator_genre_to_creator` FOREIGN KEY (`creator_id`) REFERENCES `creator`(`id_creator`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `FK_creator_genre_to_genre` FOREIGN KEY (`genre_id`) REFERENCES `genre`(`id_genre`) ON DELETE RESTRICT ON UPDATE RESTRICT
) AUTO_INCREMENT = 1;

--
-- Table structure for table `video_genre`
--

DROP TABLE IF EXISTS `video_genre`;
CREATE TABLE `video_genre` (
    `id_video_genre` int NOT NULL AUTO_INCREMENT,
    `video_id` int NOT NULL,
    `genre_id` int NOT NULL,
    CONSTRAINT `PK_video_genre_id` PRIMARY KEY (`id_video_genre`),
    CONSTRAINT `FK_video_genre_to_video` FOREIGN KEY (`video_id`) REFERENCES `video`(`id_video`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `FK_video_genre_to_genre` FOREIGN KEY (`genre_id`) REFERENCES `genre`(`id_genre`) ON DELETE RESTRICT ON UPDATE RESTRICT
) AUTO_INCREMENT = 1;

--
-- Table structure for table `video_topic`
--

DROP TABLE IF EXISTS `video_topic`;
CREATE TABLE `video_topic` (
    `id_video_topic` int NOT NULL AUTO_INCREMENT,
    `video_id` int NOT NULL,
    `topic_id` int NOT NULL,
    CONSTRAINT `PK_video_topic_id` PRIMARY KEY (`id_video_topic`),
    CONSTRAINT `FK_video_topic_to_video` FOREIGN KEY (`video_id`) REFERENCES `video`(`id_video`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `FK_video_topic_to_topic` FOREIGN KEY (`topic_id`) REFERENCES `topic`(`id_topic`) ON DELETE RESTRICT ON UPDATE RESTRICT
) AUTO_INCREMENT = 1;

--
-- Table structure for table `video_specialty`
--

DROP TABLE IF EXISTS `video_specialty`;
CREATE TABLE `video_specialty` (
    `id_video_specialty` int NOT NULL AUTO_INCREMENT,
    `video_id` int NOT NULL,
    `specialty_id` int NOT NULL,
    CONSTRAINT `PK_video_specialty_id` PRIMARY KEY (`id_video_specialty`),
    CONSTRAINT `FK_video_specialty_to_video` FOREIGN KEY (`video_id`) REFERENCES `video`(`id_video`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `FK_video_specialty_to_specialty` FOREIGN KEY (`specialty_id`) REFERENCES `specialty`(`id_specialty`) ON DELETE RESTRICT ON UPDATE RESTRICT
) AUTO_INCREMENT = 1;


/* -----------------------------------------------------------------------------
----------------------------------------------------------------------------- */

DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
    `id_project`int NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `important` tinyint DEFAULT 0,
    `description` varchar(255) DEFAULT NULL,
    `status` ENUM('Not Started', 'In Progress', 'On Hold', 'Completed') DEFAULT NULL,
    CONSTRAINT `PK_project` PRIMARY KEY (`id_project`),
    CONSTRAINT `chk_project_imp` CHECK (`important` IN (0,1)),
    CONSTRAINT `chk_project_status` CHECK (`status` IN ('Not Started', 'In Progress', 'On Hold', 'Completed'))
) AUTO_INCREMENT = 10;

DROP TABLE IF EXISTS `project_topic_video`;
CREATE TABLE `project_topic_video` (
    `id_ptv` int NOT NULL AUTO_INCREMENT,
    `project_id` int NOT NULL,
    `topic_id` int NOT NULL,
    `video_id` int NOT NULL,
    CONSTRAINT `PK_ptv` PRIMARY KEY (`id_ptv`),
    CONSTRAINT `FK_ptv_to_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`id_project`),
    CONSTRAINT `FK_ptv_to_topic` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id_topic`),
    CONSTRAINT `FK_ptv_to_video` FOREIGN KEY (`video_id`) REFERENCES `video` (`id_video`)
) AUTO_INCREMENT = 1;



/* -------------------------------------------------------------------------- */


/* ----------------------------------------------------------------------------- 
_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(_.~"(
----------------------------------------------------------------------------- */


/* -------------------------------------------------------------------------- */


-- (LOCK ?


--
-- ALTER table structure for table `topic`
--

ALTER TABLE `topic`
    ADD COLUMN `important` tinyint DEFAULT 0 COMMENT "Bool 0-1" AFTER `name`,
    CONSTRAINT `chk_video_imp` CHECK (`important` IN (0, 1));

--
-- ALTER table structure for table `creator`
--

ALTER TABLE `creator`
    ADD COLUMN `value` tinyint DEFAULT NULL COMMENT "1-poor < 9-rich" AFTER `name`,
    CONSTRAINT `chk_creator_val` CHECK (`value` >= 1 AND `value` <= 9);

--
-- ALTER table structure for table `title`
--

ALTER TABLE `video`
    ADD COLUMN `value` tinyint DEFAULT NULL COMMENT "1-poor < 9-rich" AFTER `title`,
    ADD COLUMN `short` tinyint DEFAULT 0 COMMENT "Bool 0-1" AFTER `release_date`,
    CONSTRAINT `chk_video_val` CHECK (`value` >= 1 AND `value` <= 9),
    CONSTRAINT `chk_video_short` CHECK (`short` IN (0, 1));


-- --
-- -- ALTER table structure for table `topic`
-- --

-- ALTER TABLE `project`
--     ADD COLUMN `important` tinyint DEFAULT 0 COMMENT "Bool 0-1" AFTER `name`,
--     ADD COLUMN `status` varchar(20) DEFAULT `yellow` COMMENT "green, yellow, red" AFTER `description`,
--     CONSTRAINT `chk_project_imp` CHECK (`value` >= 1 AND `value` <= 9),
--     CONSTRAINT `chk_project_status` CHECK (`short` IN (0, 1))



/* -----------------------------------------------------------------------------
-- (...) ADD COLUMN `tier` char(1) COMMENT "S-A-B-to-F";

SELECT column_name
FROM your_table_name
ORDER BY CASE
    WHEN column_name = 'S' THEN 1
    WHEN column_name = 'A' THEN 2
    WHEN column_name = 'B' THEN 3
    WHEN column_name = 'C' THEN 4
    WHEN column_name = 'D' THEN 5
    WHEN column_name = 'E' THEN 6
    WHEN column_name = 'F' THEN 7
    ELSE 8
END;
*/
----------------------------------------------------------------------------- */


/* -----------------------------------------------------------------------------
DELIMITER //

CREATE TRIGGER trg_check_important
BEFORE INSERT ON `topic` FOR EACH ROW
BEGIN
  IF NEW.`important` NOT IN (0, 1) THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Invalid value for important column. Must be 0 or 1.';
  END IF;
END;
//

DELIMITER ;
----------------------------------------------------------------------------- */



/* -------------------------------------------------------------------------- */
/* -----------------------------------------------------------------------------
----------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------- */


-- 
-- (TODO) index name on video_topic...
-- 


create playlist

