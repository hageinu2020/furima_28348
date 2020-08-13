# README

## users テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| name     | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |
| nickname | string  | null: false |
| birthday | date    | null: false |
| kana     | string  | null: false |

### Association
- has_many :sales
- has_many :buys

## sales テーブル

|Column  | Type       |Options                         |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| pict   | img        | null: false                    |
| user   | references | null: false, foreign_key: true |
| price  | integer    | null: false
| name   | string     | null: false


### Association
- belongs_to :user
- belongs_to :buys

## buys テーブル

|Column   | Type      |Options                         |
| ------- | ----------| -------------------------------|
| card    | integer   | null: false                    |
| address | text      | null: false                    |
| tel     | integer   | null: false                    |
| sale    | references| null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :sales
