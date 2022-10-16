DROP  DATABASE ig_clone;
CREATE DATABASE ig_clone;
USE ig_clone;

-- CREATING TABLE

CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    photo_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE tags (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);


-- INSERTING DATA 

INSERT INTO users(username) 
VALUE ('messi'),('kohli'),('dhoni');

INSERT INTO photos(image_url,user_id) 
VALUES('/qwejfhvf',1),('/cfeededb',2),('/dxfrfrcs',2);

INSERT INTO comments(comment_text,user_id,photo_id) 
VALUES('GREAT BATSMAN',1,2),('GREAT SPORTSMAN',3,2),('MEANS A ALOT',2,1);

INSERT INTO likes(user_id,photo_id) 
VALUES(1,1),(2,1),(1,2),(1,3),(3,3);

INSERT INTO follows(follower_id,followee_id) 
VALUES(1,2),(1,3),(3,1),(2,3);

INSERT INTO tags(tag_name) 
VALUES('hardwore'),('consistent'),('Goat');

INSERT INTO photo_tags(photo_id,tag_id) 
VALUES(1,1),(1,2),(2,3),(3,2);




-- SHOWING TABLE

SHOW TABLES;



-- DESCRIBING TABLES

DESCRIBE users;
DESCRIBE photos;
DESCRIBE comments;
DESCRIBE likes;
DESCRIBE follows;
DESCRIBE tags;
DESCRIBE photo_tags;



-- SHOWING ALL COLUMN OF TABLE
SELECT * FROM users;
SELECT * FROM photos;
SELECT * FROM comments;
SELECT * FROM likes;
SELECT * FROM follows;
SELECT * FROM tags;
SELECT * FROM photo_tags;

