CREATE TABLE Users(
  id INT PRIMARY KEY,
  email varchar(30),
  pass varchar(30),
  created_at varchar(30),
  updated_at varchar(30)
);

CREATE TABLE Tweets(
  id INT PRIMARY KEY,
  user_id INT,
  title varchar(30),
  tweet_content varchar(140),
  FOREIGN KEY (user_id)
  REFERENCES Users(id)
);

