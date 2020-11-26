


# アプリケーション名：Belayers

# アプリケーション概要
- クライマーがロープクライミングの相手をアプリを通して見つけることができます
- クライマー通しがフォローし合うとマッチングが成立し、チャットで会話をすることができます。


# URL
※ 全機能実装後に展開予定
- ユーザ管理：実装完了
- マッチング機能：実装完了
- チャット機能：進行中
- SNS認証：未着手

# テスト用アカウント
※ 全機能実装後に展開予定

# 利用方法
## アカウント登録







****************************************************

# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| ---------------------| ------ | ----------- |
| name                 | string | null: false |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| self_introduction    | text   |             |
| sex_id               | integer  | null: false |
| area_id              | integer | null: false |
| weight_id            | integer | null: false |
| belay_exp_id         | integer | null: false |
| climb_type           | integer | null: false | check boxで実装


  ### Association

  - has_many :room_users
  - has_many :rooms, through: room_users
  - has_many :messages

  #フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので親はfollowing_id(フォローする側)
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  #中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「following」と定義
  has_many :followings, through: :active_relationships, source: :follower

  #フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローされる側)
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  #中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「follower」と定義
  has_many :followers, through: :passive_relationships, source: :following



## relationships テーブル

| Column                  | Type        | Options           |
| ---------------------   | ------      | -----------       |
| following_id            | integer     | null: false       |
| follower_id             | integer     | null: false       |
| status                  | integer     | null: false       |


  ### Association

  - belongs_to :following, class_name: "User"
  - belongs_to :follower, class_name: "User"


## messages テーブル

| Column                | Type         | Options                              |
| --------------------- | -------------- | -------------------------------------|
| room_id (FK)          | references   | null: false, foreign_key: true       |
| user_id (FK)          | references   | null: false, foreign_key: true       |
| message               | string       | null: false                          |

  ### Association

  - belongs_to :room
  - belongs_to :user

## rooms テーブル

| Column                | Type           | Options                              |
| --------------------- | --------------  | -------------------------------------|
|                       | references    |                                     |


  ### Association

  - has_many :room_users
  - has_many :users, through: room_users
  - has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user
