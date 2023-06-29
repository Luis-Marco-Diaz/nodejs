CREATE TABLE "users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "user_name" varchar(30) NOT NULL,
  "email" varchar(40) NOT NULL,
  "age" int NOT NULL,
  "password" varchar(30) NOT NULL,
  "rol" int,
  "course" int,
  "video_course" int
);

CREATE TABLE "courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(30) NOT NULL,
  "description" varchar(30) NOT NULL,
  "level" int,
  "teacher" varchar(30)
);

CREATE TABLE "video_curses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(30) NOT NULL,
  "url" varchar(30) NOT NULL,
  "category" int
);

CREATE TABLE "levels" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "level_type" varchar(30) NOT NULL
);

CREATE TABLE "category_type" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "category_type1" varchar(30) NOT NULL
);

CREATE TABLE "roles" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "roles" varchar(30) NOT NULL
);

CREATE TABLE "roles_category_type" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "role" int,
  "Enroll" boolean,
  "Create" boolean,
  "Manage" boolean
);

ALTER TABLE "levels" ADD FOREIGN KEY ("id") REFERENCES "courses" ("level");

ALTER TABLE "category_type" ADD FOREIGN KEY ("id") REFERENCES "video_curses" ("category");

ALTER TABLE "roles_category_type" ADD FOREIGN KEY ("id") REFERENCES "users" ("rol");

ALTER TABLE "users" ADD FOREIGN KEY ("course") REFERENCES "courses" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("video_course") REFERENCES "video_curses" ("id");

ALTER TABLE "roles" ADD FOREIGN KEY ("id") REFERENCES "roles_category_type" ("role");


/* INSERCIÓN DE DATOS EN TABLAS */

/* #1) INSERCIÓN DE Roles administrativos en tabla roles */

INSERT INTO roles VALUES (1, 'Student');
INSERT INTO roles VALUES (2, 'Teacher');
INSERT INTO roles VALUES (3, 'Admin');

/* #2) INSERCIÓN del nivel de dificultad */

INSERT INTO levels VALUES (1, 'Basic');
INSERT INTO levels VALUES (2, 'Middle');
INSERT INTO levels VALUES (3, 'Advanced');

/* #3) INSERCIÓN del tipo de categoría */

INSERT INTO category_type VALUES (1, 'FrontEnd');
INSERT INTO category_type VALUES (2, 'BackEnd');
INSERT INTO category_type VALUES (3, 'FullStack');

/* #4) INSERCIÓN de cursos */

INSERT INTO courses VALUES (1, 'HTML5', 'Curso intensivo de HTML5', 1, 'Marco Díaz');
INSERT INTO courses VALUES (2, 'CSS', 'Curso intensivo de CSS + UX', 2, 'Marco Díaz');
INSERT INTO courses VALUES (3, 'REACT', 'Curso REACT modo DIOS', 3, 'Marco Díaz');

/* #5) INSERCIÓN de Video cursos */

INSERT INTO video_curses VALUES (1, 'HTML5 VIDEO', 'https://google.com', 1);
INSERT INTO video_curses VALUES (2, 'CSS VIDEO', 'https://google.com', 2);
INSERT INTO video_curses VALUES (3, 'REACT VIDEO', 'https://google.com', 3);

/* #6) INSERCIÓN de Usuarios */

INSERT INTO users VALUES (1, 'Juanito Perez', 'juanito@gmail.com', 23, 'passJuan', 1, 1, 1);
INSERT INTO users VALUES (2, 'María Panfila', 'marypanfi@gmail.com', 18, 'passMari', 2, 1, 1);

