# README

## users テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| family-name | string  | null: false |
| first-name  | string  | null: false |
| email       | string  | null: false |
| password    | string  | null: false |
| nickname    | string  | null: false |
| birthday    | date    | null: false |
| family-kana | string  | null: false |
| first-kana  | string  | null: false |

### Association
- has_many :sales
- has_many :buys

## sales テーブル

|Column   | Type       |Options                        |
| ------- | ---------- | ----------------------------- |
| text    | text       |null: false                    |
| pict    | img        |null: false                    |
| user    | references |null: false, foreign_key: true |
| price   | integer    |null: false                    |
| name    | string     |null: false                    |
| genre   | string     |null: false                    |
| status  | string     |null: false                    |
| fee     | string     |null: false                    |
| area    | string     |null: false                    |
| process | string     |null: false                    |


### Association
- belongs_to :user
- belongs_to :buys

## buys テーブル

|Column   | Type      |Options                         
| ------- | --------- | ----------------------------- |
| code    | integer   | null: false                   |
| city    | string    | null: false                   |
| address | string    | null: false                   |
| building| string    |                               |
| tel     | string    | null: false                   | 
| sale    | references| null: false, foreign_key: true| 


### Association
- belongs_to :user
- belongs_to :sales
