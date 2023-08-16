CREATE TABLE Tweets(
  id INT PRIMARY KEY,
  user_id INT,
  title varchar(30),
  tweet_content varchar(140),
  FOREIGN KEY (user_id)
  REFERENCES Users(id)
);
