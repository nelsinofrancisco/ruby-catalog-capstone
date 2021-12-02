
CREATE TABLE games (
  id int GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
  PRIMARY KEY (id),
  title varchar(30),
  multiplayer boolean,
  last_played_at date,
  item_id int NOT NULL,
  CONSTRAINT kf_items FOREIGN KEY(item_id) REFERENCES items(id) ON DELETE CASCADE,
);

CREATE TABLE authors (
  id int GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
  PRIMARY KEY (id),
  first_name varchar(30),
  last_name varchar(30)
);

CREATE TABLE items (
  id int GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
  PRIMARY KEY (id),
  genre varchar(30),
  author varchar(30),
  source varchar(30),
  label varchar(30),
  publish_date date,
  archived boolean,
  author_id int,
  game_id int,
  CONSTRAINT kf_authors FOREIGN KEY(author_id) REFERENCES authors(id) ON DELETE CASCADE,
  CONSTRAINT kf_games FOREIGN KEY(game_id) REFERENCES games(id) ON DELETE CASCADE
);