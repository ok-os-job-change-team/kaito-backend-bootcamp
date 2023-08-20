CREATE TABLE Favorites(
  id INT PRIMARY KEY,
  user_id INT,
  tweet_id INT,
  FOREIGN KEY (user_id)
  REFERENCES Users(id)
  FOREIGN KEY (tweet_id)
  REFERENCES Tweets(id)
);
