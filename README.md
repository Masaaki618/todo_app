ローカルにインストール

```
git clone https://github.com/Masaaki618/addTodo.git
```

ルート直下に.envファイルの作成

```
DB_HOST=db 
DB_USER=postgres 
DB_PASSWORD=password
```

コンテナのビルド

```
make build
```

コンテナの起動 --バックグラウンド

```
make up
```

dbの作成

```
make db_
```

---

その他のコマンド

コンテナに入りたい時

```
make bash
```

コンテナの起動 dockerのログを確認したい時

```
make up_log
```

コンテナの停止

```
make stop
```

コンテナの削除

```
make down
```

コンテナ、イメージ、ボリューム全削除
※コンテナ停止後に行うこと

```
make all_dell
```

---

#### ブランチ命名規則

issue 番号を必ず含める

**＜具体例＞**
issue#1 モデルの作成の場合

`git checkout -b '#1-add-model'`

#### コミットメッセージ

#issue 番号 + プレフィックス + 日本語で端的に

- **プレフィックス**をつける
    - add: 機能追加
    - fix: バグ修正
    - config: 設定
    - refactor: リファクタリング
    - docs:ドキュメント
    - chore: その他環境構築など雑用

例）
`git commit -m '#1 add: modelの作成' `
