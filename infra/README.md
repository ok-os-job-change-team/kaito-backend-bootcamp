# SQLの砂場環境の構築
## 環境
MySQL 8.0.30
Docker(Debian)
## setup方法
```bash
# dockerのDBコンテナの立ち上げ。
$ docker compose up -d

# コンテナに入る。
$ docker exec -it database bash 

# コンテナ内でMySQLクライアントを使う。
$ mysql -u root -p
```
