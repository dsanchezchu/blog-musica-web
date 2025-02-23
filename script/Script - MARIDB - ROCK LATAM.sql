-- Creación de tablas
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `roles` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_role`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `admin_details` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `permissions` text DEFAULT NULL,
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `id_user` (`id_user`),
  CONSTRAINT `admin_details_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `author_details` (
  `id_author` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `publications` text DEFAULT NULL,
  PRIMARY KEY (`id_author`),
  UNIQUE KEY `id_user` (`id_user`),
  CONSTRAINT `author_details_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `editor_details` (
  `id_editor` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `experience` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_editor`),
  UNIQUE KEY `id_user` (`id_user`),
  CONSTRAINT `editor_details_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `member_details` (
  `id_member` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `activity` text DEFAULT NULL,
  `years` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_member`),
  UNIQUE KEY `id_user` (`id_user`),
  CONSTRAINT `member_details_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `category` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_category`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `forum` (
  `id_forum` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `author` int(11) NOT NULL,
  `publication_date` datetime NOT NULL DEFAULT current_timestamp(),
  `update_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `popular` tinyint(1) DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT 'Sin Titulo Disponible',
  PRIMARY KEY (`id_forum`),
  KEY `author` (`author`),
  CONSTRAINT `forum_ibfk_1` FOREIGN KEY (`author`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `comment` (
  `id_comment` int(11) NOT NULL AUTO_INCREMENT,
  `id_forum` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `publication_date` datetime NOT NULL DEFAULT current_timestamp(),
  `update_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `context` text NOT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `id_forum` (`id_forum`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`id_forum`) REFERENCES `forum` (`id_forum`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tag` (
  `id_tag` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tag`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `forum_category` (
  `id_category` int(11) NOT NULL,
  `id_forum` int(11) NOT NULL,
  PRIMARY KEY (`id_category`,`id_forum`),
  KEY `id_forum` (`id_forum`),
  CONSTRAINT `forum_category_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`),
  CONSTRAINT `forum_category_ibfk_2` FOREIGN KEY (`id_forum`) REFERENCES `forum` (`id_forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `forum_tag` (
  `id_forum_tag` int(11) NOT NULL AUTO_INCREMENT,
  `id_forum` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL,
  `creation_date` datetime DEFAULT current_timestamp(),
  `is_active` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_forum_tag`),
  KEY `id_forum` (`id_forum`),
  KEY `id_tag` (`id_tag`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `forum_tag_ibfk_1` FOREIGN KEY (`id_forum`) REFERENCES `forum` (`id_forum`),
  CONSTRAINT `forum_tag_ibfk_2` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id_tag`),
  CONSTRAINT `forum_tag_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `user_role` (
  `id_user` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  PRIMARY KEY (`id_user`,`id_role`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;