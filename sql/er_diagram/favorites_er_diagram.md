```mermaid
erDiagram

Users ||--o{ Tweets:""
Users ||--o{ Favorites:"" 
Favorites }o--|| Tweets:""

Users {
  integer id
  string email
  string pass
  string created_at
  string updated_at
}

Tweets {
  integer id
  integer user_id
  string title
  string tweet_content
}

Favorites {
  integer id
  integer user_id
  integer tweet_id
}
```

```markdown
# favoritesテーブルのレコードを考える
## 1つのツイートに複数のユーザーがいいねする時(tweet : user = 1 : 多)
id, user_id, tweet_id
1, 1, 1
2, 2, 1
3, 3, 1

## 一人のユーザーが複数のツイートにいいねする時のレコード(user : tweet = 1 : 多)
id, user_id, tweet_id
1, 1, 1
2, 1, 2
3, 1, 3
```
