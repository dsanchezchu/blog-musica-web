-- Tabla principal para usuarios
CREATE TABLE "user" (
    id_user SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    profile_photo VARCHAR(255),
    role VARCHAR(50) NOT NULL CHECK (role IN ('editor', 'admin', 'member', 'author'))
);

-- Categorías
CREATE TABLE category (
    id_category SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description VARCHAR(255)
);

-- Etiquetas
CREATE TABLE tag (
    id_tag SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);

-- Foros
CREATE TABLE forum (
    id_forum SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    author INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    publication_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    popular BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (author) REFERENCES "user"(id_user)
);

-- Comentarios en los foros
CREATE TABLE comment (
    id_comment SERIAL PRIMARY KEY,
    id_forum INT NOT NULL,
    id_user INT NOT NULL,
    publication_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    context TEXT NOT NULL,
    FOREIGN KEY (id_forum) REFERENCES forum(id_forum),
    FOREIGN KEY (id_user) REFERENCES "user"(id_user)
);

-- Relación entre foros y categorías
CREATE TABLE forum_category (
    id_category INT NOT NULL,
    id_forum INT NOT NULL,
    PRIMARY KEY (id_category, id_forum),
    FOREIGN KEY (id_category) REFERENCES category(id_category),
    FOREIGN KEY (id_forum) REFERENCES forum(id_forum)
);

-- Relación entre foros y etiquetas
CREATE TABLE forum_tag (
    id_forum_tag SERIAL PRIMARY KEY,
    id_forum INT NOT NULL,
    id_tag INT NOT NULL,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    created_by INT,
    FOREIGN KEY (id_forum) REFERENCES forum(id_forum),
    FOREIGN KEY (id_tag) REFERENCES tag(id_tag),
    FOREIGN KEY (created_by) REFERENCES "user"(id_user)
);

-- Detalles específicos para administradores
CREATE TABLE admin_details (
    id_admin SERIAL PRIMARY KEY,
    id_user INT UNIQUE NOT NULL,
    permissions TEXT,
    FOREIGN KEY (id_user) REFERENCES "user"(id_user)
);

-- Detalles específicos para miembros
CREATE TABLE member_details (
    id_member SERIAL PRIMARY KEY,
    id_user INT UNIQUE NOT NULL,
    activity TEXT,
    years VARCHAR(255),
    FOREIGN KEY (id_user) REFERENCES "user"(id_user)
);

-- Detalles específicos para editores
CREATE TABLE editor_details (
    id_editor SERIAL PRIMARY KEY,
    id_user INT UNIQUE NOT NULL,
    experience VARCHAR(255),
    FOREIGN KEY (id_user) REFERENCES "user"(id_user)
);

-- Detalles específicos para autores
CREATE TABLE author_details (
    id_author SERIAL PRIMARY KEY,
    id_user INT UNIQUE NOT NULL,
    publications TEXT,
    FOREIGN KEY (id_user) REFERENCES "user"(id_user)
);