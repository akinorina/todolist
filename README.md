# todolist

## はじめに
このGITリポジトリは、todolistアプリのリポジトリです。
その主にDBとGateway(reverse-proxy)のDocker実装です。

todolistアプリ全体を Docker Compose で実行する場合、backend と frontend のリポジトリを同時に同じディレクトリ内に配置する必要があります。
```
任意のDIRECTORY/
 +-- todolist
 +-- todolist_backend
 +-- todolist_frontend
```
以下、ローカルホストで Docker-Compose での実行手順を示します。





## リポジトリをclone

任意のディレクトリにて次のコマンドを実行して、リポジトリをcloneします。
```
git clone git@github.com:akinorina/todolist.git
git clone git@github.com:akinorina/todolist_backend.git
git clone git@github.com:akinorina/todolist_frontend.git

```





## host名設定

| プロパティ | 値 |
|:---------|:---------|
| host名   | example.local |
| port     | 80, 443 |

実際に動作させる場合、ローカルホストの /etc/hosts に example.local を次の様に追加しておきます。
```
127.0.0.1    example.local
```





## todolist

```
cd todolist
```



Dockerでの実行用の環境変数ファイル .env を作成します。

.env
```
# .env for local

# DATABASE (PostgreSQL)
DATABASE_HOST = 'db'
DATABASE_PORT = 5432
DATABASE_USER = 'todolist'
DATABASE_PASSWORD = 'todolist'
DATABASE_DBNAME = 'todolist'

# Reverse Proxy by Nginx.
REVERSEPROXY_HOST = 'example.local'

```



OpenSSL の自己署名証明書を作成します。（OpenSSLはインストール済みとします）
```
cd ./reverse-proxy/certificates

# 秘密鍵(KEY)を作成する
openssl genrsa 2048 > server.key

# 証明書署名要求(CSR)を作成する
openssl req -new -key server.key > server.csr

# 証明書署名要求(CSR)を自分の秘密鍵で署名する
cat server.csr | openssl x509 -req -signkey server.key > server.crt
```





## todolist_backend
```
cd ./todolist_backend
```

Dockerでの実行様の環境変数ファイル .env.development.local を作成

.env.development.local
```
# Application
APP_NAME = 'todolist'
APP_PORT = 3000
APP_CORS = true

# DB
DATABASE_HOST = db
DATABASE_PORT = 5432
DATABASE_USER = 'todolist'
DATABASE_PASSWORD = 'todolist'
DATABASE_DBNAME = 'todolist'

```



## todolist_frontend
```
cd ../todolist_frontend
```

Dockerでの実行様の環境変数ファイル .env.development.local を作成

.env.development.local
```
# todolist frontend

NEXT_PUBLIC_API_URL = ''

```




## todolist にて、 docker-compose ビルド・実行

```
cd ./todolist
```

build
```
docker-compose -f docker-compose.yml -f docker-compose-bf.yml build
```

実行
```
docker-compose -f docker-compose.yml -f docker-compose-bf.yml up -d
```


Webブラウザで次のURLへアクセスします。
```
https://example.local/
```













