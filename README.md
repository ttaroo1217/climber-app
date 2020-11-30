


# アプリケーション名：Belayers(ビレイヤーズ)

# アプリケーション概要
- クライマーがロープクライミングの相手を、アプリを通して見つけることができます
- クライマー同士がフォローし合うと、マッチングが成立し、チャットで会話をすることができます。

※ belayer(ビレイヤー)とは、ロープクライミングにおけるパートナーの呼称のことです


- URL https://climber-app.herokuapp.com/

## ユーザ管理：実装完了
### 新規登録
- 「新規登録」ボタンをクリックし、新規登録ページにアクセスする

 https://gyazo.com/0ed957805b8b4d33c843ff0cb99be167

- 新規登録ページにて、プロフィールを入力し、「会員登録」ボタンをクリックする
 https://gyazo.com/9149879c5077f7afe58670040eb16292

- トップページのユーザ一覧(Your Climbing Partners!)にて、作成したアカウントが表される
 https://gyazo.com/5d9899077887d3d44c0d6f5ef307878a


- マッチング機能：実装完了
- チャット機能：進行中
- SNS認証：未着手

# テスト用アカウント
- ユーザA
・メールアドレス：hoge@hoge.com
・パスワード：hoge123456

- ユーザB
・メールアドレス：sample@sample.com
・パスワード：sample123456

# 利用方法
## アカウント登録
- トップページの「新規登録」ボタンをクリックし、メールアドレス/PWおよびその他のプロフィールを登録できます
- 登録が完了しているユーザは、「ログイン」ボタンをクリックしサービスを利用することができます
- 登録が完了しているユーザは、「ログオフ」ボタンをクリックし、サービスからログオフすることができます

## マッチング機能(ロープクライミングの相手を見つける)
- ユーザはトップページのユーザ一覧から任意のユーザをクリックし、そのクユーザの詳細ページにアクセスすることができます
- ユーザは他のユーザの詳細ページにてプロフィールを確認し、相手が自分のロープクライミングの相手に適しているか、確認することができます。(体重のレンジ、クライマータイプを確認することができます)
- 自分以外のユーザの詳細ページにて、「フォロー」ボタンをクリックし、フォローすることができます
- 自分がフォローしたユーザにフォローされたら、マッチングが成立します(「チャットする」ボタンが表示されます。)
- 「チャットする」ボタンをクリックすると、マッチングが成立したユーザとのチャットルームに画面遷移し、メッセージを送ることができます

## 目指した課題解決
このアプリケーションを通じて、ロープクライミングを趣味としている人の、クライミングパートナー探しに関する課題を解決します

ロープクライミングという競技をご存知でしょか？
ロープクライミングとは、クライマーが二人一組になって互いに命綱を腹部に結び合い、高所に登るクライミング競技の一種です。
(昨今人気を博しているボルダリングの「壁が高くなったバージョンだな」と認識していただければ結構です。高所にのぼるため、命綱が必要になってきます。)

従来からロープクライミングの相手を探す場合は、ジムでの出会い等、オフラインが中心となっています。
またロープクライミングは、クライマー同士の体重レンジの制約(体重が離れすぎていたらダメ)を考慮する必要があり、自分に合ったパートナーを探すことが難しいという現状があります。
そこで、オンライン上で効率よくクライミングパートナーをさがすことができる仕組みを作りたく、このアプリを考えました。


## 洗い出した要件

- 「ユーザ管理機能」
 ユーザの新規登録、ログイン/ログアウトすることができる
- 「マッチング機能」
 クライマー(ユーザ)はロープクライミングの相手をみつけることができる
- 「チャット機能」
 クライマー(ユーザ)同士がチャットで会話することができる
- 「SNS認証」
 ユーザーはSNS認証を介し、新規登録・ログイン/ログアウトすることができる


# 実装予定の機能

- ユーザ管理：実装完了
- マッチング機能：実装完了
- チャット機能：進行中
- SNS認証：未着手

# データベース設計
- ER図  https://gyazo.com/bef6798777dc3cbb685858de691b170b

# ローカルでの動作方法
※ 全機能実装後に展開予定

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
