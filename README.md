# テーブル設計

## users テーブル

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| family_name           | string  | null: false               |
| given_name            | string  | null: false               |
| family_name_kana      | string  | null: false               |
| given_name_kana       | string  | null: false               |
| duty_station          | string  | null: false               |
| birthday              | date    | null: false               |

### Association

- has_many :events
- has_many :department_users
- has_many :departments, through: department_users
- has_many :comments

## departments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |

### Association

- has_many :events
- has_many :department_users
- has_many :users, through: department_users
- has_many :comments


## department_users テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| department    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :event

## events テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| title            | string      | null: false                    |
| start_time       | datetime    | null: false                    |
| content          | text        | null: false                    |
| user             | references  | null: false, foreign_key:true  |
| department       | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :department

## comments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| department    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :department
