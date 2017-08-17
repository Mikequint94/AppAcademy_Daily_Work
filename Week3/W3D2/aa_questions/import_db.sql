CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body  TEXT NOT NULL,
  author_id INTEGER NOT NULL,
  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER,
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  author_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY(question_id) REFERENCES questions(id),
  FOREIGN KEY(parent_id) REFERENCES replies(id),
  FOREIGN KEY(author_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  author_id INTEGER NOT NULL,
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO users(fname, lname)
VALUES ('Ben', 'McMuffins'),
('Mindy', 'Bizkitface'),
('Cassandra','Butters'),
('Leroy', 'McGee');

INSERT INTO questions(title, body, author_id)
VALUES ('Where''s my sandwich?', 'I''ve been searching for my
  sandwich all night and I think I actually ate it',
  (SELECT id
  FROM users
  WHERE fname = 'Ben' AND lname = 'McMuffins')
);

INSERT INTO question_follows(user_id, question_id)
VALUES (1, 1), (2,1);

INSERT INTO replies(question_id, parent_id, author_id, body)
VALUES (1, NULL, 3, 'Check the bathtub...'),
(1, 1, 4, 'GROSS!');

INSERT INTO question_likes (question_id, author_id)
VALUES (1, 1), (1, 3);
