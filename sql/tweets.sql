CREATE TABLE Tweets(
  id INT PRIMARY KEY,
  user_id INT,
  title varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  tweet_content varchar(140) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  FOREIGN KEY (user_id)
  REFERENCES Users(id)
);
