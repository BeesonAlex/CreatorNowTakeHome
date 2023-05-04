-- 20230504_add_tags_to_videos.sql

-- Up function: Adds the 'tags' column to the 'videos' table
BEGIN TRANSACTION;

ALTER TABLE videos
ADD COLUMN tags VARCHAR(255) DEFAULT '' NOT NULL;

COMMIT;

-- Down function: Removes the 'tags' column from the 'videos' table
BEGIN TRANSACTION;

ALTER TABLE videos
DROP COLUMN tags;

COMMIT;
