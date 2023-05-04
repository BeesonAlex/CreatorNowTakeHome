-- 20230505000000_create_learning_paths.sql

-- Up function: Creates the 'learning_paths' table and its columns
BEGIN TRANSACTION;

CREATE TABLE learning_paths (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  experience_level VARCHAR(255) NOT NULL,
  cover_photo VARCHAR(255) NOT NULL,
  tags VARCHAR(255) DEFAULT '' NOT NULL
);

-- Create a table to store the many-to-many relationship between learning_paths and videos
CREATE TABLE learning_path_videos (
  learning_path_id INTEGER NOT NULL,
  video_id INTEGER NOT NULL,
  PRIMARY KEY (learning_path_id, video_id),
  FOREIGN KEY (learning_path_id) REFERENCES learning_paths (id) ON DELETE CASCADE,
  FOREIGN KEY (video_id) REFERENCES videos (id) ON DELETE CASCADE
);

-- Create a table to store the many-to-many relationship between learning_paths and users
CREATE TABLE learning_path_users (
  learning_path_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  PRIMARY KEY (learning_path_id, user_id),
  FOREIGN KEY (learning_path_id) REFERENCES learning_paths (id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

COMMIT;

-- Down function: Drops the 'learning_paths', 'learning_path_videos', and 'learning_path_users' tables
BEGIN TRANSACTION;

DROP TABLE learning_path_users;
DROP TABLE learning_path_videos;
DROP TABLE learning_paths;

COMMIT;
