# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| last_name        | string | null: false |
| first_name       | string | null: false |
| last_name_kana   | string | null: false |
| first_name_kana  | string | null: false |
| birth_date       | date   | null: false |

### Association

- has_many :items
- has_many :post


## items テーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| name                  | string     | null: false       |
| info                  | text       | null: false       |
| category_id           | integer    | null: false       |
| item_status_id        | integer    | null: false       |
| fee_status_id         | integer    | null: false       |
| prefecture_id         | integer    | null: false       |
| scheduled_delivery_id | integer    | null: false       |
| price                 | integer    | null: false       |
| user                  | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post



## posts テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| postal_code        | string     | null: false       |
| prefecture_id      | integer    | null: false       |
| city               | string     | null: false       |
| address            | string     | null: false       |
| building           | string     |                   |
| phone_number       | string     | null: false       |
| user               | references | foreign_key: true |
| item               | references | foreign_key: true |


### Association
- has_many :post
- has_many :items