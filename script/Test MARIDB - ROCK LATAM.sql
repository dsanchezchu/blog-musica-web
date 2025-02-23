-- Inserción de datos
INSERT INTO `user` (`id_user`, `email`, `first_name`, `last_name`, `phone_number`, `password`, `profile_photo`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'usuario@example.com', 'Juan', 'Perez', '123456789', 'contraseña123', NULL, 1, '2025-02-16 00:58:41', '2025-02-16 00:58:41'),
(2, 'admin@example.com', 'Laura', 'Gomez', '987654321', 'admin123', NULL, 1, '2025-02-16 00:58:41', '2025-02-16 00:58:41'),
(3, 'miembro@example.com', 'Carlos', 'Lopez', '555555555', 'miembro123', NULL, 1, '2025-02-16 00:58:41', '2025-02-16 00:58:41'),
(4, 'editor@example.com', 'Ana', 'Martinez', '333333333', 'editor123', NULL, 1, '2025-02-16 00:58:41', '2025-02-16 00:58:41');

INSERT INTO `roles` (`id_role`, `name`) VALUES
(1, 'admin'),
(2, 'member'),
(3, 'editor'),
(4, 'author');

INSERT INTO `admin_details` (`id_admin`, `id_user`, `permissions`) VALUES
(1, 2, 'manage_users, manage_categories');

INSERT INTO `author_details` (`id_author`, `id_user`, `publications`) VALUES
(1, 1, 'Publicación 1, Publicación 2');

INSERT INTO `editor_details` (`id_editor`, `id_user`, `experience`) VALUES
(1, 4, 'Editor senior con 10 años de experiencia');

INSERT INTO `member_details` (`id_member`, `id_user`, `activity`, `years`) VALUES
(1, 3, 'Participar en foros', '5 años');

INSERT INTO `category` (`id_category`, `name`, `description`) VALUES
(1, 'Tecnología', 'Foros relacionados con tecnología e innovación');

INSERT INTO `forum` (`id_forum`, `content`, `author`, `publication_date`, `update_date`, `popular`, `title`) VALUES
(1, 'Este es el contenido del foro.', 1, '2025-02-15 17:27:24', '2025-02-15 17:39:24', 0, 'Ozzy Vuelve?');

INSERT INTO `comment` (`id_comment`, `id_forum`, `id_user`, `publication_date`, `update_date`, `context`) VALUES
(1, 1, 2, '2025-02-15 17:45:26', '2025-02-15 17:45:26', 'Este es un comentario de prueba en el foro.'),
(3, 1, 3, '2025-02-15 17:45:57', '2025-02-15 17:45:57', 'Este es un comentario inicial. Lo actualizaré más tarde.'),
(5, 1, 2, '2025-02-15 17:47:45', '2025-02-15 17:47:45', 'Este es un comentario inicial. Lo actualizaré más tarde.');

INSERT INTO `tag` (`id_tag`, `name`) VALUES
(1, 'Rock Alternativo');

INSERT INTO `forum_category` (`id_category`, `id_forum`) VALUES
(1, 1);

INSERT INTO `forum_tag` (`id_forum_tag`, `id_forum`, `id_tag`, `creation_date`, `is_active`, `created_by`) VALUES
(1, 1, 1, '2025-02-15 17:31:19', 1, 1);

INSERT INTO `user_role` (`id_user`, `id_role`) VALUES
(1, 1),
(1, 4),
(2, 3);