# テーブル設計

## users テーブル

| Column               | Type   　| Options     |
| ---------------------| ------ 　| ----------- |
| name                 | string 　| null: false |
| email                | string 　| null: false |
| encrypted_password   | string 　| null: false |
| self-introduction    | text 　  |             |
| sex_id               | string 　| null: false |
| area_id              | string 　| null: false |
| weight_id            | string 　| null: false |
| belay_exp_id         | string 　| null: false |
| climb_type        　　| string 　| null: false |　　check boxで実装


  ### Association

  - has_many :room_users
  - has_many :rooms, through: room_users
  - has_many :messages
  - has_many :active_relationships, class_name: "Relationship"
  - has_many :passive_relationships, class_name: "Relationship"


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

| Column                | Type   　      | Options                              |
| --------------------- | -------------- | -------------------------------------|
| room_id (FK)          | references 　  | null: false, foreign_key: true       |
| user_id (FK)          | references　   | null: false, foreign_key: true       |
| message               | string　       | null: false                          |

  ### Association

  - belongs_to :room
  - belongs_to :user

## rooms テーブル

| Column                | Type   　        | Options                              |
| --------------------- | --------------  | -------------------------------------|
|                       | references 　   |                                     |


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