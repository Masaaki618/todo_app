ローカルにインストール

```
git clone https://github.com/Masaaki618/todo_app.git
```

ルート直下に.env ファイルの作成

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

db の作成、マイグレーションの実行
※コンテナが立ち上がっていることを確認する。

```
make db_
```

---

その他のコマンド

コンテナに入りたい時

```
make bash
```

コンテナの起動 docker のログを確認したい時

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

Rubocop Airbnb 使用時のコマンド

rubocop-airbnb にて検証

```
make doc_rubo
```

rubocop-airbnb にて自動修正

```
make doc_rubo_a
```

Rspec の実行

```
make rspec
```

System Spec の実行

```
make system_spec
```

---

#### ブランチ命名規則

issue 番号を必ず含める

**＜具体例＞**
モデルの作成 + issue#1 の場合

`git checkout -b 'add-model-#1'`

#### コミットメッセージ

プレフィックス + 日本語で端的に + #issue 番号

- **プレフィックス**をつける
  - add: 機能追加
  - fix: バグ修正
  - config: 設定
  - refactor: リファクタリング
  - docs:ドキュメント
  - chore: その他環境構築など雑用

例）
`git commit -m 'add: modelの作成 #1' `
