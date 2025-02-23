-- Tabla principal para usuarios
CREATE TABLE "user" (
    id_user INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT UNIQUE NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    profile_photo TEXT,
    role TEXT NOT NULL CHECK (role IN ('editor', 'admin', 'member', 'author'))
);

-- Categorías
CREATE TABLE category (
    id_category INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE NOT NULL,
    description TEXT
);

-- Etiquetas
CREATE TABLE tag (
    id_tag INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE NOT NULL
);

-- Foros
CREATE TABLE forum (
    id_forum INTEGER PRIMARY KEY AUTOINCREMENT,
    content TEXT NOT NULL,
    author INTEGER NOT NULL,
    title TEXT NOT NULL,
    publication_date DATETIME NOT NULL DEFAULT (DATETIME('now')),
    update_date DATETIME DEFAULT (DATETIME('now')),
    popular BOOLEAN DEFAULT 0,
    FOREIGN KEY (author) REFERENCES "user"(id_user)
);

-- Comentarios en los foros
CREATE TABLE comment (
    id_comment INTEGER PRIMARY KEY AUTOINCREMENT,
    id_forum INTEGER NOT NULL,
    id_user INTEGER NOT NULL,
    publication_date DATETIME NOT NULL DEFAULT (DATETIME('now')),
    update_date DATETIME DEFAULT (DATETIME('now')),
    context TEXT NOT NULL,
    FOREIGN KEY (id_forum) REFERENCES forum(id_forum),
    FOREIGN KEY (id_user) REFERENCES "user"(id_user)
);

-- Relación entre foros y categorías
CREATE TABLE forum_category (
    id_category INTEGER NOT NULL,
    id_forum INTEGER NOT NULL,
    PRIMARY KEY (id_category, id_forum),
    FOREIGN KEY (id_category) REFERENCES category(id_category),
    FOREIGN KEY (id_forum) REFERENCES forum(id_forum)
);

-- Relación entre foros y etiquetas
CREATE TABLE forum_tag (
    id_forum_tag INTEGER PRIMARY KEY AUTOINCREMENT,
    id_forum INTEGER NOT NULL,
    id_tag INTEGER NOT NULL,
    creation_date DATETIME DEFAULT (DATETIME('now')),
    is_active BOOLEAN DEFAULT 1,
    created_by INTEGER,
    FOREIGN KEY (id_forum) REFERENCES forum(id_forum),
    FOREIGN KEY (id_tag) REFERENCES tag(id_tag),
    FOREIGN KEY (created_by) REFERENCES "user"(id_user)
);

-- Detalles específicos para administradores
CREATE TABLE admin_details (
    id_admin INTEGER PRIMARY KEY AUTOINCREMENT,
    id_user INTEGER UNIQUE NOT NULL,
    permissions TEXT,
    FOREIGN KEY (id_user) REFERENCES "user"(id_user)
);

-- Detalles específicos para miembros
CREATE TABLE member_details (
    id_member INTEGER PRIMARY KEY AUTOINCREMENT,
    id_user INTEGER UNIQUE NOT NULL,
    activity TEXT,
    years TEXT,
    FOREIGN KEY (id_user) REFERENCES "user"(id_user)
);

-- Detalles específicos para editores
CREATE TABLE editor_details (
    id_editor INTEGER PRIMARY KEY AUTOINCREMENT,
    id_user INTEGER UNIQUE NOT NULL,
    experience TEXT,
    FOREIGN KEY (id_user) REFERENCES "user"(id_user)
);

-- Detalles específicos para autores
CREATE TABLE author_details (
    id_author INTEGER PRIMARY KEY AUTOINCREMENT,
    id_user INTEGER UNIQUE NOT NULL,
    publications TEXT,
    FOREIGN KEY (id_user) REFERENCES "user"(id_user)
);