-- Índices y restricciones
ALTER TABLE `admin_details`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `id_user` (`id_user`);

ALTER TABLE `author_details`
  ADD PRIMARY KEY (`id_author`),
  ADD UNIQUE KEY `id_user` (`id_user`);

ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `id_forum` (`id_forum`),
  ADD KEY `id_user` (`id_user`);

ALTER TABLE `editor_details`
  ADD PRIMARY KEY (`id_editor`),
  ADD UNIQUE KEY `id_user` (`id_user`);

ALTER TABLE `forum`
  ADD PRIMARY KEY (`id_forum`),
  ADD KEY `author` (`author`);

ALTER TABLE `forum_category`
  ADD PRIMARY KEY (`id_category`,`id_forum`),
  ADD KEY `id_forum` (`id_forum`);

ALTER TABLE `forum_tag`
  ADD PRIMARY KEY (`id_forum_tag`),
  ADD KEY `id_forum` (`id_forum`),
  ADD KEY `id_tag` (`id_tag`),
  ADD KEY `created_by` (`created_by`);

ALTER TABLE `member_details`
  ADD PRIMARY KEY (`id_member`),
  ADD UNIQUE KEY `id_user` (`id_user`);

ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_role`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `tag`
  ADD PRIMARY KEY (`id_tag`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id_user`,`id_role`),
  ADD KEY `id_role` (`id_role`);

-- AUTO_INCREMENT de las tablas
ALTER TABLE `admin_details`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `author_details`
  MODIFY `id_author` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `comment`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `editor_details`
  MODIFY `id_editor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `forum`
  MODIFY `id_forum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `forum_tag`
  MODIFY `id_forum_tag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `member_details`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `roles`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `tag`
  MODIFY `id_tag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

-- Restricciones para tablas
ALTER TABLE `admin_details`
  ADD CONSTRAINT `admin_details_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

ALTER TABLE `author_details`
  ADD CONSTRAINT `author_details_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`id_forum`) REFERENCES `forum` (`id_forum`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

ALTER TABLE `editor_details`
  ADD CONSTRAINT `editor_details_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

ALTER TABLE `forum`
  ADD CONSTRAINT `forum_ibfk_1` FOREIGN KEY (`author`) REFERENCES `user` (`id_user`);

ALTER TABLE `forum_category`
  ADD CONSTRAINT `forum_category_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`),
  ADD CONSTRAINT `forum_category_ibfk_2` FOREIGN KEY (`id_forum`) REFERENCES `forum` (`id_forum`);

ALTER TABLE `forum_tag`
  ADD CONSTRAINT `forum_tag_ibfk_1` FOREIGN KEY (`id_forum`) REFERENCES `forum` (`id_forum`),
  ADD CONSTRAINT `forum_tag_ibfk_2` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id_tag`),
  ADD CONSTRAINT `forum_tag_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id_user`);

ALTER TABLE `member_details`
  ADD CONSTRAINT `member_details_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`);