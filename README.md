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
- has_many :buys_date

## sales テーブル

|Column   | Type       |Options                        |
| ------- | ---------- | ----------------------------- |
| text    | string     |null: false                    |
| pict    | string     |null: false                    |
| user    | references |null: false, foreign_key: true |
| price   | integer    |null: false                    |
| name    | string     |null: false                    |
| genre   | integer    |null: false                    |
| status  | integer    |null: false                    |
| area    | integer    |null: false                    |
| process | integer    |null: false                    |
| fee     | integer    |null: false                    |



### Association
- belongs_to :user
- has_one :buys_date

## buys テーブル

|Column    | Type      |Options                         
| -------- | --------- | ----------------------------- |
| code     | string    |null: false                    |
| pref     | integer   |null: false                    |
| city     | string    |null: false                    |
| address  | string    |null: false                    |
| building | string    |                               |
| tel      | string    |null: false                    |
| buy_date | references|null: false, foreign_key: true |


### Association
- belongs_to :buys_date

## buys_date テーブル

| Column | Type       | Options                        |
| -----  | -------    | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| sales  | references | null: false, foreign_key: true |


### Association
- belongs_to :sales
- belongs_to :buys
- belongs_to :users
