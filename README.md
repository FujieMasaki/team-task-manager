# チームタスク管理アプリケーション

このアプリケーションは、チームでのタスク管理を効率化するためのRESTful APIを提供します。Rails 6.1とReact 17で開発され、後にRails 7とReact 18にアップグレードする計画です。

## プロジェクト概要

チームタスク管理アプリケーションは、プロジェクトとタスクの管理を簡単かつ効率的に行うためのツールです。チーム作成、メンバー招待、プロジェクト管理、タスク割り当て、ステータス追跡などの機能を提供します。

### 主な機能

- ユーザー認証（JWT認証）
- チーム作成と管理
- チームメンバーの招待と権限管理
- プロジェクト作成と管理
- タスク作成、割り当て、ステータス管理
- タスクへのコメント機能
- 通知システム

## 技術スタック

### バックエンド
- Ruby 2.7.6
- Rails 6.1.7（APIモード）
- MySQL 8.0
- Devise + JWT認証
- RSpec（テスト）
- Swagger/Rswag（API文書）

### フロントエンド（計画中）
- React 17（後にReact 18へアップグレード予定）
- TypeScript
- Recoil（状態管理）

### インフラ
- Docker（開発環境）
- AWS（本番環境予定）
  - EC2: バックエンドホスティング
  - RDS: データベース
  - S3/CloudFront: フロントエンドホスティング
  - Lambda: バックグラウンド処理

## 開発環境のセットアップ

### 前提条件
- Docker
- Docker Compose

### インストール手順

1. リポジトリをクローン：
```bash
git clone <リポジトリURL>
cd team-task-manager
```

2. Docker環境の構築と起動：
```bash
docker-compose build
docker-compose up -d
```

3. データベースのセットアップ：
```bash
docker-compose exec web rails db:create
docker-compose exec web rails db:migrate
docker-compose exec web rails db:seed
```

4. APIサーバーへのアクセス：
```
http://localhost:3000
```

## APIドキュメント

APIドキュメントはSwagger UIを通じて提供されます。以下のURLでアクセスできます：

```
http://localhost:3000/api-docs
```
## ER図
![Untitled_-_dbdiagram_io](https://github.com/user-attachments/assets/4b4603d4-0095-4a6c-accf-0bb8fc22f9a1)
https://dbdiagram.io/d/67d9e45975d75cc84495e4b9

## テスト

RSpecを使用してテストを実行できます：

```bash
docker-compose exec web rails spec
```

## 開発ワークフロー

このプロジェクトはGitHubフローを使用しています：

1. 新機能開発やバグ修正の際は新しいブランチを作成
2. 変更をコミットしてプッシュ
3. プルリクエストを作成
4. コードレビュー後、マージ

## バージョンアップ計画

このプロジェクトは、以下のようなバージョンアップを予定しています：

1. Rails 6.1からRails 7へのアップグレード
2. React 17からReact 18へのアップグレード

## 開発者

- [Masaki Fujie](https://github.com/FujieMasaki) - フルスタック開発者
